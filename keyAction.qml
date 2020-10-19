import QtQuick 2.6

Rectangle
{
    width: 300;
    height: 200;
    color:"#C0C0C0";
    focus: true;

    Keys.enabled: true;
    Keys.onEscapePressed: Qt.quit();//按ESC 键
    Keys.onBacktabPressed: Qt.quit();//back tab;

    Keys.onPressed: {
        switch(event.key){
        case Qt.Key_0:
        case Qt.Key_1:
        case Qt.Key_2:
        case Qt.Key_3:
        case Qt.Key_4:
        case Qt.Key_5:
        case Qt.Key_6:
        case Qt.Key_7:
            event.accepted=true;
            keyView.text=event.key-Qt.Key_0;
            break;
        }
    }

    Text{
        id:keyView;
        font.bold: true;
        font.pixelSize: 24;
        text:qsTr("test");
        anchors.centerIn: parent;
        //anchors.fill: parent;
    }

}
