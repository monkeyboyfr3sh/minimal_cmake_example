#include <QApplication>
#include <QWidget>
#include <QPushButton>
#include <QMessageBox>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Create a QWidget (main window)
    QWidget window;
    window.setWindowTitle("Qt Widget Example");

    // Create a QPushButton
    QPushButton *button = new QPushButton("Click Me", &window);

    // Connect a slot (function) to the button's click signal
    QObject::connect(button, &QPushButton::clicked, [&](){
        // Create a QMessageBox
        QMessageBox::information(&window, "Message", "Button clicked!");
    });

    // Set the size of the main window
    window.resize(300, 200);

    // Show the main window
    window.show();

    // Run the application's event loop
    return app.exec();
}
