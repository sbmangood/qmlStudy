import QtQuick 2.6

Item {
    Rectangle{
        width: 300;
        height: 200;

        Rectangle{
            id:rect1;
            anchors.left: parent.left;
            anchors.leftMargin: 20;
            anchors.top: parent.top;
            anchors.topMargin: 20;

            width: 120;
            height: 120;
            gradient: Gradient{
                GradientStop{
                    position: 0.0;
                    color: "blue";
                }
                GradientStop{
                    position: 0.0;
                    color: "gray";
                }
            }
        }

        Rectangle{
            anchors.left: rect1.right;
            anchors.leftMargin: 20;
            anchors.top: rect1.top;
            width: 120;
            height: 120;
            rotation: 90;

            color: "red";
        }

        anchors.fill: parent;


    }

}
