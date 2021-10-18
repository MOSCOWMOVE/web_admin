// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moscow_move_mobile/components/DropDownLists/BaseFilterDropDownList.dart';
import 'package:moscow_move_mobile/components/DropDownLists/SportTypesList.dart';
import 'package:moscow_move_mobile/components/Text.dart';
import 'package:moscow_move_mobile/components/DropDownLists/DropDownList.dart';
import 'package:moscow_move_mobile/components/sidbebar/BaseSidebar.dart';

class RightSidebar extends StatelessWidget {
  RightSidebar({ Key key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BaseSidebar(
      children: [
        SvgPicture.asset("assets/logo.svg"),
        Container(
          child: Mytext(
            text: "Главная",
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
          margin: const EdgeInsets.only(top: 35)
        ),
        SizedBox(
          height: height - 175 - 10,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      child: BaseFilterDropDownList(
                        checkboxes: ["Футбол", "Футбол", "Футбол"],
                        name: "Виды спорта"
                      ),
                      margin: const EdgeInsets.only(
                        top: 30
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30
                      ),
                      child: BaseFilterDropDownList(
                        checkboxes: ["Центральный", "Центральный", "Центральный"],
                        name: "Районы"
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30
                      ),
                      child: BaseFilterDropDownList(
                        checkboxes: ["Федерация спорта", "Федерация спорта", "Федерация спорта"],
                        name: "Ведомства"
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30
                      ),
                      child: BaseFilterDropDownList(
                        checkboxes: ["Открытая", "Закрытая", "Бассейн"],
                        name: "Тип зоны"
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30
                      ),
                      child: BaseFilterDropDownList(
                        checkboxes: ["500", "1000", "3000", "5000"],
                        name: "Доступность"
                      )
                    ),
                  ]
                ),
              )
              
            ],
          )
        ),

      ],
      isRight: true,
    );
  }
}