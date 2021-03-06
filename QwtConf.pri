################################################################
# Qwt Widget Library
# Copyright (C) 1997   Josef Wilgen
# Copyright (C) 2002   Uwe Rathmann
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the Qwt License, Version 1.0
###################################################################

# This file is modified from "examples.pri" of qwt library

# Set the correct path to qwt library
QWT_ROOT = "c:/Qt/qwt-6.1.3"

include( $${QWT_ROOT}/qwtconfig.pri )
include( $${QWT_ROOT}/qwtbuild.pri )
include( $${QWT_ROOT}/qwtfunctions.pri )

# Set the correct path to output qwt directories
QWT_OUT_ROOT = "c:/Qt/build-qwt-Desktop_Qt_5_4_2_MSVC2010_OpenGL_32bit-Debug"

TEMPLATE     = app

INCLUDEPATH += $${QWT_ROOT}/src
DEPENDPATH  += $${QWT_ROOT}/src

QMAKE_RPATHDIR = $${QWT_OUT_ROOT}/lib
qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)


greaterThan(QT_MAJOR_VERSION, 4) {

    QT += printsupport
    QT += concurrent
}

contains(QWT_CONFIG, QwtFramework) {

    LIBS      += -F$${QWT_ROOT}/lib
}
else {

    LIBS      += -L$${QWT_ROOT}/lib
}

contains(QWT_CONFIG, QwtOpenGL ) {

    QT += opengl
}
else {

    DEFINES += QWT_NO_OPENGL
}

contains(QWT_CONFIG, QwtSvg) {

    QT += svg
}
else {

    DEFINES += QWT_NO_SVG
}


win32 {
    contains(QWT_CONFIG, QwtDll) {
        DEFINES    += QT_DLL QWT_DLL
    }
}
