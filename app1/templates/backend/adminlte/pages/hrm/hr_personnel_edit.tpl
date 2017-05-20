<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Main content -->
	<section class="content">
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script src="{$.const.TEMPLATE_URL}plugins/bootstrap-validator/validator.min.js"></script>
<script src="{$.const.TEMPLATE_URL}plugins/shollu-autofill/js/shollu-autofill.js"></script>
<script src="{$.const.TEMPLATE_URL}plugins/shollu-combobox/js/shollu_cb.min.js"></script>
<script src="{$.const.TEMPLATE_URL}plugins/input-mask/jquery.inputmask.js"></script>
<script src="{$.const.TEMPLATE_URL}plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script>
	var $url_module = "{$.php.base_url()~$class~'/'~$method}", $bread = {$.php.json_encode($bread)};
	{* For design form interface *}
	var col = [], row = [], a = [];
	var form1 = BSHelper.Form({ autocomplete:"off" });
	var form2 = BSHelper.Form({ autocomplete:"off" });
	var form3 = BSHelper.Form({ autocomplete:"off" });
	var form4 = BSHelper.Form({ autocomplete:"off" });
	var box1 = BSHelper.Box({ type:"info" });
	
	col.push( $('<div style="text-align:center;width:100%;" />') );
	col.push( $('<img id="btn_uploadphoto" class="profile-user-img img-responsive img-circle" style="width:150px; margin-bottom:13px; cursor:pointer; cursor:hand;" title="Upload Photo" alt="User Picture" />') );
	col.push( $('<h3 class="profile-username text-center">{$.session.user_name}</h3>') ); 
	col.push( $('<p class="text-muted text-center">{$.session.user_description}</p>') ); 
	{* col.push( $('<ul class="list-group list-group-unbordered" />') *}
		{* .append( $('<li class="list-group-item" />') *}
			{* .append( BSHelper.Combobox({ horz:false, label:"Role (Default)", idname:"user_role_id", textField:"code_name", url:"{$.php.base_url('systems/a_user_role')}?filter=user_id="+{$.session.user_id}, remote: true, required:true }) ) ) *}
		{* .append( $('<li class="list-group-item" />') *}
			{* .append( BSHelper.Combobox({ horz:false, label:"Organization (Default)", idname:"user_org_id", textField:"code_name", url:"{$.php.base_url('systems/a_user_org')}?filter=user_id="+{$.session.user_id}, remote: true, required:true }) ) ) *}
  {* ); *}
	{* col.push( BSHelper.Button({ type:"button", label:"Reload", idname:"btn_reload", *}
		{* onclick:"var last_url = window.location.href; *}
			{* $.getJSON('{$.const.RELOAD_LNK}', '', function(data){ window.location.replace(last_url); });"  *}
	{* }) );  *}
	form1.append(subRow(subCol(12, col)));
	box1.find('.box-body').append(form1);
	
	var tab1 = BSHelper.Tabs({
		dataList: [
			{	title:"Personal", idname:"tab-personal", 
				content:function(){
					col = [], row = [], a = [];
					{* col.push(BSHelper.Input({ horz:false, type:"text", label:"Code", idname:"code", required: false, })); *}
					{* col.push(BSHelper.Input({ horz:false, type:"text", label:"Name", idname:"name", required: true, })); *}
					col.push(BSHelper.Input({ horz:false, type:"text", label:"First Name", idname:"first_name", required: true, }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Last Name", idname:"last_name", required: true, }));
					col.push(BSHelper.Input({ horz:false, type:"textarea", label:"Description", idname:"description", }));
					row.push(subCol(6, col)); col = [];
					col.push(BSHelper.Checkbox({ horz:false, label:"Is Active", idname:"is_active", value:1 }));
					col.push(BSHelper.Input({ type:"text", label:"Birth Place", idname:"birth_place", required: false }));
					col.push(BSHelper.Input({ type:"date", label:"Birth Date", idname:"birth_date", cls:"auto_ymd", format:"{$.session.date_format}" }));
					row.push(subCol(6, col)); col = [];
					a.push(subRow(row)); col = []; row = [];
					col.push(BSHelper.Combobox({ horz:false, label:"Gender", label_link:"{$.const.PAGE_LNK}?pageid=62", idname:"gender_id", url:"{$.php.base_url('hrm/hr_gender')}", remote: true }));
					col.push(BSHelper.Combobox({ horz:false, label:"Religion", label_link:"{$.const.PAGE_LNK}?pageid=71", idname:"religion_id", url:"{$.php.base_url('hrm/hr_religion')}", remote: true }));
					col.push(BSHelper.Combobox({ horz:false, label:"Marital Status", label_link:"{$.const.PAGE_LNK}?pageid=66", idname:"marital_status_id", url:"{$.php.base_url('hrm/hr_marital_status')}", remote: true }));
					row.push(subCol(6, col)); col = [];
					col.push(BSHelper.Combobox({ horz:false, label:"Education Level", label_link:"{$.const.PAGE_LNK}?pageid=55", idname:"education_level_id", url:"{$.php.base_url('hrm/hr_education')}", remote: true }));
					col.push(BSHelper.Combobox({ horz:false, label:"Home Status", label_link:"{$.const.PAGE_LNK}?pageid=63", idname:"home_status_id", url:"{$.php.base_url('hrm/hr_home_status')}", remote: true }));
					col.push(BSHelper.Combobox({ horz:false, label:"Nationality", label_link:"{$.const.PAGE_LNK}?pageid=69", idname:"nationality_id", url:"{$.php.base_url('hrm/hr_nationality')}", remote: true }));
					row.push(subCol(6, col)); col = [];
					a.push(subRow(row)); col = []; row = [];
					{* form2.append(subRow(row)); *}
					{* form2.append(subRow(subCol(12, BSHelper.Button({ type:"submit", label:"Save", cls:"btn-primary" }) )) ); *}
					{* return form2; *}
					return a;
				} 
			},
			{	title:"Contact", idname:"tab-contact", 
				content:function(){
					col = [], row = [], a = [];
					col.push(BSHelper.Input({ type:"text", label:"Email", idname:"email", required: false }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Phone", idname:"phone", required: false, }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Fax", idname:"fax", required: false, }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Website", idname:"website", required: false, }));
					row.push(subCol(6, col)); col = [];
					row.push(subCol(6, col)); col = [];
					{* form3.append(subRow(row)); *}
					{* form3.append(subRow(subCol(12, BSHelper.Button({ type:"submit", label:"Save", cls:"btn-primary" }) )) ); *}
					{* return form3; *}
					return subRow(row);
				} 
			},
			{	title:"Employment", idname:"tab-employment", 
				content:function(){
					col = [], row = [], a = [];
					col.push(BSHelper.Input({ type:"text", label:"Employee ID/NIK", idname:"employee_id", required: false }));
					col.push(BSHelper.Input({ horz:false, type:"date", label:"Begin Date", idname:"begin_date", cls:"auto_ymd", format:"{$.session.date_format}" }));
					col.push(BSHelper.Input({ horz:false, type:"date", label:"End Date", idname:"end_date", cls:"auto_ymd", format:"{$.session.date_format}" }));
					col.push(BSHelper.Combobox({ horz:false, label:"Job Title", label_link:"{$.const.PAGE_LNK}?pageid=64", idname:"job_title_id", url:"{$.php.base_url('hrm/hr_job_title')}", remote: true }));
					col.push(BSHelper.Combobox({ horz:false, label:"Occupation", label_link:"{$.const.PAGE_LNK}?pageid=70", idname:"occupation_id", url:"{$.php.base_url('hrm/hr_occupation')}", remote: true }));
					col.push(BSHelper.Combobox({ horz:false, label:"Employee Level", label_link:"{$.const.PAGE_LNK}?pageid=57", idname:"employee_level_id", url:"{$.php.base_url('hrm/hr_employee_level')}", remote: true }));
					row.push(subCol(6, col)); col = [];
					col.push(BSHelper.Input({ type:"text", label:"BPJS TK No", idname:"bpjs_tk_no", required: false }));
					col.push(BSHelper.Input({ type:"text", label:"BPJS KES No", idname:"bpjs_kes_no", required: false }));
					row.push(subCol(6, col)); col = [];
					{* col.push(BSHelper.Combobox({ label:"Layout", idname:"layout", required: true,
						list:[
							{ id:"layout-boxed", name:"Boxed" },
							{ id:"layout-fixed", name:"Fixed" },
							{ id:"sidebar-collapse", name:"Sidebar Collapse" },
						]
					}));
					col.push(BSHelper.Combobox({ label:"Language", idname:"language", required: true,
						list:[
							{ id:"english", name:"English" },
						] 
					})); *}
					{* form4.append(subRow(subCol(6, col))); *}
					{* form4.append(subRow(subCol(12, BSHelper.Button({ type:"submit", label:"Save", idname:"btn_saveconfig" }) )));  *}
					{* return form4; *}
					return subRow(row);
				} 
			},
			{	title:"Finance & Taxes", idname:"tab-finance", 
				content:function(){
					col = [], row = [], a = [];
					col.push(BSHelper.Combobox({ horz:false, label:"Bank", label_link:"{$.const.PAGE_LNK}?pageid=20", idname:"bank_id", url:"{$.php.base_url('hrm/fa_bank')}", remote: true }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Account No", idname:"bank_account_no", required: false, }));
					row.push(subCol(6, col)); col = [];
					col.push(BSHelper.Input({ horz:false, type:"text", label:"NPWP No", idname:"npwp_no", required: false, }));
					col.push(BSHelper.Input({ horz:false, type:"date", label:"NPWP Date", idname:"npwp_date", cls:"auto_ymd", format:"{$.session.date_format}" }));
					col.push(BSHelper.Input({ horz:false, type:"textarea", label:"NPWP Address", idname:"npwp_address", }));
					row.push(subCol(6, col)); col = [];
					a.push(subRow(row)); col = []; row = [];
					row.push(subCol(6, col)); col = [];
					row.push(subCol(6, col)); col = [];
					a.push(subRow(row)); col = []; row = [];
					return a;
				} 
			},
			{	title:"Others", idname:"tab-other", 
				content:function(){
					col = [], row = [], a = [];
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Father Name", idname:"father_name", required: false, }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Mother Name", idname:"mother_name", required: false, }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Spouse Name", idname:"spouse_name", required: false, }));
					row.push(subCol(6, col)); col = [];
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Child Name 1", idname:"child1_name", required: false, }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Child Name 2", idname:"child2_name", required: false, }));
					col.push(BSHelper.Input({ horz:false, type:"text", label:"Child Name 3", idname:"child3_name", required: false, }));
					row.push(subCol(6, col)); col = [];
					a.push(subRow(row)); col = []; row = [];
					row.push(subCol(6, col)); col = [];
					row.push(subCol(6, col)); col = [];
					a.push(subRow(row)); col = []; row = [];
					return a;
				} 
			},
			{	title:"Allowance", idname:"tab-allowance", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Card", idname:"tab-card", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Education", idname:"tab-education", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Employee History", idname:"tab-employee-history", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Experience", idname:"tab-experience", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Facility", idname:"tab-facility", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Leave", idname:"tab-leave", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Loan", idname:"tab-loan", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Training", idname:"tab-training", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Travel", idname:"tab-travel", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
			{	title:"Sosial", idname:"tab-sosial", 
				content:function(){
					col = [], row = [], a = [];
					row.push(subCol(12, col)); col = [];
					return subRow(row);
				} 
			},
		],
	});
	
	col = [];
	col.push(subCol(3, box1));
	col.push(subCol(9, tab1));
	$(".content").append(subRow(col));
	
	$("[data-mask]").inputmask();
	
	
	
	{* col.push(BSHelper.Input({ horz:false, type:"text", label:"Code", idname:"code", required: false, }));
	col.push(BSHelper.Input({ horz:false, type:"text", label:"Name", idname:"name", required: true, }));
	col.push(BSHelper.Input({ horz:false, type:"textarea", label:"Description", idname:"description", }));
	col.push(BSHelper.Checkbox({ horz:false, label:"Is Active", idname:"is_active", value:1 }));
	row.push(subCol(6, col)); col = [];
	row.push(subCol(6, col)); col = [];
	form1.append(subRow(row));
	form1.append(subRow(subCol()));
	col = [];
	col.push( BSHelper.Button({ type:"submit", label:"Submit", idname:"submit_btn" }) );
	col.push( '&nbsp;&nbsp;&nbsp;' );
	col.push( BSHelper.Button({ type:"button", label:"Cancel", cls:"btn-danger", idname:"btn_cancel", onclick:"window.history.back();" }) );
	form1.append( col );
	box1.find('.box-body').append(form1);
	$(".content").append(box1); *}

</script>
<script src="{$.const.ASSET_URL}js/window_edit.js"></script>
