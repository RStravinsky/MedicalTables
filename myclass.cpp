#include "myclass.h"

MyClass::MyClass(QObject *parent) :
    QObject(parent)
{
}

void MyClass::buttonClicked(const int &in)
{
    qDebug() << in;
}

void MyClass::mainButtonClicked( const QString &in)
{
    qDebug() << in;
}

QString MyClass::imagePath()
{
    return m_imagePath;
}

void MyClass::setImagePath(const QString &path)
{
    if (path != m_imagePath)
       m_imagePath = path;
}
