import QtQuick 2.0

Rectangle{
    width: 480;
    height: 400;
    id:root;
    Canvas{
        id:randomImgData;
        width: 120;
        height: 100;
        contextType: "2d";
        property var imageData:null;
        onPaint: {
            if(imageData==null){
                imageData=context.createImageData(120,100);//contxt 就是画师
                for(var i=0;i<48000;i+=4){
                    imageData.data[i]=Math.floor(Math.random()*255);
                    imageData.data[i+1]=Math.floor(Math.random()*255);
                    imageData.data[i+2]=Math.floor(Math.random()*255);
                    imageData.data[i+3]=255;
                }
            }

            context.drawImage(imageData,0,0);
        }
    }

    Canvas{
        id:imageCanvas;
        property var poster: "./images/1.jpg";
        anchors.left: parent.left;
        anchors.top:randomImgData.bottom;
        anchors.topMargin: 20;
        width: 200;
        height: 230;
        onPaint: {
            var ctx=getContext("2d");
            ctx.drawImage(poster,0,0,width,height);
        }

        Component.onCompleted: loadImage(poster);
        onImageLoaded: {
            requestPaint();
            negative.setImageData(getContext("2d").createImageData(poster));

        }
    }

    Canvas{
        id:negative;
        anchors.left: imageCanvas.right;
        anchors.leftMargin: 10;
        anchors.top:imageCanvas.top;
        width: 200;
        height: 230;
        contextType: "2d";
        property var imageData: null;

        onPaint: {
            if(imageData!==null){
                context.drawImage(imageData,0,0,width,height);

            }
        }

        function setImageData(data){
            imageData=data;
            var limit=data.width*data.height*4;

            for(var i=0;i<limit;i+=4){
                imageData.data[i]=255-data.data[i];
                imageData.data[i+1]=255-data.data[i+1];
                imageData.data[i+2]=255-data.data[i+2];
                imageData.data[i+3]=data.data[i+3];
            }
            requestPaint();
        }


    }
}
