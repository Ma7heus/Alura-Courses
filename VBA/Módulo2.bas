Attribute VB_Name = "Módulo2"
Sub ultimoaparelho()
Attribute ultimoaparelho.VB_ProcData.VB_Invoke_Func = " \n14"
    
    Range("C1").Select
    Selection.End(xlDown).Select
    
End Sub
Sub primeiroaparelho()
    
    Range("C1").Select
    Selection.End(xlDown).Select
    Range("C2").Select
    
End Sub
Sub Triânguloisósceles3_Clique()

Range("C1").Select
    Selection.End(xlDown).Select
    Range("c3").Select
    
End Sub
Sub Triânguloisósceles5_Clique()

Range("C1").Select
    Selection.End(xlDown).Select
    
End Sub
Sub Cadastro_filial()

nome_filial = InputBox(" Digite abaixo o nome da nova Filial seguindo o seguinte padrão: 000_NOME DA FILIAL ! ")

ultima_linha = Sheets("DADOS").Range("B2").End(xlDown).Row + 1

    Sheets("DADOS").Cells(ultima_linha, 2) = nome_filial
    
MsgBox "    Filial nova cadastrada!"
    
End Sub
Sub Cadastro_modelo()

nome_filial = InputBox(" Digite abaixo o modelo do novo smartphone seguindo o seguinte exemplo: GALAXY A51 !")

If nome_filial = "" Then GoTo fim
    ultima_linha = Sheets("DADOS").Range("A2").Insert
    ultima_linha = Sheets("DADOS").Range("A2").Row
        Sheets("DADOS").Cells(ultima_linha, 1) = nome_filial


fim:

    
End Sub
Sub tela_cheia()
    Application.DisplayFullScreen = True
End Sub

Sub Ordenar_planilha()
Application.ScreenUpdating = False

    ActiveWorkbook.Worksheets("SMARTPHONES").AutoFilter.Sort.SortFields.Clear
    ActiveWorkbook.Worksheets("SMARTPHONES").AutoFilter.Sort.SortFields.Add Key:= _
        Range("A3:A2000"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption _
        :=xlSortNormal
    With ActiveWorkbook.Worksheets("SMARTPHONES").AutoFilter.Sort
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
    
Application.ScreenUpdating = True

End Sub
Sub SALVAR_PLANILHA_NEW()
    ActiveWorkbook.Save
End Sub
Sub Macro_ajustar_TABELA3()
Application.ScreenUpdating = False

Sheets("TABELA GERAL").Select

    Sheets("TABELA GERAL").Range("U2:U3").AutoFill Destination:=Range("U2:U2000")
    Sheets("TABELA GERAL").Range("V2:V3").AutoFill Destination:=Range("V2:V2000")
    Sheets("TABELA GERAL").Range("W2:W3").AutoFill Destination:=Range("W2:W2000")
    
ActiveWorkbook.Save
Sheets("tela inicial").Select
Application.ScreenUpdating = True
End Sub
Sub Macro_ajustar_tabela_analise()
Application.ScreenUpdating = False
Sheets("SMARTPHONES").Select

    Sheets("SMARTPHONES").Range("N2:N3").AutoFill Destination:=Range("N2:N2000")
    Sheets("SMARTPHONES").Range("O2:O3").AutoFill Destination:=Range("O2:O2000")
    Sheets("SMARTPHONES").Range("P2:P3").AutoFill Destination:=Range("P2:P2000")
    Sheets("SMARTPHONES").Range("U2:U3").AutoFill Destination:=Range("U2:U2000")
    Sheets("SMARTPHONES").Range("V2:V3").AutoFill Destination:=Range("V2:V2000")
    Sheets("SMARTPHONES").Range("W2:W3").AutoFill Destination:=Range("W2:W2000")
    
ActiveWorkbook.Save
Sheets("analise").Select
Application.ScreenUpdating = True
End Sub

Sub tela_cheia_OFF()
    Application.DisplayFullScreen = False
End Sub

