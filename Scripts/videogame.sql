create database videogames;
use videogames;

create table TiposLocal (
idTipoLocal int primary key auto_increment not null,
Descricao_TipoLocal varchar(30)
);

create table TipoPessoas (
idTipoPessoa int primary key auto_increment not null,
Descricao_TipoPessoa varchar(20)
);

create table Pessoas (
idPessoa int primary key auto_increment not null,
TipoPessoa_idTipoPessoa int,
Nome_Pessoa varchar(90),
RG_Pessoa varchar(11),
CPF_Pessoa varchar(16),
foreign key (TipoPessoa_idTipoPessoa) references TipoPessoas(idTipoPessoa)
);

create table Enderecos (
idEndereco int primary key auto_increment not null,
TipoLocal_idTipoLocal int,
Pessoa_idPessoa int,
Logradouro_Endereco varchar(75),
Numero_Endereco int,
Complemento_Endereco varchar(110),
Bairro_Endereco varchar(50),
CEP_Encereco varchar(10),
Cidade_Endereco varchar(40),
Estado_Encereco char(2),
foreign key (TipoLocal_idTipoLocal) references TiposLocal(idTipoLocal),
foreign key (Pessoa_idPessoa) references Pessoas(idPessoa)
);

create table Jogos (
idJogos int primary key auto_increment not null,
Nome_Jogo varchar(50),
Descricao_Jogo varchar(120),
Genero_Jogo varchar(20),
Produtora_Jogo varchar(40)
);

create table Clientes (
idCliente int primary key auto_increment not null,
Pessoa_idPessoa int not null,
Pai_Cliente varchar(80),
Mae_Cliente varchar(80),
Nick_Cliente varchar(12) not null,
Senha_Cliente varchar(8),
foreign key (Pessoa_idPessoa) references Pessoas(idPessoa)
);

create table VideoGames (
idVideoGame int primary key auto_increment not null,
Modelo_VideoGame varchar(35),
NS_VideoGame varchar(24)
);

create table Funcionarios (
idFuncionario int primary key auto_increment not null,
Pessoa_idPessoa int,
Sexo char(1),
Idade int,
foreign key(Pessoa_idPessoa) references Pessoas(idPessoa)
);

create table Alugueis (
idAluguel int primary key auto_increment not null,
Funcionario_idFuncionario int,
VideoGame_idVideoGame int,
Cliente_idCliente int,
Jogos_idJogos int,
Valor_Aluguel real,
Data_Aluguel date,
foreign key(Funcionario_idFuncionario) references Funcionarios(IdFuncionario),
foreign key(VideoGame_idVideoGame) references VideoGames(idVideoGame) ,
foreign key(Cliente_idCliente) references Clientes(idCliente),
foreign key(Jogos_idJogos) references Jogos(idJogos)
);

create table Contatos (
idContato int primary key auto_increment not null,
TipoLocal_idTipoLocal int,
Pessoa_idPessoa int,
Telefone_Contato varchar(13),
Mail_Contato varchar(30),
foreign key (TipoLocal_idTipoLocal) references TiposLocal(idTipoLocal),
foreign key (Pessoa_idPessoa) references Pessoas(idPessoa)
);