<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>${content.title}</h1>
	</div>
	
	<div>
		${content.body}
	</div>
	
	<div class="document_list">
		<#list documents as document>
			<#if (document.status == "published")>
				<div class="document">
					<div class="document_header">
						<div class="document_intro">
							<a href="${document.uri}"><h2><#escape x as x?xml>${document.title}</#escape></h2></a>
							<p>${document.date?string("dd MMMM yyyy")}</p>
						</div>
					</div>
					<#if document.exerpt??>
						<div class="document_exerpt">
							${document.exerpt}
						</div>
					</#if>
					<#if document.download_link??>
						<div class="document_download_link">
							<a href="${document.download_link}">Téléchargez moi ! </a>
						</div>
					</#if>
					
					
					
					<div class="document_content" style="display:none">
						${document.body}
					</div>
				</div>
				<hr />
			</#if>
		</#list>
	</div>

<#include "footer.ftl">