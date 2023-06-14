part of '../theme.dart';

const Text myTasks = Text(
  'Мои дела',
  style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black),
);

const Text done = Text(
  'Выполнено - 5',
  style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(0, 0, 0, 0.3)),
);

bool click = false;
void setState(Null Function() param0) {}

IconButton eyeButton = IconButton(
  padding: EdgeInsets.zero,
  visualDensity: const VisualDensity(
    horizontal: 0,
    vertical: 0,
  ),
  splashRadius: 20,
  alignment: Alignment.center,
  iconSize: 15,
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
    (click == true) ? Icons.visibility_off : Icons.visibility,
  ),
);

IconButton eyeButtonBar = IconButton(
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
    (click == true) ? Icons.visibility_off : Icons.visibility,
  ),
);
