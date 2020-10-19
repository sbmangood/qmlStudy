import QtQuick 2.0

import QtQuick.Layouts 1.1
Rectangle{
    width: 360;
    height: 240;
    color: "#EEEEEE";
    id:rootItem;

    Text{
        id:centerText;
        text:"A single Text";
        font.pixelSize: 24;
        font.bold: true;
    }

    function setTextColor(cl){
        centerText.color=cl;
    }

    Row{
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        spacing: 4;

        M_colorPicker{
            color:Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            onColorPicked: setTextColor(cl);
        }
        M_colorPicker{
            color:Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            onColorPicked: setTextColor(cl);
        }
        M_colorPicker{
            color:Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            onColorPicked: setTextColor(cl);
        }
        M_colorPicker{
            color:Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            onColorPicked: setTextColor(cl);
        }
        M_colorPicker{
            color:Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            onColorPicked: setTextColor(cl);
        }
    }
}
