{extends file="index.tpl"}
{block name="body"}
    <div class="row">
        <div class="card col-md-12">
            <div class="card-header">
                <h4>Add student form</h4>
                <a href="/students/">
                    <button type="button" class="btn btn-outline-primary float-right"><span class="fa fa-backward"></span></button>
                </a>
            </div>
            <div class="card-body bg-light">
                <form action="/students/save-student" method="post">
                    <div class="row">
                        <div class="col-md-4 mt-2">
                            <div class="input-group">
                                <label for="names" class="input-group-text rounded-0 rounded-left">Names</label>
                                <input type="text" required class="form-control" placeholder="Student names" name="names"/>
                            </div>
                        </div>
                        <div class="col-md-3 mt-2">
                            <div class="input-group">
                                <label for="gender" class="input-group-text rounded-0 rounded-left">Gender</label>
                                <select class="form-control" id="gender" name="gender">
                                    <option value="F">Female</option>
                                    <option value="M">Male</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 mt-2">
                            <div class="input-group">
                                <label for="dob" class="input-group-text rounded-0 rounded-left">DOB</label>
                                <input type="date" required id="dob" class="form-control" placeholder="Student names" name="dob"/>
                            </div>
                        </div>
                        <div class="col-md-2 mt-2">
                            <div class="input-group">
                                <label for="disability" class="input-group-text rounded-0 rounded-left">Disability</label>
                                <select class="form-control" id="gender" name="disabled">
                                    <option value="1">No</option>
                                    <option value="2">Yes</option>
                                </select>
                            </div>
                        </div>
                        <hr class="col-md-12 border-danger"/>
                        <div class="col-md-4 mt-2">
                            <div class="input-group">
                                <label for="religion" class="input-group-text rounded-0 rounded-left">Religion</label>
                                <select class="form-control" name="religion" id="religion">
                                    {foreach $religions as $religion name="rel"}
                                        <option value="{$smarty.foreach.rel.index+1}">{$religion}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 mt-2">
                            <div class="input-group">
                                <label for="yearJoined" class="input-group-text rounded-0 rounded-left">yearJoined</label>
                                <select class="form-control" name="yearJoined" id="yearJoined">
                                    {for $i=($smarty.now|date_format:"Y") - 30 to $smarty.now|date_format:"Y"}
                                        <option value="">{$i}</option>
                                    {/for}
                                </select>
                            </div>
                        </div>
                        <hr class="col-md-12 border-danger"/>
                        <div class="col-md-12 mt-2">
                            <div class="input-group">
                                <label for="address" class="input-group-text rounded-0 rounded-left">Address</label>
                                <textarea  id="address" required class="form-control" placeholder="Where does student stay" name="address"></textarea>
                            </div>
                        </div>
                        <hr class="col-md-12 border-danger"/>
                        <div class="col-md-12"><button class="btn btn-outline-info float-right" type="button"><i class="fa fa-plus-circle"></i> Add more</button></div>
                        <div class="col-md-12 row p-0" id="parentsData">
                            <div class="col-md-5 mt-2">
                                <div class="input-group">
                                    <label for="parent" class="input-group-text rounded-0 rounded-left">Names</label>
                                    <input  id="parent" required class="form-control rounded-0" placeholder="Parent names" name="parent[]">
                                </div>
                            </div>
                            <div class="col-md-4 mt-2">
                                <div class="input-group">
                                    <label for="parent_contact" class="input-group-text rounded-0 rounded-left">Contacts</label>
                                    <input  id="parent_contact" required class="form-control rounded-0" placeholder="Telephone numbers for parent" name="parent_contact[]">
                                </div>
                            </div>
                            <div class="col-md-3 mt-2">
                                <div class="input-group">
                                    <label for="parent_nin" class="input-group-text rounded-0 rounded-left">NIN</label>
                                    <input  id="parent_nin" class="form-control rounded-0" placeholder="Parent NIN" name="nin[]">
                                </div>
                            </div>
                            <div class="col-md-6 mt-2">
                                <div class="input-group">
                                    <label for="parent_type" class="input-group-text rounded-0 rounded-left">Relationship</label>
                                    <select name="parent_type[]" id="parent_type" class="form-control rounded-0">
                                        <option value="1">Father</option>
                                        <option value="2">Mother</option>
                                        <option value="3">Guardian</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 mt-2">
                                <div class="input-group">
                                    <label for="parent_status" class="input-group-text rounded-0 rounded-left">Parent status</label>
                                    <select name="parent_status[]"  id="parent_status" class="form-control rounded-0">
                                        <option value="1">Alive</option>
                                        <option value="2">Deceased</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12 mt-2">
                                <div class="input-group">
                                    <label for="parent_address" class="input-group-text rounded-0 rounded-left">Address</label>
                                    <textarea  id="parent_address" required class="form-control" placeholder="Where does this parent stay" name="parent_address[]"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 row" id="parentsDataCopy"></div>
                        <hr class="col-md-12 border-danger"/>
                        <div class="col-md-12"><button class="btn btn-outline-info float-right" type="button"><i class="fa fa-plus-circle"></i> Add more</button></div>
                        <div class="col-md-12 row" id="academicBackground">
                            <div class="col-md-4 mt-2">
                                <div class="input-group">
                                    <label for="formerSchool" class="input-group-text rounded-0 rounded-left">School</label>
                                    <input  id="formerSchool" class="form-control rounded-0" placeholder="Former school" name="school[]">
                                </div>
                            </div>
                            <div class="col-md-3 mt-2">
                                <div class="input-group">
                                    <label for="school_level" class="input-group-text rounded-0 rounded-left">Level</label>
                                    <select  id="school_level" class="form-control rounded-0" name="school_level[]">
                                        {foreach $levels.levels as $level name=level}
                                            <option value="{$smarty.foreach.level.index+1}">{$level}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3 mt-2">
                                <div class="input-group">
                                    <label for="index" class="input-group-text rounded-0 rounded-left">Index</label>
                                    <input type="text"  id="index" class="form-control rounded-0" placeholder="Student number or index number" name="school_index[]">
                                </div>
                            </div>
                            <div class="col-md-2 mt-2">
                                <div class="input-group">
                                    <label for="year" class="input-group-text rounded-0 rounded-left">Year</label>
                                    <input type="number"  id="year" class="form-control rounded-0" placeholder="Year of sitting" name="year[]">
                                </div>
                            </div>
                            <div class="col-md-12 mt-2">
                                <div class="input-group">
                                    <label for="grades" class="input-group-text rounded-0 rounded-left">Grades</label>
                                    <textarea   id="grades" class="form-control rounded-0" placeholder="Student grades" name="grades[]"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6 mt-2">
                                <div class="input-group">
                                    <label for="final_result" class="input-group-text rounded-0 rounded-left">Final result</label>
                                    <input type="text"  id="final_result" class="form-control rounded-0" placeholder="final result" name="final_result[]">
                                </div>
                            </div>
                            <div class="col-md-6 mt-2">
                                <div class="input-group">
                                    <label for="result_type" class="input-group-text rounded-0 rounded-left">Result Type</label>
                                    <select  id="school_level" class="form-control rounded-0" name="school_level[]">
                                        {foreach $levels.result_type as $level name=level}
                                            <option value="{$smarty.foreach.level.index+1}">{$level}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr class="col-md-12 border-danger"/>
                        <div class="col-md-12 row mt-2">
                            <div class="col-md-6">
                                <div class="alert alert-info rounded-0">
                                    Leave blank to auto create student Number
                                </div>
                                <div class="input-group">
                                    <label for="studentNo" class="input-group-text rounded-0 rounded-left">Student Number</label>
                                    <input type="text"  id="studentNo" class="form-control rounded-0" placeholder="Student No" name="studentNo">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="alert alert-info rounded-0">
                                    Leave blank to auto create Registration Number
                                </div>
                                <div class="input-group">
                                    <label for="regNo" class="input-group-text rounded-0 rounded-left">Reg Number</label>
                                    <input type="text"  id="regNo" class="form-control rounded-0" placeholder="Registration No" name="regNo">
                                </div>
                            </div>
                        </div>
                        <hr class="col-md-12 border-danger"/>
                        <div class="col-md-4 mt-2">
                            <div class="alert alert-info">
                                Assign class to student
                            </div>
                            <div class="input-group">
                                <label for="class" class="input-group-text rounded-0">Class</label>
                                <select id="class" class="form-control" name="class">
                                    {foreach $classes as $class}
                                        <option value="{$class.id}">{$class._class}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 mt-2">
                            <div class="alert alert-info">
                                Assign stream to student
                            </div>
                            <div class="input-group">
                                <label for="stream" class="input-group-text rounded-0">Class</label>
                                <select id="stream" class="form-control" name="stream">
                                    {foreach $streams as $stream}
                                        <option value="{$stream.id}">{$stream.stream}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 mt-2">
                            <div class="alert alert-info">
                                Assign House
                            </div>
                            <div class="input-group">
                                <label for="house" class="input-group-text rounded-0">House</label>
                                <select id="house" class="form-control" name="house">
                                    {foreach $houses as $house}
                                        <option value="{$house.id}">{$house.house}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-primary float-right mt-2" type="submit">ADD STUDENT</button>
                </form>
            </div>
            <div class="card-footer">
                You can upload student's information via excel sheets
            </div>
        </div>
    </div>
{/block}