import QtQuick 2.0

Rectangle{

    width: 800;
    height: 480;
    id:root;

    property Component reminderCop: null;
    property var reminderWin: null;

    function showReminder(){
        if(reminderCop==null){
            reminderWin=Qt.createQmlObject("reminder.qml");
        }

        if(reminderWin==null){
            reminderWin=reminderCop.createObject(
                            root,
                            {
                                "width":300,"height":200,
                                "x":(width-300)/2,
                                "y":(height-200)/2,
                                "color":"blue"
                            }
                        );
        }
    }


//    Component.onCompleted: {
//        var name="zhang san";
//        console.log(typeof name);
//        console.log(typeof 60);

//        var temp
//        if(undefined===temp){
//            console.log("undefine");
//        }
//        else{
//            console.log(temp);
//        }
//        temp="not null";
//        if(temp===undefined){
//            console.log("undefine");
//        }
//        else{
//            console.log(temp);
//        }
//    }
}
