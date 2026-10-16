CREATE table Regiao (
	
    codRegiao bigint,
    nomeRegiao varchar(100),
    descricaoRegiao text,
    primary key(codRegiao)
    
);

create table Vinicola (
	
    codVinicola bigint,
    codRegiao bigint,
    nomeVinicola varchar(100),
    descricaoVinicola TEXT,
    foneVinicola varchar(15),
    emailVinicola varchar(15),
    primary key(codVinicola),
    foreign key(codRegiao) references Regiao(codRegiao)
    
);

create table Vinho (
	
	codVinho bigint,
    codVinicola  bigint,
	nomeVinho varchar(50),
    tipoVinho varchar(30),
    anoVinho INT,
    descricaoVinho TEXT,
    primary key(codVinho),
    foreign key(codVinicola) references Vinicola(codVinicola)
    
);


 insert into Regiao (codRegiao, nomeRegiao, descricaoRegiao) values
 (1, 'Vale dos Vinhedos', 'Região vinícola no Rio Grande do Sul, referência em vinhos brasileiros de altitude e clima temperado'),
(2, 'Bordeaux', 'Região francesa às margens do rio Garonne, uma das mais tradicionais do mundo em produção de tintos encorpados'),
(3, 'Toscana', 'Região central da Itália, famosa pelo Chianti e por vinhedos em colinas históricas'),
(4, 'Mendoza', 'Região argentina aos pés dos Andes, principal produtora de Malbec do país'),
(5, 'Vale de Napa', 'Região californiana nos Estados Unidos, conhecida por vinhos premium e clima mediterrâneo');

insert into Vinicola (codVinicola, codRegiao, nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola) values
(1, 1, 'Miolo Wine Group', 'Uma das maiores vinícolas brasileiras, pioneira em vinhos finos no Vale dos Vinhedos', '(54) 3459-9000', 'miolo@vinho.com'),
(2, 2, 'Château Margaux', 'Vinícola histórica de Bordeaux, produtora de um dos vinhos mais renomados da França', '+33557888383', 'margaux@vin.fr'),
(3, 3, 'Antinori', 'Família italiana com séculos de tradição na produção de vinhos toscanos', '+39 055 23595', 'antinori@it.com'),
(4, 4, 'Catena Zapata', 'Vinícola argentina referência mundial em Malbec de altitude em Mendoza', '+542614131100', 'catena@arg.com'),
(5, 5, 'Robert Mondavi Winery', 'Vinícola pioneira no Vale de Napa, símbolo da moderna vinicultura americana', '+1 707-226-1395', 'mondavi@usa.com');

insert into Vinho (codVinho, codVinicola, nomeVinho, tipoVinho, anoVinho, descricaoVinho) values
(1, 1, 'Miolo Cuvée Tradition', 'Espumante', 2021, 'Espumante brasileiro elaborado pelo método tradicional, com notas de frutas brancas'),
(2, 2, 'Château Margaux Grand Vin', 'Tinto', 2018, 'Tinto encorpado, considerado um dos grandes vinhos de Bordeaux, com taninos elegantes'),
(3, 3, 'Antinori Tignanello', 'Tinto', 2019, 'Tinto italiano ícone da Toscana, mistura de Sangiovese com uvas internacionais'),
(4, 4, 'Catena Zapata Malbec Argentino', 'Tinto', 2020, 'Malbec de altitude, com aromas de frutas negras e especiarias'),
(5, 5, 'Robert Mondavi Cabernet Sauvignon', 'Tinto', 2020, 'Cabernet Sauvignon californiano, encorpado e com toques de carvalho');

select nomeVinho, tipoVinho, anoVinho, descricaoVinho, nomeVinicola, nomeRegiao
from Vinho
join Vinicola on Vinho.codVinicola = Vinicola.codVinicola
join Regiao on Vinicola.codRegiao = Regiao.codRegiao; 	

CREATE USER 'sommelier'@'localhost' identified BY 'canguru123' with max_queries_per_hour 40;

grant select on sistemofiverson.Vinho to 'sommelier'@'localhost';
grant select (codVinicola, nomeVinicola) on sistemofiverson.Vinicola to 'sommelier'@'localhost';

