<#include "header.ftl">
	
	<#include "menu.ftl">

	<#list org_openCiLife_blocks?sort_by("order") as block>
		<#assign blockCategory = block.category>
		<#if ( ecoWeb.seq_containsOne(blockCategory, "homepage"))>
		
		<div id="${block.anchorId}"
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
					
					<@ecoWeb.buildsubContent block />
					</div>	
						
					<#if (block.contentImage)??>
						<img src=${block.contentImage} class="blockIcon"/>
					<#else></#if>
				</div>
			</div>
		</#if>
  	</#list>

<#include "footer.ftl">