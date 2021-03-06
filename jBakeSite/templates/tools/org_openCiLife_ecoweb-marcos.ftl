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
			<#assign transformedASequence = splitStringToSequence(aSequence)>
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

<#-- convert a String to a Sequence
param : value : the String to convert
param : **default** : , : autoSplitChar : String containing this Char will be converted to Sequence with autoSplitChar as separator
return : URL prepend with rootPath (if configured)
-->
<#function splitStringToSequence stringValue autoSplitChar = ",">
	<#if (stringValue?is_string && stringValue?contains(autoSplitChar))>
		<#assign sequence=stringValue?split(r"\s*,\s*", "r")>
	<#else>
		<#assign sequence=[stringValue]>
	</#if>
	
	<#return sequence>
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
<#-- 
<#function findAndReplaceUrlAddAwareRootPath text rootPath = content.rootpath>
	<#assign contentRootPathAwareURL = text>
	
	<#if (config.rootPath)??>
		<#assign contentRootPathAwareURL = text?replace("/images/", rootPath + "/images/", "r")>
	</#if>
	
	<#return contentRootPathAwareURL>
</#function>
 -->
 
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


<#-- Find the **displayName** of a custom document type
param : postType : the name of the document type
return : a text, the configured display name (in jbake.properties) or the original post type name
-->
<#function getDisplayName postType>
	<#assign postTypeDisplayName = postType>
	<#assign postTypeDisplayNameProp = "ecoweb_type_" + postType + "_displayName">
	
	<#if (config[postTypeDisplayNameProp])??>
		<#assign postTypeDisplayName = config[postTypeDisplayNameProp]>
	</#if>
	
	<#return postTypeDisplayName>
</#function>


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
		<@debug "Found content ton include"/>
		<#if ((content.includeContent.display??) && (content.includeContent.display.type??))>
			<#assign subContents = db.getAllContent(content.includeContent.type)>
			<@debug "Included Type " + content.includeContent.type/>
			<#if (subContents?size >0)>
				<#assign subContentDisplayMode = (content.includeContent.display.type)!"bullet">
				<#assign subContentDisplayContentMode = (content.includeContent.display.content)!"link">
				<#assign specificClass = (content.includeContent.specificClass)!"">
				
				<#assign theModalId = "basicModal">
				<#if (subContentDisplayContentMode == "modal")>
					<@buildModal modalId= theModalId/>
				</#if>
				
				<@debug subContentDisplayMode = subContentDisplayMode subContentDisplayContentMode = subContentDisplayContentMode/>
				<#if (subContentDisplayMode == "table")>
					<table class="${subContentDisplayMode}_list content_type_${subContentDisplayContentMode} ${specificClass}">
						<thead>
							<tr>
								<th>Logo</th>
								<th>Nom</th>
								<th>Résumé</th>
								<#if (content.includeContent.display.additionalData)??>
									<#list content.includeContent.display.additionalData as colName, colValue>
										<#if (colName?? && colName != "")>
								<th>${colName}</th>
										</#if>
									</#list>
								</#if>
							</tr>
						</thead>
						<tbody>
				<#else>
					<div class="${subContentDisplayMode}_list ${specificClass}">
				</#if>
				<#list subContents?sort_by("order") as subContent>
					<#assign subContentCategory = (subContent.category)!"__none__">
					<#assign includeContentFilter = content.includeContent.category!"all">
					<#assign specificContentClass = (content.includeContent.display.specificClass)!"">
					<#if ((subContent.status == "published") && (includeContentFilter == "all" || seq_containsOne(includeContentFilter, subContentCategory)))>
						<@debug "ACEPTED : SubContent : " + (subContent.title)!"not_set", includeContentFilter  + " IN " + subContentCategory/>
						<#if (subContentDisplayMode == "table")>
									<tr<#rt>
										<#if (subContentDisplayContentMode == "link")>
											<#lt> data-href="${ecoWeb.buildRootPathAwareURL(subContent.uri)}"<#rt>
										</#if>
										<#if (specificContentClass != "")>
											<#lt> class="${specificContentClass}"
										</#if>
									<#lt>>
										<td class="${subContentDisplayMode}_image">
											<#if (subContent.contentImage)??>
												<img src="${ecoWeb.buildRootPathAwareURL(subContent.contentImage)}" class="widget_image" />
											</#if>
										</td>
										<td class="${subContentDisplayMode}_title widget_title">
											${subContent.title!""}
										</td>
										<td class="${subContentDisplayMode}_exerpt widget_exerpt">
											${subContent.exerpt!""}
										</td>
										<#if (subContentDisplayContentMode == "modal")>
										<td>
											<button type="button" class="btn btn-primary btn-block ${subContentDisplayMode}_showMore showMore" data-toggle="modal" data-target="#${theModalId}">Détails</button>
										</td>
										</#if>
										<#if (subContentDisplayMode == "modal" || subContentDisplayMode == "visible")>
										<td class="${subContentDisplayMode}_content widget_content">
											${subContent.body!""}
										</td>
										</#if>
										<#if ((content.includeContent.display.additionalData)?? && content.includeContent.display.additionalData?is_hash)>
											<#list content.includeContent.display.additionalData as colName, colValue>
												<#if (subContent[colValue]?is_date)>
										<td>${subContent[colValue]?string('dd/MM/yyyy à HH:mm')}</td>
												<#else>
										<td>${subContent[colValue]}</td>
												</#if>
											</#list>
										</#if>
									</tr>
						<#else>
							<div class="${subContentDisplayMode} content_type_${subContentDisplayContentMode} ${specificContentClass}">
								<#if (subContentDisplayContentMode == "link")>
									<a href="${ecoWeb.buildRootPathAwareURL(subContent.uri)}" class="widget_link">
								<#elseif (subContentDisplayContentMode == "modal")>
									<a href="#" role="button" class="widget_link_modal" data-toggle="modal" data-target="#${theModalId}">
								</#if>
								<#if (subContent.contentImage??)>
									<div class="${subContentDisplayMode}_image">
										<#if (subContent.contentImage)??>
										<img src="${ecoWeb.buildRootPathAwareURL(subContent.contentImage)}" class="widget_image"/>
										</#if>
									</div>
								</#if>
								<h3 class="${subContentDisplayMode}_title widget_title"><#rt>
									<#t>${subContent.title!""}
								<#lt></h3>
								<div class="${subContentDisplayMode}_exerpt widget_exerpt">
									${subContent.exerpt!""}
								</div>
								<#if (subContentDisplayContentMode == "link" || subContentDisplayContentMode == "modal")>
									</a>
								</#if>
								<#if (subContentDisplayContentMode == "modal")>
									<button type="button" class="btn btn-primary btn-block ${subContentDisplayMode}_showMore showMore" data-toggle="modal" data-target="#${theModalId}">Détails</button>
								</#if>
								<#if (subContentDisplayContentMode == "modal" || subContentDisplayContentMode == "visible")>
									<div class="${subContentDisplayMode}_content widget_content">
										${subContent.body!""}
									</div>
								</#if>
							</div>
						</#if> <#-- end onf contentDuisplayType "switch" -->
					<#else>
						<@debug "FILTRED (" + subContent.status + ") : SubContent : " + (subContent.title)!"not_set", includeContentFilter + " NOT IN " subContentCategory />
					</#if> <#-- end of category filter check -->
				</#list>
				<#if (subContentDisplayMode == "table")>
						</tbody>
					</table>
				<#else>
					</div>
				</#if>
			<#else>
				pas de contenus (pour le moment).
			</#if>
		</#if>
	<#else>
		<@debug "No SubContent for this content"/>
	</#if>
</#macro>
