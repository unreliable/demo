package demo

import org.springframework.dao.DataIntegrityViolationException

class GoodsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [goodsInstanceList: Goods.list(params), goodsInstanceTotal: Goods.count()]
    }

    def create() {
        [goodsInstance: new Goods(params)]
    }

    def save() {
        def goodsInstance = new Goods(params)
        if (!goodsInstance.save(flush: true)) {
            render(view: "create", model: [goodsInstance: goodsInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'goods.label', default: 'Goods'), goodsInstance.id])
        redirect(action: "show", id: goodsInstance.id)
    }

    def show() {
        def goodsInstance = Goods.get(params.id)
        if (!goodsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])
            redirect(action: "list")
            return
        }

        [goodsInstance: goodsInstance]
    }

    def edit() {
        def goodsInstance = Goods.get(params.id)
        if (!goodsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])
            redirect(action: "list")
            return
        }

        [goodsInstance: goodsInstance]
    }

    def update() {
        def goodsInstance = Goods.get(params.id)
        if (!goodsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (goodsInstance.version > version) {
                goodsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'goods.label', default: 'Goods')] as Object[],
                          "Another user has updated this Goods while you were editing")
                render(view: "edit", model: [goodsInstance: goodsInstance])
                return
            }
        }

        goodsInstance.properties = params

        if (!goodsInstance.save(flush: true)) {
            render(view: "edit", model: [goodsInstance: goodsInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'goods.label', default: 'Goods'), goodsInstance.id])
        redirect(action: "show", id: goodsInstance.id)
    }

    def delete() {
        def goodsInstance = Goods.get(params.id)
        if (!goodsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])
            redirect(action: "list")
            return
        }

        try {
            goodsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def search(){
		def c = Goods.createCriteria()
		def goodsList = c.list {
			if(params.categoryName){
				category{
					eq('categoryName',params.categoryName)
				}
			}
		}
		print(goodsList)
		render(view:'list',model:[goodsInstanceList:goodsList,goodsInstanceTotal: Goods.count()])
	}
}
