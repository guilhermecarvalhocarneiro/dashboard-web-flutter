// Map que será utilizado para renderizar os itens do menu
import 'package:line_icons/line_icons.dart';

final List<Map<String, dynamic>> menuItens = [
  {
    'title': 'Home',
    'icon': LineIcons.desktop,
    'route': '/',
    'alt': 'Página inicial',
    'selected': true,
    'sub_itens': [
      {
        'title': 'Meus dados',
        'icon': LineIcons.deviantart,
        'route': '/meus_dados',
        'alt': 'Meus dados',
        'selected': false,
      },
      {
        'title': 'Minhas contas',
        'icon': LineIcons.diceTwo,
        'route': '/minhas_contas',
        'alt': 'Minhas contas',
        'selected': false,
      },
      {
        'title': 'Meus pontos',
        'icon': LineIcons.alternateCalendar,
        'route': '/subitem3',
        'alt': 'Sub Item 3',
        'selected': false,
      },
    ]
  },
  {
    'title': 'Financeiro',
    'icon': LineIcons.dollarSign,
    'route': '/about',
    'alt': 'Sobre o projeto',
    'selected': false,
    'sub_itens': [
      {
        'title': 'Contas a pagar',
        'icon': LineIcons.paypal,
        'route': '/subitem1',
        'alt': 'Contas a pagar',
        'selected': false,
      },
      {
        'title': 'Contas a receber',
        'icon': LineIcons.creditCard,
        'route': '/subitem2',
        'alt': 'Contas a receber',
        'selected': false,
      },
      {
        'title': 'Lançamentos Futuros',
        'icon': LineIcons.moneyCheck,
        'route': '/subitem3',
        'alt': 'Lançamentos Futuros',
        'selected': false,
      },
      {
        'title': 'Faturas',
        'icon': LineIcons.spellCheck,
        'route': '/subitem3',
        'alt': 'Sub Item 3',
        'selected': false,
      },
      {
        'title': 'Recebíveis',
        'icon': LineIcons.moneyBill,
        'route': '/subitem3',
        'alt': 'Recebíveis',
        'selected': false,
      },
    ]
  },
  {
    'title': 'Clientes',
    'icon': LineIcons.users,
    'route': '/contact',
    'alt': 'Clientes',
    'selected': false,
    'sub_itens': [
      {
        'title': 'Novos Clientes',
        'icon': LineIcons.userPlus,
        'route': '/subitem1',
        'alt': 'Novos Clientes',
        'selected': false,
      },
      {
        'title': 'Melhores Clientes',
        'icon': LineIcons.userCheck,
        'route': '/subitem2',
        'alt': 'Melhores Clientes',
        'selected': false,
      },
      {
        'title': 'Aniversariantes',
        'icon': LineIcons.birthdayCake,
        'route': '/subitem2',
        'alt': 'Aniversariantes',
        'selected': false,
      }
    ]
  },
];
