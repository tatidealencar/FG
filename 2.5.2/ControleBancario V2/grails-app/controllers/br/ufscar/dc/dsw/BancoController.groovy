package br.ufscar.dc.dsw



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class BancoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Banco.list(params), model:[bancoInstanceCount: Banco.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_CLIENTE', 'ROLE_GERENTE'])
    def show(Banco bancoInstance) {
        respond bancoInstance
    }

    def create() {
        respond new Banco(params)
    }

    @Transactional
    def save(Banco bancoInstance) {
        if (bancoInstance == null) {
            notFound()
            return
        }

        if (bancoInstance.hasErrors()) {
            respond bancoInstance.errors, view:'create'
            return
        }

        bancoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bancoInstance.label', default: 'Banco'), bancoInstance.id])
                redirect bancoInstance
            }
            '*' { respond bancoInstance, [status: CREATED] }
        }
    }

    def edit(Banco bancoInstance) {
        respond bancoInstance
    }

    @Transactional
    def update(Banco bancoInstance) {
        if (bancoInstance == null) {
            notFound()
            return
        }

        if (bancoInstance.hasErrors()) {
            respond bancoInstance.errors, view:'edit'
            return
        }

        bancoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Banco.label', default: 'Banco'), bancoInstance.id])
                redirect bancoInstance
            }
            '*'{ respond bancoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Banco bancoInstance) {

        if (bancoInstance == null) {
            notFound()
            return
        }

        bancoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Banco.label', default: 'Banco'), bancoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bancoInstance.label', default: 'Banco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}