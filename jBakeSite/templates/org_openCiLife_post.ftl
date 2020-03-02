<#include "header.ftl">
	
	<#include "menu.ftl">
	
	<#if ((content.displayDate)?? && content.displayDate == "true")>
		<p><em>${content.date?string("dd MMMM yyyy")}</em></p>
	</#if>
	<#if (content.title)??>
		<div class="page-header">
			<h1><#escape x as x?xml>${content.title}</#escape></h1>
		</div>
	</#if>
	${content.body}
	<@ecoWeb.buildsubContent content />
	
<#include "footer.ftl">