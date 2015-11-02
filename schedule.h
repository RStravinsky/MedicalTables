#ifndef SCHEDULE_H
#define SCHEDULE_H

#include <QObject>
#include <QtXlsx>

class Schedule : public QObject
{
    Q_OBJECT
    Q_PROPERTY( QString m_documentTitle READ documentTitle NOTIFY documentTitleChanged)
    QXlsx::Document m_schedule;
    QString m_documentTitle;

public:
    explicit Schedule(QObject *parent = 0);
    explicit Schedule(QString fName, QObject *parent = 0) : QObject(parent), m_schedule(fName) {}
    Q_INVOKABLE void test();
    QString documentTitle() {
        m_documentTitle = m_schedule.documentProperty("title");
        return m_documentTitle;
    }


signals:
    void documentTitleChanged();

public slots:


};

#endif // SCHEDULE_H
