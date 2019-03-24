<#include "header.ftl">
	
	<#include "menu.ftl">

	<#list blocks as block>
  		<#if (block.status == "published")>
  			<#if (block.title)??>
				<h2>${block.title}</h2>
			<#else></#if>
			
			<div class=class="textItems">
				${block.body}
			</div>
  		</#if>
  	</#list>
	

<#include "footer.ftl">