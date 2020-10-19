import QtQuick 2.2
import QtQuick.Controls 1.2


Rectangle{
    width: 480;
    height: 320;
    color: "#121212";

    BusyIndicator{
        id:busy;
        running: true;

        anchors.centerIn: parent;
        z:2;
    }

    Text{
        id:stateLabel;
        visible: false;
        anchors.centerIn: parent;
        z:3;
    }

    Image{
        id:imgViewer;
        asynchronous: true;
        cache:false;

        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
        onStatusChanged: {
            if(imgViewer.status==Image.Loading){
                busy.running=true;
                stateLabel.visible=false;
            }
            else if(imgViewer.status==Image.Ready){
                busy.running=false;
            }
            else if(imgViewer.status==Image.Error){
                busy.running=false;
                stateLabel.visible=true;
                stateLabel.text="Error image";
                stateLabel.color="red";
            }
        }
    }

    Component.onCompleted: {
        imgViewer.source="http://pic.sc.chinaz.com/files/pic/pic9/202010/hpic3003.jpg";
    }
}

