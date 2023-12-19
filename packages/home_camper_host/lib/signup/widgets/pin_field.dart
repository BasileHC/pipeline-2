import 'package:flutter/material.dart';

class PinField extends StatelessWidget {
  const PinField({
    super.key,
    required this.pin,
    required this.pinLength,
  });

  static const double _itemSize = 50;

  final String pin;
  final int pinLength;

  Widget _buildCurrent() {
    return Container(
      height: _itemSize,
      width: _itemSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFDADADA),
        border: Border.all(),
      ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      height: _itemSize,
      width: _itemSize,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF2F2F5)),
    );
  }

  Widget _buildFull(String number) {
    assert(number.length == 1);
    return Container(
      height: _itemSize,
      width: _itemSize,
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFDADADA)),
      child: Text(
        number,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
            pin.length, (index) => _buildFull(pin.substring(index, index + 1))),
        if (pin.length < pinLength) _buildCurrent(),

        // builds remaining slots (-1 to account for the current slot)
        ...List.generate(
            pin.length == pinLength ? 0 : pinLength - pin.length - 1,
            (index) => _buildEmpty()),
      ],
    );
  }
}
