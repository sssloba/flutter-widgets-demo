import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/screen_exports.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerTile('Home Page', HomePage()),
          DrawerTile('Animated Cross Fade', AnimatedCrossFadeDemo()),
          DrawerTile('Slivers', Slivers()),
          DrawerTile('Draggable', Draggables()),
          DrawerTile('Steppers', Steppers()),
          DrawerTile('Reorderable List', Reorderables()),
          DrawerTile('Colored title', ColoredBox(color: Colors.green)),
          DrawerTile('Callback Text', CallbackTextFirst()),
          DrawerTile('Stateful Builder Demo', StatefulBuilderDemo()),
          DrawerTile('Physical Model', PhysicalModelDemo()),
          DrawerTile('Draggable Scrollable Demo', DraggableScrollableDemo()),
          DrawerTile('Value Notifier Draggable', ValueNotifierDraggable()),
          DrawerTile('Overlay Portal Demo', OverlayPortalDemo()),
          DrawerTile('Drop Down Demo', DropDownDemo()),
          DrawerTile('Custom Buttons Demo', CustomButtonsDemo()),
          DrawerTile('Paginated List View', PaginatedListView()),
          DrawerTile('Overflow Bar Demo', OverflowBarDemo()),
          DrawerTile('Bezier Curves Demo', BezierCurvesDemo()),
          DrawerTile('Carousel View Demo', CarouselViewDemo()),
          DrawerTile(
              'Resizable Gesture Container', ResizableGestureContainer()),
          DrawerTile('Autocomplete Demo', AutocompleteDemo()),
        ],
      ),
    );
  }
}
