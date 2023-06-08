import 'package:flutter/material.dart';

class MockContactTable extends StatelessWidget {
  const MockContactTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 16.0,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Nome',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Telefone',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'WhatsApp',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Data de Nascimento',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('John Doe')),
              DataCell(Text('johndoe@example.com')),
              DataCell(Text('(123) 456-7890')),
              DataCell(Text('(123) 456-7890')),
              DataCell(Text('01/01/1990')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Jane Smith')),
              DataCell(Text('janesmith@example.com')),
              DataCell(Text('(987) 654-3210')),
              DataCell(Text('(987) 654-3210')),
              DataCell(Text('02/02/1995')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Bob Johnson')),
              DataCell(Text('bobjohnson@example.com')),
              DataCell(Text('(555) 123-4567')),
              DataCell(Text('(555) 123-4567')),
              DataCell(Text('03/03/1985')),
            ],
          ),
        ],
      ),
    );
  }
}
