class Cachorro {
   public raca : String 
   public cor : String 
   public porte : String 
   public idade : Number
   public sexo : String 
   public pelugem : String 

    constructor(raca: string, cor: string, porte: string, idade: number, sexo: string, pelugem: string){
       this.raca = raca
       this.cor = cor
       this.porte = porte
       this.idade = idade
       this.sexo = sexo
       this.pelugem = pelugem
    }
       
    latir(){
        console.log("Woof Woof")
    }    
    comer(){
        console.log("Chomp Chomp")
    }
    beber(){
        console.log("Slurp Slurp")
    }
    reproduzir(){
        console.log("Pant Pant")
    }
    correr(){
         console.log("Thump Thump")
    }
    cheirar(){
          console.log("Sniff Sniff")
    }

}

const cachorro1 = new Cachorro("Dalmata", "Branco com bolinhas pretas", "Pequeno", 2, "Femea", "Denso")
const cachorro2 = new Cachorro("Golden Retriever", "Dourado", "Grande", 3, "Macho", "Longo")
const cachorro3 = new Cachorro("Dachshund", "Marrom", "Pequeno", 5, "Macho", "Curto")



