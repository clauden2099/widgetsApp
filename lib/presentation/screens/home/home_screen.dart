import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView()
    );
  }
}

class _HomeView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    /*Cuando un widget tiene se instancia con un builder significa que ese 
    widget no recibe directamente un hijo (child) ya construido, sino que 
    recibe una función que construye el widget bajo demanda.
  */
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index){
      final menuItem = appMenuItems[index];
      /*Los tiles son widgets ya prearmados o configurados para que se vean
      bien en un listView por que ya tienen una estrucutra de la información
      que llevaran estos */
      return _CustmListTile(menuItem: menuItem);
    }
    );
  }
}

class _CustmListTile extends StatelessWidget {
  const _CustmListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color:colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: (){
        /*Con la navegación de go router solo hay que llamar al context y usar 
        alguno de los métodos de navegación, con el push es que se genera un stack
        de pantallas y en el arguemnto del método se debe de indicar la url o path
        hacía donde se ira con la navegación */
        //context.push(menuItem.link);
        //Navegación el nombre de la pantalla
        context.pushNamed(ButtonsScreen.name);
      },
    );
  }
}