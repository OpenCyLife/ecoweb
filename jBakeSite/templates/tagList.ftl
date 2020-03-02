<#include "header.ftl">

	<#include "menu.ftl">
	<h1>Tags</h1>
	
	<ul>
		<#list tags?sortBy("name") as tag>
		<#if (tag?? && tag?hasContent && tag.name?hasContent)>
			<li><a href="${ecoWeb.buildRootPathAwareURL(tag.uri)}">${tag.name}</a></li>
			</#if>
		</#list>
	</ul>
	
<#include "footer.ftl">