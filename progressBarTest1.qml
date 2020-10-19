import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle{
    ProgressBar{
        minimumValue: 0;
        maximumValue: 1;
        value: 0.2;
        width: 400;
        height: 20;

        anchors.centerIn: parent;

        style: ProgressBarStyle{
            background: Rectangle{
                implicitWidth: 400;
                implicitHeight: 20;
                border.width: 1;
                border.color: control.hovered ? "green" : "gray";
                color:"lightgray";
            }

            progress: Rectangle{
                color:"red";
            }
        }

    }
}
