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
