VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} Baixaraparelho 
   Caption         =   "Adicionar aos disponiveis"
   ClientHeight    =   8265.001
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   6360
   OleObjectBlob   =   "Baixaraparelho.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "Baixaraparelho"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub BOTAO_BUSCAR_Click()

On Error GoTo Mensagem

chapa = CAIXA_CHAPA.Value + 0

APARELHO = CAIXA_APARELHO.Value

For Each ABA In ThisWorkbook.Sheets
    If ABA.Name = "SMARTPHONES" Then
         
    ult_linha = Sheets("SMARTPHONES").Range("A2").End(xlDown).Row + 1
            For LINHA = 3 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                CAIXA_EMAIL = ABA.Cells(LINHA, 6).Value
                CAIXA_SENHA = ABA.Cells(LINHA, 7).Value
                CAIXA_FILIAL = ABA.Cells(LINHA, 2).Value
                CAIXA_PROFISSIONAL = ABA.Cells(LINHA, 1).Value
                CAIXA_IMEI = ABA.Cells(LINHA, 8).Value
                CAIXA_MAC = ABA.Cells(LINHA, 9).Value
                CAIXA_APARELHO = ABA.Cells(LINHA, 11).Value
                CAIXA_STATUS.Value = "EM CAMPO"
                
           End If
        Next
    End If
Next


For Each ABA In ThisWorkbook.Sheets
    If ABA.Name = "DISPONIVEIS" Then

    ult_linha = Sheets("DISPONIVEIS").Range("A2").End(xlDown).Row + 1
    
            For LINHA = 3 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                CAIXA_PROFISSIONAL = ABA.Cells(LINHA, 1).Value
                CAIXA_FILIAL = ABA.Cells(LINHA, 2).Value
                CAIXA_EMAIL.Value = "NÃO INFORMADO"
                CAIXA_SENHA.Value = "NÃO INFORMADO"
                CAIXA_IMEI = ABA.Cells(LINHA, 5).Value
                CAIXA_MAC = ABA.Cells(LINHA, 6).Value
                CAIXA_APARELHO = ABA.Cells(LINHA, 4).Value
                CAIXA_STATUS.Value = "DISPONIVEL"
                CAIXA_TEXTO = ABA.Cells(LINHA, 8).Value
           End If
        Next
    End If
Next


For Each ABA In ThisWorkbook.Sheets
    If ABA.Name = "PENDENCIAS" Then

    ult_linha = Sheets("PENDENCIAS").Range("A2").End(xlDown).Row + 1
    
            For LINHA = 3 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                CAIXA_PROFISSIONAL = ABA.Cells(LINHA, 1).Value
                CAIXA_FILIAL = ABA.Cells(LINHA, 2).Value
                CAIXA_EMAIL.Value = "NÃO INFORMADO"
                CAIXA_SENHA.Value = "NÃO INFORMADO"
                CAIXA_IMEI = ABA.Cells(LINHA, 5).Value
                CAIXA_MAC = ABA.Cells(LINHA, 6).Value
                CAIXA_APARELHO = ABA.Cells(LINHA, 4).Value
                CAIXA_STATUS.Value = "PENDENTE"
                CAIXA_TEXTO = ABA.Cells(LINHA, 8).Value
           End If
        Next
    End If
Next

For Each ABA In ThisWorkbook.Sheets
    If ABA.Name = "BAIXADOS" Then

    ult_linha = Sheets("BAIXADOS").Range("A2").End(xlDown).Row + 1
    
            For LINHA = 4 To ult_linha
            If ABA.Cells(LINHA, 4).Value = chapa Then
            MsgBox "    Este Smartphone já foi baixado! "
            
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
Unload Baixaraparelho
End Sub

Private Sub BOTAO_PESQUISAR_Click()
formulariopesquisa.Show
End Sub

Private Sub BOTAO_SALVAR_Click()

Application.ScreenUpdating = False

On Error GoTo Mensagem
    
 If CAIXA_CHAPA = "" Then
    MsgBox "    É necessário informar uma chapa!"
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
    MsgBox "    É necessário informar o motivo da baixa!"
   Exit Sub
   
End If


LINHA = Sheets("BAIXADOS").Range("A1").End(xlDown).Row + 1

    Sheets("BAIXADOS").Cells(LINHA, 2).Value = CAIXA_PROFISSIONAL.Value
    Sheets("BAIXADOS").Cells(LINHA, 3).Value = CAIXA_FILIAL.Value
    Sheets("BAIXADOS").Cells(LINHA, 4).Value = CAIXA_CHAPA.Value
    Sheets("BAIXADOS").Cells(LINHA, 1).Value = CAIXA_APARELHO.Value
    Sheets("BAIXADOS").Cells(LINHA, 5).Value = CAIXA_IMEI.Value
    Sheets("BAIXADOS").Cells(LINHA, 6).Value = CAIXA_MAC.Value
    Sheets("BAIXADOS").Cells(LINHA, 7).Value = CAIXA_DATA.Value
    Sheets("BAIXADOS").Cells(LINHA, 8).Value = CAIXA_TEXTO.Value

linha_four = Sheets("HISTORICO").Range("A1048476").End(xlUp).Row + 1

    Sheets("HISTORICO").Cells(linha_four, 1).Value = CAIXA_PROFISSIONAL.Value
    Sheets("HISTORICO").Cells(linha_four, 2).Value = CAIXA_FILIAL.Value
    Sheets("HISTORICO").Cells(linha_four, 3).Value = CAIXA_CHAPA.Value
    Sheets("HISTORICO").Cells(linha_four, 4).Value = "NÃO INFORMADO"
    Sheets("HISTORICO").Cells(linha_four, 5).Value = CAIXA_EMAIL.Value
    Sheets("HISTORICO").Cells(linha_four, 6).Value = CAIXA_SENHA.Value
    Sheets("HISTORICO").Cells(linha_four, 7).Value = CAIXA_IMEI.Value
    Sheets("HISTORICO").Cells(linha_four, 8).Value = CAIXA_MAC.Value
    Sheets("HISTORICO").Cells(linha_four, 9).Value = CAIXA_DATA.Value
    Sheets("HISTORICO").Cells(linha_four, 10).Value = CAIXA_APARELHO.Value
    Sheets("HISTORICO").Cells(linha_four, 11).Value = "SMARTPHONE BAIXADO"
    Sheets("HISTORICO").Cells(linha_four, 12).Value = CAIXA_TEXTO.Value
    

chapa = CAIXA_CHAPA.Value + 0

For Each ABA In ThisWorkbook.Sheets

If ABA.Name <> "tela inicial" Then
If ABA.Name <> "PENDENCIAS" Then
If ABA.Name <> "DISPONIVEIS" Then
If ABA.Name <> "BAIXADOS" Then
If ABA.Name <> "TERMOS" Then
If ABA.Name <> "INFOGERAIS" Then
If ABA.Name <> "analise" Then
If ABA.Name <> "DADOS" Then
If ABA.Name <> "IDADES" Then
If ABA.Name <> "HISTORICO" Then

        ult_linha = ABA.Range("a1").End(xlDown).Row + 1
               
         For LINHA = 4 To ult_linha
                     
         If ABA.Cells(LINHA, 3).Value = chapa Then
                          
         ABA.Range(ABA.Cells(LINHA, 1), ABA.Cells(LINHA, 11)).Delete shift:=xlUp
                             
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
 End If
 End If
 
 
 Next


MsgBox "    O Smartphone foi baixado."

CAIXA_PROFISSIONAL = ""
CAIXA_FILIAL = ""
CAIXA_CHAPA = ""
CAIXA_APARELHO = ""
CAIXA_IMEI = ""
CAIXA_MAC = ""
CAIXA_DATA = ""
CAIXA_TEXTO = ""

ActiveWorkbook.Save

GoTo fim

Mensagem:

MsgBox "    Existem inconsistências nas infomações preenchidas."

fim:

Unload Baixaraparelho

Application.ScreenUpdating = True

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
ultima_linha = Sheets("SMARTPHONES").Range("b3").End(xlDown).Row
CAIXA_PROFISSIONAL.RowSource = "SMARTPHONES!A3:A" & ultima_linha
End Sub
Private Sub UserForm_Initialize()
CAIXA_DATA = Date
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
