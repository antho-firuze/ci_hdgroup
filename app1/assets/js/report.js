/*!
 * import_data.js v1.0.0
 * Copyright 2016, Ahmad Firuze
 *
 * Freely distributable under the MIT license.
 * Portions of G.ENE.SYS Ultimate - Manufacturing Systems
 *
 * A script file to support import_data.tpl
 */
/* Get Params */
var id = getURLParameter("id"), 
	$pageid = getURLParameter("pageid"),
	$filter = getURLParameter("filter"),
	$ob = getURLParameter("ob"),
	act = getURLParameter("action"),
	act_name = "";
/* 
/* ========================================= */
/* Default init for Header									 */
/* ========================================= */

// $( document ).ready(function() {
	/* Start :: Init for Title, Breadcrumb */
	// console.log($bread);
	// console.log($bread.length);
	$(document).prop('title', $HEAD_TITLE+' > '+$bread[$bread.length-1].title);
	$bread.unshift({ icon:"fa fa-dashboard", title:"Dashboard", link: "window.location.replace('"+$APPS_LNK+"')" });
	$(".content").before(BSHelper.PageHeader({ 
		bc_list: $bread
	}));
	
	$(".content-header small").html(act_name);
// });
/* 
/* ==================================== */
/* Default action for Form Import Data */
/* ==================================== */
$( document ).ready(function() {
	
	/* This class is for auto conversion from dmy to ymd */
	$(".auto_ymd").on('change', function(){
		$('input[name="'+$(this).attr('id')+'"]').val( datetime_db_format($(this).val(), $(this).attr('data-format')) );
	});
	
	/* For inputmask */
	if (jQuery().inputmask) {
		$("[data-mask]").inputmask();
	}
	
	/* Init form */
	$('form').each(function(e){
		var form = $(this);
		
		if (typeof(tinyMCE) !== 'undefined') {
			form.on('submit', function(e){
				form.find('textarea.editor-tinymce').val(tinyMCE.activeEditor.getContent());
			});
		}
		
		form.validator().on('submit', function(e) {
			if (e.isDefaultPrevented()) { return false;	} 

			/* adding primary key id on the fly */
			form.append(BSHelper.Input({ type:"hidden", idname:"export", value:1 }));
			
			form.find("[type='submit']").prop( "disabled", true );
			
			$.ajax({ url: $url_module, method: 'OPTIONS', async: true, dataType:'json',
				data: form.serializeJSON(),
				success: function(result) {
					if (result.status){
						form.find("[type='submit']").prop( "disabled", false );
						window.open(result.data.file_url);
					}
				},
				error: function(data) {
					if (data.status >= 500){
						var message = data.statusText;
					} else {
						var error = JSON.parse(data.responseText);
						var message = error.message;
					}
					form.find("[type='submit']").prop( "disabled", false );
					BootstrapDialog.show({ message:message, closable: false, type:'modal-danger', title:'Notification', 
						buttons: [{ label: 'OK', hotkey: 13, 
							action: function(dialogRef) {
								dialogRef.close();
							} 
						}],
					});
				}
			});

			return false;
		});
	});
	
});
