VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ALTERAR_SITUACAO_APARELHO_NEW 
   Caption         =   "ATUALIZAR SITUAÇÃO DO APARELHO"
   ClientHeight    =   6195
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8640.001
   OleObjectBlob   =   "ALTERAR_SITUACAO_APARELHO_NEW.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "ALTERAR_SITUACAO_APARELHO_NEW"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub BOTAO_BUSCAR_Click()

CAIXA_EMAIL = ""
CAIXA_SENHA = ""
CAIXA_FILIAL = ""
CAIXA_PROFISSIONAL = ""
CAIXA_IMEI = ""
CAIXA_MAC = ""
CAIXA_APARELHO = ""
CAIXA_STATUS = ""
CAIXA_TEXTO = ""
CAIXA_MATRICULA = ""


On Error GoTo Mensagem

chapa = CAIXA_CHAPA.Value + 0
APARELHO = CAIXA_APARELHO.Value

For Each ABA In ThisWorkbook.Sheets
If ABA.Name <> "tela inicial" Then
If ABA.Name <> "DISPONIVEIS" Then
If ABA.Name <> "TERMOS" Then
If ABA.Name <> "HISTORICO" Then
If ABA.Name <> "analise" Then
If ABA.Name <> "DADOS" Then
If ABA.Name <> "IDADES" Then
If ABA.Name <> "SMARTPHONES" Then
If ABA.Name = "TABELA GERAL" Then
     
ult_linha = Sheets("TABELA GERAL").Cells(1, 1).End(xlDown).Row + 1

    For LINHA = 3 To ult_linha
        If ABA.Cells(LINHA, 3).Value = chapa Then
            CAIXA_EMAIL = ABA.Cells(LINHA, 5).Value
            CAIXA_MATRICULA = ABA.Cells(LINHA, 4).Value
            CAIXA_SENHA = ABA.Cells(LINHA, 6).Value
            CAIXA_FILIAL = ABA.Cells(LINHA, 2).Value
            CAIXA_PROFISSIONAL = ABA.Cells(LINHA, 1).Value
            CAIXA_IMEI = ABA.Cells(LINHA, 7).Value
            CAIXA_MAC = ABA.Cells(LINHA, 8).Value
            CAIXA_APARELHO = ABA.Cells(LINHA, 10).Value
            CAIXA_STATUS = ABA.Cells(LINHA, 11).Value
            CAIXA_TEXTO = ABA.Cells(LINHA, 12).Value
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

Next

For Each ABA In ThisWorkbook.Sheets
If ABA.Name = "SMARTPHONES" Then
    
ult_linha = Sheets("SMARTPHONES").Cells(2, 1).End(xlDown).Row + 1

        For LINHA = 3 To ult_linha
        If ABA.Cells(LINHA, 3).Value = chapa Then
            CAIXA_PROFISSIONAL = ABA.Cells(LINHA, 1).Value
            CAIXA_FILIAL = ABA.Cells(LINHA, 2).Value
            CAIXA_MATRICULA = ABA.Cells(LINHA, 4).Value
            CAIXA_EMAIL = ABA.Cells(LINHA, 6).Value
            CAIXA_SENHA = ABA.Cells(LINHA, 7).Value
            CAIXA_IMEI = ABA.Cells(LINHA, 8).Value
            CAIXA_MAC = ABA.Cells(LINHA, 9).Value
            CAIXA_APARELHO = ABA.Cells(LINHA, 11).Value
            CAIXA_STATUS.Value = "EM CAMPO"
       End If
    Next
    
ElseIf ABA.Name = "BAIXADOS" Then

ult_linha = Sheets("BAIXADOS").Cells(1, 1).End(xlDown).Row + 1

        For LINHA = 3 To ult_linha
        If ABA.Cells(LINHA, 3).Value = chapa Then
            CAIXA_EMAIL = ""
            CAIXA_SENHA = ""
            CAIXA_FILIAL = ""
            CAIXA_PROFISSIONAL = ""
            CAIXA_IMEI = ""
            CAIXA_MAC = ""
            CAIXA_APARELHO = ""
            CAIXA_STATUS = ""
            CAIXA_TEXTO = ""
            MsgBox " Esse aparelho já foi baixado!"
            Exit Sub
       End If
    Next
    
End If
Next

MsgBox "    Busca concluida!"
GoTo fim
Mensagem:

MsgBox "A chapa informada não é válida e/ou não existe. Tente novamente."
fim:

End Sub
Private Sub BOTAO_CANCELAR_Click()
Unload ALTERAR_SITUACAO_APARELHO_NEW
End Sub
Private Sub BOTAO_PESQUISAR_Click()
formulariopesquisa.Show
End Sub

Private Sub BOTAO_SALVAR_Click()

On Error GoTo Mensagem

Application.ScreenUpdating = False
Application.Calculation = xlCalculationManual
Application.EnableEvents = False

'Descobre nome da aba ativa
nome_aba = ActiveSheet.Name

If CAIXA_CHAPA = "" Then
        MsgBox "    É necessário informar uma chapa!"
        Exit Sub
    ElseIf CAIXA_TABELA = "" Then
        MsgBox "    É necessário informar o a tabela onde deseja salvar!"
   Exit Sub
    ElseIf CAIXA_PROFISSIONAL = "" Then
        MsgBox "    É necessário infomar o nome do profissional!"
        Exit Sub
    ElseIf CAIXA_FILIAL = "" Then
        MsgBox "    É necessário informar uma filial para vinculo!"
        Exit Sub
    ElseIf CAIXA_APARELHO = "" Then
        MsgBox "    É necessário informar o modelo do Smartphone!"
       Exit Sub
    ElseIf CAIXA_IMEI = "" Then
        MsgBox "    É necessário informar o IMEI do Smartphone!"
       Exit Sub
    ElseIf CAIXA_MAC = "" Then
        MsgBox "    É necessário informar o MAC do Smartphone!"
       Exit Sub
    ElseIf CAIXA_TEXTO = "" Then
        MsgBox "    É necessário informar o motivo!"
   Exit Sub
End If


'CODIGO QUE DELETA O APARELHO
                                   
chapa = CAIXA_CHAPA.Value + 0

For Each ABA In ThisWorkbook.Sheets

    If ABA.Name <> "tela inicial" Then
    If ABA.Name <> "BAIXADOS" Then
    If ABA.Name <> "TERMOS" Then
    If ABA.Name <> "INFOGERAIS" Then
    If ABA.Name <> "analise" Then
    If ABA.Name <> "DADOS" Then
    If ABA.Name <> "IDADES" Then
    If ABA.Name <> "HISTORICO" Then
    
        ult_linha = ABA.Cells(1, 1).End(xlDown).Row + 1
        
            For LINHA = 2 To ult_linha
                If ABA.Cells(LINHA, 3).Value = chapa Then
                    ABA.Range(ABA.Cells(LINHA, 1), ABA.Cells(LINHA, 12)).Delete shift:=xlUp
                    LINHA = LINHA - 1
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
Next
 
 
 
'CODIGO QUE ADICIONA O APARELHO

chapa = CAIXA_CHAPA.Value
TABELA = CAIXA_TABELA.Value

If TABELA = "DISPONIVEIS" Then
    LINHA = Sheets(TABELA).Cells(1, 1).End(xlDown).Row + 1
        Sheets(TABELA).Cells(LINHA, 1).Value = CAIXA_PROFISSIONAL.Value
        Sheets(TABELA).Cells(LINHA, 2).Value = CAIXA_FILIAL.Value
        Sheets(TABELA).Cells(LINHA, 3).Value = CAIXA_CHAPA.Value
        Sheets(TABELA).Cells(LINHA, 4).Value = CAIXA_APARELHO.Value
        Sheets(TABELA).Cells(LINHA, 5).Value = CAIXA_IMEI.Value
        Sheets(TABELA).Cells(LINHA, 6).Value = CAIXA_MAC.Value
        Sheets(TABELA).Cells(LINHA, 7).Value = CAIXA_DATA.Value
        Sheets(TABELA).Cells(LINHA, 8).Value = CAIXA_TEXTO.Value
        
    
' tabela que adiciona nas pendencias


ElseIf TABELA = "PENDENCIAS" Then


If CAIXA_RECEBIDO = "" Then
MsgBox " E necessario informar se o aparelho ja foi recebido."
Exit Sub
End If
    LINHA = Sheets(TABELA).Cells(1, 1).End(xlDown).Row + 1
        Sheets(TABELA).Cells(LINHA, 1).Value = CAIXA_PROFISSIONAL.Value
        Sheets(TABELA).Cells(LINHA, 2).Value = CAIXA_FILIAL.Value
        Sheets(TABELA).Cells(LINHA, 3).Value = CAIXA_CHAPA.Value
        Sheets(TABELA).Cells(LINHA, 4).Value = CAIXA_APARELHO.Value
        Sheets(TABELA).Cells(LINHA, 5).Value = CAIXA_IMEI.Value
        Sheets(TABELA).Cells(LINHA, 6).Value = CAIXA_MAC.Value
        Sheets(TABELA).Cells(LINHA, 7).Value = CAIXA_DATA.Value
        Sheets(TABELA).Cells(LINHA, 8).Value = CAIXA_TEXTO.Value
        Sheets(TABELA).Cells(LINHA, 9).Value = CAIXA_RECEBIDO.Value
        
' Tabela que baixa os aparelhos
    
ElseIf TABELA = "BAIXADOS" Then
    LINHA = Sheets(TABELA).Cells(1, 1).End(xlDown).Row + 1
        Sheets(TABELA).Cells(LINHA, 1).Value = CAIXA_PROFISSIONAL.Value
        Sheets(TABELA).Cells(LINHA, 2).Value = CAIXA_FILIAL.Value
        Sheets(TABELA).Cells(LINHA, 3).Value = CAIXA_CHAPA.Value
        Sheets(TABELA).Cells(LINHA, 4).Value = CAIXA_APARELHO.Value
        Sheets(TABELA).Cells(LINHA, 5).Value = CAIXA_IMEI.Value
        Sheets(TABELA).Cells(LINHA, 6).Value = CAIXA_MAC.Value
        Sheets(TABELA).Cells(LINHA, 7).Value = CAIXA_DATA.Value
        Sheets(TABELA).Cells(LINHA, 8).Value = CAIXA_TEXTO.Value

'Tabela que manda os aparelhos para uso no campo

ElseIf TABELA = "EM CAMPO" Then
    LINHA = Sheets("SMARTPHONES").Cells(1, 1).End(xlDown).Row + 1
        Sheets("SMARTPHONES").Cells(LINHA, 1).Value = CAIXA_PROFISSIONAL.Value
        Sheets("SMARTPHONES").Cells(LINHA, 2).Value = CAIXA_FILIAL.Value
        Sheets("SMARTPHONES").Cells(LINHA, 3).Value = CAIXA_CHAPA.Value
        Sheets("SMARTPHONES").Cells(LINHA, 4).Value = CAIXA_MATRICULA.Value
        Sheets("SMARTPHONES").Cells(LINHA, 5).Value = CAIXA_MATRICULA.Value
        Sheets("SMARTPHONES").Cells(LINHA, 6).Value = CAIXA_EMAIL.Value
        Sheets("SMARTPHONES").Cells(LINHA, 7).Value = CAIXA_SENHA.Value
        Sheets("SMARTPHONES").Cells(LINHA, 8).Value = CAIXA_IMEI.Value
        Sheets("SMARTPHONES").Cells(LINHA, 9).Value = CAIXA_MAC.Value
        Sheets("SMARTPHONES").Cells(LINHA, 10).Value = CAIXA_DATA.Value
        Sheets("SMARTPHONES").Cells(LINHA, 11).Value = CAIXA_APARELHO.Value
        
 'Codigo que adiciona na tabela de mudanças para controle de despesa
        
linha_tabeladespesa = Sheets("MUDANÇAS").Cells(1, 1).End(xlDown).Row + 1
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 1).Value = CAIXA_PROFISSIONAL.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 2).Value = CAIXA_FILIAL.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 3).Value = CAIXA_CHAPA.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 5).Value = CAIXA_DATA.Value
    Sheets("MUDANÇAS").Cells(linha_tabeladespesa, 4).Value = CAIXA_APARELHO.Value
        
End If
  
For Each ABA In ThisWorkbook.Sheets

If ABA.Name = "HISTORICO" Then
    linha_four = Sheets("HISTORICO").Cells(1048476, 1).End(xlUp).Row + 1

    Sheets("HISTORICO").Cells(linha_four, 1).Value = CAIXA_PROFISSIONAL.Value
    Sheets("HISTORICO").Cells(linha_four, 2).Value = CAIXA_FILIAL.Value
    Sheets("HISTORICO").Cells(linha_four, 3).Value = CAIXA_CHAPA.Value
    Sheets("HISTORICO").Cells(linha_four, 4).Value = CAIXA_MATRICULA.Value
    Sheets("HISTORICO").Cells(linha_four, 5).Value = CAIXA_EMAIL.Value
    Sheets("HISTORICO").Cells(linha_four, 6).Value = CAIXA_SENHA.Value
    Sheets("HISTORICO").Cells(linha_four, 7).Value = CAIXA_IMEI.Value
    Sheets("HISTORICO").Cells(linha_four, 8).Value = CAIXA_MAC.Value
    Sheets("HISTORICO").Cells(linha_four, 9).Value = CAIXA_DATA.Value
    Sheets("HISTORICO").Cells(linha_four, 10).Value = CAIXA_APARELHO.Value
    Sheets("HISTORICO").Cells(linha_four, 11).Value = TABELA
    Sheets("HISTORICO").Cells(linha_four, 12).Value = CAIXA_TEXTO.Value
    
ElseIf ABA.Name = "TABELA GERAL" Then
    linha_five = Sheets("TABELA GERAL").Cells(1048476, 1).End(xlUp).Row + 1

    Sheets("TABELA GERAL").Cells(linha_five, 1).Value = CAIXA_PROFISSIONAL.Value
    Sheets("TABELA GERAL").Cells(linha_five, 2).Value = CAIXA_FILIAL.Value
    Sheets("TABELA GERAL").Cells(linha_five, 3).Value = CAIXA_CHAPA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 4).Value = CAIXA_MATRICULA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 5).Value = CAIXA_EMAIL.Value
    Sheets("TABELA GERAL").Cells(linha_five, 6).Value = CAIXA_SENHA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 7).Value = CAIXA_IMEI.Value
    Sheets("TABELA GERAL").Cells(linha_five, 8).Value = CAIXA_MAC.Value
    Sheets("TABELA GERAL").Cells(linha_five, 9).Value = CAIXA_DATA.Value
    Sheets("TABELA GERAL").Cells(linha_five, 10).Value = CAIXA_APARELHO.Value
    Sheets("TABELA GERAL").Cells(linha_five, 11).Value = TABELA
    Sheets("TABELA GERAL").Cells(linha_five, 12).Value = CAIXA_TEXTO.Value
End If

Next
    
CAIXA_PROFISSIONAL = ""
CAIXA_FILIAL = ""
CAIXA_CHAPA = ""
CAIXA_APARELHO = ""
CAIXA_IMEI = ""
CAIXA_MAC = ""
CAIXA_TEXTO = ""
CAIXA_STATUS = ""
CAIXA_TABELA = ""
CAIXA_EMAIL = ""
CAIXA_SENHA = ""
CAIXA_MATRICULA = ""
CAIXA_RECEBIDO = ""

If TABELA = "PENDENCIAS" Then
    MsgBox "    Aparelho adicionado aos Pendentes!"
ElseIf TABELA = "DISPONIVEIS" Then
    MsgBox "    Aparelho adicionado aos Disponiveis!"
ElseIf TABELA = "BAIXADOS" Then
    MsgBox "    Aparelho adicionado aos Baixados!"
ElseIf TABELA = "EM CAMPO" Then
    MsgBox "    Aparelho adicionado aos Em Campo!"
End If


'Reconta as celulas após efetuar a mudança

Sheets("TABELA GERAL").Select

    Sheets("TABELA GERAL").Range("U2:U3").AutoFill Destination:=Range("U2:U2000")
    Sheets("TABELA GERAL").Range("V2:V3").AutoFill Destination:=Range("V2:V2000")
    Sheets("TABELA GERAL").Range("W2:W3").AutoFill Destination:=Range("W2:W2000")
    
Sheets("SMARTPHONES").Select

    Sheets("SMARTPHONES").Range("N2:N3").AutoFill Destination:=Range("N2:N2000")
    Sheets("SMARTPHONES").Range("O2:O3").AutoFill Destination:=Range("O2:O2000")
    Sheets("SMARTPHONES").Range("P2:P3").AutoFill Destination:=Range("P2:P2000")
    Sheets("SMARTPHONES").Range("U2:U3").AutoFill Destination:=Range("U2:U2000")
    Sheets("SMARTPHONES").Range("V2:V3").AutoFill Destination:=Range("V2:V2000")
    Sheets("SMARTPHONES").Range("W2:W3").AutoFill Destination:=Range("W2:W2000")

Sheets(nome_aba).Select

ActiveWorkbook.Save

GoTo fim
Mensagem:
MsgBox "    Existem inconsistências nas infomações preenchidas."
fim:

Application.ScreenUpdating = True
Application.Calculation = xlCalculationAutomatic
Application.EnableEvents = True

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
            CAIXA_FILIAL = ABA.Cells(LINHA, 2).Value
            CAIXA_MATRICULA = ABA.Cells(LINHA, 4).Value
            CAIXA_EMAIL = ABA.Cells(LINHA, 5).Value
            CAIXA_SENHA = ABA.Cells(LINHA, 6).Value
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
    CAIXA_EMAIL = ""
    CAIXA_SENHA = ""
    CAIXA_MATRICULA = ""
    CAIXA_FILIAL = ""
    End If


GoTo fim

Mensagem:

MsgBox "    O nome informado não é valido e/ou não existe. Tente novamente."

fim:

End Sub

Private Sub CAIXA_APARELHO_ENTER()
ultima_linha = Sheets("DADOS").Range("A2").End(xlDown).Row
CAIXA_APARELHO.RowSource = "DADOS!A2:A" & ultima_linha

End Sub
Private Sub CAIXA_CHAPA_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
 
    KeyAscii = SóNúmeros(KeyAscii)

End Sub


Private Sub CAIXA_FILIAL_Enter()
ultima_linha = Sheets("dados").Range("b2").End(xlDown).Row
CAIXA_FILIAL.RowSource = "DADOS!B2:B" & ultima_linha

End Sub
Private Sub CAIXA_PROFISSIONAL_ENTER()
ultima_linha = Sheets("TABELA GERAL").Range("A3").End(xlDown).Row
CAIXA_PROFISSIONAL.RowSource = "'TABELA GERAL'!A3:A" & ultima_linha
End Sub

Private Sub CAIXA_RECEBIDO_ENTER()
ultima_linha = Sheets("DADOS").Range("F2").End(xlDown).Row
CAIXA_RECEBIDO.RowSource = "'DADOS'!F2:F" & ultima_linha
End Sub
Private Sub CAIXA_TABELA_ENTER()
ultima_linha = Sheets("DADOS").Range("D2").End(xlDown).Row
CAIXA_TABELA.RowSource = "DADOS!D2:D" & ultima_linha
End Sub

Private Sub CALCULAR_Click()

CAIXA_TESTE.Value = CAIXA_DATA + 10

End Sub


Private Sub ComboBox1_Change()

End Sub

Private Sub UserForm_Initialize()

CAIXA_DATA = Sheets("DADOS").Range("E2").Value

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
