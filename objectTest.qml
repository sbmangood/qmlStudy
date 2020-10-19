import QtQuick 2.2

Rectangle{
    id:root;
    Component.onCompleted: {
        var obj= {
            "sex":"man"
        }

        console.log(obj.toString());
        console.log(obj.constructor);

        console.log(root.hasOwnProperty("width"));
        console.log(Item.isPrototypeOf(root));
        console.log(root.propertyIsEnumerable("children"));
        console.log(root.toString());
        console.log(root.valueOf());

        obj.name="zhang san";
        obj.printName=function printName( num){
//            var Number(num);
            console.log("name: ",this.name,"  age： ",num ,"  sex: ",this.sex);
        }

        obj.printName(18);

        for(var prop in obj ){
            console.log(prop,",",obj[prop]);
        }
        obj.name="li si";
        obj["sex"]="nv";
        obj["printName"](20);
    }
}
