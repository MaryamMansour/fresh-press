import 'package:flutter/material.dart';

import '../../models/Sources.dart';

class SourceItem extends StatelessWidget {
Sources src;
bool selected;
SourceItem(this.src,this.selected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
      decoration: BoxDecoration(
        color:selected?Color(0xFF2E8B57):Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Color(0xFF2E8B57),width: 2)
      ),
      child: (Text(src.name??"",style: TextStyle(
        color: selected?Colors.white:Color(0xFF2E8B57)
      ),)),
    );
  }
}
