import 'package:flutter/material.dart';

class MySliverBar extends StatefulWidget {
  const MySliverBar({super.key});

  @override
  State<MySliverBar> createState() => _MySliverBarState();
}

class _MySliverBarState extends State<MySliverBar> {
  bool click = false;
  double top = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      backgroundColor: const Color.fromRGBO(247, 246, 242, 1),
      foregroundColor: const Color.fromRGBO(247, 246, 242, 1),
      expandedHeight: 160,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
              expandedTitleScale: 1.6,
              titlePadding: EdgeInsets.fromLTRB(
                  top == MediaQuery.of(context).padding.top + kToolbarHeight
                      ? 16
                      : 60,
                  0,
                  0,
                  16),
              title: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    top <
                            MediaQuery.of(context).padding.top +
                                kToolbarHeight +
                                11
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Мои дела',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(
                                      horizontal: 0,
                                      vertical: 0,
                                    ),
                                    splashRadius: 20,
                                    alignment: Alignment.center,
                                    iconSize: 24,
                                    constraints: const BoxConstraints(),
                                    color: const Color.fromRGBO(0, 122, 255, 1),
                                    onPressed: () {
                                      setState(
                                        () {
                                          click = !click;
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      (click == true)
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    )),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Мои дела',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Выполнено - 5',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.3)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 25, 0),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        visualDensity: const VisualDensity(
                                          horizontal: 0,
                                          vertical: 0,
                                        ),
                                        splashRadius: 15,
                                        alignment: Alignment.center,
                                        iconSize: 15,
                                        constraints: const BoxConstraints(),
                                        color: const Color.fromRGBO(
                                            0, 122, 255, 1),
                                        onPressed: () {
                                          setState(
                                            () {
                                              click = !click;
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          (click == true)
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
