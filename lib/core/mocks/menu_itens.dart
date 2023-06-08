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
        'title': 'Sub Item 1',
        'icon': LineIcons.desktop,
        'route': '/subitem1',
        'alt': 'Sub Item 1',
        'selected': false,
      },
      {
        'title': 'Sub Item 2',
        'icon': LineIcons.desktop,
        'route': '/subitem2',
        'alt': 'Sub Item 2',
        'selected': false,
      },
      {
        'title': 'Sub Item 3',
        'icon': LineIcons.desktop,
        'route': '/subitem3',
        'alt': 'Sub Item 3',
        'selected': false,
      },
    ]
  },
  {
    'title': 'Sobre',
    'icon': LineIcons.tablet,
    'route': '/about',
    'alt': 'Sobre o projeto',
    'selected': false,
    'sub_itens': [
      {
        'title': 'Sub Item 1',
        'icon': LineIcons.tablet,
        'route': '/subitem1',
        'alt': 'Sub Item 1',
        'selected': false,
      },
      {
        'title': 'Sub Item 2',
        'icon': LineIcons.tablet,
        'route': '/subitem2',
        'alt': 'Sub Item 2',
        'selected': false,
      },
      {
        'title': 'Sub Item 3',
        'icon': LineIcons.tablet,
        'route': '/subitem3',
        'alt': 'Sub Item 3',
        'selected': false,
      },
      {
        'title': 'Sub Item 4',
        'icon': LineIcons.tablet,
        'route': '/subitem3',
        'alt': 'Sub Item 3',
        'selected': false,
      },
      {
        'title': 'Sub Item 5',
        'icon': LineIcons.tablet,
        'route': '/subitem3',
        'alt': 'Sub Item 3',
        'selected': false,
      },
    ]
  },
  {
    'title': 'Contato',
    'icon': LineIcons.accusoft,
    'route': '/contact',
    'alt': 'Contato',
    'selected': false,
    'sub_itens': []
  },
  {'title': 'Feed', 'icon': LineIcons.comment, 'route': '/feed', 'alt': 'Feed', 'selected': false, 'sub_itens': []},
];
