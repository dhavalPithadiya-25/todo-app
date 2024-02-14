import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/app/extensions/context_extension.dart';

class DemoView extends StatefulWidget {
  const DemoView({super.key});

  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            stops: [],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.lightGreen,
            ],
          ),
        ),
      ),
    );
  }
}

/*Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
height: 50,
width: double.infinity,
color: context.colorScheme.primary,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.onPrimary,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.secondary,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.onSecondary,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.tertiary,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.onTertiary,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.error,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.onError,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.background,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.onBackground ,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.surface,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.onSurface,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.onSurfaceVariant,
),
height: 50,
width: double.infinity,
),
Gap(15),
Container(
decoration: BoxDecoration(
border: Border.all(),
color: context.colorScheme.outline,
),
height: 50,
width: double.infinity,
),
*/ /* FilledButton(
                  onPressed: () {},
                  child: const Center(
                    child: Text("Helloooo"),
                  ),
                ),
                OutlinedButton(onPressed: () {}, child: Text("Helllooo"))*/ /*
],
)*/

/*          Text("labelSmall",style: Theme.of(context).textTheme.labelSmall,),
            Gap(6),
            Text("labelMedium",style: Theme.of(context).textTheme.labelMedium,),
            Gap(6),
            Text("labelLarge",style: Theme.of(context).textTheme.labelLarge,),
            Gap(16),

            Text("titleSmall",style: Theme.of(context).textTheme.titleSmall,),
            Gap(6),
            Text("titleMedium",style: Theme.of(context).textTheme.titleMedium,),
            Gap(6),
            Text("titleLarge",style: Theme.of(context).textTheme.titleLarge,),
            Gap(16),


            Text("bodySmall",style: Theme.of(context).textTheme.bodySmall,),
            Gap(6),
            Text("bodyMedium",style: Theme.of(context).textTheme.bodyMedium,),
            Gap(6),
            Text("bodyLarge",style: Theme.of(context).textTheme.bodyLarge,),
            Gap(16),

            Text("headlineSmall",style: Theme.of(context).textTheme.headlineSmall,),
            Gap(6),
            Text("headlineMedium",style: Theme.of(context).textTheme.headlineMedium,),
            Gap(6),
            Text("headlineLarge",style: Theme.of(context).textTheme.headlineLarge,),
            Gap(16),

            Text("displaySmall",style: Theme.of(context).textTheme.displaySmall,),
            Gap(6),
            Text("displayMedium",style: Theme.of(context).textTheme.displayMedium,),
            Gap(6),
            Text("displayLarge",style: Theme.of(context).textTheme.displayLarge,),
            Gap(6),


            */
