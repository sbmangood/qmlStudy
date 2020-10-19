import QtQuick 2.0

Rectangle {

    width: 320;
    height: 200;
    Text {
        id: normal;
        text: qsTr("Normal text");
        anchors.left: parent.Left;
        anchors.leftMargin: 20;
        anchors.top: parent.top;
        anchors.topMargin: 20;
        font.pointSize:24;

    }
    Text {
        id: raised;
        text: qsTr("Raised text");
        anchors.left: normal.left;

        anchors.top: normal.bottom;
        anchors.topMargin: 4;
        font.pointSize: 24;
        style: Text.Raised;
        styleColor: "red";

    }
    Text {
        id: outLine;
        text: qsTr("Outline text");
        anchors.left: normal.left;
        anchors.top: raised.bottom;
        anchors.topMargin: 4;
        font.pointSize: 24;
        style: Text.Outline;
        styleColor: "red";

    }
    Text {
        id: sunken;
        text: qsTr("Sunken text");
        anchors.left: normal.left;
        anchors.top: outLine.bottom;
        anchors.topMargin: 4;
        font.pointSize: 24;
        style: Text.Sunken;
        styleColor: "#A00000";

    }
}
