import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dreambody/config.dart';

class NutritionSearch extends StatefulWidget {
  NutritionSearch({Key key, this.token});
  final String token;

  @override
  _NutritionSearchState createState() => _NutritionSearchState();
}

class _NutritionSearchState extends State<NutritionSearch> {
  String _result = "";

  void _searchNutritions({keyword: String}) async {
    if (mounted) {
      final response = await http.get('$serverBaseUrl/foodInfo?name=$keyword',
          headers: {'Authorization': 'Bearer ${widget.token}'});
      print(response.body);
      setState(() {
        _result = response.body;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _searchNutritions(keyword: '후렌치파이');
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(_result));
  }
}
