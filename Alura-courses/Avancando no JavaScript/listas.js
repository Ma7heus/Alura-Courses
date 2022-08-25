console.log(`Trabalhando com Listas`)
// USAREMOS O ARRAY - new array


const ListaDeDestinos = new Array(
    `Salvador`,
    `São Paulo`,
    `Rio de Janeiro`
)
console.log(ListaDeDestinos)

// Adicionando elementos na lista, usando push
ListaDeDestinos.push(`Curitiba`)
console.log(ListaDeDestinos)

// removendo item da lista usando splint
ListaDeDestinos.splice(1, 1)
console.log(ListaDeDestinos)

//selecionando elemento da lista a ser impresso no console.
console.log(ListaDeDestinos[1])

// atruibuindo um valor da lista para um variavel const
const cidade = ListaDeDestinos[2]
console.log(cidade)
































