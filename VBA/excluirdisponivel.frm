VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} excluirdisponivel 
   Caption         =   "EXCLUIR APARELHO DISPONIVEL"
   ClientHeight    =   3285
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4920
   OleObjectBlob   =   "excluirdisponivel.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "excluirdisponivel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BOTAOCANCELAR_Click()

Unload excluirdisponivel

End Sub

Private Sub BOTAOEXCLUIRDISPONIVEL_Click()

Application.ScreenUpdating = False

On Error GoTo Mensagem

Valor_CHAPA = CAIXA_CHAPA.Value + 0

ult_linha = Range("C200").End(xlUp).Row

For LINHA = 2 To ult_linha

    If Cells(LINHA, 3).Value = Valor_CHAPA Then
        Range(Cells(LINHA, 1), Cells(LINHA, 8)).Delete shift:=xlUp
    LINHA = LINHA - 1
    
End If

Next

ActiveWorkbook.Save

CAIXA_CHAPA = ""

MsgBox " Chapa informada excluida"

GoTo fim

Mensagem:

MsgBox "    Smartphone não encontrado."

fim:

Unload excluirdisponivel

Application.ScreenUpdating = True

End Sub


