import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    this.enabled = true,
    this.errorText,
    this.hintText,
    this.onCountryChanged,
  });

  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool enabled;
  final String? errorText;
  final String? hintText;
  final Function(CountryCode)? onCountryChanged;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  CountryCode _selectedCountry = CountryCode.coteDivoire;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 52,
              child: PopupMenuButton<CountryCode>(
                offset: const Offset(0, 50),
                onSelected: (CountryCode country) {
                  setState(() {
                    _selectedCountry = country;
                  });
                  widget.onCountryChanged?.call(country);
                },
                itemBuilder: (BuildContext context) {
                  return CountryCode.values.map((CountryCode country) {
                    return PopupMenuItem<CountryCode>(
                      value: country,
                      child: Row(
                        children: [
                          Text(
                            country.flag,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            country.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Outfit",
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            country.dialCode,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontFamily: "Outfit",
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedCountry.flag,
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _selectedCountry.dialCode,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Phone input - right side
            Expanded(
              child: TextFormField(
                enabled: widget.enabled,
                controller: widget.controller,
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  PhoneNumberFormatter(),
                ],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF006AB0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF006AB0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFF006AB0),
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  fillColor: widget.enabled
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.3),
                  filled: true,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                  ),
                  errorStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    height: 1,
                  ),
                  errorMaxLines: 1,
                  errorText: widget.errorText,
                  hintText: widget.hintText ?? '07 04 31 99 65',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: "Outfit",
                    fontSize: 18,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Outfit",
                  fontSize: 18,
                  height: 1.2,
                  letterSpacing: 1,
                ),
                textAlignVertical: TextAlignVertical.center,
                validator: widget.validator,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Formatter pour ajouter des espaces dans le numéro de téléphone
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    // Supprimer tous les espaces
    final digitsOnly = text.replaceAll(' ', '');

    // Ajouter des espaces tous les 2 chiffres
    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 2 == 0) {
        buffer.write(' ');
      }
      buffer.write(digitsOnly[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

// Énumération des codes pays
enum CountryCode {
  coteDivoire('🇨🇮', '+225', 'Côte d\'Ivoire'),
  senegal('🇸🇳', '+221', 'Sénégal'),
  mali('🇲🇱', '+223', 'Mali'),
  benin('🇧🇯', '+229', 'Bénin'),
  burkinaFaso('🇧🇫', '+226', 'Burkina Faso'),
  niger('🇳🇪', '+227', 'Niger'),
  togo('🇹🇬', '+228', 'Togo'),
  guinea('🇬🇳', '+224', 'Guinée'),
  france('🇫🇷', '+33', 'France');

  final String flag;
  final String dialCode;
  final String name;

  const CountryCode(this.flag, this.dialCode, this.name);
}
