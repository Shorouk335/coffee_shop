import 'package:flutter/material.dart';


/// if ispassword == true  
/// should textObscure == true 
 
class DefultTextFormField extends StatefulWidget {
  DefultTextFormField(
      {super.key,
      this.title,
      this.titleColor,
      this.titleSize,
      this.textController,
      this.cursorColor,
      this.initialValue,
      this.keybordType,
      this.obscureText = false,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.showCursor,
      this.textStyle,
      this.validator,
      this.label,
      this.labelText,
      this.labelStyle,
      this.hintText,
      this.suffix,
      this.prefix,
      this.isFilledColor = true,
      this.fillColor,
      this.borderRadius,
      this.borderSideColor,
      this.borderSideWidth,
      this.contentPadding,
      this.hintColor,
      this.textColor,
      this.textSize,
      this.boxShadow,
      this.isPassword = false , 
      this.aroundContainerPadding =  EdgeInsets.zero , 
      this.textAlign = TextAlign.start});
  //title
  final String? title;
  final Color? titleColor;
  final double? titleSize;
  // textForm
  final TextEditingController? textController;
  final Color? cursorColor;
  final bool? showCursor;
  final String? initialValue;
  final TextInputType? keybordType;
  bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  // dicoration
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final Widget? suffix;
  final Widget? prefix;
  final bool? isFilledColor;
  final Color? fillColor;
  final double? borderRadius;
  final Color? borderSideColor;
  final double? borderSideWidth;
  final EdgeInsetsGeometry? contentPadding;
  final double? textSize;
  final Color? textColor;
  final Color? hintColor;
  final List<BoxShadow>? boxShadow;
  final bool isPassword;
  EdgeInsetsGeometry? aroundContainerPadding ;
  TextAlign  textAlign ;

  @override
  State<DefultTextFormField> createState() => _DefultTextFormFieldState();
}

class _DefultTextFormFieldState extends State<DefultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
      if (widget.title != null)
        Text(
          widget.title ?? "",
          style: TextStyle(
              color: widget.titleColor,
              fontSize: widget.titleSize,
              fontWeight: FontWeight.w500),
        ),
      if (widget.title != null)
        SizedBox(
          height: 25,
        ),
        // if want to make shadow to text form with the same radius of text form
      Container(
        padding: widget.aroundContainerPadding ,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
           color: Colors.transparent,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
             boxShadow: widget.boxShadow
            
            ),
        child: TextFormField( 
        
          controller: widget.textController,
          cursorColor: widget.cursorColor,
          showCursor: widget.showCursor,
          initialValue: widget.initialValue,
          keyboardType: widget.keybordType,
          obscureText: widget.obscureText ?? false,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          style: widget.textStyle,
          // to controll of align of text in text form field
          textAlign: widget.textAlign ,
          validator: widget.validator,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding,
            label: widget.label,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: widget.hintColor ?? Colors.grey[400],
                fontSize: widget.textSize),
                prefix: widget.prefix,

            suffix: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    child: Icon(
                      widget.obscureText == false
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                  )
                : widget.suffix,
         
            filled: widget.isFilledColor,
            fillColor: widget.fillColor,
            // border before click
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 10.0)),
              borderSide: BorderSide(
                  width: widget.borderSideWidth ?? 0.0,
                  color: widget.borderSideColor ??
                      widget.fillColor ??
                      Colors.transparent),
            ),
            //border after click
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 10.0)),
              borderSide: BorderSide(
                  width: widget.borderSideWidth ?? 1.0,
                  color: widget.borderSideColor ??
                      widget.fillColor ??
                      Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 10.0)),
              borderSide: BorderSide(
                  width: widget.borderSideWidth ?? 1.0,
                  color: widget.borderSideColor ??
                      widget.fillColor ??
                      Colors.transparent),
            ), 


             focusedErrorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 10.0)),
              borderSide: BorderSide(
                  width: widget.borderSideWidth ?? 1.0,
                  color: widget.borderSideColor ??
                      widget.fillColor ??
                      Colors.transparent),
            ),
          ),
        ),
      )
    ]);
  }
}
