
import 'package:flutter/material.dart';
import 'package:svoyinsta/services/ThemeServise.dart';

AppBar appBar({required String title, Icon? icon, void Function()? onPressed}) {
  return AppBar(
    title: Text(title, style: ThemeService.appBarStyle,),
    centerTitle: true,
    actions: [
      if(icon != null) IconButton(onPressed: onPressed, icon: icon)
    ],
  );
}