
<%@ page import="demo.Goods" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-goods" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-goods" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list goods">
			
				<g:if test="${goodsInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="goods.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${goodsInstance?.category?.id}">${goodsInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.desCription}">
				<li class="fieldcontain">
					<span id="desCription-label" class="property-label"><g:message code="goods.desCription.label" default="Des Cription" /></span>
					
						<span class="property-value" aria-labelledby="desCription-label"><g:fieldValue bean="${goodsInstance}" field="desCription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.photoUrl}">
				<li class="fieldcontain">
					<span id="photoUrl-label" class="property-label"><g:message code="goods.photoUrl.label" default="Photo Url" /></span>
					
						<span class="property-value" aria-labelledby="photoUrl-label"><g:fieldValue bean="${goodsInstance}" field="photoUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="goods.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${goodsInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${goodsInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="goods.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${goodsInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${goodsInstance?.id}" />
					<g:link class="edit" action="edit" id="${goodsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
