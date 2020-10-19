import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {

       width: 320;
       height: 240;
       color: "red";
       Text{
           id:text;
           anchors.centerIn: parent;
           text:"Hello";
           color: "blue";
           font.pixelSize: 32;
       }
       Button{
           id:button;

       }
       Image{
           id:image;
       }

       Component.onCompleted: {
           console.log("-",text);
           console.log("-",button);
           console.log("-",image);
       }
}
