Attribute VB_Name = "Módulo1"
Sub MOSTRAR_FORMULARIO()
Adicionaraparelho.Show
End Sub
Sub MOSTRAR_FORMULARIO_EXCLUIR()
excluiraparelho.Show
End Sub
Sub MOSTRAR_FORMULARIO_PENDENTE()
Adicionarpendente.Show
End Sub
Sub MOSTRAR_FORMULARIO_EXCLUIR_PENDENTE()
excluirpendente.Show
End Sub
Sub MOSTRAR_FORMULARIO_ADICIONAR_DISPONIVEL()
Adicionardisponivel.Show
End Sub
 
Sub MOSTRAR_FORMULARIO_EXCLUIR_DISPONIVEL()
excluirdisponivel.Show
End Sub
Sub MOSTRAR_BAIXAR_APARELHO()
Baixaraparelho.Show
End Sub
Sub excluir_termo()
   Selection.ClearContents
End Sub
Sub MOSTRAR_FORMULARIO_PESQUISA()
formulariopesquisa.Show
End Sub
Sub MOSTRAR_FORMULARIO_COPIAR_DATA()
formulariocopiardatas.Show
End Sub
Sub MOSTRAR_ALTERAR_DADOS()
Alterardados.Show
End Sub
Sub salvar_planilha()
Application.ScreenUpdating = False
ActiveWorkbook.Save
Application.ScreenUpdating = True
End Sub
Sub MOSTRAR_FORMULARIO_ALTERAR_SITUACAO()
ALTERAR_SITUACAO_APARELHO_NEW.Show
End Sub
Sub FECHAR_FORMULARIO_ALTERAR_SITUACAO()
Unload ALTERAR_SITUACAO_APARELHO_NEW
End Sub
Sub MOSTRAR_COMPRA_SMART()
compra_smart.Show
End Sub
