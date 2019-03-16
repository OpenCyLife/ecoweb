<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Les projets</h1>
	</div>
	<div class="project_list">
		<#list projects as project>
			<#if (project.status == "published")>
				<div class="project">
					<div class="project_header">
					<div class="project_image">
						<img src="${project.image!images/no_image.png}" width="150px" />
						</div>
						<div class="project_intro">
							<a href="${project.uri}"><h1><#escape x as x?xml>${project.title}</#escape></h1></a>
							<p>${project.date?string("dd MMMM yyyy")}</p>
						</div>
					</div>
					<#if project.exerpt??>
						<div class="project_exerpt">
							${project.exerpt}
						</div>
					</#if>
					<div class="project_content" style="display:none">
						${project.body}
					</div>
				</div>
				<hr />
			</#if>
		</#list>
	</div>

<#include "footer.ftl">