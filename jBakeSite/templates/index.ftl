<#include "header.ftl">
	
	<#include "menu.ftl">

	<#list org_openCiLife_blocks?sort_by("order") as block>
		<#assign blockCategory = block.category>
		<#if ( ecoWeb.seq_containsOne(blockCategory, "homepage"))>
		
		<#if (block.anchorId)??>
			<span stype="display:none" id="${block.anchorId}"></span>
		<#else></#if>
		
		<div
		<#if (block.specificClass)??>
			class="<#escape x as x?xml>${block.specificClass}</#escape>"
		</#if>
		>
		<#if (block.title)??>
			<h2
			class="blockTitle"><#escape x as x?xml>${block.title}</#escape></h2>
		<#else></#if>
		
				<div class="blockBody">
					<div class="blockContent">
						${block.body}
						
						<#if (block.includePoleList)??>
						<#if block.includePoleList == "true">
							<div class="blockSubContent">
								<#list org_openCiLife_poles as pole>
									<#if (pole.status == "published")>
										<div class="blockDescription">
										<#if pole.image??>
												<img class="descriptionIcons" src="${pole.image}">
										</#if>
										<p class="titleDescription">
											<#escape x as x?xml>${pole.title}</#escape>
										</p>
											${pole.body}
										</div>
									</#if>
								</#list>
							</div>
						</#if>
					</#if>
					</div>	
						
					<#if (block.contentImage)??>
						<img src=${block.contentImage} class="blockIcon"/>
					<#else></#if>
				</div>
			</div>
		</#if>
  	</#list>

<#include "footer.ftl">