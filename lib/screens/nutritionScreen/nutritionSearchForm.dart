import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dreambody/config.dart';

class NutritionSearchForm extends StatefulWidget {
  NutritionSearchForm({Key key, this.token});
  final String token;

  @override
  NutritionSearchFormState createState() => NutritionSearchFormState();
}

class NutritionSearchFormState extends State<NutritionSearchForm> {
  final _formKey = GlobalKey<NutritionSearchFormState>();
  TextEditingController foodNameController = TextEditingController();
  String _result = "";

  void handleSubmit() async {
    final keyword = foodNameController.text;
    final response = await http.get('$serverBaseUrl/foodInfo?name=$keyword',
        headers: {'Authorization': 'Bearer ${widget.token}'});

    setState(() {
      _result = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: foodNameController,
            decoration: InputDecoration(labelText: '음식 이름을 적어주세요'),
            validator: (value) {
              return value.isEmpty ? 'Enter some text' : null;
            },
          ),
          RaisedButton(
            onPressed: handleSubmit,
            child: Text('영양소 검색'),
          ),
          Text(_result)
        ],
      ),
    );
  }
}
