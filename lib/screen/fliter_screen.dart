import 'package:flutter/material.dart';
import 'package:tours/widgets/app_drawer.dart';

class FliterScreen extends StatefulWidget {
  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;
  const FliterScreen(this.saveFilters, this.currentFilters, {super.key});
  static const screenRoute = '/fliters';

  @override
  State<FliterScreen> createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    final theme = Theme.of(context);
    return SwitchListTile(
      activeColor: theme.colorScheme.primary, // amber
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: theme.colorScheme.secondary,
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.titleLarge?.copyWith(color: Colors.white70),
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black, // ✅ full black background
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary, // amber
        foregroundColor: theme.colorScheme.onPrimary, // white
        title: Text(
          'الفلترة',
          style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    'الرحلات الصيفية فقط',
                    'إظهار الرحلات في فصل الصيف فقط',
                    _summer,
                    (newValue) => setState(() => _summer = newValue),
                  ),
                  buildSwitchListTile(
                    'الرحلات الشتوية فقط',
                    'إظهار الرحلات في فصل الشتاء فقط',
                    _winter,
                    (newValue) => setState(() => _winter = newValue),
                  ),
                  buildSwitchListTile(
                    'للعائلات',
                    'إظهار الرحلات التي للعائلات فقط',
                    _family,
                    (newValue) => setState(() => _family = newValue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
