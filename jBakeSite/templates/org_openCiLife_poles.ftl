<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>${content.title}</h1>
	</div>
	
	<div>
		${content.body}
	</div>
	
	<div class="document_list">
		<#list org_openCiLife_poles as pole>
			<#if (pole.status == "published")>
				<div class="document">
					<div class="document_header">
						<div class="document_intro">
						
						
							<a href="${pole.uri}"><h2>
							<#if pole.icone??>
								<i class="${pole.icone}"></i>
							</#if>
							<#escape x as x?xml>${pole.title}</#escape>
							</h2></a>
						</div>
					</div>
					<#if pole.exerpt??>
						<div class="document_exerpt">
							${pole.exerpt}
						</div>
					</#if>
					
					<div class="document_content" style="display:none">
						${pole.body}
					</div>
				</div>
				<hr />
			</#if>
		</#list>
	</div>

<#include "footer.ftl">