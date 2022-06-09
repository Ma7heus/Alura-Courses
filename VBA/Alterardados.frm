VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} Alterardados 
   Caption         =   "FORMULÁRIO PARA ALTERAÇÃO DE  INFORMAÇÃOES "
   ClientHeight    =   6045
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8010
   OleObjectBlob   =   "Alterardados.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "Alterardados"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub BOTAO_BUSCAR_Click()
 
On Error GoTo Mensagem
 
 If CAIXA_NOME = "" Then
    
    GoTo Mensagem
    
End If

chapa = CAIXA_NOME.Value

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
If ABA.Name <> "TABELA GERAL" Then
     
     ult_linha = Sheets("SMARTPHONES").Range("A1").End(xlDown).Row
          
     For LINHA = 1 To ult_linha
     
        If ABA.Cells(LINHA, 1).Value = chapa Then
            CAIXA_NOME = ABA.Cells(LINHA, 1).Value
            CAIXA_FILIAL = ABA.Cells(LINHA, 2).Value
            CAIXA_MATRICULA = ABA.Cells(LINHA, 4).Value
            CAIXA_SENHA_CRM = ABA.Cells(LINHA, 5).Value
            CAIXA_EMAIL = ABA.Cells(LINHA, 6).Value
            CAIXA_SENHA_EMAIL = ABA.Cells(LINHA, 7).Value
            CAIXA_IMEI = ABA.Cells(LINHA, 8).Value
            CAIXA_MAC = ABA.Cells(LINHA, 9).Value
            CAIXA_MODELO = ABA.Cells(LINHA, 11).Value
        End If
    
    If ABA.Cells(LINHA, 2).Value = chapa Then GoTo fim
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

GoTo fim

Mensagem:

MsgBox "    O nome informado não é válido e/ou não existe. Tente novamente."

fim:

End Sub

Private Sub BOTAO_LIMPAR_Click()

CAIXA_NOME = ""
CAIXA_INFO = ""
CAIXA_DADOS = ""
CAIXA_FILIAL = ""
CAIXA_EMAIL = ""
CAIXA_SENHA_EMAIL = ""
CAIXA_MODELO = ""
CAIXA_IMEI = ""
CAIXA_MAC = ""
CAIXA_SENHA_CRM = ""


End Sub

Private Sub BOTAO_PESQUISAR_Click()
formulariopesquisa.Show
End Sub

Private Sub BOTAO_PESQUISAR_two_Click()
formulariocopiardatas.Show
End Sub

Private Sub BOTAOCANCELAR_Click()
Unload Alterardados

End Sub
Private Sub BOTAOSALVAR_Click()

Application.ScreenUpdating = False
Application.Calculation = xlCalculationManual
Application.EnableEvents = False

DATA = Date

'CODIGO QUE MUDA OS DADOS DA TABELA SMARTPHONES
    
If CAIXA_NOME <> "" Then
    nome = CAIXA_NOME
    LINHA = Sheets("SMARTPHONES").Cells.Find(nome).Row
        Else
        MsgBox "    É necessário informar o nome do Profissional!"
    Exit Sub
End If
            
If CAIXA_INFO.Value = "NOME" Then
    coluna = 1
    ElseIf CAIXA_INFO.Value = "FILIAL" Then
    coluna = 2
    ElseIf CAIXA_INFO.Value = "CHAPA" Then
    coluna = 3
    ElseIf CAIXA_INFO.Value = "USUARIO CRM" Then
    coluna = 4
    ElseIf CAIXA_INFO.Value = "E-MAIL" Then
    coluna = 6
    ElseIf CAIXA_INFO.Value = "SENHA E-mail" Then
    coluna = 7
    ElseIf CAIXA_INFO.Value = "IMEI" Then
    coluna = 8
    ElseIf CAIXA_INFO.Value = "MAC" Then
    coluna = 9
    ElseIf CAIXA_MODELO.Value = "MODELO" Then
    coluna = 11
        Else
        MsgBox "   Preencher informação a ser editada!"
    Exit Sub
End If
        
If CAIXA_DADOS.Value <> "" Then
    Sheets("SMARTPHONES").Cells(LINHA, coluna).Value = CAIXA_DADOS.Value
        Else
        MsgBox "    Preencher alteração a ser salva!"
    Exit Sub
End If

'CODIGO QUE ALTERA A TABELA GERAL

If CAIXA_NOME <> "" Then
    nome = CAIXA_NOME
    LINHA_DOIS = Sheets("TABELA GERAL").Cells.Find(nome).Row
        Else
        MsgBox "    É necessário informar o nome do Profissional!"
    Exit Sub
End If

If CAIXA_INFO.Value = "NOME" Then
    coluna = 1
    ElseIf CAIXA_INFO.Value = "FILIAL" Then
    coluna = 2
    ElseIf CAIXA_INFO.Value = "CHAPA" Then
    coluna = 3
    ElseIf CAIXA_INFO.Value = "USUARIO CRM" Then
    coluna = 4
    ElseIf CAIXA_INFO.Value = "E-MAIL" Then
    coluna = 6
    ElseIf CAIXA_INFO.Value = "SENHA E-mail" Then
    coluna = 7
    ElseIf CAIXA_INFO.Value = "IMEI" Then
    coluna = 8
    ElseIf CAIXA_INFO.Value = "MAC" Then
    coluna = 9
    ElseIf CAIXA_MODELO.Value = "MODELO" Then
    coluna = 11
        Else
        MsgBox "   Preencher informação a ser editada!"
    Exit Sub
End If

If CAIXA_DADOS.Value <> "" Then
    Sheets("TABELA GERAL").Cells(LINHA_DOIS, coluna).Value = CAIXA_DADOS.Value
        Else
        MsgBox "    Preencher alteração a ser salva!"
    Exit Sub
End If

ThisWorkbook.Save

MsgBox "    Alterações Salvas."
GoTo fim
Mensagem:
MsgBox "    Existem inconsitências nas infomações preenchidas."
fim:

Application.ScreenUpdating = True
Application.Calculation = xlCalculationAutomatic
Application.EnableEvents = True

End Sub
Private Sub CAIXA_CHAPA_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
 KeyAscii = SóNúmeros(KeyAscii)
End Sub

Private Sub CAIXA_PROFISSIONAL_ENTER()

ultima_linha = Sheets("SMARTPHONES").Range("a2").End(xlDown).Row
CAIXA_PROFISSIONAL.RowSource = "SMARTPHONES!A2:A" & ultima_linha

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
Private Sub CAIXA_DADOS_Enter()

If CAIXA_INFO.Value = "" Then
    MsgBox "    Preencha antes a infomação a ser editada!"
    End If

If CAIXA_INFO.Value = "FILIAL" Then

ultima_linha = Sheets("DADOS").Range("b2").End(xlDown).Row
CAIXA_DADOS.RowSource = "DADOS!b2:b" & ultima_linha

ElseIf CAIXA_INFO = "MODELO" Then

ultima_linha = Sheets("DADOS").Range("a2").End(xlDown).Row
CAIXA_DADOS.RowSource = "DADOS!A2:A" & ultima_linha

ElseIf CAIXA_INFO = "NOME" Then

ultima_linha = Sheets("SMARTPHONES").Range("a3").End(xlDown).Row
CAIXA_DADOS.RowSource = "SMARTPHONES!A3:A" & ultima_linha

ElseIf CAIXA_INFO.Value = "USUARIO CRM" Then

ultima_linha = Sheets("SMARTPHONES").Range("D3").End(xlDown).Row
CAIXA_DADOS.RowSource = "SMARTPHONES!D3:D" & ultima_linha

ElseIf CAIXA_INFO.Value = "E-MAIL" Then

ultima_linha = Sheets("SMARTPHONES").Range("F3").End(xlDown).Row
CAIXA_DADOS.RowSource = "SMARTPHONES!F3:F" & ultima_linha

ElseIf CAIXA_INFO.Value = "SENHA E-mail" Then

ultima_linha = Sheets("SMARTPHONES").Range("g3").End(xlDown).Row
CAIXA_DADOS.RowSource = "SMARTPHONES!g3:g" & ultima_linha

End If

End Sub
Private Sub CAIXA_INFO_Enter()
ultima_linha = Sheets("DADOS").Range("C2").End(xlDown).Row
CAIXA_INFO.RowSource = "DADOS!C2:C" & ultima_linha
End Sub

Private Sub CAIXA_NOME_Enter()
ultima_linha = Sheets("TABELA GERAL").Range("a3").End(xlDown).Row
CAIXA_NOME.RowSource = "'TABELA GERAL'!A3:A" & ultima_linha

End Sub
Private Sub UserForm_Initialize()
DATA = Date
End Sub

