<?php
//DADOS DA CONEXÃO E TIMEZONE:

date_default_timezone_set('America/Sao_Paulo');

$host= 'mysql02.hstbr.net';
$bd= 'mysql_quero_ajudar';
$senhabd= '';

$userbd = '';


// RECEBENDO OS DADOS PREENCHIDOS DO FORMULÁRIO !
$nome	= $_POST ["nome"];	//atribuição do campo "nome" vindo do formulário para variavel
$email	= $_POST ["email"];	//atribuição do campo "email" vindo do formulário para variavel
$ip = $_SERVER["REMOTE_ADDR"]; //pegar o ip
$tipo_lead = 'B2C'; //tipo de lead
$hora_inclusao = date('Y-m-d H:i'); //pegar a data e hora

//conectando com o servidor do banco de dados - mysql
$conexao = mysql_connect($host,$userbd, $senhabd);
if (!$conexao)
	die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());
//conectando com a tabela do banco de dados
$banco = mysql_select_db($bd,$conexao);
if (!$banco)
	die ("Erro de conexão com banco de dados, o seguinte erro ocorreu -> ".mysql_error());



$query = "INSERT INTO tabela_leads_capturados (nome, email, ipv4_lead, tipo_lead, hora_inclusao)
VALUES ('$nome', '$email', '$ip', '$tipo_lead', '$hora_inclusao')";

mysql_query($query,$conexao) OR die("Error:".mysql_error());

header("Location: http://www.vamosteajudar.com.br/aprenda-a-vender.html");
//redireciona para a página aprenda a vender
?>
