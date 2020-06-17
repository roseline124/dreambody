import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';

class SelectForm extends StatefulWidget {
  SelectForm(
      {@required this.label, @required this.data, this.defaultItemIndex});

  final String label;
  final List<dynamic> data;
  final int defaultItemIndex;

  @override
  _SelectFormState createState() => _SelectFormState(
      label: label, data: data, defaultItemIndex: defaultItemIndex);
}

class _SelectFormState extends State<SelectForm> {
  _SelectFormState(
      {@required this.label, @required this.data, this.defaultItemIndex});

  final String label;
  final List<dynamic> data;
  final int defaultItemIndex;

  int selectedFoodVariants = 0;
  int selectedPortionCounts = 0;
  int selectedPortionSize = 0;

  DirectSelectItem<dynamic> getDropDownMenuItem(dynamic value) {
    return DirectSelectItem<dynamic>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value.toString());
        });
  }

  final GlobalKey<State> selectFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DirectSelectContainer(
      key: selectFormKey,
      child: Selector(data: data, label: label),
    );
  }
}

class Selector extends StatelessWidget {
  Selector(
      {@required this.data, @required this.label, this.defaultItemIndex = 0});

  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  final List<dynamic> data;
  final String label;
  final int defaultItemIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: AlignmentDirectional.centerStart,
            margin: EdgeInsets.only(left: 4),
            child: Text(label)),
        Padding(
          padding: buttonPadding,
          child: Container(
            decoration: _getShadowDecoration(),
            child: Card(
                child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: Padding(
                        child: DirectSelectList<dynamic>(
                          values: data,
                          defaultItemIndex: defaultItemIndex,
                          itemBuilder: (dynamic value) =>
                              getDropDownMenuItem(value),
                          focusedItemDecoration: _getDslDecoration(),
                        ),
                        padding: EdgeInsets.only(left: 12))),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: _getDropdownIcon(),
                )
              ],
            )),
          ),
        ),
      ],
    );
  }

  DirectSelectItem<dynamic> getDropDownMenuItem(dynamic value) {
    return DirectSelectItem<dynamic>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value.toString());
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.arrow_drop_down,
      color: Colors.black,
    );
  }
}
