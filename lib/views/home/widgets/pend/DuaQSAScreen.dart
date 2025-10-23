import 'package:deen_quran/views/home/widgets/pend/buildPlaceHolder.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart' show AppColors;

class DuaQSAScreen extends StatelessWidget {
  const DuaQSAScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildPlaceholderScreen('Dua & QSA', '🤲', AppColors.green);
  }
}