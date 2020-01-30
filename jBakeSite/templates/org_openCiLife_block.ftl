<#include "header.ftl">

	<#include "menu.ftl">
	
	<#if (content.specificClass)??>
		<div class="<#escape x as x?xml>${content.specificClass}</#escape>">
	<#else>
		<div>
	</#if>
	
		<#if (content.title)??>
			<h2
			<#if (content.anchorId)??>
				id="${content.anchorId}"
			<#else></#if>
			class="poleTitle"><#escape x as x?xml>${content.title}</#escape></h2>
		<#else></#if>
		
		<div class="poleBody">
			${content.body}
			
			<#if (content.includePoleList)??>
				<#if content.includePoleList == "true">
					<div>
						<#list org_openCiLife_poles as pole>
							<#if (pole.status == "published")>
								<a href="${pole.uri}"><h2>
								<#if pole.icone??>
									<i class="${pole.icone}"></i>
								</#if>
								<#escape x as x?xml>${pole.title}</#escape>
							</h2></a>
							</#if>
						</#list>
					</div> 
				</#if>
			</#if>
		</div>
		
		<#if (content.contentImage)??>
			<img src=${content.contentImage} class="poleIcons"/>
		<#else></#if>
		
	</div>

<#include "footer.ftl">