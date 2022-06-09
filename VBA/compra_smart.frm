VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} compra_smart 
   Caption         =   "Registro de compra de equipamentos"
   ClientHeight    =   3675
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4290
   OleObjectBlob   =   "compra_smart.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "compra_smart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BOTAO_CANCELAR_Click()
Unload compra_smart
End Sub

Private Sub BOTAO_SALVAR_Click()

nome = CAIXA_DESCRICAO.Value

If nome = "" Then
    MsgBox " É necessário informar a descrição do equipamento1"
    Exit Sub
        ElseIf CAIXA_QUANTIDADE = "" Then
        MsgBox "    É necessario informar a quantidade!"
        Exit Sub
        ElseIf CAIXA_NFE = "" Then
        MsgBox "    É necessario informar a NFE!"
        Exit Sub
        ElseIf CAIXA_DATA_NFE = "" Then
        MsgBox "    É necessario informar a data da NFE!"
        Exit Sub
        ElseIf CAIXA_DATA_REC = "" Then
        MsgBox "    É necessario informar a data de recebimento!"
        Exit Sub
    
End If

ultima_linha = Sheets("COMPRA").Range("A1").End(xlDown).Row + 1

    Sheets("COMPRA").Cells(ultima_linha, 1).Value = CAIXA_DESCRICAO.Value
    Sheets("COMPRA").Cells(ultima_linha, 2).Value = CAIXA_QUANTIDADE.Value
    Sheets("COMPRA").Cells(ultima_linha, 3).Value = CAIXA_NFE.Value
    Sheets("COMPRA").Cells(ultima_linha, 4).Value = CAIXA_DATA_NFE.Value
    Sheets("COMPRA").Cells(ultima_linha, 5).Value = CAIXA_DATA_REC.Value

GoTo fim

Mensagem:
MsgBox "    Existem inconsitências nos dados informados."

fim:
MsgBox "    Compra registrada com sucesso."


End Sub
