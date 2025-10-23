import 'package:deen_quran/views/home/widgets/pend/buildPlaceHolder.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart';

class MemorizeScreen extends StatelessWidget {
  const MemorizeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildPlaceholderScreen('Memorize', '💡', AppColors.orange);
  }
}