<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>${content.title}</h1>
	</div>
	
	<div>
		${content.body}
	</div>
	
	<div class="mosaic_list">
		<#list bonnes_pratiques as bp>
			<#if (bp.status == "published")>
				<div class="mosaic_item">
					<div class="mosaic_item_header">
						<div class="mosaic_item_intro">
							<a href="${bp.uri}"><h2><#escape x as x?xml>${bp.title}</#escape></h2></a>
							<p>${bp.date?string("dd MMMM yyyy")}</p>
						</div>
					</div>
					<#if bp.exerpt??>
						<div class="mosaic_item_exerpt">
							${bp.exerpt}
						</div>
					</#if>
					
					<div class="mosaic_item_content" style="display:none">
						${bp.body}
					</div>
				</div>
				<hr />
			</#if>
		</#list>
	</div>

<#include "footer.ftl">