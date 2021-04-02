import QtQuick 2.12
import QtQuick.Window 2.12

Window {
        visible: true
        width: 800
        height: 640
        title: qsTr("Hello World")
        property bool run: false

        MouseArea {
                focus: true
                width : 800
                height: 640
                onClicked: {
                        run = !run
                        springanimateexample.x = mouse.x - springanimateexample.width/2
                        springanimateexample.y = mouse.y - springanimateexample.height/2

                }
        }

        // Below animation is example of the component embedded animation
        Rectangle {
                 width: 200
                 height : 200
                 color : "blue"
                 x:0
                 y:20

         NumberAnimation on x {
                 from :0
                 to : 500
                 duration: 1000
                 running: run
         }

        }
        // Below animation is example of multiple properties usage with given target
        Rectangle {
                id : secondexample
                width: 200
                height : 200
                color : "pink"
                rotation: 20
                x:100
                y:50
        }

        NumberAnimation {
                // x , y
                target : secondexample
                properties: "x,y"
                from : 100
                to : 230
                duration : 1000
                running:  run
        }

        NumberAnimation {
                // width and height change
                target : secondexample
                properties: "width, height"
                from : 200
                to : 300
                duration : 1000
                running:  run
        }

        NumberAnimation {
                // rotation
                target : secondexample
                properties: "rotation"
                from : 0
                to : 90
                duration : 2500
                running:  run
        }

        // Rotation Animation :
        Rectangle {
                id : coloranimationexample
                width: 200
                height : 200
                color : "yellow"
                rotation: 20
                x:300
                y:50
        }

        RotationAnimation {
                target : coloranimationexample
                from: 0
                to: 230
                duration: 1000
                running: run
        }

        // Behavior spring Animation
        Rectangle {
                id : springanimateexample
                width: 100
                height : 100
                color : "purple"
                x:100
                y:250
                Behavior on x {
                        SpringAnimation { spring: 0.5; damping : 0.2}
                }
                Behavior on y {
                        SpringAnimation{spring : 1; damping : 1}
                }
        }

        // with Easing Type x movement

        Rectangle {
                id : easingexample
                width: 100
                height : 100
                color : "cyan"
                x:100
                y:500
               NumberAnimation on x{
                       from : 100
                       to : 700
                       easing.type : Easing.OutExpo
                       duration:2000
                       running : run
               }
        }

        // sequential example
        Rectangle {
                id : sequentialexample
                width: 100
                height : 100
                color : "green"
                x:250
                y:500
                opacity : 1
                Text{
                        text: "Sequential"
                }
        }

        // sequential animation work for sequence.
        // each animation on queue, when current finish skip the next.
        SequentialAnimation {
                NumberAnimation {
                        target : sequentialexample
                        properties: "x"
                        from : 250
                        to : 500
                        duration :2000
                }

                // pause animation make pause between animations
                PauseAnimation {
                        duration: 200
                }

                PropertyAnimation {
                        target : sequentialexample
                        properties: "width"
                        from : 100
                        to : 250
                        duration: 1000
                }

                PropertyAnimation {
                        target: sequentialexample
                        properties:  "height"
                        duration: 1000
                        from : 100
                        to : 300
                        easing.type: Easing.InOutQuad
                }


                running : run

        }


        // Parallel Animation, Each Animation work Parallell
        Rectangle {
                id : parallelexample
                width: 100
                height : 100
                color : "black"
                x:450
                y:500
                opacity : 1
                Text{
                        text: "parallel"
                        color : "white"
                        id : paralleltext
                }
        }

        ParallelAnimation {

                PropertyAnimation {
                        target: parallelexample
                        properties: "height"
                        duration: 1000
                        from : 100
                        to : 300
                        easing.type: Easing.InOutQuad
                }


                ColorAnimation {
                        from: "white"
                        to: "black"
                        duration:1000
                        easing.type: Easing.InOutQuad
                        target : paralleltext
                        properties: "color"
                }

                running: run



        }





}
