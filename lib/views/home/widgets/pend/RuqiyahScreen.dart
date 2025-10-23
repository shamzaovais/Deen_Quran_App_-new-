import 'package:deen_quran/views/home/widgets/pend/buildPlaceHolder.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart';

class RuqiyahScreen extends StatelessWidget {
  const RuqiyahScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildPlaceholderScreen('Ruqiyah', '🎵', AppColors.primaryBlue);
  }
}