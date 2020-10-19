import QtQuick 2.0


Canvas{
    width: 400;
    height: 240;
    id:root;
    Image{
        id:img;
        source: "./images/3.jpg";
        visible: false;
        onStateChanged: {
            if(status==Image.Ready){
                root.requestPaint();
            }
        }
    }

    onPaint: {
        var ctx=getContext("2d");
        ctx.lineWidth=4;
        ctx.strokeStyle="red";
        var gd1=ctx.createLinearGradient(60,50,180,130);
        gd1.addColorStop(0.0,Qt.rgba(1,0,0,1.0));
        gd1.addColorStop(1.0,Qt.rgba(0,0,1,1.0));
        ctx.fillStyle=gd1;

        ctx.beginPath();
        ctx.rect(60,50,120,80);
        ctx.fill();
        ctx.stroke();

        ctx.drawImage(img,10,10);

    }
}
