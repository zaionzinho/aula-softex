let n1 = "5";
let n2 = "8";
let n3 = "6";
let n4 = "10";

// Converter para números antes de calcular a média
let media = (parseFloat(n1) + parseFloat(n2) + parseFloat(n3) + parseFloat(n4)) / 4;

// Mostrar a média do aluno
console.log(media);

// Aplicar a fórmula de Bhaskara na equação x² + (média)x + 0 = 0
function calcularBhaskara(a, b, c) {
const discriminante = b * b - 4 * a * c; // Δ = b² - 4ac

if (discriminante < 0) {
return "A equação não tem raízes reais."; // Não há raízes reais
}

const raiz1 = (-b + Math.sqrt(discriminante)) / (2 * a); // Primeira raiz
const raiz2 = (-b - Math.sqrt(discriminante)) / (2 * a); // Segunda raiz

return {
raiz1: raiz1,
raiz2: raiz2
};
}

// Usando a média como valor para o coeficiente b
const a = 1;
const b = media; // Média das notas
const c = 0;

// Calcular as raízes da equação
const resultado = calcularBhaskara(a, b, c);

// Exibir a média e as raízes
console.log(`Média das notas: ${media}`);
console.log(`Raiz 1: ${resultado.raiz1}`);
console.log(`Raiz 2: ${resultado.raiz2}`);