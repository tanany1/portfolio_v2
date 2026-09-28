import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'vertical_headers.dart';

class VerticalHeadersBuilder extends StatelessWidget {
  const VerticalHeadersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is AppBarHeadersAxisChanged,
      builder: (context, state) {
        return AnimatedCrossFade(
          sizeCurve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          crossFadeState: _getCrossFadeState(context),
          firstChild: Container(
            decoration: BoxDecoration(
              color: AppColors.cardBgElevated,
              border: const Border(
                bottom: BorderSide(
                  color: AppColors.cardBorder,
                  width: 1.5,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const VerticalHeaders(),
          ),
          secondChild: Container(),
          duration: const Duration(milliseconds: 200),
        );
      },
    );
  }

  CrossFadeState _getCrossFadeState(BuildContext context) {
    final currentHeaderAxis = context.read<HomeBloc>().appBarHeaderAxis;
    return currentHeaderAxis == AppBarHeadersAxis.horizontal
        ? CrossFadeState.showSecond
        : CrossFadeState.showFirst;
  }
}

