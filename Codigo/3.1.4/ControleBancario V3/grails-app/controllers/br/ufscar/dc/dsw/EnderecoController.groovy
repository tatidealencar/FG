package br.ufscar.dc.dsw

import grails.converters.JSON
import grails.plugins.rest.client.RestResponse

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
import grails.plugins.rest.client.RestBuilder

@Transactional(readOnly = true)
@Secured('ROLE_GERENTE')
class EnderecoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Endereco.list(params), model: [enderecoCount: Endereco.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_CLIENTE', 'ROLE_GERENTE'])
    def show(Endereco endereco) {
        respond endereco
    }

    def create() {
        respond new Endereco(params)
    }

    @Transactional
    def save(Endereco endereco) {
        if (endereco == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (endereco.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond endereco.errors, view: 'create'
            return
        }

        endereco.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'endereco.label', default: 'Endereco'), endereco.id])
                redirect endereco
            }
            '*' { respond endereco, [status: CREATED] }
        }
    }

    def edit(Endereco endereco) {
        respond endereco
    }

    @Transactional
    def update(Endereco endereco) {
        if (endereco == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (endereco.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond endereco.errors, view: 'edit'
            return
        }

        endereco.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'endereco.label', default: 'Endereco'), endereco.id])
                redirect endereco
            }
            '*' { respond endereco, [status: OK] }
        }
    }

    @Transactional
    def delete(Endereco endereco) {

        if (endereco == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        endereco.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'endereco.label', default: 'Endereco'), endereco.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def addressByCEP() {

        String restUrl="http://cep.republicavirtual.com.br/web_cep.php?cep="+params.cep+"&formato=json"

        RestBuilder rBuilder = new RestBuilder()
        RestResponse rResponse = rBuilder.get(restUrl)

        def html = rResponse?.json
        params.estado = Estado.findBySigla(html.uf)
        params.cidade = Cidade.findByNomeAndEstado(html.cidade, params.estado)
        params.bairro = html.bairro
        params.logradouro = html.tipo_logradouro + " " + html.logradouro

        render template: 'address', model: [endereco: new Endereco(params)]
    }
}
