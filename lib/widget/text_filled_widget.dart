import '../constants/constants.dart';

class MyTextFormField extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  Function(String?)? onSaved;
  final Function()? onTab;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final Color? fillColor;
  final Color border;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? counterText;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

   MyTextFormField({
    Key? key,
    required this.hint,
    this.suffixIcon,
    required this.obscureText,
    this.maxLines,
    this.fillColor,
    this.controller,
    this.validator,
    this.maxLength,
    this.keyboardType,
    this.prefixIcon,
    this.counterText,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    required this.readOnly,
    this.inputFormatters,
    this.onTab,
    required this.border,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      textAlign: TextAlign.start,
      onTap: widget.onTab,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFamily: regular,
        fontSize: 14,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counterText: widget.counterText,
        filled: true,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        hintText: widget.hint,
        hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(166, 166, 166, 0.7), fontFamily: medium, fontSize: 12, fontStyle: FontStyle.normal),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: widget.fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
