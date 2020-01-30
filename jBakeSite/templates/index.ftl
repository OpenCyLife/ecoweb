<#include "header.ftl">
	
	<#include "menu.ftl">

	<#list org_openCiLife_blocks?sort_by("order") as block>
	
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
		class="poleTitle"><#escape x as x?xml>${block.title}</#escape></h2>
	<#else></#if>
	
			<div class="poleBody">
				<div class="blockContent">
					${block.body}
					
					<#if (block.includePoleList)??>
					<#if block.includePoleList == "true">
						<div class="containerPole poleThemes">
							<#list org_openCiLife_poles as pole>
								<#if (pole.status == "published")>
									<div class="poleDescription">
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
					<img src=${block.contentImage} class="poleIcons"/>
				<#else></#if>
			</div>
		</div>
  	</#list>

<#include "footer.ftl">