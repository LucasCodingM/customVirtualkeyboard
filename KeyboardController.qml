import QtQuick

Item {
    id: root
    objectName: "root"

    signal accepted(string text);   // onAccepted: print('onAccepted', text)
    property Item target
    property bool isKeyboardActive: false

    function show() {

        if(!isKeyboardActive && keyboard === null)
        {

            // var rootObject = null, object = parent // search up the parent chain to find QQuickView::rootObject()
            // while(object) {
            //     if(object)  rootObject = object
            //     object = object.parent
            // }

            keyboard = keyboardComponent.createObject(windowMain)
            keyboard.target = root.target

            isKeyboardActive = true
        }
        else
        {
            console.info("The keyboard is already shown")
        }
    }

    function hide()
    {
        if(isKeyboardActive && keyboard !== null)
        {
            keyboard.destroy()
            isKeyboardActive = false
        }
        else
            console.info("The keyboard is already hidden")
    }



    // private
    property Item keyboard: null
    Component {id: keyboardComponent;  Keyboard {}}
}
