import QtQuick 2.0

import QtQuick.Controls 1.2

Rectangle{
    id:rootItem;
    width: 360;
    height: 360;
    property var count: 0;
    property Component compt: null;

    Text{
        id:coloredText;
        text:"Hello";
        anchors.centerIn: parent;
        font.pixelSize: 24;
    }

    function changeTextColor(cl){
        coloredText.color=cl;
    }

    function createColorPicker(cl){
        if(rootItem.compt==null){
            rootItem.compt=Qt.createComponent("M_colorPicker.qml");
        }

        var colorPicker;
        if(rootItem.compt.status==Component.Ready){
            colorPicker=rootItem.compt.createObject(rootItem,{
                                                        "color":cl,"x":rootItem.count*55,"y":10
                                                    }
                                                        );

            colorPicker.colorPicked.connect(rootItem.changeTextColor);

            if(rootItem.count%2==1){
                colorPicker.destroy(1000);
            }
        }
        rootItem.count++;

    }
    Button{
        id:add;
        text:"add";
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        onClicked: {
            createColorPicker(Qt.rgba(Math.random(),Math.random(),Math.random(),1));
        }
    }
}

