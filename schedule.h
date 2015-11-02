#ifndef SCHEDULE_H
#define SCHEDULE_H

#include <QObject>
#include <QtXlsx>

class Schedule : public QObject
{
    Q_OBJECT
    QXlsx::Document m_schedule;

public:
    explicit Schedule(QObject *parent = 0);
    Q_INVOKABLE void testSave();


signals:
    void documentTitleChanged();

public slots:


};

#endif // SCHEDULE_H
