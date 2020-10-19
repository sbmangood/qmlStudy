import QtQuick 2.6

Rectangle {
    width: 320;
    height: 200;
    color: "blue";

//    Text{
//        width: 150;
//        height: 100;
//        wrapMode: Text.WordWrap;
//        font.bold: true;
//        font.pixelSize: 24;
//        font.underline: true;
//        text:"Hello world";
//        anchors.centerIn: parent;
//        color:"blue";
//    }

    Text{
        width: 150;
        height: 100;
        wrapMode: Text.WordWrap;
        font.bold: true;
        font.pixelSize: 24;
        font.underline: true;
        text:"Hello <font color=\"red\">world</font>";//仅仅把world显示为红色
        anchors.centerIn: parent;
       // color:"blue";
    }
}
