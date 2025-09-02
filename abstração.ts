class Celular {

  marca: string;
  modelo: string;
  cor: string;
  SO: string;
  armazenamento: number; 
  camera: number;       
  bateria: number;      

  
  constructor(marca: string, modelo: string, cor: string, armazenamento: number, camera: number, bateria: number) {
    this.marca = marca;
    this.modelo = modelo;
    this.cor = cor;
    this.armazenamento = armazenamento;
    this.camera = camera;
    this.bateria = bateria;
  }

  
  ligar(): void {
    if (this.bateria > 0) {
      console.log(`${this.marca} ${this.modelo} está ligado!`);
    } else {
      console.log(`Bateria fraca! Não foi possível ligar.`);
    }
  }

 
  carregar(quantidade: number): void {
    this.bateria += quantidade;
    if (this.bateria > 100) {
      this.bateria = 100;
    }
    console.log(`Bateria carregada: ${this.bateria}%`);
  }

 
  tirarFoto(): void {
    console.log(`Foto tirada com a câmera de ${this.camera}MP! `);
    this.bateria -= 2;
    if (this.bateria < 0) this.bateria = 0;
  }
}


