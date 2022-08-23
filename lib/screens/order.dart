import 'package:flutter/material.dart';

import 'package:pizzeria_flutter/screens/order-params.dart';
import 'package:pizzeria_flutter/theme/app_theme.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _ingredients = TextEditingController();
  final TextEditingController _count = TextEditingController();
  final TextEditingController _size = TextEditingController();
  int _total = 0;

  final OrderParams orderParams = OrderParams();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var parametros = ModalRoute.of(context)?.settings.arguments as OrderParams;
    _name.text = parametros.name!;
    _lastName.text = parametros.lastName!;
    _email.text = parametros.email!;
    _ingredients.text = parametros.ingredients!;
    _count.text = parametros.count!;
    _size.text = parametros.size!;
  }

  @override
  Widget build(BuildContext context) {
    if (_count.text != '' && _size.text != '') {
      _total =
          orderParams.calculateOrder(countT: _count.text, sizeT: _size.text);
    } else {
      _total = 0;
    }
    var sizeName = orderParams.getNameSize(size: _size.text);
    var ingredientName =
        orderParams.getingredientName(ingredient: _ingredients.text);
    print(_total);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: AppTheme.bgSecondary,
              margin: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: AppTheme.secondary,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'Detalle de orden',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nombre: ${_name.text}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Text(
                      'Apellidos: ${_lastName.text}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Text(
                      'Email: ${_email.text}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Text(
                      'Tamaño: $sizeName',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Text(
                      'Ingrediente: $ingredientName',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Text(
                      'Cantidad: ${_count.text}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.secondary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Total: $_total',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppTheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _name.text);
              },
              child: const Text('Guadar'),
            ),
          ],
        ),
      ),
    );
  }
}
