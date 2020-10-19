import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 320;
    height: 440;
    color: "gray";



        Component{
            id:btnStyle;
            ButtonStyle{
                background:Rectangle{
                    implicitWidth : 150;
                    implicitHeight: 25;
                    border.width: control.pressed? 2:1;
                    border.color: (control.hovered|| control.pressed ? "green":"#888888");

                }
            }
        }
        Button{
            style: btnStyle;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            anchors.top: parent.top;
            id:btn1;
            text: "Btn1";
        }
        Button{
            style: btnStyle;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            id:btn2;
            anchors.top:btn1.bottom;
            anchors.topMargin: 20;
            text: "Btn2";
        }
        Button{
            style: btnStyle;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            id:btn3;
            anchors.top:btn2.bottom;
            anchors.topMargin: 20;
            text: "Btn3";
        }

        Image{
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            anchors.top: btn3.bottom;
            anchors.topMargin: 20;
            width: 200;
            height: 200;
            fillMode: Image.PreserveAspectFit;
            source:"images/testImage.jpg";
        }



}
