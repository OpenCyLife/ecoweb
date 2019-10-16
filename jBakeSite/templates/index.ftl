<#include "header.ftl">
	
	<#include "menu.ftl">

	<#list blocks as block>
	
	<div
	<#if (block.specificClass)??>
		class="<#escape x as x?xml>${block.specificClass}</#escape>"
	</#if>
	>
	<#if (block.title)??>
		<h2
		<#if (block.ancorId)??>
			id="${block.ancorId}"
		</#if>
		class="poleTitle"><#escape x as x?xml>${block.title}</#escape></h2>
	<#else></#if>
	
			<div class="poleBody">
				<div class="blockContent">
					${block.body}
					
					<#if (block.includePoleList)??>
					<#if block.includePoleList == "true">
						<div class="containerPole poleThemes">
							<#list poles as pole>
								<#if (pole.status == "published")>
									<span> 
										<a href="${pole.uri}">
											<#if pole.icone??>
												<i class="${pole.icone}"></i>
											</#if>
											<#escape x as x?xml>${pole.title}</#escape>
										</a> 
									</span>
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