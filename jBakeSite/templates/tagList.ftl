<#include "header.ftl">

	<#include "menu.ftl">
	<h1>Tags</h1>
	
	<ul>
		<#list tags as tag>
			<li><a href="${ecoWeb.buildRootPathAwareURL(tag.uri)}">${tag.name}</a></li>
		</#list>
	</ul>
	
<#include "footer.ftl">