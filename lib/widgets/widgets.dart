import 'dart:async';

import 'package:WaraShops/dialogs/confirm_dialog.dart';
import 'package:WaraShops/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:WaraShops/bloc/history_bloc.dart';
import 'package:WaraShops/bloc/result_bloc.dart';
import 'package:WaraShops/utils/utils.dart';
import 'package:go_router/go_router.dart';

/* import 'package:url_launcher/url_launcher_string.dart'; */

import 'package:provider/provider.dart';
import '../data/constants.dart';
import '../models/models.dart';
part 'simple_text.dart';
part 'shop_card.dart';
part 'page_container.dart';
part 'search_box.dart';
part 'search/search_shop_store_delegate.dart';
part 'no_results.dart';
part 'results/stream_data_widget.dart';
part 'buttons/button_with_icon.dart';

part 'slideshow/slideshow.dart';
part 'slideshow/slide_item.dart';

part 'anim/fade_in_transition.dart';
part 'anim/fade_in_opacity.dart';
