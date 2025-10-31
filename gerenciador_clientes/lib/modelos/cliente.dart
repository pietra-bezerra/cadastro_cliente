//import nessário do materal app
import 'package:flutter/material.dart';

class Cliente  {
  final String nome;
  final String email; 
  final String senha;


//construtor do cliente
  Cliente({
    required this.nome,
    required this.email,
    required this.senha,
  });
  @override
  String toString() {
    return 'Cliente: $nome, Email: $email';
  }
}

class GerenciadorClientes{
  //variavel estatica que guarda a unica cópia desta claase
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();
  //construtor privado
  GerenciadorClientes._interno();
//sempre retorna a instancia existente
  factory GerenciadorClientes() => _instancia;
  //lista <ul> que amazena todos os clientes cadastrados
  final List<Cliente> _clientes = [];
//para acessar a lista de clientes (retorna uma cópia imutável)
  List<Cliente> get clientes => List.unmodifiable(_clientes);

//tentar cadastrar um novo cliente
  bool cadastrar(Cliente cliente){
//vamos checar se ja existe um email cadastrado
if(_clientes.any((c) => c.email.toLowerCase() == cliente.email.toLowerCase())){
print('Erro: email ${cliente.email} já cadastrado.');
return false; //falha no cadastro
}
_clientes.add(cliente);//adcionar o cliente
print('Cliente ${cliente.nome} cadastrado com sucesso.');
return true; //cadastrouuuuuuu
  }
  Cliente ? login(String email, String senha){
  return _clientes.firstWhere(
    //é uma função anônima
    // o c representa cada elemento (cada cliente) da lista _clientes
    (c) => c.email.toLowerCase() == email.toLowerCase() && c.senha == senha,
    orElse: () => Null as Cliente, //retorna nulo se não encontrar os dados
  );

}
}