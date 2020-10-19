import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle{
    width: 360;
    height: 300;
    color: "#eeeeee";

    Component{
        id:phoneDelegate;
        Item{
            id:wrapper;
            width: parent.width;
            height: 30;

            MouseArea{
                anchors.fill: parent;
                onClicked: wrapper.ListView.view.currentIndex=index;
                onDoubleClicked: {
                    wrapper.ListView.view.model.remove(index);
                    listView.footerItem.text="None";
                }
            }

            RowLayout{
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 8;
                Text{
                    id:coll;
                    text: name;
                    color: wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                    Layout.preferredWidth: 120;
                }

                Text{
                    text:cost;
                    color:wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize:
                        wrapper.ListView.isCurrentItem ? 22 :18;

                    Layout.preferredWidth: 80;

                }

                Text{
                    text:manufacturer;
                    color:wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 :18;
                    Layout.fillWidth: true;
                }
            }


        }

    }

    Component{
        id:headerView;
        Item{
            width: parent.width;
            height: 30;
            RowLayout{
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing:8;
                Text {

                    text: qsTr("Name");
                    font.bold:true;
                    font.pixelSize: 20;
                    Layout.preferredWidth: 120;
                }

                Text{
                    text:"Cost";
                    font.bold:true;
                    font.pixelSize: 20;
                    Layout.preferredWidth: 80;
                }

                Text{
                    text:"Manufacturer";
                    font.bold: true;
                    font.pixelSize: 20;
                    Layout.fillWidth: true;
                }
            }
        }
    }

    Component{
        id:phoneModel;
        ListModel{
            ListElement{
                name:"iPhone 3G";
                cost:"1000";
                manufacturer:"Apple";
            }

            ListElement{
                name:"iPhone 4";
                cost:"1800";
                manufacturer:"Apple";
            }
            ListElement{
                name:"iPhone 4s";
                cost:"2000";
                manufacturer:"Apple";
            }
            ListElement{
                name:"iPhone 5";
                cost:"4000";
                manufacturer:"Apple";
            }
            ListElement{
                name:"P5";
                cost:"4000";
                manufacturer:"Huawei";
            }
        }
    }

    Component{
        id:footerView;
        Item{
            id:footerRootItem;
            width: parent.width;
            height: 30;
            property alias text: txt.text;

            signal clean();
            signal add();

            Text{
                id:txt;
                width: parent.width;
                font.italic: true;
                color:"blue";
                height: 30;
                verticalAlignment: Text.AlignVCenter;
            }

            Button{
                id:clearAll;
                anchors.right: parent.right;
                anchors.verticalCenter: parent.verticalCenter;
                text:"Clear";
                onClicked: {

                    footerView.clean;
                }
            }
            Button{
                id:addOne;
                anchors.right: clearAll.left;
                anchors.rightMargin: 4;
                anchors.verticalCenter: parent.verticalCenter;
                text:"Add";
                onClicked: footerRootItem.add();
            }
        }


    }

    Component{
        id:sectionHeader;
        Rectangle{
            width: parent.width;
            height: childrenRect.height;
            color:"lightsteelblue";
            Text{
                text:section;
                font.bold:true;
                font.pixelSize: 20;
            }
        }
    }

    ListView{
        id:listView;
        anchors.fill: parent;
        delegate: phoneDelegate;
        header:headerView;
        footer: footerView;
        model: phoneModel.createObject(ListView);

        focus: true;
        highlight: Rectangle{
            color:"lightblue";
        }

        onCurrentIndexChanged: {
            if(listView.currentIndex>=0){
                var data=listView.model.get(listView.currentIndex);
                listView.footerItem.text=data.name+" ,"+data.cost+" ,"+data.manufacturer;
            }
            else{
                listView.footerItem.text="";
            }
        }

        function addOne(){
            model.append(
                     {
                         "name":"MX3",
                         "cost":"1888",
                         "manufacturer":"Meizu"
                     }
                );
        }

        Component.onCompleted: {
            listView.footerItem.clean.connect(listView.model.clear);
            listView.footerItem.add.connect(listView.addOne);
        }

        section.property: "manufacturer";
        section.criteria: ViewSection.FullString;
        section.delegate: sectionHeader;
    }
}


