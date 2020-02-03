<#--  inspired by : https://subscription.packtpub.com/book/web_development/9781782163824/1/ch01lvl1sec06/top-9-features-you-need-to-know-about -->

<#-- Search if an element on a list, belong to another list 
param : aSequence : the sequence to search for matches
param : lookupItems : item or items to search for
return : true in a least one lookupItems is found in aSequence
-->
<#function seq_containsOne aSequence lookupItems>
	<#assign found=false>
	<#if (lookupItems?is_sequence)>
	
		<#list lookupItems as item>
			<#if (!found)>
				<#assign found = aSequence?seq_contains(item) >
			</#if>
		</#list>
	<#else>
		<#assign found = aSequence?seq_contains(lookupItems) >
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
