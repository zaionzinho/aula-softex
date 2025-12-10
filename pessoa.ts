class Pessoa {
    public nome : String 
    public altura : Number 
    public idade : Number 
    public sexo : String 
    public tipoDeSangue : String
    public nacionalidade : String

    constructor(nome: string, altura: number, idade: number, sexo: string, tipoDeSangue:string, nacionalidade: string){
        this.nome = nome
        this.altura = altura
        this.idade = idade
        this.sexo = sexo
        this.tipoDeSangue = tipoDeSangue
        this.nacionalidade = nacionalidade
    }

    comer(){
        console.log("Comendo...")
    }
    acordar(){
        console.log("Acordando...")
    }
    reproduzir(){
        console.log("Reproduzindo...")
    }
    andar(){
        console.log("Andando...")
    }
    dormir(){
        console.log("Dormindo...")
    }
    ler(){
        console.log("Lendo...")
    }


}

const pessoa1 = new Pessoa("Icaro", 1.75, 25, "Masculino", "O+", "Brasileiro")
const pessoa2 = new Pessoa("Ana", 1.65, 30, "Feminino", "A-", "Brasileira")
const pessoa3 = new Pessoa("Carlos", 1.80, 28, "Masculino", "B+", "Brasileiro")