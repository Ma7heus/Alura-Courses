VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} Adicionaraparelho 
   Caption         =   "ADICIONAR APARELHO NOVO"
   ClientHeight    =   7035
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   5295
   OleObjectBlob   =   "Adicionaraparelho.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "Adicionaraparelho"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BOTAO_BUSCAR_Click()
 
On Error GoTo Mensagem
IMEI = ""
Mac = ""
APARELHO1 = ""

If CAIXA_CHAPA = "" Then
    MsgBox "    É necessario informar uma chapa!"
    GoTo fim
End If
 
chapa = CAIXA_CHAPA.Value + 0
APARELHO = APARELHO1.Value

For Each ABA In ThisWorkbook.Sheets
    If ABA.Name = "TABELA GERAL" Then
    ult_linha = Sheets("TABELA GERAL").Cells(1, 1).End(xlDown).Row + 1
         For LINHA = 2 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                IMEI = ABA.Cells(LINHA, 7).Value
                Mac = ABA.Cells(LINHA, 8).Value
                APARELHO1 = ABA.Cells(LINHA, 10).Value
            End If
        Next
If IMEI & Mac & APARELHO1 = "" Then GoTo Mensagem
        
    ElseIf ABA.Name = "BAIXADOS" Then
    ult_linha_two = Sheets("BAIXADOS").Cells(1, 1).End(xlDown).Row + 1
        For linha_two = 3 To ult_linha_two
            If ABA.Cells(linha_two, 3).Value = chapa Then
                    IMEI = ""
                    Mac = ""
                    APARELHO1 = ""
                    MsgBox " Este smartphone já foi Baixado, não é mais possivel usar-lo!!! "
            End If
         Next
    End If
Next

GoTo fim
Mensagem:
MsgBox "A chapa informada não é válida e/ou não existe. Tente novamente."
fim:

End Sub

Private Sub BOTAOCANCELAR_Click()
Unload Adicionaraparelho

End Sub

Private Sub BOTAOSALVAR_Click()

Application.ScreenUpdating = False



APARELHO = APARELHO1.Value
novo = CAIXA_NOVO.Value


If CAIXA_CHAPA = "" Then
    MsgBox "    É necessário informar uma chapa!"
    Exit Sub
ElseIf CAIXA_PROFISSIONAL = "" Then
    MsgBox "    É necessário infomar o nome do profissional!"
    Exit Sub
ElseIf MATRICULA = "" Then
    MsgBox "    É necessário informar a matricula do profissional!"
    Exit Sub
ElseIf FILIAL = "" Then
    MsgBox "    É necessário informar uma filial para vinculo!"
    Exit Sub
ElseIf EMAIL = "" Then
    MsgBox "    É necessário informar o e-mail do profissional!"
    Exit Sub
ElseIf SENHA = "" Then
    MsgBox "    É necessário informar a senha do e-mail do profissional!"
    Exit Sub
ElseIf APARELHO = "" Then
    MsgBox "    É necessário informar o modelo do Smartphone!"
   Exit Sub
ElseIf IMEI = "" Then
    MsgBox "    É necessário informar o IMEI do Smartphone!"
   Exit Sub
ElseIf Mac = "" Then
    MsgBox "    É necessário informar o MAC do Smartphone!"
   Exit Sub

End If

LINHA = Sheets("SMARTPHONES").Cells(1, 1).End(xlDown).Row + 1

Sheets("SMARTPHONES").Cells(LINHA, 1).Value = CAIXA_PROFISSIONAL.Value
Sheets("SMARTPHONES").Cells(LINHA, 2).Value = FILIAL.Value
Sheets("SMARTPHONES").Cells(LINHA, 3).Value = CAIXA_CHAPA.Value
Sheets("SMARTPHONES").Cells(LINHA, 4).Value = MATRICULA.Value
Sheets("SMARTPHONES").Cells(LINHA, 5).Value = MATRICULA.Value
Sheets("SMARTPHONES").Cells(LINHA, 6).Value = EMAIL.Value
Sheets("SMARTPHONES").Cells(LINHA, 7).Value = SENHA.Value
Sheets("SMARTPHONES").Cells(LINHA, 8).Value = IMEI.Value
Sheets("SMARTPHONES").Cells(LINHA, 9).Value = Mac.Value
Sheets("SMARTPHONES").Cells(LINHA, 10).Value = DATA.Value
Sheets("SMARTPHONES").Cells(LINHA, 11).Value = APARELHO1.Value

' Codigo que adiciona na tabela de mudanças para controle das despesas.

linha_tabeladespesa = Sheets("MUDANÇAS").Cells(1, 1).End(xlDown).Row + 1
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 1).Value = CAIXA_PROFISSIONAL.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 2).Value = FILIAL.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 3).Value = CAIXA_CHAPA.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 5).Value = DATA.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 4).Value = APARELHO1.Value
    
linha_four = Sheets("HISTORICO").Cells(1048476, 1).End(xlUp).Row + 1

    Sheets("HISTORICO").Cells(linha_four, 1).Value = CAIXA_PROFISSIONAL.Value
    Sheets("HISTORICO").Cells(linha_four, 2).Value = FILIAL.Value
    Sheets("HISTORICO").Cells(linha_four, 3).Value = CAIXA_CHAPA.Value
    Sheets("HISTORICO").Cells(linha_four, 4).Value = MATRICULA.Value
    Sheets("HISTORICO").Cells(linha_four, 5).Value = EMAIL.Value
    Sheets("HISTORICO").Cells(linha_four, 6).Value = SENHA.Value
    Sheets("HISTORICO").Cells(linha_four, 7).Value = IMEI.Value
    Sheets("HISTORICO").Cells(linha_four, 8).Value = Mac.Value
    Sheets("HISTORICO").Cells(linha_four, 9).Value = DATA.Value
    Sheets("HISTORICO").Cells(linha_four, 10).Value = APARELHO1.Value
    Sheets("HISTORICO").Cells(linha_four, 11).Value = "EM USO POR PROFISSIONAL"
    
linha_five = Sheets("TABELA GERAL").Cells(1048476, 1).End(xlUp).Row + 1

    Sheets("TABELA GERAL").Cells(linha_five, 1).Value = CAIXA_PROFISSIONAL.Value
    Sheets("TABELA GERAL").Cells(linha_five, 2).Value = FILIAL.Value
    Sheets("TABELA GERAL").Cells(linha_five, 3).Value = CAIXA_CHAPA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 4).Value = MATRICULA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 5).Value = EMAIL.Value
    Sheets("TABELA GERAL").Cells(linha_five, 6).Value = SENHA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 7).Value = IMEI.Value
    Sheets("TABELA GERAL").Cells(linha_five, 8).Value = Mac.Value
    Sheets("TABELA GERAL").Cells(linha_five, 9).Value = DATA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 10).Value = APARELHO1.Value
    Sheets("TABELA GERAL").Cells(linha_five, 11).Value = "EM CAMPO"
    Sheets("TABELA GERAL").Cells(linha_five, 12).Value = "EM USO POR PROFISSIONAL"


If novo = verdadeiro Then

    linha_three = Sheets("IDADES").Range("A1048576").End(xlUp).Row + 1
      
    Sheets("IDADES").Cells(linha_three, 1).Value = APARELHO1.Value
    Sheets("IDADES").Cells(linha_three, 2).Value = CAIXA_CHAPA.Value
    Sheets("IDADES").Cells(linha_three, 3).Value = IMEI.Value
    Sheets("IDADES").Cells(linha_three, 4).Value = Mac.Value
    Sheets("IDADES").Cells(linha_three, 5).Value = DATA.Value
    Sheets("IDADES").Cells(linha_three, 6).Value = CAIXA_DATA_FINAL.Value

End If

MsgBox "    Cadastro de Smartphone concluido!"

CAIXA_PROFISSIONAL.Value = ""
FILIAL.Value = ""
CAIXA_CHAPA.Value = ""
MATRICULA.Value = ""
EMAIL.Value = ""
SENHA.Value = ""
IMEI.Value = ""
Mac.Value = ""
APARELHO1.Value = ""

ActiveWorkbook.Save


GoTo fim

Mensagem:

MsgBox "    Existem inconsitências nas infomações preenchidas."

fim:

Application.ScreenUpdating = True

End Sub

Private Sub BUSCAR_2_Click()

On Error GoTo Mensagem
 
 If CAIXA_PROFISSIONAL = "" Then
    
    GoTo Mensagem
    
End If

nome = CAIXA_PROFISSIONAL.Value

For Each ABA In ThisWorkbook.Sheets

If ABA.Name <> "tela inicial" Then
If ABA.Name <> "PENDENCIAS" Then
If ABA.Name <> "DISPONIVEIS" Then
If ABA.Name <> "BAIXADOS" Then
If ABA.Name <> "TERMOS" Then
If ABA.Name <> "analise" Then
If ABA.Name <> "DADOS" Then
If ABA.Name <> "IDADES" Then
If ABA.Name <> "HISTORICO" Then
If ABA.Name <> "SMARTPHONES" Then
     
     ult_linha = Sheets("TABELA GERAL").Range("A1").End(xlDown).Row
     encontrou = False
     For LINHA = 1 To ult_linha
        If ABA.Cells(LINHA, 1).Value = nome Then
            encontrou = True
            FILIAL = ABA.Cells(LINHA, 2).Value
            MATRICULA = ABA.Cells(LINHA, 4).Value
            EMAIL = ABA.Cells(LINHA, 5).Value
            SENHA = ABA.Cells(LINHA, 6).Value
        End If
    
    Next
    
    
End If
End If
End If
End If
End If
End If
End If
End If
End If
End If

Next


    If encontrou = False Then
    MsgBox "    Nome não encontrado!"
    EMAIL = ""
    SENHA = ""
    MATRICULA = ""
    FILIAL = ""
    End If


GoTo fim

Mensagem:

MsgBox "    O nome informado não é valido e/ou não existe. Tente novamente."

fim:






End Sub

Private Sub CAIXA_CHAPA_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
 KeyAscii = SóNúmeros(KeyAscii)
End Sub
Private Sub CAIXA_PROFISSIONAL_ENTER()
ultima_linha = Sheets("TABELA GERAL").Range("a3").End(xlDown).Row
CAIXA_PROFISSIONAL.RowSource = "'TABELA GERAL'!A3:A" & ultima_linha
End Sub
Private Sub FILIAL_enter()
ultima_linha = Sheets("DADOS").Range("B2").End(xlDown).Row
FILIAL.RowSource = "DADOS!B2:B" & ultima_linha
End Sub
Private Sub APARELHO1_ENTER()
ultima_linha = Sheets("DADOS").Range("A2").End(xlDown).Row
APARELHO1.RowSource = "DADOS!A2:A" & ultima_linha
End Sub
Private Function SóNúmeros(l As IReturnInteger)
    Select Case l
        Case Asc("0") To Asc("9")
            SóNúmeros = l
        Case Else
            SóNúmeros = 0
            MsgBox "Favor inserir apenas números!", vbExclamation, "CAMPO TIPO NÚMERO"
    End Select
End Function
Private Sub UserForm_Initialize()
On Error GoTo ERRO

MsgBox "    Esse cadastro e apenas para smartphones novos!"

DATA = Date

Dim DATA2 As Double
Dim DIAS As Double
Dim NOVA_DATA As Date

On Error Resume Next
DATA2 = VBA.Format(DATA, "00000")
DIAS = 1095

NOVA_DATA = VBA.Format(DATA2 + DIAS, "dd/mm/yyyy")
CAIXA_DATA_FINAL = NOVA_DATA

Exit Sub
ERRO:
MsgBox "    Erro ao calcular Data!"

End Sub

