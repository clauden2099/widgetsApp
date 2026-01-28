import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_change_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //Providers
   // final isDarkMode = ref.watch(isDarkModeProvider);
   //Usando el stateNotifier
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).update((state) => !state);
              //Usando el stateNotifier
              ref.read(themeNotifierProvider.notifier).toogleDakMode();
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final List<Color> colors = ref.watch(colorListProvider);
    //final selectedColor = ref.watch(selectedColorProvider);
    //Usando el stateNotifier
    final AppTheme apptheme = ref.watch(themeNotifierProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: apptheme.selectedColor,
          onChanged: (value) {
            //ref.read(selectedColorProvider.notifier).state = index;
            //Usando el stateNotifier
            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
