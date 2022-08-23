class OrderParams {
  String? name;
  String? lastName;
  String? email;
  String? size;
  String? ingredients;
  String? count;

  final List<Map<String, dynamic>> sizes_ = [
    {
      'value': '1',
      'label': 'Grande',
      'price': 9000,
    },
    {
      'value': '2',
      'label': 'Mediana',
      'price': 4000,
    },
    {
      'value': '3',
      'label': 'Pequeña',
      'price': 2000,
    }
  ];

  final List<Map<String, dynamic>> ingredients_ = [
    {
      'value': '1',
      'label': 'Piña',
    },
    {
      'value': '2',
      'label': 'Jalapeños',
    },
    {
      'value': '3',
      'label': 'Queso',
    }
  ];

  // OrderParams();

  OrderParams({
    this.name,
    this.email,
    this.ingredients,
    this.lastName,
    this.size,
    this.count,
  });

  //Get sizes pizza
  List get sizes => sizes_;

  //Get ingredients pizza
  List get ingredient => ingredients_;

  calculateOrder({required sizeT, required countT}) {
    if (countT != '') {
      final price = sizes_.firstWhere((e) => e['value'] == sizeT);
      return int.parse(countT) * price['price'];
    }
  }

  getNameSize({required size}) {
    final name = sizes_.firstWhere((e) => e['value'] == size);
    return name['label'];
  }

  getingredientName({required ingredient}) {
    final name = ingredients_.firstWhere((e) => e['value'] == ingredient);
    return name['label'];
  }
}
