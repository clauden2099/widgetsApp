import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
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
        
      },
    );
  }
}