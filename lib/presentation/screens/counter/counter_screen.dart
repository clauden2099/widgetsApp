import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

/*Para consumir o suscribirse a un estdo de riverpod la clase debe de 
extender de ConsumerWidget que es igual a un StatelessWidget*/
class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  /*Cuando se usa un ConsumerWidget el método build debe de recibir un 
  widgetRef */
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*Aquí se esta suscribiendo al provider que se definio 
    y cada que cambie este se redibujaran los widgets que trabajen con este
    en caso de ser necesrio*/
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(onPressed: () {
            ref.read(isDarkModeProvider.notifier).update((state) => !state);
          }, icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined)),
        ],
      ),
      body: Center(
        child: Text(
          'Valor : $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //De esta manera se cambia el valor de un provider
          ref.read(counterProvider.notifier).state++;
          //Forma 2 de cambiar el valor de un provider
          //ref.read(counterProvider.notifier).update((state) => state+1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
