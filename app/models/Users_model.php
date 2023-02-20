<?php

use JetBrains\PhpStorm\ArrayShape;

class Users_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function auth(): bool|array|string
    {
        $email = trim($this->inputs->post("email"));
        if (empty($email))
            return false;
        if ($this->security->validate_email($email))
            $this->db->where("email", $email);
        else {
            $this->db->orWhere("username", $email);
        }
        $query = $this->db->getOne("users", "password, role, id, state, school");
        if (empty($query))
            return false;
        if (! password_verify($this->inputs->post("password"), $query['password']))
            return false;
        return $query;
    }

    /**
     * @throws Exception
     */
    function get_user_bio($user): array|string|null
    {
        $this->db->where("id", $user);
        return $this->db->getOne("bio", "user, dob, gender, photo, names, religion, photo, (select school from schools where schools.id = bio.school) as school, school as school_id");
    }

    /**
     * @throws Exception
     */
    function is_admin() {
        if ($this->session->data->role !== 1)
            throw new Exception("Invalid application settings. Access privileges denied.");
    }

    /**
     * @throws Exception
     */
    function is_logged_in() {
        if ($this->session->data("user") != null) {
            $data = $this->get_user_bio($this->session->data("user"));
            $roles = [1 => "Administrator", 2 => "Finance", 3 => "Teacher", 4 => "Student", 5 => "Parent", 6 => "Director of Studies", 7 => "Head Teacher", 8 => "Super Administrator"];
            $data['role'] = $roles[$this->session->data->role];
            return $data;
        }
        $this->redirect("/");
        exit;
    }

    function get_religions(): array
    {
        return [
            1 => "Catholic",
            2 => "Muslim",
            3 => "Protestant",
            4 => "Pentocostal",
            5 => "Seventh Day",
            6 => "Others"
        ];
    }

    #[ArrayShape(["levels" => "string[]", "result_type" => "string[]"])] function get_school_levels(): array
    {
        return array(
            "levels" => [
                    "Pre-Primary",
                    "Primary",
                    "Olevel",
                    "A-level"
                ],
            "result_type" => [
                "Report card",
                "UCE Certificate",
                "UACE Certificate",
                "Others"
            ]
        );
    }

    function add_student($term_settings) {
        print_r($term_settings);
        print_r($_POST);
        $names = trim($this->inputs->post("names"));
        $gender = trim($this->inputs->post("gender"));
        $dob = trim($this->inputs->post("dob"));
        $disability = trim($this->inputs->post("disabled"));
        $religion = trim($this->inputs->post("religion"));
        $address = trim($this->inputs->post("address"));
        $address = trim($this->inputs->post("address"));
        $year = trim($this->inputs->post("yearJoined"));
        $school = $this->session->data->school;
        $parents_data = [];
        $i = 0;
        foreach ($this->inputs->post("parent") as $item) {
            $parents_data[$i]['names'] = trim($item);
            $parents_data[$i]['contacts'] = trim($this->inputs->post("parent_contact")[$i]);
            $parents_data[$i]['nin'] = trim($this->inputs->post("nin")[$i]);
            $parents_data[$i]['type'] = trim($this->inputs->post("parent_type")[$i]);
            $parents_data[$i]['status'] = trim($this->inputs->post("parent_status")[$i]);
            $parents_data[$i]['address'] = trim($this->inputs->post("parent_address")[$i]);
            $i++;
        }
        //print_r($parents_data);
        $i = 0;
        $former_school_data = [];
        foreach ($this->inputs->post("school") as $item) {
            $former_school_data[$i]['former_school'] = trim($item);
            $former_school_data[$i]['school_level'] = trim($this->inputs->post("school_level")[$i]);
            $former_school_data[$i]['index'] = trim($this->inputs->post("school_index")[$i]);
            $former_school_data[$i]['year'] = trim($this->inputs->post("year")[$i]);
            $former_school_data[$i]['grades'] = trim($this->inputs->post("grades")[$i]);
            $former_school_data[$i]['final_result'] = trim($this->inputs->post("final_result")[$i]);
            $i++;
        }
        $studentNo = trim($this->inputs->post("studentNo"));
        $regNo = trim($this->inputs->post("regNo"));
        $class = trim($this->inputs->post("class"));
        $stream = trim($this->inputs->post("stream"));
        $house = trim($this->inputs->post("house"));

        $student_id_insert_no = 0; // To track student number creation id so that we can update it after
        $student_reg_insert_no = 0; //To track student registration creation id so that we cna update it after generating student bio creation

        if (empty($studentNo))
            $student_id_insert_no = $this->generate_student_id($year, $school);
        if (empty($regNo))
            $student_reg_insert_no = $this->generate_student_reg($year, $school);
    }

    function generate_student_id($year , $school) {
        $month = date('m');

        do {
            // Generate a 6-digit random number
            $random = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);

            // Concatenate the year, month, and random number to form a 10-digit code
            $code = $year . $month . $random;

            // Check if the code already exists in the database
            $existing_record = $this->db->getOne('students_id', 'student_no', ['student_no' => $code, 'school' => $school]);
        } while ($existing_record);

// Insert the code into the database
        // Return the unique code
        return $this->db->insert('students_id', ['student_id' => $code, 'school' => $school]);
    }

    function generate_student_reg() {

    }

    function is_unique() {

    }

}