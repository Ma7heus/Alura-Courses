import {Cliente} from "./Cliente.js"
import {contaCorrente} from "./contaCorrente.js"

// obejto com dados do cliente
const cliente1 = new Cliente()
cliente1.nome = "Matheus"
cliente1.cpf = 12156879536

// objeto com dados da conta do cliente
const contaCorenteMatheus = new contaCorrente()
contaCorenteMatheus.agencia = 1001

//Fazendo deposito na conta
contaCorenteMatheus.depositar(1000)

//Realizando saque
contaCorenteMatheus.sacar(50)

//mostrar saldo do cleinte em conta
contaCorenteMatheus.mostraSaldo()