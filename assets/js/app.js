// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import $ from "jquery"
import "phoenix_html"
import socket from "./socket"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".
//

let channel = socket.channel("content_preview_channel", {})

channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("formatted_content", payload => {
    console.log(payload)
    $("#content-preview").html(payload.doc);
})

window.EditorConfig = {
    lineNumbers: true,
    theme: 'monokai',
    mode: 'xml',
    htmlMode: true,
    height: "auto",
}

$(document).ready(function() {
  // Menu toggle
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("active");
  });

  //CodeMirror
  CodeMirror.fromTextArea(document.getElementById("layouts_content"),
      window.EditorConfig
  ).on('change', editor => {
      channel.push("content_edited", { body: editor.getValue() })
  })
});