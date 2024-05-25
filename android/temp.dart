// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:


// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:

// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// Layouts in Flutter
// UI
// Layout
// What's the point?
// Widgets are classes used to build UIs.
// Widgets are used for both layout and UI elements.
// Compose simple widgets to build complex widgets.
// The core of Flutter's layout mechanism is widgets. In Flutter, almost everything is a widget—even layout models are widgets. The images, icons, and text that you see in a Flutter app are all widgets. But things you don't see are also widgets, such as the rows, columns, and grids that arrange, constrain, and align the visible widgets.

// You create a layout by composing widgets to build more complex widgets. For example, the first screenshot below shows 3 icons with a label under each one:

// Sample layout Sample layout with visual debugging
// The second screenshot displays the visual layout, showing a row of 3 columns where each column contains an icon and a label.

// Note
// Most of the screenshots in this tutorial are displayed with debugPaintSizeEnabled set to true so you can see the visual layout. For more information, see Debugging layout issues visually, a section in Using the Flutter inspector.

// Here's a diagram of the widget tree for this UI:

// Node tree
// Most of this should look as you might expect, but you might be wondering about the containers (shown in pink). Container is a widget class that allows you to customize its child widget. Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.

// In this example, each Text widget is placed in a Container to add margins. The entire Row is also placed in a Container to add padding around the row.

// The rest of the UI in this example is controlled by properties. Set an Icon's color using its color property. Use the Text.style property to set the font, its color, weight, and so on. Columns and rows have properties that allow you to specify how their children are aligned vertically or horizontally, and how much space the children should occupy.

// Lay out a widget
// #
// How do you lay out a single widget in Flutter? This section shows you how to create and display a simple widget. It also shows the entire code for a simple Hello World app.

// In Flutter, it takes only a few steps to put text, an icon, or an image on the screen.

// 1. Select a layout widget
// #
// Choose from a variety of layout widgets based on how you want to align or constrain the visible widget, as these characteristics are typically passed on to the contained widget.

// This example uses Center which centers its content horizontally and vertically.

// 2. Create a visible widget
// #
// For example, create a Text widget:

// Text('Hello World'),
// content_copy
// Create an Image widget:

// return Image.asset(
//   image,
//   fit: BoxFit.cover,
// );
// content_copy
// Create an Icon widget:

// Icon(
//   Icons.star,
//   color: Colors.red[500],
// ),
// content_copy
// 3. Add the visible widget to the layout widget
// #
// All layout widgets have either of the following:

// A child property if they take a single child—for example, Center or Container
// A children property if they take a list of widgets—for example, Row, Column, ListView, or Stack.
// Add the Text widget to the Center widget:

// const Center(
//   child: Text('Hello World'),
// ),
// content_copy
// 4. Add the layout widget to the page
// #
// A Flutter app is itself a widget, and most widgets have a build() method. Instantiating and returning a widget in the app's build() method displays the widget.

// Material apps
// #
// For a Material app, you can use a Scaffold widget; it provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets. Then you can add the Center widget directly to the body property for the home page.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String appTitle = 'Flutter layout demo';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Material library implements widgets that follow Material Design principles. When designing your UI, you can exclusively use widgets from the standard widgets library, or you can use widgets from the Material library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Cupertino apps
// #
// To create a Cupertino app, use CupertinoApp and CupertinoPageScaffold widgets.

// Unlike Material, it doesn't provide a default banner or background color. You need to set these yourself.

// To set default colors, pass in a configured CupertinoThemeData to your app's theme property.

// To add an iOS-styled navigation bar to the top of your app, add a CupertinoNavigationBar widget to the navigationBar property of your scaffold. You can use the colors that CupertinoColors provides to configure your widgets to match iOS design.

// To lay out the body of your app, set the child property of your scaffold with the desired widget as its value, like Center or Column.

// To learn what other UI components you can add, check out the Cupertino library.

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       title: 'Flutter layout demo',
//       theme: CupertinoThemeData(
//         brightness: Brightness.light,
//         primaryColor: CupertinoColors.systemBlue,
//       ),
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           backgroundColor: CupertinoColors.systemGrey,
//           middle: Text('Flutter layout demo'),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Hello World'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// Note
// The Cupertino library implements widgets that follow Apple's Human Interface Guidelines for iOS. When designing your UI, you can use widgets from the standard widgets library, or the Cupertino library. You can mix widgets from both libraries, you can customize existing widgets, or you can build your own set of custom widgets.

// Non-Material apps
// #
// For a non-Material app, you can add the Center widget to the app's build() method:

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: const Center(
//         child: Text(
//           'Hello World',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
// content_copy
// By default, a non-Material app doesn't include an AppBar, title, or background color. If you want these features in a non-Material app, you have to build them yourself. This app changes the background color to white and the text to dark grey to mimic a Material app.

// That's it! When you run the app, you should see Hello World.

// App source code:

// Material app
// Non-Material app
// Hello World
// Lay out multiple widgets vertically and horizontally
// #
// One of the most common layout patterns is to arrange widgets vertically or horizontally. You can use a Row widget to arrange widgets horizontally, and a Column widget to arrange widgets vertically.

// What's the point?
// Row and Column are two of the most commonly used layout patterns.
// Row and Column each take a list of child widgets.
// A child widget can itself be a Row, Column, or other complex widget.
// You can specify how a Row or Column aligns its children, both vertically and horizontally.
// You can stretch or constrain specific child widgets.
// You can specify how child widgets use the Row's or Column's available space.
// To create a row or column in Flutter, you add a list of children widgets to a Row or Column widget. In turn, each child can itself be a row or column, and so on. The following example shows how it is possible to nest rows or columns inside of rows or columns.

// This layout is organized as a Row. The row contains two children: a column on the left, and an image on the right:

// Screenshot with callouts showing the row containing two children

// The left column's widget tree nests rows and columns.

// Diagram showing a left column broken down to its sub-rows and sub-columns

// You'll implement some of Pavlova's layout code in Nesting rows and columns.

// Note
// Row and Column are basic primitive widgets for horizontal and vertical layouts—these low-level widgets allow for maximum customization. Flutter also offers specialized, higher level widgets that might be sufficient for your needs. For example, instead of Row you might prefer ListTile, an easy-to-use widget with properties for leading and trailing icons, and up to 3 lines of text. Instead of Column, you might prefer ListView, a column-like layout that automatically scrolls if its content is too long to fit the available space. For more information, see Common layout widgets.

// Aligning widgets
// #
// You control how a row or column aligns its children using the mainAxisAlignment and crossAxisAlignment properties. For a row, the main axis runs horizontally and the cross axis runs vertically. For a column, the main axis runs vertically and the cross axis runs horizontally.

// Diagram showing the main axis and cross axis for a row Diagram showing the main axis and cross axis for a column
// The MainAxisAlignment and CrossAxisAlignment enums offer a variety of constants for controlling alignment.

// Note
// When you add images to your project, you need to update the pubspec.yaml file to access them—this example uses Image.asset to display the images. For more information, see this example's pubspec.yaml file or Adding assets and images. You don't need to do this if you're referencing online images using Image.network.

// In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly between, before, and after each image.

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// Row with 3 evenly spaced images
// App source: row_column

// Columns work the same way as rows. The following example shows a column of 3 images, each is 100 pixels high. The height of the render box (in this case, the entire screen) is more than 300 pixels, so setting the main axis alignment to spaceEvenly divides the free vertical space evenly between, above, and below each image.

// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Image.asset('images/pic1.jpg'),
//     Image.asset('images/pic2.jpg'),
//     Image.asset('images/pic3.jpg'),
//   ],
// );
// content_copy
// App source: row_column

// Column showing 3 images spaced evenly
// Sizing widgets
// #
// When a layout is too large to fit a device, a yellow and black striped pattern appears along the affected edge. Here is an example of a row that is too wide:

// Overly-wide row
// Widgets can be sized to fit within a row or column by using the Expanded widget. To fix the previous example where the row of images is too wide for its render box, wrap each image with an Expanded widget.

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space
// App source: sizing

// Perhaps you want a widget to occupy twice as much space as its siblings. For this, use the Expanded widget flex property, an integer that determines the flex factor for a widget. The default flex factor is 1. The following code sets the flex factor of the middle image to 2:

// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Expanded(
//       child: Image.asset('images/pic1.jpg'),
//     ),
//     Expanded(
//       flex: 2,
//       child: Image.asset('images/pic2.jpg'),
//     ),
//     Expanded(
//       child: Image.asset('images/pic3.jpg'),
//     ),
//   ],
// );
// content_copy
// Row of 3 images with the middle image twice as wide as the others
// App source: sizing

// Packing widgets
// #
// By default, a row or column occupies as much space along its main axis as possible, but if you want to pack the children closely together, set its mainAxisSize to MainAxisSize.min. The following example uses this property to pack the star icons together.

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     Icon(Icons.star, color: Colors.green[500]),
//     const Icon(Icons.star, color: Colors.black),
//     const Icon(Icons.star, color: Colors.black),
//   ],
// )
// content_copy
// Row of 5 stars, packed together in the middle of the row
// App source: pavlova

// Nesting rows and columns
// #
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
// The layout framework allows you to nest rows and columns inside of rows and columns as deeply as you need. Let's look at the code for the outlined section of the following layout:
