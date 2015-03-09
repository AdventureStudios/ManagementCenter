<cfparam name="URL.TN" default="00000000-0000-0000-0000-000000000000">

<cfquery name="rsTasks" datasource="SOURCE_User">
SELECT *
FROM dbo.Tasks
WHERE Task_TrackingNumber = <cfqueryparam value="#URL.TN#"> 
</cfquery>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
<!--body {font-family: Helvetica, sans-serif;font-size: 14px;color: #000;background-color: #E6E6E6;margin: 20px;}-->
<!--.contents {font-family: Helvetica, sans-serif;font-size: 14px;color: #000;padding-top: 10px;padding-right: 30px;padding-bottom: 30px;padding-left: 30px;display: block;}-->
<!--.contents_notes {font-family: Helvetica, sans-serif;font-size: 16px;color: #408000;padding-top: 10px;padding-right: 30px;padding-bottom: 30px;padding-left: 30px;border: 1px dashed #CCC;line-height: 20px;}-->
<!--.contents_team {font-family: Helvetica, sans-serif;font-size: 14px;color: #000;padding-top: 10px;padding-right: 30px;padding-bottom: 30px;padding-left: 30px;display: block;}-->
<!--.contents_wrapper {font-family: Helvetica, sans-serif;font-size: 14px;color: #000;padding-top: 10px;padding-right: 30px;padding-bottom: 5px;padding-left: 30px;font-weight: bold;border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #000;display: block;}-->
<!--.headline {font-family: Helvetica, sans-serif;font-size: 32px;line-height: 36px;color: #000;padding-top: 30px;padding-right: 30px;padding-bottom: 10px;padding-left: 30px;display: block;}-->
<!--.headline_task {font-family: Helvetica, sans-serif;font-size: 28px;line-height: 32px;color: #000;padding-top: 20px;padding-right: 30px;padding-bottom: 10px;padding-left: 30px;display: block;}-->
<!--.message_wrapper {display: block;padding: 10px;border: 1px dotted #999;}-->
<!--.message_wrapper_title {font-family: Helvetica, sans-serif;font-size: 16px;color: #999;padding-top: 10px;padding-right: 30px;padding-bottom: 5px;padding-left: 30px;line-height: 20px;}-->
</style>
</head>
<body>
<cfoutput>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="##FFFFFF">
<tr>
<td><img src="http://jesuits.org/managementcenter/images_base_email/email_header_update.jpg" width="800" height="112">
<div class="headline">Progress Note</div>
<div class="message_wrapper">
<div class="contents_notes">#rsTasks.Notes_Completed#</div>
<cfif #rsTasks.Task_Video# NEQ ''>
<div class="message_wrapper_title">Video message</div>
<div class="contents">#rsTasks.Task_Video#</div>
</cfif>
</div>

<div class="message_wrapper">
<div class="message_wrapper_title">Task</div>
<div class="headline_task">#rsTasks.Task#</div>
<div class="contents">
#paragraph_Format_Standard(rsTasks.Task_Details)#<br>
<br>
<cfif #rsTasks.Attached_File# GT "" ><strong>File:</strong> <a href="http://jesuits.org/Assets/Tasks/#rsTasks.Attached_File#">#rsTasks.Attached_File#</a></cfif>
</div>
<div class="contents_team">Message to: #REPLACE(rsTasks.AssignedTo, ",", ", ", "All")#</div>
</div>
</td>
  </tr>
</table>
</cfoutput>

</body>
</html>
