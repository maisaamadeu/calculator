class ButtonModel {
  final String action;
  final Function() actionFunction;
  final bool isDoubleWidth;

  ButtonModel(this.action, this.actionFunction, {this.isDoubleWidth = false});
}
