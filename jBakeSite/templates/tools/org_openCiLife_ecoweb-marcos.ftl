<#--  inspired by : https://subscription.packtpub.com/book/web_development/9781782163824/1/ch01lvl1sec06/top-9-features-you-need-to-know-about -->

<#-- Search if an element on a list, belong to another list 
param : aSequence : the sequence to search for matches
param : lookupItems : item or items to search for
param : **default** : , : autoSplitChar : String containing this Char will be converted to Sequence with autoSplitChar as separator
return : true in a least one lookupItems is found in aSequence
-->
<#function seq_containsOne aSequence lookupItems autoSplitChar = ",">
	<#assign found=false>
	
	<#assign transformedASequence=aSequence>
	<#assign transformedLookupItems=lookupItems>
	
	<#if autoSplitChar?? && autoSplitChar != "">
		<#if (aSequence?is_string && aSequence?contains(autoSplitChar))>
			<#assign transformedASequence=aSequence?split(r"\s*,\s*", "r")>
		</#if>
		
		<#if (lookupItems?is_string && lookupItems?contains(autoSplitChar))>
			<#assign transformedLookupItems=lookupItems?split(r"\s*,\s*", "r")>
		</#if>
	
	</#if>
	
	<#if (transformedLookupItems?is_sequence)>
		<#if (transformedASequence?is_sequence)>
			<#list transformedLookupItems as item>
				<#if (!found)>
					<#assign found = transformedASequence?seq_contains(item)>
				</#if>
			</#list>
		<#else> <#-- transformedASequence is not a Sequence, but transformedLookupItems IS -->
			<#assign found = transformedLookupItems?seq_contains(transformedASequence)>
		</#if>
	<#else> <#-- transformedLookupItems is not a Sequence -->
		<#if (transformedASequence?is_sequence)>
			<#assign found = transformedASequence?seq_contains(transformedLookupItems)>
		<#else> <#-- both params are NOT lists -->
			<#assign found = transformedLookupItems == transformedASequence>
		</#if>>
	</#if>
	
	<#return found>
</#function>

<#-- Build URL, using the root.path if required 
param : relativeUrl : the relative URL to adapt
return : URL prepend with rootPath (if configured)
-->
<#function buildRootPathAwareURL relativeUrl>
	<#assign rootPathAwareURL = relativeUrl>
	
	<#if (content.rootpath)??>
		<#assign rootPathAwareURL = content.rootpath + relativeUrl>
	</#if>
	
	<#return rootPathAwareURL>
</#function>

<#-- search for absolute UURL in content and preprend the RootPath
param : text : the teh text to search for relative URL
param : rootPath : default ${content.rootpath} : the rootPath of teh webSite
return : text with URL transformed
-->
<#function findAndReplaceUrlAddAwareRootPath text rootPath = content.rootpath>
	<#assign contentRootPathAwareURL = text>
	
	<#if (config.replaceRootContextInBodyContent)?? && config.replaceRootContextInBodyContent == true>
		<#assign contentRootPathAwareURL = text?replace("/images/", "../images/", "r")>
	</#if>
	
	<#return contentRootPathAwareURL>
</#function>

<#-- display text from config file. Handle corectly when coma "," in text
param : theText : the text to display (may be a "sequence")
return : a text (with original coma ",")
-->
<#function displayConfigText theText>
	<#if theText?is_sequence>
		<#assign text = theText?join(", ")>
	<#else>
		<#assign text = theText>
	</#if>
	<#return text>
</#function>

<#-- display debug messages in HTML page. Only displayend if "site.debug.enabled" exist and is "true"
param : message : the message to display (a String)
-->
<#macro debug message...>
	<#if (config.site_debug_enabled)?? && config.site_debug_enabled == "true">
		<div class="debug">
		<#if (message?is_hash)>
			<#-- Called using <@macro debug "A message"> OR <@macro debug "first message", "Second message"> OR <@macro debug "first message", ["Second message", "And an other"]> -->
			<#list message as key, value>
				<#if value?is_sequence>
					<#list value as aMessage>
						<p class="debug"> ${key} = ${aMessage}</p>
					</#list>
				<#else>
					<p class="debug">${key} = ${value}</p>
				</#if>
			</#list>
		<#elseif (message?is_sequence)>
			<#-- Called using <@macro debug ["A message"]> OR <@macro debug ["first message", "Second message"]> -->
				<#list message as value>
					<#if value?is_sequence>
						<#list value as aMessage>
							<p class="debug"> ${aMessage}</p>
						</#list>
					<#else>
						<#if (value?is_boolean)>
						<p class="debug">${value?string('yes', 'no')}</p>
						<#else>
							<p class="debug">${value}</p>
						</#if>
					</#if>
				</#list>
		<#else>
			<p class="debug"> ${message}</p>
		</#if>
		</div>
	</#if>
</#macro>



<#-- build an modal block (using Boostrap)
param : modalId : *default* : basicModal : (html) ID of the modal (to be ued in link to target this modal)
param : closeButtonlabel : *default* : close : lable of the botom close button
-->
<#macro buildModal modalId="basicModal" closeButtonlabel = "close">
	<div class="modal fade" id="${modalId}" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Basic Modal</h4>
      			</div>
				<div class="modal-body">
					<img src="none" class="modal-image"/>
					<div class="modal-body-content">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">${closeButtonlabel}</button>
				</div>
			</div>
		</div>
	</div>
</#macro>

<#-- build an modal block (using Boostrap)
param : content : content to search for incluide content
-->
<#macro buildsubContent content>
	<#if (content.includeContent)??>
		<#if ((content.includeContent.display??) && (content.includeContent.display.type??))>
			<#assign subContents = db.getAllContent(content.includeContent.type)>
			<@debug "Included Type " + content.includeContent.type/>
			<#if (subContents?size >0)>
				<#assign subContentDisplayMode = (content.includeContent.display.type)!"bullet">
				<#assign subContentDisplayContentMode = (content.includeContent.display.content)!"link">
				
				<#assign theModalId = "basicModal">
				<#if (subContentDisplayContentMode == "modal")>
					<@buildModal modalId= theModalId/>
				</#if>
				
				<@debug subContentDisplayMode = subContentDisplayMode subContentDisplayContentMode = subContentDisplayContentMode/>
				<div class="${subContentDisplayMode}_list">
				<#list subContents?sort_by("order") as subContent>
					<#assign subContentCategory = (subContent.category)!"__none__">
					<#assign includeContentFilter = content.includeContent.category!"none">
					
					<#if (includeContentFilter == "none" || seq_containsOne(includeContentFilter, subContentCategory))>
						<@debug "ACEPTED : SubContent : " + (subContent.title)!"not_set", includeContentFilter  + " IN " + subContentCategory/>
						<div class="${subContentDisplayMode}">
							<#if (subContentDisplayContentMode == "link")>
								<a href="${ecoWeb.buildRootPathAwareURL(subContent.uri)}" class="widget_link">
							<#elseif (subContentDisplayContentMode == "modal")>
								<a href="#" role="button" class="widget_link_modal" data-toggle="modal" data-target="#${theModalId}">
							</#if>
							<#if (subContent.contentImage??)>
								<div class="${subContentDisplayMode}_image">
									<img src="${ecoWeb.buildRootPathAwareURL(subContent.contentImage)}" class="widget_image" />
								</div>
							</#if>
							<h2 class="${subContentDisplayMode}_title widget_title">
								${subContent.title!""}
							</h2>
							<div class="${subContentDisplayMode}_exerpt widget_exerpt">
								${subContent.exerpt!""}
							</div>
							<#if (subContentDisplayContentMode == "link" || subContentDisplayContentMode == "modal")>
								</a>
							</#if>
							<div class="${subContentDisplayMode}_content widget_content">
								${subContent.body!""}
							</div>
						</div>
						<#else>
							<@debug "FILTRED : SubContent : " + (subContent.title)!"not_set", includeContentFilter + " NOT IN " subContentCategory />
						</#if> <#-- end of category filter check -->
					</#list>
			<#else>
				pas de contenus (pour le moment).
			</#if>
		</#if>
	</#if>
</#macro>
