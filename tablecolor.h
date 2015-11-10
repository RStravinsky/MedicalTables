#ifndef TABLECOLOR_H
#define TABLECOLOR_H

#include <QObject>
#include <QQmlListProperty>

class tablecolor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString color READ color NOTIFY colorChanged)

public:
    explicit tablecolor(QObject *parent = 0);
    tablecolor(QString color): m_color(color) {}

    inline QString color() const {
        return m_color;
    }

public slots:

signals:
    void colorChanged( QString color );

private:
    QString m_color;
};


#endif // TABLECOLOR_H
