#ifndef OPTIONSLIST_H
#define OPTIONSLIST_H

#include <QObject>

class OptionsList : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int Temp READ Temp WRITE setTemp NOTIFY TempChanged)
public:
    explicit OptionsList(QObject *parent = 0);
    int getTemp() const;
    void setTemp(int temp);

signals:
    void tempChanged();

public slots:
};

#endif // OPTIONSLIST_H
