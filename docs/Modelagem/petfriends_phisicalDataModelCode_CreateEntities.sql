CREATE TABLE "public.CadastroAnimal" (
	"id" serial NOT NULL UNIQUE,
	"nome" varchar(100) NOT NULL,
	"nome_final" varchar(100),
	"id_tipo_animal" integer NOT NULL,
	"genero" varchar(20),
	"id_cor_pelo" integer NOT NULL,
	"data_resgate" DATE NOT NULL,
	"idade_anos" integer,
	"idade_meses" integer DEFAULT '0',
	"peso" DECIMAL NOT NULL,
	"id_porte_animal" integer NOT NULL,
	"adestravel" BOOLEAN,
	"foto" bytea,
	"historia" varchar(4000),
	"id_procedimento_padrao" integer NOT NULL,
	"data_cadastro" DATE NOT NULL,
	"data_divulgacao" DATE,
	"lar_temporario" BOOLEAN,
	"despesa_mensal" integer,
	"falecido" BOOLEAN,
	"data_falecimento" integer,
	"id_causa_falecimento" integer,
	CONSTRAINT "CadastroAnimal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Usuario" (
	"id" serial NOT NULL UNIQUE,
	"nome_completo" varchar(200) NOT NULL,
	"registro_geral" varchar(20) NOT NULL,
	"cpf" varchar(20) NOT NULL,
	"telefone" varchar(50) NOT NULL,
	"endereco" varchar(200) NOT NULL,
	"numero_casa_apartamento" integer NOT NULL,
	"complemento" varchar(20),
	"cep" integer,
	"bairro" varchar(100) NOT NULL,
	"cidade" varchar(100) NOT NULL,
	"estado" varchar(50) NOT NULL,
	"id_tipo_usuario" integer NOT NULL,
	"link_rede_social" integer,
	"data_cadastro" integer NOT NULL,
	"ativo" BOOLEAN NOT NULL,
	CONSTRAINT "Usuario_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.PadrinhoDoador" (
	"id" serial NOT NULL UNIQUE,
	"id_usuario_padrinho_doador" integer NOT NULL,
	"tipo" varchar(100),
	"meio" varchar(255),
	"id_cadastro_animal" integer NOT NULL,
	"valor_acordado" DECIMAL,
	"doador_ativo" BOOLEAN NOT NULL,
	"id_grupo_status" integer NOT NULL,
	"motivo_saida_grupo" varchar(1000),
	"intencao_retorno" BOOLEAN NOT NULL,
	"observacao" varchar(4000),
	"data_cadastro" DATE NOT NULL,
	CONSTRAINT "PadrinhoDoador_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ControleDoacao" (
	"id" serial NOT NULL UNIQUE,
	"id_padrinho_doador" integer NOT NULL,
	"data_entrada" DATE NOT NULL,
	"valor_real_entrada" DECIMAL NOT NULL,
	"recebido" BOOLEAN NOT NULL,
	"cobranca" varchar(100) NOT NULL,
	"id_categoria" integer NOT NULL,
	"id_lista_banco" integer NOT NULL,
	"id_lista_status_doacao" integer NOT NULL,
	"observacao" varchar(4000),
	CONSTRAINT "ControleDoacao_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categoria" (
	"id" serial NOT NULL UNIQUE,
	"categoria" varchar(100) NOT NULL,
	CONSTRAINT "Categoria_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ListaBanco" (
	"id" serial NOT NULL UNIQUE,
	"nome_banco" varchar(100) NOT NULL,
	CONSTRAINT "ListaBanco_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ListaStatusDoacao" (
	"id" serial NOT NULL UNIQUE,
	"status" varchar(100) NOT NULL,
	CONSTRAINT "ListaStatusDoacao_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.TipoAnimal" (
	"id" serial NOT NULL UNIQUE,
	"tipo_animal" varchar(50) NOT NULL,
	"raca_animal" varchar(50) NOT NULL,
	CONSTRAINT "TipoAnimal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.CorPeloAnimal" (
	"id" serial(50) NOT NULL UNIQUE,
	"cor_pelo" varchar(50) NOT NULL,
	CONSTRAINT "CorPeloAnimal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.PorteAnimal" (
	"id" serial(50) NOT NULL UNIQUE,
	"porte" varchar(50) NOT NULL,
	CONSTRAINT "PorteAnimal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.CustoPorResgatePorAnimal" (
	"id" serial NOT NULL UNIQUE,
	"id_cadastro_animal" integer NOT NULL,
	"custo" DECIMAL NOT NULL,
	"status_check_list" BOOLEAN NOT NULL,
	CONSTRAINT "CustoPorResgatePorAnimal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.LarTemporarioListaContato" (
	"id" serial NOT NULL UNIQUE,
	"nome_lar_temporario" varchar(200) NOT NULL,
	"id_responsavel_lar_temporario" integer NOT NULL,
	"id_status_contato" integer NOT NULL,
	"previa_comentario" varchar(4000),
	"data_cadastro" DATE NOT NULL,
	"ativo" BOOLEAN NOT NULL,
	"data_arquivamento" DATE NOT NULL,
	"foto" bytea,
	CONSTRAINT "LarTemporarioListaContato_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.DespesaFixa" (
	"id" serial NOT NULL UNIQUE,
	"tipo_despesa" varchar(100) NOT NULL,
	"valor_despesa" DECIMAL NOT NULL,
	"id_porte_animal" integer NOT NULL,
	CONSTRAINT "DespesaFixa_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ControleLarTemporarioPorAnimal" (
	"id" serial NOT NULL UNIQUE,
	"id_cadastro_animal" integer NOT NULL,
	"id_responsavel_ong" integer NOT NULL,
	"id_responsavel_lar_temporario" integer NOT NULL,
	"status_lar_temporario" integer NOT NULL,
	"data_registro" DATE NOT NULL,
	"id_despesa_fixa" integer NOT NULL,
	"data_vencimento" DATE NOT NULL,
	"ativo" BOOLEAN NOT NULL,
	CONSTRAINT "ControleLarTemporarioPorAnimal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.TipoUsuario" (
	"id" serial NOT NULL UNIQUE,
	"tipo" varchar(100) NOT NULL,
	CONSTRAINT "TipoUsuario_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Adontante" (
	"id" serial NOT NULL UNIQUE,
	"id_usuario_adotante" integer NOT NULL,
	"registro_adoçao" integer NOT NULL,
	CONSTRAINT "Adontante_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.RegistroAdocao" (
	"id" serial NOT NULL UNIQUE,
	"id_cadastro_animal" integer NOT NULL,
	"data_adocao" DATE NOT NULL,
	"id_adotante" integer NOT NULL,
	"motivo_adocao" varchar(255) NOT NULL,
	"termo" varchar(255),
	"foto_link" bytea,
	"dilvulgacao_grupo_apoiadores" BOOLEAN NOT NULL,
	"tipo_meio_adocao" varchar(255) NOT NULL,
	"adocao_concluida" integer NOT NULL,
	"data_cadastro" DATE NOT NULL,
	CONSTRAINT "RegistroAdocao_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Status" (
	"id" serial NOT NULL UNIQUE,
	"status_contato" varchar(100) NOT NULL,
	CONSTRAINT "Status_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.TaxiListaContato" (
	"id" serial NOT NULL UNIQUE,
	"id_funcionario_ong" integer NOT NULL,
	"id_usuario_responsavel_taxi" integer NOT NULL,
	"valor" DECIMAL NOT NULL,
	"id_status_contato" integer NOT NULL,
	"previa_comentario" varchar(4000),
	CONSTRAINT "TaxiListaContato_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.FuncionarioOng" (
	"id" serial NOT NULL UNIQUE,
	"email" varchar(100) NOT NULL,
	"login" varchar(100) NOT NULL,
	"senha" varchar(100) NOT NULL,
	"id_usuario" integer NOT NULL,
	CONSTRAINT "FuncionarioOng_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.CustoPorResgate" (
	"id" serial NOT NULL UNIQUE,
	"acao" varchar(100) NOT NULL,
	"custo_macho" DECIMAL NOT NULL,
	"custo_femea" DECIMAL NOT NULL,
	"data_cadastro" TIMESTAMP NOT NULL,
	"ativo" BOOLEAN NOT NULL,
	CONSTRAINT "CustoPorResgate_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.CausaFalecimento" (
	"id" serial NOT NULL UNIQUE,
	"causa_falecimento" varchar(100) NOT NULL,
	CONSTRAINT "CausaFalecimento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "CadastroAnimal" ADD CONSTRAINT "CadastroAnimal_fk0" FOREIGN KEY ("id_tipo_animal") REFERENCES "TipoAnimal"("id");
ALTER TABLE "CadastroAnimal" ADD CONSTRAINT "CadastroAnimal_fk1" FOREIGN KEY ("id_cor_pelo") REFERENCES "CorPeloAnimal"("id");
ALTER TABLE "CadastroAnimal" ADD CONSTRAINT "CadastroAnimal_fk2" FOREIGN KEY ("id_porte_animal") REFERENCES "PorteAnimal"("id");
ALTER TABLE "CadastroAnimal" ADD CONSTRAINT "CadastroAnimal_fk3" FOREIGN KEY ("id_procedimento_padrao") REFERENCES "CustoPorResgate"("id");
ALTER TABLE "CadastroAnimal" ADD CONSTRAINT "CadastroAnimal_fk4" FOREIGN KEY ("id_causa_falecimento") REFERENCES "CausaFalecimento"("id");

ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_fk0" FOREIGN KEY ("id_tipo_usuario") REFERENCES "TipoUsuario"("id");

ALTER TABLE "PadrinhoDoador" ADD CONSTRAINT "PadrinhoDoador_fk0" FOREIGN KEY ("id_usuario_padrinho_doador") REFERENCES "Usuario"("id");
ALTER TABLE "PadrinhoDoador" ADD CONSTRAINT "PadrinhoDoador_fk1" FOREIGN KEY ("id_cadastro_animal") REFERENCES "CadastroAnimal"("id");
ALTER TABLE "PadrinhoDoador" ADD CONSTRAINT "PadrinhoDoador_fk2" FOREIGN KEY ("id_grupo_status") REFERENCES "Status"("id");

ALTER TABLE "ControleDoacao" ADD CONSTRAINT "ControleDoacao_fk0" FOREIGN KEY ("id_padrinho_doador") REFERENCES "PadrinhoDoador"("id");
ALTER TABLE "ControleDoacao" ADD CONSTRAINT "ControleDoacao_fk1" FOREIGN KEY ("id_categoria") REFERENCES "Categoria"("id");
ALTER TABLE "ControleDoacao" ADD CONSTRAINT "ControleDoacao_fk2" FOREIGN KEY ("id_lista_banco") REFERENCES "ListaBanco"("id");
ALTER TABLE "ControleDoacao" ADD CONSTRAINT "ControleDoacao_fk3" FOREIGN KEY ("id_lista_status_doacao") REFERENCES "ListaStatusDoacao"("id");







ALTER TABLE "CustoPorResgatePorAnimal" ADD CONSTRAINT "CustoPorResgatePorAnimal_fk0" FOREIGN KEY ("id_cadastro_animal") REFERENCES "CadastroAnimal"("id");

ALTER TABLE "LarTemporarioListaContato" ADD CONSTRAINT "LarTemporarioListaContato_fk0" FOREIGN KEY ("id_responsavel_lar_temporario") REFERENCES "Usuario"("id");
ALTER TABLE "LarTemporarioListaContato" ADD CONSTRAINT "LarTemporarioListaContato_fk1" FOREIGN KEY ("id_status_contato") REFERENCES "Status"("id");

ALTER TABLE "DespesaFixa" ADD CONSTRAINT "DespesaFixa_fk0" FOREIGN KEY ("id_porte_animal") REFERENCES "PorteAnimal"("id");

ALTER TABLE "ControleLarTemporarioPorAnimal" ADD CONSTRAINT "ControleLarTemporarioPorAnimal_fk0" FOREIGN KEY ("id_cadastro_animal") REFERENCES "CadastroAnimal"("id");
ALTER TABLE "ControleLarTemporarioPorAnimal" ADD CONSTRAINT "ControleLarTemporarioPorAnimal_fk1" FOREIGN KEY ("id_responsavel_ong") REFERENCES "Usuario"("id");
ALTER TABLE "ControleLarTemporarioPorAnimal" ADD CONSTRAINT "ControleLarTemporarioPorAnimal_fk2" FOREIGN KEY ("id_responsavel_lar_temporario") REFERENCES "LarTemporarioListaContato"("id");
ALTER TABLE "ControleLarTemporarioPorAnimal" ADD CONSTRAINT "ControleLarTemporarioPorAnimal_fk3" FOREIGN KEY ("status_lar_temporario") REFERENCES "Status"("id");
ALTER TABLE "ControleLarTemporarioPorAnimal" ADD CONSTRAINT "ControleLarTemporarioPorAnimal_fk4" FOREIGN KEY ("id_despesa_fixa") REFERENCES "DespesaFixa"("id");


ALTER TABLE "Adontante" ADD CONSTRAINT "Adontante_fk0" FOREIGN KEY ("id_usuario_adotante") REFERENCES "Usuario"("id");

ALTER TABLE "RegistroAdocao" ADD CONSTRAINT "RegistroAdocao_fk0" FOREIGN KEY ("id_cadastro_animal") REFERENCES "CadastroAnimal"("id");
ALTER TABLE "RegistroAdocao" ADD CONSTRAINT "RegistroAdocao_fk1" FOREIGN KEY ("id_adotante") REFERENCES "Adontante"("id");


ALTER TABLE "TaxiListaContato" ADD CONSTRAINT "TaxiListaContato_fk0" FOREIGN KEY ("id_funcionario_ong") REFERENCES "FuncionarioOng"("id");
ALTER TABLE "TaxiListaContato" ADD CONSTRAINT "TaxiListaContato_fk1" FOREIGN KEY ("id_usuario_responsavel_taxi") REFERENCES "Usuario"("id");
ALTER TABLE "TaxiListaContato" ADD CONSTRAINT "TaxiListaContato_fk2" FOREIGN KEY ("id_status_contato") REFERENCES "Status"("id");

ALTER TABLE "FuncionarioOng" ADD CONSTRAINT "FuncionarioOng_fk0" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id");

























