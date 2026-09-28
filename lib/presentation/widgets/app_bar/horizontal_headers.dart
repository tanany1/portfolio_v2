import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_enums.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'custom_header_btn.dart';

class HorizontalHeaders extends StatelessWidget {
  const HorizontalHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is AppBarHeadersColorChangedByIndex ||
          current is AppBarHeadersIndexChanged,
      builder: (context, state) {
        final currentIndex = context.read<HomeBloc>().appBarHeaderIndex;
        return Row(
          children: List.generate(
            AppBarHeaders.values.length,
            (index) => CustomHeaderBtn(
              headerIndex: index,
              isActive: currentIndex == index,
            ),
          ),
        );
      },
    );
  }
}
