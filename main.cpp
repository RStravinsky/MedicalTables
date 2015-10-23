#include <QApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QRect>
#include <QDebug>
#include <QDesktopWidget>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QRect screenRec = QApplication::desktop()->availableGeometry();
    int screenHeight = screenRec.height();
    int screenWidth = screenRec.width();

    app.setWindowIcon(QIcon("qrc:/images/logo.ico"));
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
