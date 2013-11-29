
<%@ page import="demo.Goods" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-goods" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-goods" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:form action="search"method="post">
				Category:<g:select id="category" name="categoryName" from="${demo.Category.list()}" optionKey="categoryName" required="" value="${goodsInstance?.category?.categoryName}" class="many-to-one"/>
				Title:<input type="text" id="title" name="title"/>
				Description:<textarea id="description" name="description"></textarea>
				<input type="submit" class="save" value="Seach"/>
			</g:form>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="goods.category.label" default="Category" /></th>
					
						<g:sortableColumn property="desCription" title="${message(code: 'goods.desCription.label', default: 'Des Cription')}" />
					
						<g:sortableColumn property="photoUrl" title="${message(code: 'goods.photoUrl.label', default: 'Photo Url')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'goods.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'goods.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${goodsInstance.id}">${fieldValue(bean: goodsInstance, field: "category")}</g:link></td>
					
						<td>${fieldValue(bean: goodsInstance, field: "desCription")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "photoUrl")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${goodsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
