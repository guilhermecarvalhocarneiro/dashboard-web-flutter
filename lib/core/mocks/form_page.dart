import 'package:flutter/material.dart';

class MockFormPage extends StatefulWidget {
  const MockFormPage({super.key});

  @override
  State<MockFormPage> createState() => _MockFormPageState();
}

class _MockFormPageState extends State<MockFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _dobController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _dobController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Realizar ações com os dados do formulário
      // por exemplo, salvar os dados em um banco de dados

      // Limpar os campos do formulário após a submissão
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _whatsappController.clear();
      _dobController.clear();
      _descriptionController.clear();

      // Exibir um SnackBar para confirmar o envio dos dados
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulário enviado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira um nome válido.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira um email válido.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Telefone'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira um telefone válido.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _whatsappController,
            decoration: const InputDecoration(labelText: 'WhatsApp'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira um número válido de WhatsApp.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _dobController,
            decoration: const InputDecoration(labelText: 'Data de Nascimento'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira uma data de nascimento válida.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Descrição'),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira uma descrição válida.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
