import 'package:flutter/material.dart';
import 'package:dreambody/models/Food.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu(
      {@required this.notifyParent,
      this.selectedFoods = const [],
      this.open = false});

  final bool open;
  final List<Food> selectedFoods;
  final Function({int index}) notifyParent;

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<Widget> renderListTiles() {
    return List.generate(widget.selectedFoods.length, (int index) {
      final food = widget.selectedFoods[index];
      return Column(
        children: [
          ListTile(
              title: Text(
                '${food.name} (칼로리: ${food.calorie})',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                  '탄수화물: ${food.carbohydrate} / 단백질: ${food.protein} / 지방: ${food.fat}',
                  style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  if (widget.selectedFoods != null &&
                      widget.selectedFoods.isNotEmpty) {
                    widget.notifyParent(index: index);
                  }
                },
              )),
          Divider(
            color: Colors.white.withOpacity(0.5),
            height: 10,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: width,
        height: height - 100,
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.open
                    ? Icon(Icons.arrow_drop_down, color: Colors.white)
                    : Icon(Icons.arrow_drop_up, color: Colors.white),
                InkWell(
                  child: Text(
                    '수정',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
              height: height - 250,
              child: SingleChildScrollView(
                child: Column(
                  children: renderListTiles(),
                ),
              )),
        ]),
      ),
    );
  }
}
