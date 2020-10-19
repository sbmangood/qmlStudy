import QtQuick 2.0

Rectangle{
    id:m_colorPicker;
    width: 50;
    height: 30;
    signal colorPicked(color cl);

    function configureBorder(){
        m_colorPicker.border.width=m_colorPicker.focus ? 2 : 0;
        m_colorPicker.border.color=m_colorPicker.focus ? "#90D750" : "#808080";
    }

    MouseArea{
        anchors.fill: parent;
        onClicked: {
            m_colorPicker.colorPicked(m_colorPicker.color);
            mouse.accepted=true;
            m_colorPicker.focus=true;


        }
    }


    Keys.onReturnPressed: {
        m_colorPicker.colorPicked(m_colorPicker.color);
        event.accepted=true;
    }

    Keys.onSelectPressed: {
        m_colorPicker.colorPicked(m_colorPicker.color);
        event.accepted=true;
    }

    onFocusChanged: {
        configureBorder();


    }

    Component.onCompleted: {
        configureBorder();
    }

}
