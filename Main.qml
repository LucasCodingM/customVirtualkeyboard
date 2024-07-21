import QtQuick

Window {
    id:windowMain
    objectName: "windowMain"
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Rectangle {
        color: "#134B70"
        anchors {left: parent.left;  right: parent.right;  top: parent.top;  margins: 10}
        height: 100
        radius: 5

        TextInput {
            id: textInput
            anchors {left: parent.left;  right: parent.right;  leftMargin: 10; verticalCenter: parent.verticalCenter;}
            font.pixelSize: 0.5 * parent.height
            cursorVisible: true
        }
    }

    Component.onCompleted: keyboardController.show()

    KeyboardController {
        id: keyboardController
        target: textInput
    }



}
