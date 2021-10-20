import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double searchRowHeight = 35.0;

class SearchRow extends StatefulWidget {
  const SearchRow(
      {required this.controller,
      required this.onChanged,
      this.hintText,
      Key? key})
      : super(key: key);

  final String? hintText;
  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  _SearchRowState createState() => _SearchRowState();
}

class _SearchRowState extends State<SearchRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12, left: 3),
      width: MediaQuery.of(context).size.width * 0.5,
      height: searchRowHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Color(0xff5A5CD8),
          )),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.controller.text.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: GestureDetector(
                    child: Icon(
                      Icons.close,
                      color: Color(0xff5A5CD8),
                    ),
                    onTap: () {
                      setState(() {
                        widget.controller.clear();
                        widget.onChanged('');
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                    },
                  ),
                )
              : null,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: Color(0xff5A5CD8),
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
