<%@ page import="demo.Goods" %>



<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="goods.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${demo.Category.list()}" optionKey="id" required="" value="${goodsInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'desCription', 'error')} ">
	<label for="desCription">
		<g:message code="goods.desCription.label" default="Des Cription" />
		
	</label>
	<g:textField name="desCription" value="${goodsInstance?.desCription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="goods.photoUrl.label" default="Photo Url" />
		
	</label>
	<g:textField name="photoUrl" value="${goodsInstance?.photoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="goods.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" required="" value="${fieldValue(bean: goodsInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="goods.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${goodsInstance?.title}"/>
</div>

