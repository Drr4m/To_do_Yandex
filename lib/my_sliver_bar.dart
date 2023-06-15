import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoyandex/my_tasks.dart';

class MySliverBar extends ConsumerStatefulWidget {
  const MySliverBar({super.key});

  @override
  ConsumerState<MySliverBar> createState() => _MySliverBarState();
}

class _MySliverBarState extends ConsumerState<MySliverBar> {
  double top = 0;

  @override
  Widget build(BuildContext context) {
    final click = ref.watch(hide);
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
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
                  0),
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
                                      ref
                                          .read(hide.notifier)
                                          .update((state) => !click);
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
                              Row(
                                children: [
                                  Text(
                                    'Выполнено - $count',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0, 0, 0, 0.3)),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 23,
                                    width: 23,
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        visualDensity: const VisualDensity(
                                          horizontal: 0,
                                          vertical: 0,
                                        ),
                                        splashRadius: 25,
                                        iconSize: 15,
                                        constraints: const BoxConstraints(
                                          maxHeight: 20,
                                        ),
                                        color: const Color.fromRGBO(
                                            0, 122, 255, 1),
                                        onPressed: () {
                                          ref
                                              .read(hide.notifier)
                                              .update((state) => !click);
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
