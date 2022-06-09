VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} formulariocopiardatas 
   Caption         =   "Pesquisa Geral de Smartphones"
   ClientHeight    =   4305
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7815
   OleObjectBlob   =   "formulariocopiardatas.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "formulariocopiardatas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub BOTAO_BUSCAR_Click()

Application.ScreenUpdating = False

CAIXA_DATA.Value = ""
CAIXA_MODELO.Value = ""
CAIXA_NFE.Value = ""
CAIXA_FILIAL.Value = ""
CAIXA_CC.Value = ""

On Error GoTo Mensagem
If CAIXA_CHAPA = "" Then
MsgBox "    É necessario informar uma chapa!"
    GoTo fim
End If

chapa = CAIXA_CHAPA.Value + 0

Workbooks.Open (ThisWorkbook.Path & "\pat401kn.xlsx")

DATA = Cells.Find(chapa).Offset(0, 1)
nome = Cells.Find(chapa).Offset(0, 3)
NFE = Cells.Find(chapa).Offset(0, 4)
FILIAL = Cells.Find(chapa).Offset(0, 7)
CCUSTO = Cells.Find(chapa).Offset(0, 8)

ActiveWorkbook.Close
    
CAIXA_DATA.Value = DATA
CAIXA_MODELO.Value = nome
CAIXA_NFE.Value = NFE
CAIXA_FILIAL.Value = FILIAL
CAIXA_CC.Value = CCUSTO


GoTo fim
Mensagem:
ActiveWorkbook.Close
MsgBox "    A chapa informada não foi encontrada."
fim:

Application.ScreenUpdating = True

End Sub

Private Sub BOTAO_FECHAR_Click()
Unload formulariocopiardatas
End Sub

Private Sub BOTAO_LIMPAR_Click()

CAIXA_MODELO = ""
CAIXA_CHAPA = ""
CAIXA_NFE = ""
CAIXA_DATA = ""
CAIXA_FILIAL = ""
CAIXA_CC = ""

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
Private Sub CAIXA_CHAPA_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
 KeyAscii = SóNúmeros(KeyAscii)
End Sub

Private Sub CommandButton1_Click()
Alterardados.Show
End Sub

Private Sub Label3_Click()

End Sub
