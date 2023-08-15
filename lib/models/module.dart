import 'package:flutter/material.dart';

class Module {
  String name, chapter, time;
  IconData iconData;

  Module(this.name, this.chapter, this.time, this.iconData);

  static List<Module> moduleList() {
    List<Module> list = [];
    list.add(Module(
        'Chant', 'Chapitre 4', '27 mins', Icons.calendar_today_outlined));
    list.add(Module('Dessin', 'Chapitre 5', '30 mins', Icons.school_outlined));
    list.add(Module(
        'Art Plastique', 'Chapitre 1', '25 mins', Icons.category_outlined));
    list.add(Module(
        'Cuisine', 'Chapitre 3', '18 mins', Icons.outdoor_grill_outlined));
    list.add(Module('Art', 'Chapter 2', '10 mins', Icons.calculate_outlined));

    return list;
  }
}
