<#include "header.ftl">

	<#include "menu.ftl">
	
	<#if (content.title)??>
		<h2><#escape x as x?xml>${content.title}</#escape></h2>
	<#else></#if>
	
	<div class=class="textItems">
		${content.body}
	</div>

<#include "footer.ftl">