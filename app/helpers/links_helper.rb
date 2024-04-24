module LinksHelper

  def sanitize_link(url)
    url.gsub(/https:\/\/|http:\/\//, "")
  end

  def link_class(link)
    link.css_class.gsub("_","-")
  end

  def icons_list
    [
      "twitter",
      "youtube",
      "facebook",
      "whatsapp",
      "google",
      "linkedin",
      "telegram",
      "tiktok",
      "instagram",
      "address-book",
      "address-card",
      "angry",
      "arrow-alt-circle-down",
      "arrow-alt-circle-left",
      "arrow-alt-circle-right",
      "arrow-alt-circle-up",
      "bell",
      "bell-slash",
      "bookmark",
      "building",
      "calendar",
      "calendar-alt",
      "calendar-check",
      "calendar-minus",
      "calendar-plus",
      "calendar-times",
      "caret-square-down",
      "caret-square-left",
      "caret-square-right",
      "caret-square-up",
      "chart-bar",
      "check-circle",
      "check-square",
      "circle",
      "clipboard",
      "clock",
      "clone",
      "closed-captioning",
      "comment",
      "comment-alt",
      "comment-dots",
      "comments",
      "compass",
      "copy",
      "copyright",
      "credit-card",
      "dizzy",
      "dot-circle",
      "edit",
      "envelope",
      "envelope-open",
      "eye",
      "eye-slash",
      "file",
      "file-alt",
      "file-archive",
      "file-audio",
      "file-code",
      "file-excel",
      "file-image",
      "file-pdf",
      "file-powerpoint",
      "file-video",
      "file-word",
      "flag",
      "flushed",
      "folder",
      "folder-open",
      "frown",
      "frown-open",
      "futbol",
      "gem",
      "grimace",
      "grin",
      "grin-alt",
      "grin-beam",
      "grin-beam-sweet",
      "grin-hearts",
      "grin-squint",
      "grin-squint-tears",
      "grin-stars",
      "grin-tears",
      "grin-tongue",
      "grin-tongue-squint",
      "grin-tongue-wink",
      "grin-wink",
      "hand-lizard",
      "hand-paper",
      "hand-peace",
      "hand-point-down",
      "hand-point-left",
      "hand-point-right",
      "hand-point-up",
      "hand-pointer",
      "hand-rock",
      "hand-scissors",
      "hand-spock",
      "handshake",
      "hdd",
      "heart",
      "home",
      "hospital",
      "hourglass",
      "id-badge",
      "id-card",
      "image",
      "images",
      "keyboard",
      "kiss",
      "kiss-beam",
      "kiss-wink-heart",
      "laugh",
      "laugh-beam",
      "laugh-squint",
      "laugh-wink",
      "lemon",
      "life-ring",
      "lightbulb",
      "list-alt",
      "map",
      "meh",
      "meh-blank",
      "meh-rolling-eyes",
      "minus-square",
      "money-bill-alt",
      "moon",
      "newspaper",
      "object-group",
      "object-upgroup",
      "paper-plane",
      "pause-circle",
      "play-circle",
      "plus-square",
      "question-circle",
      "registered",
      "sad-cry",
      "sad-tear",
      "save",
      "share-square",
      "smile",
      "smile-beam",
      "smile-wink",
      "snowflake",
      "square",
      "star",
      "star-half",
      "sticky-note",
      "stop-circle",
      "sun",
      "surprise",
      "thumbs-down",
      "thumbs-up",
      "times-circle",
      "tired",
      "trash-alt",
      "user",
      "user-circle",
      "window-close",
      "window-maximize",
      "window-minimize",
      "window-restore",
    ]
  end


  # def icons_list
  #   [
  #     ["&#xf2b9;", "address-book"],
  #     ["&#xf2bb;", "address-card"],
  #     ["&#xf556;", "angry"],
  #     ["&#xf358;", "arrow-alt-circle-down"],
  #     ["&#xf359;", "arrow-alt-circle-left"],
  #     ["&#xf35a;", "arrow-alt-circle-right"],
  #     ["&#xf35b;", "arrow-alt-circle-up"],
  #     ["&#xf0f3;", "bell"],
  #     ["&#xf1f6;", "bell-slash"],
  #     ["&#xf02e;", "bookmark"],
  #     ["&#xf1ad;", "building"],
  #     ["&#xf133;", "calendar"],
  #     ["&#xf073;", "calendar-alt"],
  #     ["&#xf274;", "calendar-check"],
  #     ["&#xf272;", "calendar-minus"],
  #     ["&#xf271;", "calendar-plus"],
  #     ["&#xf273;", "calendar-times"],
  #     ["&#xf150;", "caret-square-down"],
  #     ["&#xf191;", "caret-square-left"],
  #     ["&#xf152;", "caret-square-right"],
  #     ["&#xf151;", "caret-square-up"],
  #     ["&#xf080;", "chart-bar"],
  #     ["&#xf058;", "check-circle"],
  #     ["&#xf14a;", "check-square"],
  #     ["&#xf111;", "circle"],
  #     ["&#xf328;", "clipboard"],
  #     ["&#xf017;", "clock"],
  #     ["&#xf24d;", "clone"],
  #     ["&#xf20a;", "closed-captioning"],
  #     ["&#xf075;", "comment"],
  #     ["&#xf27a;", "comment-alt"],
  #     ["&#xf4ad;", "comment-dots"],
  #     ["&#xf086;", "comments"],
  #     ["&#xf14e;", "compass"],
  #     ["&#xf0c5;", "copy"],
  #     ["&#xf1f9;", "copyright"],
  #     ["&#xf09d;", "credit-card"],
  #     ["&#xf567;", "dizzy"],
  #     ["&#xf192;", "dot-circle"],
  #     ["&#xf044;", "edit"],
  #     ["&#xf40e0", "envelope"],
  #     ["&#xf2b6;", "envelope-open"],
  #     ["&#xf06e;", "eye"],
  #     ["&#xf070;", "eye-slash"],
  #     ["&#xf15b;", "file"],
  #     ["&#xf15c;", "file-alt"],
  #     ["&#xf1c6;", "file-archive"],
  #     ["&#xf1c7;", "file-audio"],
  #     ["&#xf1c9;", "file-code"],
  #     ["&#xf1c3;", "file-excel"],
  #     ["&#xf1c5;", "file-image"],
  #     ["&#xf1c1;", "file-pdf"],
  #     ["&#xf1c4;", "file-powerpoint"],
  #     ["&#xf1c8;", "file-video"],
  #     ["&#xf1c2;", "file-word"],
  #     ["&#xf024;", "flag"],
  #     ["&#xf579;", "flushed"],
  #     ["&#xf07b;", "folder"],
  #     ["&#xf07c;", "folder-open "],
  #     ["&#xf119;", "frown"],
  #     ["&#xf57a;", "frown-open"],
  #     ["&#xf1e3;", "futbol"],
  #     ["&#xf3a5;", "gem"],
  #     ["&#xf57f;", "grimace"],
  #     ["&#xf580;", "grin"],
  #     ["&#xf581;", "grin-alt"],
  #     ["&#xf582;", "grin-beam"],
  #     ["&#xf583;", "grin-beam-sweet"],
  #     ["&#xf584;", "grin-hearts"],
  #     ["&#xf585;", "grin-squint"],
  #     ["&#xf586;", "grin-squint-tears"],
  #     ["&#xf587;", "grin-stars"],
  #     ["&#xf588;", "grin-tears"],
  #     ["&#xf589;", "grin-tongue"],
  #     ["&#xf58a;", "grin-tongue-squint"],
  #     ["&#xf58b;", "grin-tongue-wink"],
  #     ["&#xf58c;", "grin-wink"],
  #     ["&#xf258;", "hand-lizard"],
  #     ["&#xf256;", "hand-paper"],
  #     ["&#xf25b;", "hand-peace"],
  #     ["&#xf0a7;", "hand-point-down"],
  #     ["&#xf0a5;", "hand-point-left"],
  #     ["&#xf0a4;", "hand-point-right"],
  #     ["&#xf0a6;", "hand-point-up"],
  #     ["&#xf25a;", "hand-pointer"],
  #     ["&#xf255;", "hand-rock"],
  #     ["&#xf257;", "hand-scissors"],
  #     ["&#xf259;", "hand-spock"],
  #     ["&#xf2b5;", "handshake"],
  #     ["&#xf0a0;", "hdd"],
  #     ["&#xf004;", "heart"],
  #     ["&#xf015;", "home"],
  #     ["&#xf0f8;", "hospital"],
  #     ["&#xf254;", "hourglass"],
  #     ["&#xf2c1;", "id-badge"],
  #     ["&#xf2c2;", "id-card "],
  #     ["&#xf03e;", "image"],
  #     ["&#xf302;", "images"],
  #     ["&#xf11c;", "keyboard"],
  #     ["&#xf596;", "kiss"],
  #     ["&#xf597;", "kiss-beam"],
  #     ["&#xf598;", "kiss-wink-heart"],
  #     ["&#xf599;", "laugh"],
  #     ["&#xf59a;", "laugh-beam"],
  #     ["&#xf59b;", "laugh-squint "],
  #     ["&#xf59c;", "laugh-wink"],
  #     ["&#xf094;", "lemon"],
  #     ["&#xf1cd;", "life-ring"],
  #     ["&#xf0eb;", "lightbulb"],
  #     ["&#xf022;", "list-alt"],
  #     ["&#xf279;", "map"],
  #     ["&#xf11a;", "meh"],
  #     ["&#xf5a4;", "meh-blank"],
  #     ["&#xf5a5;", "meh-rolling-eyes"],
  #     ["&#xf146;", "minus-square"],
  #     ["&#xf3d1;", "money-bill-alt"],
  #     ["&#xf186;", "moon"],
  #     ["&#xf1ea;", "newspaper"],
  #     ["&#xf247;", "object-group"],
  #     ["&#xf248;", "object-upgroup"],
  #     ["&#xf1d8;", "paper-plane"],
  #     ["&#xf28b;", "pause-circle"],
  #     ["&#xf144;", "play-circle"],
  #     ["&#xf0fe;", "plus-square"],
  #     ["&#xf059;", "question-circle"],
  #     ["&#xf25d;", "registered"],
  #     ["&#xf5b3;", "sad-cry"],
  #     ["&#xf5b4;", "sad-tear"],
  #     ["&#xf0c7;", "save"],
  #     ["&#xf14d;", "share-square"],
  #     ["&#xf118;", "smile"],
  #     ["&#xf5b8;", "smile-beam"],
  #     ["&#xf4da;", "smile-wink"],
  #     ["&#xf2dc;", "snowflake"],
  #     ["&#xf0c8;", "square"],
  #     ["&#xf005;", "star"],
  #     ["&#xf089;", "star-half"],
  #     ["&#xf249;", "sticky-note"],
  #     ["&#xf28d;", "stop-circle"],
  #     ["&#xf185;", "sun"],
  #     ["&#xf5c2;", "surprise"],
  #     ["&#xf165;", "thumbs-down"],
  #     ["&#xf164;", "thumbs-up"],
  #     ["&#xf057;", "times-circle"],
  #     ["&#xf5c8;", "tired"],
  #     ["&#xf2ed;", "trash-alt"],
  #     ["&#xf007;", "user"],
  #     ["&#xf2bd;", "user-circle"],
  #     ["&#xf410;", "window-close"],
  #     ["&#xf2d0;", "window-maximize "],
  #     ["&#xf2d1;", "window-minimize"],
  #     ["&#xf2d2;", "window-restore"],
  #   ]
  # end
end



# <option value="address-book">&#xf2b9; address-book</option>
# <option value="address-card">&#xf2bb; address-card</option>
# <option value="angry">&#xf556; angry</option>
# <option value="arrow-alt-circle-down">&#xf358; arrow-alt-circle-down</option>
# <option value="arrow-alt-circle-left">&#xf359; arrow-alt-circle-left</option>
# <option value="arrow-alt-circle-right">&#xf35a; arrow-alt-circle-right</option>
# <option value="arrow-alt-circle-up">&#xf35b; arrow-alt-circle-up</option>
# <option value="bell">&#xf0f3; bell</option>
# <option value="bell-slash">&#xf1f6; bell-slash</option>
# <option value="bookmark">&#xf02e; bookmark</option>
# <option value="building">&#xf1ad; building</option>
# <option value="calendar">&#xf133; calendar</option>
# <option value="calendar-alt">&#xf073; calendar-alt</option>
# <option value="calendar-check">&#xf274; calendar-check</option>
# <option value="calendar-minus">&#xf272; calendar-minus</option>
# <option value="calendar-plus">&#xf271; calendar-plus</option>
# <option value="calendar-times">&#xf273; calendar-times</option>
# <option value="caret-square-down">&#xf150; caret-square-down</option>
# <option value="caret-square-left">&#xf191; caret-square-left</option>
# <option value="caret-square-right">&#xf152; caret-square-right</option>
# <option value="caret-square-up">&#xf151; caret-square-up</option>
# <option value="chart-bar">&#xf080; chart-bar</option>
# <option value="check-circle">&#xf058; check-circle</option>
# <option value="check-square">&#xf14a; check-square</option>
# <option value="circle">&#xf111; circle</option>
# <option value="clipboard">&#xf328; clipboard</option>
# <option value="clock">&#xf017; clock</option>
# <option value="clone">&#xf24d; clone</option>
# <option value="closed-captioning">&#xf20a; closed-captioning</option>
# <option value="comment">&#xf075; comment</option>
# <option value="comment-alt">&#xf27a; comment-alt</option>
# <option value="comment-dots">&#xf4ad; comment-dots</option>
# <option value="comments">&#xf086; comments</option>
# <option value="compass">&#xf14e; compass</option>
# <option value="copy">&#xf0c5; copy</option>
# <option value="copyright">&#xf1f9; copyright</option>
# <option value="credit-card">&#xf09d; credit-card</option>
# <option value="dizzy">&#xf567; dizzy</option>
# <option value="dot-circle">&#xf192; dot-circle</option>
# <option value="edit">&#xf044; edit</option>
# <option value="envelope">&#xf40e0 envelope </option>
# <option value="envelope-open">&#xf2b6; envelope-open</option>
# <option value="eye">&#xf06e; eye</option>
# <option value="eye-slash">&#xf070; eye-slash</option>
# <option value="file">&#xf15b; file</option>
# <option value="file-alt">&#xf15c; file-alt</option>
# <option value="file-archive">&#xf1c6; file-archive</option>
# <option value="file-audio">&#xf1c7; file-audio</option>
# <option value="file-code">&#xf1c9; file-code</option>
# <option value="file-excel">&#xf1c3; file-excel </option>
# <option value="file-image">&#xf1c5; file-image</option>
# <option value="file-pdf">&#xf1c1; file-pdf</option>
# <option value="file-powerpoint">&#xf1c4; file-powerpoint</option>
# <option value="file-video">&#xf1c8; file-video</option>
# <option value="file-word">&#xf1c2; file-word</option>
# <option value="flag">&#xf024; flag</option>
# <option value="flushed">&#xf579; flushed</option>
# <option value="folder">&#xf07b; folder</option>
# <option value="folder-open">&#xf07c; folder-open </option>
# <option value="frown">&#xf119; frown</option>
# <option value="frown-open">&#xf57a; frown-open</option>
# <option value="futbol">&#xf1e3; futbol</option>
# <option value="gem">&#xf3a5; gem</option>
# <option value="grimace">&#xf57f; grimace</option>
# <option value="grin">&#xf580; grin</option>
# <option value="grin-alt">&#xf581; grin-alt</option>
# <option value="grin-beam">&#xf582; grin-beam</option>
# <option value="grin-beam-sweet">&#xf583; grin-beam-sweet </option>
# <option value="grin-hearts">&#xf584; grin-hearts</option>
# <option value="grin-squint">&#xf585; grin-squint</option>
# <option value="grin-squint-tears">&#xf586; grin-squint-tears</option>
# <option value="grin-stars">&#xf587; grin-stars</option>
# <option value="grin-tears">&#xf588; grin-tears</option>
# <option value="grin-tongue">&#xf589; grin-tongue</option>
# <option value="grin-tongue-squint">&#xf58a; grin-tongue-squint</option>
# <option value="grin-tongue-wink">&#xf58b; grin-tongue-wink</option>
# <option value="grin-wink">&#xf58c; grin-wink </option>
# <option value="hand-lizard">&#xf258; hand-lizard</option>
# <option value="hand-paper">&#xf256; hand-paper</option>
# <option value="hand-peace">&#xf25b; hand-peace</option>
# <option value="hand-point-down">&#xf0a7; hand-point-down</option>
# <option value="hand-point-left">&#xf0a5; hand-point-left</option>
# <option value="hand-point-right">&#xf0a4; hand-point-right</option>
# <option value="hand-point-up">&#xf0a6; hand-point-up</option>
# <option value="hand-pointer">&#xf25a; hand-pointer</option>
# <option value="hand-rock">&#xf255; hand-rock </option>
# <option value="hand-scissors">&#xf257; hand-scissors</option>
# <option value="hand-spock">&#xf259; hand-spock</option>
# <option value="handshake">&#xf2b5; handshake</option>
# <option value="hdd">&#xf0a0; hdd</option>
# <option value="heart">&#xf004; heart</option>
# <option value="home">&#xf015; home</option>
# <option value="hospital">&#xf0f8; hospital</option>
# <option value="hourglass">&#xf254; hourglass</option>
# <option value="id-badge">&#xf2c1; id-badge</option>
# <option value="id-card">&#xf2c2; id-card </option>
# <option value="image">&#xf03e; image</option>
# <option value="images">&#xf302; images</option>
# <option value="keyboard">&#xf11c; keyboard</option>
# <option value="kiss">&#xf596; kiss</option>
# <option value="kiss-beam">&#xf597; kiss-beam</option>
# <option value="kiss-wink-heart">&#xf598; kiss-wink-heart</option>
# <option value="laugh">&#xf599; laugh</option>
# <option value="laugh-beam">&#xf59a; laugh-beam</option>
# <option value="laugh-squint">&#xf59b; laugh-squint </option>
# <option value="laugh-wink">&#xf59c; laugh-wink</option>
# <option value="lemon">&#xf094; lemon</option>
# <option value="life-ring">&#xf1cd; life-ring</option>
# <option value="lightbulb">&#xf0eb; lightbulb</option>
# <option value="list-alt">&#xf022; list-alt</option>
# <option value="map">&#xf279; map</option>
# <option value="meh">&#xf11a; meh</option>
# <option value="meh-blank">&#xf5a4; meh-blank</option>
# <option value="meh-rolling-eyes">&#xf5a5; meh-rolling-eyes </option>
# <option value="minus-square">&#xf146; minus-square</option>
# <option value="money-bill-alt">&#xf3d1; money-bill-alt</option>
# <option value="moon">&#xf186; moon</option>
# <option value="newspaper">&#xf1ea; newspaper</option>
# <option value="object-group">&#xf247; object-group</option>
# <option value="object-upgroup">&#xf248; object-upgroup</option>
# <option value="paper-plane">&#xf1d8; paper-plane</option>
# <option value="pause-circle">&#xf28b; pause-circle</option>
# <option value="play-circle">&#xf144; play-circle </option>
# <option value="plus-square">&#xf0fe; plus-square</option>
# <option value="question-circle">&#xf059; question-circle</option>
# <option value="registered">&#xf25d; registered</option>
# <option value="sad-cry">&#xf5b3; sad-cry</option>
# <option value="sad-tear">&#xf5b4; sad-tear</option>
# <option value="save">&#xf0c7; save</option>
# <option value="share-square">&#xf14d; share-square</option>
# <option value="smile">&#xf118; smile</option>
# <option value="smile-beam">&#xf5b8; smile-beam </option>
# <option value="smile-wink">&#xf4da; smile-wink</option>
# <option value="snowflake">&#xf2dc; snowflake</option>
# <option value="square">&#xf0c8; square</option>
# <option value="star">&#xf005; star</option>
# <option value="star-half">&#xf089; star-half</option>
# <option value="sticky-note">&#xf249; sticky-note</option>
# <option value="stop-circle">&#xf28d; stop-circle</option>
# <option value="sun">&#xf185; sun</option>
# <option value="surprise">&#xf5c2; surprise </option>
# <option value="thumbs-down">&#xf165; thumbs-down</option>
# <option value="thumbs-up">&#xf1164; thumbs-up</option>
# <option value="times-circle">&#xf057; times-circle</option>
# <option value="tired">&#xf5c8; tired</option>
# <option value="trash-alt">&#xf2ed; trash-alt</option>
# <option value="user">&#xf007; user</option>
# <option value="user-circle">&#xf2bd; user-circle</option>
# <option value="window-close">&#xf410; window-close</option>
# <option value="window-maximize">&#xf2d0; window-maximize </option>
# <option value="window-minimize">&#xf2d1; window-minimize</option>
# <option value="window-restore">&#xf2d2; window-restore</option>
