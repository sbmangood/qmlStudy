import QtQuick 2.0

Rectangle{
    width: 320;
    height: 240;
    color: "#c0c0c0";

    Text{
        id:colroredText;
        anchors.horizontalCenter:parent.horizontalCenter;
        anchors.top:parent.top;
        anchors.topMargin: 4;
        text:"Hello";
        font.pixelSize: 32;

        function printText(tx){
            console.error(tx);
        }
        function printText2(tx){
            console.error(tx);
        }
    }


    Component{
        id:colorCompt;
        Rectangle{
            id:colorPicker;
            width: 100;
            height: 40;

            Text{
                text:"Click";
                anchors.horizontalCenter:parent.horizontalCenter;
                anchors.verticalCenter:parent.verticalCenter;
            }

            signal colorPicked(color cl);
            signal sentInt(int num);
            signal printSig(string str);

            MouseArea{
                anchors.fill: parent;

                onPressed:colorPicker.colorPicked(colorPicker.color);
                onReleased:{
                    colorPicker.sentInt(colorPicker.height);
                    colorPicker.printSig("test connect");
                }

            }
        }
    }

    Loader{
        id:redLoader;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom:parent.bottom;
        anchors.bottomMargin: 4;
        sourceComponent: colorCompt;

        onLoaded:{
            item.color="red";
            item.printSig.connect(colroredText.printText2);

        }
    }

    Loader{
        id:blueLoader;
        anchors.left:redLoader.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        sourceComponent: colorCompt;

        onLoaded: {
            item.color="blue";
            item.height=34;
            item.printSig.connect(colroredText.printText2);

        }
    }

    Connections{
        target: redLoader.item;
        onColorPicked:{
            colroredText.color=cl;
        }
        onSentInt:{
            colroredText.printText("redLoader");
            console.log("height:",num);

        }
    }
    Connections{
        target: blueLoader.item;
        onColorPicked:{
            colroredText.color=cl;
        }
        onSentInt:{
            colroredText.printText("redLoader");
            console.log("height:",num);
        }

    }
}
