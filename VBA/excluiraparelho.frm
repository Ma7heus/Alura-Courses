VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} excluiraparelho 
   Caption         =   "Exclusão de Aparelhos"
   ClientHeight    =   3405
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4785
   OleObjectBlob   =   "excluiraparelho.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "excluiraparelho"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BOTAOCANCELAR_Click()

Unload excluiraparelho


End Sub

Private Sub BOTAOEXCLUIR_Click()

Application.ScreenUpdating = False
Application.Calculation = xlCalculationManual
Application.EnableEvents = False

On Error GoTo Mensagem
nome_aba = ActiveSheet.Name

If CAIXA_CHAPA = "" Then
    GoTo Mensagem
End If

CAIXADETEXTO = ""

chapa = CAIXA_CHAPA.Value + 0

For Each ABA In ThisWorkbook.Sheets

If ABA.Name <> "tela inicial" Then
If ABA.Name <> "BAIXADOS" Then
If ABA.Name <> "TERMOS" Then
If ABA.Name <> "DISPOSITIVOS" Then
If ABA.Name <> "analise" Then
If ABA.Name <> "DADOS" Then
If ABA.Name <> "IDADES" Then
If ABA.Name <> "HISTORICO" Then

        ult_linha = ABA.Range("a1").End(xlDown).Row + 1
               
         For LINHA = 4 To ult_linha
                     
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
   MsgBox " Dispositivo selecionado Excluido"
 GoTo fim
Mensagem:
    MsgBox "    Smartphone não encontrado."
fim:
     
         
  Unload excluiraparelho
  
Application.ScreenUpdating = True
Application.Calculation = xlCalculationAutomatic
Application.EnableEvents = True
    
End Sub

Private Sub CAIXA_MODELO_ENTER()


ultima_linha = Sheets("DADOS").Range("A2").End(xlDown).Row

CAIXA_MODELO.RowSource = "DADOS!A2:A" & ultima_linha

End Sub


