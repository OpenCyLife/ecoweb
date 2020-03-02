<#include "header.ftl">

	<#include "menu.ftl">

	<#if (content.title)??>
	<div class="page-header">
		<h1><#escape x as x?xml>${content.title}</#escape></h1>
	</div>
	<#else></#if>
	
	<div class="projectInfos">
		<#if (content.projectStatus)??>
			<div class="projectStatus">
				<span class="label">Status : </span><span class="value"><#escape x as x?xml>${content.projectStatus}</#escape></span>
			</div>
		</#if>
		
		<#if (content.owner)??>
			<div class="projectOwner">
				<span class="label">Porteur : </span><span class="value"><#escape x as x?xml>${content.owner}</#escape></span>
			</div>
		</#if>
		
		<#if (content.members)??>
			<div class="projectMembers">
				<span class="label">Membres principaux : </span>
				<#assign memberList = ecoWeb.splitStringToSequence(content.members)>
				<#if (memberList?is_string || memberList?size <= 1)>
					<span class="value"><#escape x as x?xml>${content.members}</#escape></span>
				<#else>
					<ul>
						<#list memberList as member>
							<li class="value"><#escape x as x?xml>${member}</#escape></li>
						</#list>
					</ul>
				</#if>
			</div>
		</#if>
	</div>

	<p>${content.body}</p>

<#include "footer.ftl">