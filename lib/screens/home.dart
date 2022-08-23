import 'package:flutter/material.dart';

import 'package:pizzeria_flutter/screens/order-params.dart';
import 'package:pizzeria_flutter/theme/app_theme.dart';
import 'package:pizzeria_flutter/screens/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  final Map<String, String> formValues = {
    'name': '',
    'last_name': '',
    'email': '',
    'size': '',
    'ingredients': '',
    'count': '',
  };

  final OrderParams orderParams = OrderParams();
  String valueSizesSelected = '';
  String valueIngredientSelected = '';

  @override
  void initState() {
    super.initState();
    valueSizesSelected = '1';
    valueIngredientSelected = '1';
    formValues['ingredients'] = valueSizesSelected;
    formValues['size'] = valueIngredientSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(user: '--'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Bienvenido a Surfer Boy Pizza',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Por favor diligencia la siguiente informacion para la toma de su pedido',
                  style: TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 15,
                  ),
                ),
              ),
              Form(
                key: myFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      CustomInputField(
                        labelText: 'Nombre *',
                        hintText: 'Ingresa tu nombre',
                        formProperty: 'name',
                        formValues: formValues,
                        prefixIcon: Icons.account_circle_outlined,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputField(
                        labelText: 'Apellido *',
                        hintText: 'Ingresa tu Apellido',
                        formProperty: 'last_name',
                        formValues: formValues,
                        prefixIcon: Icons.account_circle_outlined,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputField(
                        labelText: 'Email *',
                        hintText: 'Ingresa tu email',
                        formProperty: 'email',
                        formValues: formValues,
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validationEmail: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputField(
                        labelText: 'Cantidad *',
                        hintText: 'Ingresa Cantidad de pizzas',
                        formProperty: 'count',
                        formValues: formValues,
                        prefixIcon: Icons.format_list_numbered_rounded,
                        keyboardType: TextInputType.number,
                        // validationNumber: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButton(
                        icon: const Icon(Icons.local_pizza_outlined),
                        hint: const Text('Selecciona el tamańo de tu pizza'),
                        isExpanded: true,
                        value: valueSizesSelected,
                        items: orderParams.sizes.map((item) {
                          return DropdownMenuItem(
                            value: item['value'],
                            child: Text(item['label']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            valueSizesSelected = value.toString();
                            formValues['size'] = value.toString();
                            print(value);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButton(
                        icon: const Icon(Icons.local_pizza_outlined),
                        hint: const Text('Selecciona los ingredientes'),
                        isExpanded: true,
                        value: valueIngredientSelected,
                        items: orderParams.ingredient.map((item) {
                          return DropdownMenuItem(
                            value: item['value'],
                            child: Text(item['label']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            valueIngredientSelected = value.toString();
                            formValues['ingredients'] = value.toString();
                            print(value);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                width: 0,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formValues['name'].toString() != '' &&
                                  formValues['last_name'].toString() != '' &&
                                  formValues['email'].toString() != '' &&
                                  formValues['ingredients'].toString() != '' &&
                                  formValues['size'].toString() != '' &&
                                  formValues['count'].toString() != '') {
                                Navigator.pushNamed(
                                  context,
                                  'order',
                                  arguments: OrderParams(
                                    name: formValues['name'].toString(),
                                    lastName:
                                        formValues['last_name'].toString(),
                                    email: formValues['email'].toString(),
                                    ingredients:
                                        formValues['ingredients'].toString(),
                                    size: formValues['size'].toString(),
                                    count: formValues['count'].toString(),
                                  ),
                                );
                              }
                              print(formValues);
                            },
                            label: const Text(
                              'Continuar',
                              style: TextStyle(
                                fontSize: 30,
                                color: AppTheme.primary,
                              ),
                            ),
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
