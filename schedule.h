#ifndef SCHEDULE_H
#define SCHEDULE_H

#include <QObject>
#include <QtXlsx>

class Schedule : public QObject
{
    Q_OBJECT
    QXlsx::Document m_schedule;
    QString activeTable;

public:
    explicit Schedule(QString filename, QObject *parent = 0) : QObject(parent), m_schedule(filename) {}
    Q_INVOKABLE void generateSchedule();


signals:

public slots:
    void activeMainButton(const QString &buttonName);
    void gridState(const QString &state);

};

#endif // SCHEDULE_H
