let readline = require('readline-sync');

let nome = readline.question("Qual é o seu nome? ");
console.log("Olá, " + nome);

let dataNasc = readline.question("Qual sua data de nascimento? (dd/mm/yyyy) ");

let partes = dataNasc.split("/"); 
let dia = parseInt(partes[0]);
let mes = parseInt(partes[1]) - 1; 
let ano = parseInt(partes[2]);

let hoje = new Date();
let idade = hoje.getFullYear() - ano;


let aniversarioJaPassou = 
    hoje.getMonth() > mes || 
    (hoje.getMonth() === mes && hoje.getDate() >= dia);

if (!aniversarioJaPassou) {
    idade--; 
}

console.log("Você tem " + idade + " anos.");

if (idade >= 18) {
    console.log("Você pode ser preso.");
} else {
    console.log("Você não pode ser preso.");
}


