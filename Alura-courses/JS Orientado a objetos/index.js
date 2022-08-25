import {Cliente} from "./Cliente.js"
import {contaCorrente} from "./contaCorrente.js"

// objetos com dados do cliente
const cliente1 = new Cliente("Matheus",12156879536)
const cliente2 = new Cliente("Amanda",1316541651684)

// objeto com dados da conta do cliente
const contaCorenteMatheus = new contaCorrente(1001,cliente1)
const contaCorenteAmanda = new contaCorrente(1002,cliente2)


contaCorenteMatheus.depositar(2000)
console.log(contaCorrente.numeroContaCorrente)







