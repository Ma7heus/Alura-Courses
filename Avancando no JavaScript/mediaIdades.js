function texto(novo) {
	document.write(novo);
	document.write("<br><br>");
}

var NomeFamilia = input("Digite o nome de sua familia:");
var NumFamiliares = parseInt(input("Digite o numero de familiares."));
var TotalIdades = 0 

for(var contador = 1;contador <=NumFamiliares;contador++){
	var idade = parseInt(input("Digite a idade do parente numero " + contador));
	var TotalIdades = TotalIdades + idade
}

var MediaIdades = TotalIdades/NumFamiliares

texto("A media das idade da familia " + NomeFamilia + " e de " + Math.round(MediaIdades));
