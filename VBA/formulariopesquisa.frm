VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} formulariopesquisa 
   Caption         =   "Pesquisa de Smartphones"
   ClientHeight    =   4740
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   6180
   OleObjectBlob   =   "formulariopesquisa.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "formulariopesquisa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BOTAO_BUSCAR_Click()

CAIXA_MODELO = ""
CAIXA_IMEI = ""
CAIXA_MAC = ""
CAIXA_INICIO = ""
CAIXA_IDADE = ""
CAIXA_FIM = ""
CAIXA_STATUS = ""



If CAIXA_CHAPA = "" Then
    GoTo Mensagem
End If

chapa = CAIXA_CHAPA.Value + 0
For Each ABA In ThisWorkbook.Sheets

If ABA.Name = "IDADES" Then
    ult_linha = ABA.Cells(2, 2).End(xlDown).Row + 1
         For LINHA = 2 To ult_linha
            If ABA.Cells(LINHA, 2).Value = chapa Then
                CAIXA_INICIO = ABA.Cells(LINHA, 5).Value
                CAIXA_FIM = ABA.Cells(LINHA, 6).Value
                CAIXA_IDADE = ABA.Cells(LINHA, 7).Value
                CAIXA_MODELO = ABA.Cells(LINHA, 1).Value
                CAIXA_IMEI = ABA.Cells(LINHA, 3).Value
                CAIXA_MAC = ABA.Cells(LINHA, 4).Value
                
            End If
        Next
    End If
Next

'segunda parte do codigo


For Each ABA In ThisWorkbook.Sheets
    If ABA.Name = "BAIXADOS" Then
    ult_linha = Sheets("BAIXADOS").Range("a2").End(xlDown).Row + 1
        For LINHA = 3 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                CAIXA_STATUS.Value = "APARELHO BAIXADO"
            End If
        Next
        
    ElseIf ABA.Name = "SMARTPHONES" Then
        ult_linha = Sheets("SMARTPHONES").Range("A2").End(xlDown).Row + 1
        For LINHA = 3 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                CAIXA_STATUS.Value = "APARELHO EM CAMPO"
            End If
        Next
        
    ElseIf ABA.Name = "PENDENCIAS" Then
        ult_linha = Sheets("PENDENCIAS").Range("A2").End(xlDown).Row + 1
        For LINHA = 3 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                CAIXA_STATUS.Value = "APARELHO PENDENTE"
            End If
        Next
        
    ElseIf ABA.Name = "DISPONIVEIS" Then
        ult_linha = Sheets("DISPONIVEIS").Range("A2").End(xlDown).Row + 1
        For LINHA = 3 To ult_linha
            If ABA.Cells(LINHA, 3).Value = chapa Then
                CAIXA_STATUS.Value = "APARELHO DISPONIVEL"
            End If
        Next
        
    End If
Next

GoTo fim
Mensagem:
MsgBox "    A chapa informada não foi encontrada. "

fim:

End Sub
Private Sub BOTAO_FECHAR_Click()
Unload formulariopesquisa
End Sub
Private Sub BOTAO_LIMPAR_Click()

CAIXA_MODELO = ""
CAIXA_CHAPA = ""
CAIXA_IMEI = ""
CAIXA_MAC = ""
CAIXA_INICIO = ""
CAIXA_FIM = ""
CAIXA_IDADE = ""

End Sub
Private Sub BOTAOMAISINFO_Click()
formulariocopiardatas.Show
End Sub

Private Sub CAIXA_CHAPA_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
 
 KeyAscii = SóNúmeros(KeyAscii)

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
Sub UserForm_Initialize()
CAIXA_AGORA = Date
End Sub
