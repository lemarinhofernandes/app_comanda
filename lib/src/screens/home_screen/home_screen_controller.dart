import 'package:app_comanda/src/models/bar_model.dart';

class HomeScreenController {
  final List<BarModel> _listaMock = <BarModel>[
    BarModel('tcholas bar', 50.0),
    BarModel('bar do padim', 200.0),
    BarModel('A Toca', 125.0),
    BarModel('A Toca', 125.0),
    BarModel('A Toca', 125.0),
    BarModel('A Toca', 125.0),
  ];
  List<BarModel> get listaMock => _listaMock;
}
