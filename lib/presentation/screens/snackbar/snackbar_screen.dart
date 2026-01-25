import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálgos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Nostrud ipsum officia reprehenderit fugiat reprehenderit amet velit proident magna sit cillum occaecat. Id nisi nisi exercitation commodo eu pariatur qui do irure excepteur eu adipisicing dolore adipisicing. Cillum Lorem aute nostrud incididunt. Tempor commodo exercitation do cupidatat est nulla consectetur sint elit ea. Sit enim ex qui excepteur velit id irure proident. Anim amet ut ullamco ad Lorem ut sint sit sint proident. Sunt in velit occaecat mollit esse consectetur nisi.',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton(
              onPressed: () {
                OpenDialog(context);
              },
              child: Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackbar(context);
        },
        label: Text('Mostrar snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }

  void showCustomSnackbar(BuildContext context) {
    //Oculta o cierra los snackbar anteriores
    ScaffoldMessenger.of(context).clearSnackBars();
    //Crea el snackbar
    final snackBar = SnackBar(
      content: Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    //Muestra el snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void OpenDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    /*El builder significar que es algo que se va a contruir en timempo de ejecución */
    builder: (context) => AlertDialog(
      title: Text('¿Estás seguro?'),
      content: Text(
        'Incididunt ullamco officia commodo officia voluptate commodo duis excepteur mollit est elit nulla est excepteur. Labore exercitation labore ea adipisicing eiusmod laborum dolor laboris consequat velit est mollit in. Aliqua duis ullamco nulla ex. Nulla ex et ad irure. Magna ea excepteur deserunt exercitation tempor pariatur sit ullamco et est exercitation. Excepteur consequat elit laborum proident consequat. Ullamco excepteur tempor proident dolore.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () {
            context.pop();
          },
          child: Text('Aceptar'),
        ),
      ],
    ),
  );
}
