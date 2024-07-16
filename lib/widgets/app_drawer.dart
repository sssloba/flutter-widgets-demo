import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/screens/animated_cross_fade_demo.dart';
import 'package:flutter_widgets_demo/screens/callback_text_first.dart';
import 'package:flutter_widgets_demo/screens/custom_buttons_demo.dart';
import 'package:flutter_widgets_demo/screens/draggable_scrollabe_demo.dart';
import 'package:flutter_widgets_demo/screens/drop_down_demo.dart';
import 'package:flutter_widgets_demo/screens/overlay_portal_demo.dart';
import 'package:flutter_widgets_demo/screens/paginated_infinite_list_view.dart';
import 'package:flutter_widgets_demo/screens/physical_model_demo.dart';
import 'package:flutter_widgets_demo/screens/draggables.dart';
import 'package:flutter_widgets_demo/screens/home_page.dart';
import 'package:flutter_widgets_demo/screens/reorderables.dart';
import 'package:flutter_widgets_demo/screens/slivers.dart';
import 'package:flutter_widgets_demo/screens/stateful_builder_demo.dart';
import 'package:flutter_widgets_demo/screens/steppers.dart';
import 'package:flutter_widgets_demo/screens/value_notifier_draggable.dart';
import 'package:flutter_widgets_demo/widgets/drawer_tile.dart';

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
        ],
      ),
    );
  }
}
