const fs = require('fs');
const xml2js = require('xml2js');

// ler o arquivo OFX
const ofx = fs.readFileSync('./nubank.ofx', 'utf-8');

// analisar o arquivo OFX
xml2js.parseString(ofx, function (err, result) {
  if (err) throw err;
  
  // extrair informações necessárias
  const transactions = result.OFX.BANKMSGSRSV1.STMTTRNRS.map(tran => {
    return {
      date: tran.TRANDATE[0],
      amount: tran.TRNAMT[0],
      description: tran.NAME[0]
      // outros detalhes que você deseja extrair
    };
  });
  
  // faça algo com as transações extraídas
  console.log(transactions);
});




