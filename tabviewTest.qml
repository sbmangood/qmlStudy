import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Rectangle {
    width: 360;
    height: 240;
    color: "lightgray";
    id:root;
    property var icons: ["./images/1.jpg","./images/2.jpg","./images/3.jpg"];
    Component.onCompleted: {
        tabView.addTab("ABC",tabContent);
        tabView.addTab("ZYY",tabContent);
        tabView.addTab("MFW",tabContent);
    }
    Component{
        id:tabContent;
        Rectangle{
            implicitHeight: 100;
            implicitWidth: 100;
            anchors.fill: parent;
            color: Qt.rgba(Math.random(),Math.random(),Math.random());
        }
    }

    TabView{
        id:tabView;
        anchors.fill: parent;
        style:TabViewStyle{
            tab:Item{
                implicitWidth: Math.max(text.width+8,80);
                implicitHeight: 48;
//                Rectangle{
//                    width: (styleData.index<control.count-1) ? (parent.width-2) : parent.width;
//                    height: parent.height-4;
//                    anchors.top: parent.top;
//                    anchors.left: parent.left;
//                    anchors.leftMargin: 1;
//                    visible: styleData.selected;

//                    gradient: Gradient{
//                        GradientStop{position : 0.0;color:"#606060";}
//                        GradientStop{position : 0.5;color:"#C0C0C0";}
//                        GradientStop{position : 1.0;color:"#A0A0A0";}
//                    }
//                }

                Rectangle{
                    width: 2;
                    height: parent.height-4;
                    anchors.top:parent.top;
                    anchors.right: parent.right;
                    visible: styleData.index<control.count-1;

                    gradient: Gradient{
                        GradientStop{position : 0.0;color:"#404040";}
                        GradientStop{position : 0.5;color:"#707070";}
                        GradientStop{position : 1.0;color:"#A0A0A0";}
                    }
                }

                RowLayout{
                    implicitWidth: Math.max(text.width,90);
                    height: 48;
                    anchors.centerIn: parent;
                    z:1;
                    Image{
                        width: 48;
                        height: 48;
                        source:root.icons[styleData.index%3];
                    }
                    Text{
                        id:text;
                        text:styleData.title;
                        color:styleData.selected ? "blue" : (styleData.hovered ? "green" : "red");
                    }

                }
            }

            tabBar: Rectangle{
                height: 56;
                gradient: Gradient{
                    GradientStop{position : 0.0;color:"red";}
                    GradientStop{position : 0.5;color:"blue";}
                    GradientStop{position : 1.0;color:"yellow";}
                }

                Rectangle{
                    width: parent.width;
                    height: 4;
                    anchors.bottom: parent.bottom;
                    border.width: 2;
                    border.color: "#c7c7c7";
                }
            }
        }
    }
}
