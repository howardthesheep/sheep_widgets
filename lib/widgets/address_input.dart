import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class AddressInput extends StatefulWidget {
  final TextEditingController controller;
  final String apiKey;
  final String labelText;
  final String? Function(String? value)? validator;
  final bool enabled;
  final Function(String)? onChanged;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;

  const AddressInput({
    super.key,
    required this.controller,
    required this.apiKey,
    this.labelText = "Address",
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.autovalidateMode,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
  });

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  String? _sessionToken;
  var uuid = const Uuid();
  List<dynamic> _placeList = [];
  bool _addressChosen = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      _onChanged();
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(() {});
  }

  _onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    if (_addressChosen) {
      setState(() {
        _addressChosen = false;
      });
      return;
    }
    getSuggestion(widget.controller.text);
  }

  void getSuggestion(String input) async {
    String kplacesApiKey = widget.apiKey;
    String type = 'address';
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&types=$type&key=$kplacesApiKey&sessiontoken=$_sessionToken';

    http.Response response = http.Response("Default", HttpStatus.internalServerError);
    try {
      response = await http.get(Uri.parse(request),
          headers: {"Accept": "application/json", "Access-Control_Allow_Origin": "*"});
    } catch (e) {
      throw Exception('Failed to send places api request: $e');
    }

    if (response.statusCode == 200) {
      // print(' response is 200');
      setState(() {
        _placeList = json.decode(response.body)['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enabled: widget.enabled,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            _placeList.clear();
          },
          controller: widget.controller,
          validator: widget.validator,
          maxLines: 1,
          keyboardType: TextInputType.streetAddress,
          onChanged: widget.onChanged,
          minLines: 1,
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          key: widget.key,
          autovalidateMode: widget.autovalidateMode,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: const OutlineInputBorder(),
            prefix: widget.prefix,
            prefixIcon: widget.prefixIcon,
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _placeList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (mounted) {
                  setState(() {
                    _addressChosen = true;
                    widget.controller.text = _placeList[index]["description"];
                    _placeList.clear();
                  });
                }
              },
              child: ListTile(
                title: Text(_placeList[index]["description"]),
                hoverColor: Theme.of(context).primaryColor.withAlpha(200),
              ),
            );
          },
        )
      ],
    );
  }
}
