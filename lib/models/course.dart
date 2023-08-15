import 'package:flutter/material.dart';

class Course {
  String name, description, lastChapter;
  IconData iconData;

  Course(this.name, this.iconData, this.description, this.lastChapter);

  static List<Course> categoryList() {
    List<Course> list = [];

    list.add(Course(
        'Chant',
        Icons.category_outlined,
        'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo aspernatur voluptate, voluptates esse, ipsam nihil dolor aliquam quia quaerat iure veniam animi nostrum! Nam vero iure, nemo exercitationem quis voluptates.',
        'Respiration & Cordes vocales'));
    list.add(Course(
        'Danse',
        Icons.calendar_today_outlined,
        'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo aspernatur voluptate, voluptates esse, ipsam nihil dolor aliquam quia quaerat.',
        'Théorie de MJ'));
    list.add(Course(
        'Dessin',
        Icons.school_outlined,
        'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo aspernatur voluptate, voluptates esse, ipsam nihil dolor aliquam quia quaerat iure veniam animi nostrum! Nam vero iure, nemo exercitationem quis voluptates.',
        'Les bases du dessin'));
    list.add(Course(
        'Cuisine',
        Icons.outdoor_grill_outlined,
        'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo aspernatur voluptate, voluptates esse, ipsam nihil dolor aliquam quia quaerat iure veniam animi nostrum! Nam vero iure, nemo exercitationem quis voluptates.',
        'Sauce Bolognaise'));
    list.add(Course(
        'Langue',
        Icons.calculate_outlined,
        'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo aspernatur voluptate, voluptates esse, ipsam nihil dolor aliquam quia quaerat iure veniam animi nostrum! Nam vero iure.',
        'Integration'));

    return list;
  }
}
