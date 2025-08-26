const readline = require('readline');

// Cria a interface readline
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Função que retorna uma Promise para cada pergunta
function perguntar(pergunta) {
  return new Promise((resolve) => {
    rl.question(pergunta, (resposta) => {
      resolve(resposta);
    });
  });
}

// Função assíncrona principal
async function formulario() {
  const nome = await perguntar("Nome: ");
  const data = await perguntar("Data de nascimento: ");
  const cidade = await perguntar("Cidade: ");
  const estado = await perguntar("Estado: ");

  console.log("\n--- Resumo do Formulário ---");
  console.log("Nome:", nome);
  console.log("Data de nascimento:", data);
  console.log("Cidade:", cidade);
  console.log("Estado:", estado);

  rl.close();
}

// Executa o formulário
formulario();



