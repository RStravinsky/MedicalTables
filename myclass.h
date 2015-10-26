#ifndef MYCLASS_H
#define MYCLASS_H

#include <QDebug>
#include <QObject>

class MyClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ imagePath WRITE setImagePath NOTIFY pathChanged);
public:
    explicit MyClass(QObject *parent = 0);
    MyClass(QString path)
    {
        m_imagePath = path;
    }
    QString imagePath();
    void setImagePath(const QString & path);

public slots:
    void buttonClicked(const int &in);
    void mainButtonClicked( const QString &in);

    signals:
    void pathChanged();


private:
    QString m_imagePath;

};

#endif // MYCLASS_H
