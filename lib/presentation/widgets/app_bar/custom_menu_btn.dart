import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../blocs/home_bloc/home_bloc.dart';

class CustomMenuBtn extends StatelessWidget {
  const CustomMenuBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          width: 44,
          height: 44,
          child: AnimatedCrossFade(
            crossFadeState: _getCrossFadeState(context),
            firstChild: IconButton(
              icon: const Icon(Icons.menu_rounded, color: AppColors.primaryColor, size: 26),
              onPressed: () => _menuBtnClicked(context),
            ),
            secondChild: IconButton(
              icon: const Icon(Icons.close_rounded, color: AppColors.primaryColor, size: 26),
              onPressed: () => _closeBtnClicked(context),
            ),
            duration: const Duration(milliseconds: 200),
          ),
        );
      },
    );
  }

  void _menuBtnClicked(BuildContext context) {
    context.read<HomeBloc>().add(
          ChangeAppBarHeadersAxis(AppBarHeadersAxis.vertical),
        );
  }

  void _closeBtnClicked(BuildContext context) {
    context.read<HomeBloc>().add(
          ChangeAppBarHeadersAxis(AppBarHeadersAxis.horizontal),
        );
  }

  CrossFadeState _getCrossFadeState(BuildContext context) {
    final currentHeaderAxis = context.read<HomeBloc>().appBarHeaderAxis;
    return currentHeaderAxis == AppBarHeadersAxis.horizontal
        ? CrossFadeState.showFirst
        : CrossFadeState.showSecond;
  }
}

