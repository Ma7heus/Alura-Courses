import {Cliente} from "./Cliente.js"
import {contaCorrente} from "./contaCorrente.js"

// objetos com dados do cliente
const cliente1 = new Cliente("Matheus",12156879536)
const cliente2 = new Cliente("Amanda",1316541651684)

// objeto com dados da conta do cliente
const contaCorenteMatheus = new contaCorrente()
contaCorenteMatheus.agencia = 1001
contaCorenteMatheus.cliente = cliente1

const contaCorenteAmanda = new contaCorrente()
contaCorenteAmanda.agencia = 1002
contaCorenteAmanda.cliente = cliente2

const conta2 = new contaCorrente()
conta2.cliente = cliente1
conta2.agencia = 102

cliente2.nome = 'matheus'

conta2.depositar(3000)
console.log(conta2._Cliente)
