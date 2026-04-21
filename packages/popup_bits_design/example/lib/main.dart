// Minimal example consumer of popup_bits_design.
// Shows the two usage patterns:
//   A) Built-in product theme (from products.dart)
//   B) In-app product theme (apps define their own — the recommended
//      pattern for new / third-party products).

import 'package:flutter/material.dart';
import 'package:popup_bits_design/popup_bits_design.dart';
import 'package:popup_bits_design/products.dart'; // optional

// ---- (B) App-defined product theme. No package changes needed. ----
const myAppTheme = PbProductTheme(
  id: 'myapp',
  name: 'My App',
  accent:     Color(0xFF0E8A8A),
  accentSoft: Color(0xFFD6EFEE),
  accentInk:  Color(0xFF1F2A3A),
);

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'popup_bits_design demo',
      // (A) Using a built-in Popup Bits product:
      theme: PopupBitsTheme.build(
        archetype: PbArchetype.cultural,
        product:   PbProducts.jyotish,
      ),
      // (B) Your own product:
      // theme: PopupBitsTheme.build(
      //   archetype: PbArchetype.marketplace,
      //   product:   myAppTheme,
      // ),
      home: const DemoHome(),
    );
  }
}

class DemoHome extends StatelessWidget {
  const DemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final pb = Theme.of(context).extension<PbThemeExt>()!;
    return Scaffold(
      appBar: AppBar(title: const Text('Popup Bits Design')),
      body: Padding(
        padding: const EdgeInsets.all(PbTokens.sp6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hello from ${pb.product.name}',
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: PbTokens.sp4),
            FilledButton(onPressed: () {}, child: const Text('Primary action')),
            const SizedBox(height: PbTokens.sp3),
            OutlinedButton(onPressed: () {}, child: const Text('Secondary')),
            const SizedBox(height: PbTokens.sp4),
            const TextField(decoration: InputDecoration(labelText: 'Your name')),
          ],
        ),
      ),
    );
  }
}
