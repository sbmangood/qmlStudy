import QtQuick 2.0

Flickable{
    width: 200;
    height: 200;
    contentWidth: image.width;
    contentHeight: image.height;
    anchors.fill: parent;

    Image{
        //anchors.fill: parent;
        id:image;
        source:"./images/testImage.jpg";
    }
}
