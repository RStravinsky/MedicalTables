#ifndef MAINIMAGESOURCE
#define MAINIMAGESOURCE
#include <QObject>

#include <QObject>

class MainImageSource : public QObject
{
    Q_PROPERTY(QString mainImageSource READ getMainImageSource NOTIFY sourceChanged)
    Q_OBJECT
public:
    explicit MainImageSource(QObject *parent = 0): QObject(parent) {}
    MainImageSource(QString _source): m_imageSource(_source) {}

    inline QString getMainImageSource() const {
        return m_imageSource;
    }

signals:
    void sourceChanged( QString _source );

private:
    QString m_imageSource;
};

#endif // MAINIMAGESOURCE

