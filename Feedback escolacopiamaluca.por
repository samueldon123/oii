/*		Murilo Amauri Paludetto 20/05
 * /
 */
programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t
	
	cadeia comentario[10], chave, autor[10] = {"","","","","","","","","",""}
	
	inteiro id_comentario=0,maximo_comentario=10, opcao, limite_comentario=0,autor_limite=0,autor_limite2
	inteiro cor_fundo = g.criar_cor(91, 118, 128), cor_textoA = g.criar_cor(151, 89, 213)
	inteiro imagem, cordenada_x=5, cordenada_y=35
	
	funcao inicio()
	{
		escreva("*********************************************************************************\n")
		escreva("	Escreva um feedback e deixe até 10 deles armazenados no sistema!\n")
		escreva("*********************************************************************************\n")
		escreva("Digite 'Entendi' para continuar\n	")
		leia(chave)
		se(chave=="Entendi" ou chave=="entendi")
		{
			opcoes()
		}
		senao
		limpa()
		inicio()
	}
	funcao opcoes()
	{
		limpa()
		escreva("1) Escrever comentario\n")
		escreva("2) Ler comentario(s)\n")
		escreva("3) Imprimir comentario(s)\n")
		escreva("Escolha uma opção: ")
		leia(opcao)
		limpa()
		escolha(opcao)
		{
			caso 1:
			usuario()
			pare
			caso 2:
			ler_comentario()
			pare
			caso 3:
			imprimir()
			pare
		}
	}	
	funcao escrever_comentario()
	{
		
		limpa()
		escreva("	  Envie aqui seu feedback\n","	(",maximo_comentario," Comentarios disponiveis)\n")
		se(maximo_comentario!=0)
		{
			maximo_comentario=maximo_comentario-1
			comentario_e()
			
		}
		senao
		comentario_ind()
	}
	funcao comentario_e()
	{
		leia(comentario[id_comentario])
		id_comentario=id_comentario+1
		opcoes()
	}
	funcao comentario_ind()
	{
		limpa()
		escreva("	Sem mais comentarios disponiveis")
		escreva("\nDeseja voltar para opções?\n(Sim)	(Não)\n")
		leia(chave)
		se(chave=="Sim" ou chave=="sim")
		{
			opcoes()
		}
		senao
		{
			ler_comentario()
		}
		
	}
	funcao ler_comentario()
	{
		limite_comentario=1
		limpa()
		escreva("Os comentarios salvos são:\n")
		para(inteiro vetor_comentario=0;vetor_comentario<10;vetor_comentario++)
		{					
			se(comentario[vetor_comentario]!="")
			{
				escreva("\n",limite_comentario,"°Comentario: ",comentario[vetor_comentario])
				escreva(" - ",autor[vetor_comentario])
				limite_comentario=limite_comentario+1
			}			
		}
		escreva("\nDeseja voltar para opções?\n(Sim)	(Não)\n")
		leia(chave)
		se(chave=="Sim" ou chave=="sim")
		{
			opcoes()
		}
		senao
		{
			ler_comentario()
		}
	}

	funcao imprimir()
	{
		chave=""
		limite_comentario=1
		limpa()
		
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(1280, 720)
		
		enquanto(verdadeiro)
		{
			
			imagem = g.carregar_imagem("C:/Users/murilo.paludetto/Downloads/FeedBack/1.png")
			g.definir_titulo_janela("Comentários")
			g.definir_cor(g.COR_BRANCO)
			g.limpar()
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(30.0)
			g.desenhar_imagem(1175, 665,imagem)
			g.desenhar_texto(5, 5,"Os comentarios salvos são:\n")
			
		
			
			para(inteiro vetor_comentario=0;vetor_comentario<10;vetor_comentario++)
			{
				
				g.definir_cor(g.COR_PRETO)
					se(comentario[vetor_comentario]!="")
					{
						
						se(limite_comentario==1)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"1°:")
						}
						senao se(limite_comentario==2)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"2°:")
						}
						senao se(limite_comentario==3)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"3°:")
						}
						senao se(limite_comentario==4)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"4°:")
						}
						senao se(limite_comentario==5)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"5°:")
						}
						senao se(limite_comentario==6)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"6°:")
						}
						senao se(limite_comentario==7)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"7°:")
						}
						senao se(limite_comentario==8)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"8°:")
						}
						senao se(limite_comentario==9)
						{
							g.desenhar_texto(cordenada_x,cordenada_y,"9°:")
						}
						senao se(limite_comentario==10)
						{
							g.desenhar_texto(cordenada_x, cordenada_y,"10°:")
							
						}
						g.definir_cor(cor_textoA)
						g.desenhar_texto(cordenada_x+60, cordenada_y,autor[vetor_comentario])
						g.definir_cor(g.COR_PRETO)
						g.desenhar_texto(cordenada_x+240, cordenada_y,comentario[vetor_comentario])
						limite_comentario=limite_comentario+1
					
						cordenada_y=cordenada_y+35
					}	
				
			}
			g.renderizar()
			se(t.tecla_pressionada(t.TECLA_ESC))
			{	
				g.encerrar_modo_grafico()				
				
			}	
			escreva("\nDeseja voltar para opções?\n(Sim)	(Não)\n")
			leia(chave)	
			se(chave=="Sim" ou chave=="sim")
			{
				g.encerrar_modo_grafico()				
				opcoes()
			}
			senao
			{
				g.encerrar_modo_grafico()				
				ler_comentario()
			}
		}
	}
	funcao usuario()
	{
		se(maximo_comentario!=0)
		{
		escreva("(Não digite nada para comentar anonimamente)\n	Digite seu nome para continuar: ")
		leia(autor[autor_limite])
		autor_limite=autor_limite+1
		escrever_comentario()
		}
		senao
		comentario_ind()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2181; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */