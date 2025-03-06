

import 'package:flutter/material.dart';
import 'package:toku2/components/item_info.dart';
import 'package:toku2/models/item_model.dart';

class PhraseesItems extends StatelessWidget {
  const PhraseesItems({super.key ,required this.item, required this.color});
final ItemModel item;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: ItemInfo(item: item),
    );
  }
}