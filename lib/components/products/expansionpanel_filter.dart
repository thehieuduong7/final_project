import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';

class Step {
  Step(this.title, this.body, [this.isExpanded = true]);
  Widget title;
  Widget body;
  bool isExpanded;
}

class ExpansionpanelFilter extends StatefulWidget {
  const ExpansionpanelFilter({Key? key, required this.filters})
      : super(key: key);
  final List<CategoryFilter> filters;
  @override
  State<ExpansionpanelFilter> createState() => _StepsState();
}

class _StepsState extends State<ExpansionpanelFilter> {
  @override
  Widget build(BuildContext context) {
    Widget toBodyWidget(List<Option> options) {
      return Expanded(
          child: ListView(
              shrinkWrap: true,
              children: options.map((e) {
                return ListTile(
                    title: Text(e.label),
                    trailing: Switch(
                      value: e.isChecked,
                      onChanged: (value) {
                        e.isChecked = !e.isChecked;

                        Provider.of<ProductProvider>(context, listen: false)
                            .loadFilter();

                        Provider.of<ProductProvider>(context, listen: false)
                            .handleFilter();
                      },
                    ));
              }).toList()));
    }

    List<Step> convertToStep(List<CategoryFilter> list) {
      return list
          .map((e) => Step(Text(e.title), toBodyWidget(e.options)))
          .toList();
    }

    List<Step> steps = convertToStep(widget.filters);

    return SingleChildScrollView(
      child: Container(
        child: _renderSteps(steps),
      ),
    );
  }

  Widget _renderSteps(List<Step> steps) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          steps[index].isExpanded = !isExpanded;
        });
      },
      children: steps.map<ExpansionPanel>((Step step) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: step.title,
            );
          },
          body: ListTile(
            title: step.body,
          ),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}
