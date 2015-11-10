#ifndef IMAGESPATH_H
#define IMAGESPATH_H

#include <QObject>

class ImagesPath : public QObject
{
    Q_PROPERTY(QString imageSource READ imageSource NOTIFY sourceChanged)
    Q_OBJECT
public:
    explicit ImagesPath(QObject *parent = 0);
    ImagesPath(QString path): m_imageSource(path) {}

    inline QString imageSource() const {
        return m_imageSource;
    }

signals:
    void sourceChanged( QString path );

private:
    QString m_imageSource;
};

#endif // IMAGESPATH_H
