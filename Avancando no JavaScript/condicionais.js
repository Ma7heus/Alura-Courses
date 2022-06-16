console.log(`TRabalhando com Condicionais!`)

const ListaDeDestinos = new Array(
    `Salvador`,
    `São Paulo`,
    `Rio de Janeiro`
)
console.log(ListaDeDestinos)

const idade = 17
const estaAcomapanhada = true

if (idade >= 18 || estaAcomapanhada) {
    console.log(`Cliente maior de idade, ${idade}. `)
    console.log(`Passagem para ${ListaDeDestinos[1]} vendida!`)
    ListaDeDestinos.splice(1, 1)

} else {
    console.log(`Cliente menor de idade, idade = ${idade}, nao pode vender!`)
}


