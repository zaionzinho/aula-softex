class Veiculo {
  public marca: string;
  public modelo: string;
  public ano: number;
  public cor: string;
  public tipo: string;  
  public combustivel: string; 

  constructor(marca: string, modelo: string, ano: number, cor: string, tipo: string, combustivel: string) {
    this.marca = marca;
    this.modelo = modelo;
    this.ano = ano;
    this.cor = cor;
    this.tipo = tipo;
    this.combustivel = combustivel;
  }

  ligar(): void {
    console.log("Vrum! O veículo ligou.");
  }

  acelerar(): void {
    console.log("Acelerando... Vrummmm!");
  }

  frear(): void {
    console.log("Freando... Screech!");
  }

  buzinar(): void {
    console.log("Biiiiiip!");
  }

  desligar(): void {
    console.log("O veículo foi desligado.");
  }
}

const carro1 = new Veiculo("Toyota","Corolla",2020,"Prata","Carro","Gasolina");
const moto1 = new Veiculo("Honda","CB 500",2022,"Vermelha","Moto","Gasolina");
const caminhão1 = new Veiculo("Volvo","FH 540",2019,"Branco","Caminhão","Diesel");
