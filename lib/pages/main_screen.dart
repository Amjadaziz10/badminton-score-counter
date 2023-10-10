import 'package:badminton_score_counter/bloc/left_counter_bloc/left_counter_bloc.dart';
import 'package:badminton_score_counter/bloc/right_counter_bloc/right_counter_bloc.dart';
import 'package:badminton_score_counter/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../shared/model_theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LeftCounterBloc()..add(LoadLeftCounter())),
          BlocProvider(
              create: (context) => RightCounterBloc()..add(LoadRightCounter())),
        ],
        child: Consumer<ModelTheme>(
            builder: (context, ModelTheme themeNotifier, child) {
          return Scaffold(
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<LeftCounterBloc, LeftCounterState>(
                      builder: (context, state) {
                    if (state is LeftCounterLoaded) {
                      return Expanded(
                        child: InkWell(
                          onTap: () => context
                              .read<LeftCounterBloc>()
                              .add(const IncrementLeftCounter(1)),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: themeNotifier.isDark ? black : red,
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    '${state.leftCounts}',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: themeNotifier.isDark
                                                ? yellow
                                                : white,
                                            fontSize: 200,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.00, 1.00),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 8, 8, 8),
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<LeftCounterBloc>()
                                                  .add(
                                                      const DecrementLeftCounter(
                                                          1));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    themeNotifier.isDark
                                                        ? Colors.black
                                                        : black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    40)))),
                                            child: FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: themeNotifier.isDark
                                                  ? yellow
                                                  : white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(4, 8, 8, 8),
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<LeftCounterBloc>()
                                                  .add(ResetLeftCounter());
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    themeNotifier.isDark
                                                        ? Colors.black
                                                        : black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    40)))),
                                            child: FaIcon(
                                              FontAwesomeIcons.rotateLeft,
                                              color: themeNotifier.isDark
                                                  ? yellow
                                                  : white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(1.00, -1.00),
                                  child: InkWell(
                                    onTap: () => context
                                        .read<LeftCounterBloc>()
                                        .add(ChangeLeftRoundCounter()),
                                    child: Container(
                                      width: 50,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Align(
                                        alignment: const AlignmentDirectional(
                                            0.00, 0.00),
                                        child: Text(
                                          '${state.leftRoundCounts}',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? yellow
                                                      : white,
                                                  fontSize: 42)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Text("error");
                    }
                  }),
                  BlocBuilder<RightCounterBloc, RightCounterState>(
                      builder: (context, state) {
                    if (state is RightCounterLoaded) {
                      return Expanded(
                        child: InkWell(
                          onTap: () => context
                              .read<RightCounterBloc>()
                              .add(const IncrementRightCounter(1)),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: themeNotifier.isDark ? black : blue,
                              shape: BoxShape.rectangle,
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.00, 0.00),
                                  child: Text("${state.rightCounts}",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: themeNotifier.isDark
                                                  ? yellow
                                                  : white,
                                              fontSize: 200,
                                              fontWeight: FontWeight.bold))),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(1.00, 1.00),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 8, 8, 8),
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () => context
                                                .read<RightCounterBloc>()
                                                .add(ResetRightCounter()),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    themeNotifier.isDark
                                                        ? Colors.black
                                                        : black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    40)))),
                                            child: FaIcon(
                                              FontAwesomeIcons.rotateLeft,
                                              color: themeNotifier.isDark
                                                  ? yellow
                                                  : white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(4, 8, 8, 8),
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () => context
                                                .read<RightCounterBloc>()
                                                .add(
                                                    const DecrementRightCounter(
                                                        1)),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    themeNotifier.isDark
                                                        ? Colors.black
                                                        : black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    40)))),
                                            child: FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: themeNotifier.isDark
                                                  ? yellow
                                                  : white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.00, -1.00),
                                  child: InkWell(
                                    onTap: () => context
                                        .read<RightCounterBloc>()
                                        .add(ChangeRightRoundCounter()),
                                    child: Container(
                                      width: 50,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: const AlignmentDirectional(
                                            0.00, 0.00),
                                        child: Text(
                                          '${state.rightRoundCounts}',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? yellow
                                                      : white,
                                                  fontSize: 42)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1, -1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.gear,
                                        color: themeNotifier.isDark
                                            ? yellow
                                            : white,
                                      ),
                                      iconSize: 40,
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/theme');
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Text("error");
                    }
                  })
                ],
              ),
            ),
          );
        }));
  }
}
