<#include "header.ftl">

	<#include "menu.ftl">
	
	<#if (content.specificClass)??>
		<div class="<#escape x as x?xml>${content.specificClass}</#escape>">
	<#else>
		<div>
	</#if>
	
		<#if (content.title)??>
			<h2
			<#if (content.ancorId)??>
				id="${content.ancorId}"
			<#else></#if>
			class="poleTitle"><#escape x as x?xml>${content.title}</#escape></h2>
		<#else></#if>
		
		<div class="poleBody">
			${content.body}
			
			<#if (content.includePoleList)??>
				<#if content.includePoleList == "true">
					<div>
						<#list poles as pole>
							<#if (pole.status == "published")>
								<div class="poleBox 
								<#if (content.specificClass)??>
									 <#escape x as x?xml>${content.specificClass}</#escape>">
								<#else>
									">
								</#if>
								<h2>
									<#if pole.icone??>
										<i class="${pole.icone}"></i>
									</#if>
									<#escape x as x?xml>${pole.title}</#escape>
								</h2>
									<div class="poleContent">
										${pole.body}
									</div>
								</div>
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