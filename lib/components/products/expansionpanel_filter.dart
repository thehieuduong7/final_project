import 'package:flutter/material.dart';

class Step {
  Step(this.title, this.body, [this.isExpanded = false]);
  Widget title;
  Widget body;
  bool isExpanded;
}

List<Step> convertToStep(List<Map<String, dynamic>> list) {
  return list.map((e) => Step(Text(e["title"]), e["body"])).toList();
}

class ExpansionpanelFilter extends StatefulWidget {
  const ExpansionpanelFilter({Key? key, required this.steps}) : super(key: key);
  final List<Step> steps;
  @override
  State<ExpansionpanelFilter> createState() => _StepsState();
}

class _StepsState extends State<ExpansionpanelFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _renderSteps(),
      ),
    );
  }

  Widget _renderSteps() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.steps[index].isExpanded = !isExpanded;
        });
      },
      children: widget.steps.map<ExpansionPanel>((Step step) {
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
