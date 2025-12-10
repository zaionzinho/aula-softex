class Celular {
    public marca : String 
    public modelo : String  
    public memoria : Number 
    public cpu : String 
    public preco : Number 
    public anoDePublicacao : Number

    constructor(marca: string, modelo: string, memoria: number, cpu: string, preco: number, anoDePublicacao: number){
        this.marca = marca
        this.modelo = modelo
        this.memoria = memoria
        this.cpu = cpu
        this.preco = preco
        this.anoDePublicacao = anoDePublicacao
    }
 
    ligar(){
        console.log("Ligando...")
    }
    desligar(){
        console.log("Desligando...")
    }
    vibrar(){
        console.log("Vibrando...")

    }
    conectarWIFI(){
        console.log("Conectando ao Wi-Fi...")
    }
    conectarBluetooth(){
        console.log("Conectando ao Bluetooth...")

    } 
    abrirSoftwares(){
        console.log("Abrindo softwares...")
    }

}

const celular1 = new Celular("Samsung", "Galaxy S21", 128, "Exynos 2100", 7999, 2021)
const celular2 = new Celular("Apple", "iPhone 13", 256, "A15 Bionic", 9999, 2021)
const celular3 = new Celular("Xiaomi", "Mi 11", 128, "Snapdragon 888", 4999, 2021)

