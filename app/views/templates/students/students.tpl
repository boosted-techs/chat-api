{extends file="index.tpl"}
{block name="body"}
    <div class="row">
        <div class="card col-md-12">
            <div class="card-header">
                <h4>Students</h4>
                <a href="/students/add-student">
                    <button class="btn btn-primary float-right"><span class="fa fa-plus-circle"></span></button>
                </a>
            </div>
            <div class="card-body table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th></th>
                        <th>Names</th>
                        <th>S.No</th>
                        <th>Reg.No</th>
                        <th>Class</th>
                        <th>Stream</th>
                        <th>House</th>
                        <th>Term</th>
                        <th>Year</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                Student lists can be downloaded and exported.
            </div>
        </div>
    </div>
{/block}