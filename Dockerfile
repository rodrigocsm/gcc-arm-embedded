#Imagem base
FROM gcc:8

#Assinatura
MAINTAINER Rodrigo Martins

#Determina as variáveis que definem a versão do Toolchain
ENV TOOLCHAIN_NAME gcc-arm-none-eabi
ENV TOOLCHAIN_GCC_VERSION 8
ENV TOOLCHAIN_YEAR 2018
ENV TOOLCHAIN_QUARTER q4
ENV TOOLCHAIN_REVISION major
ENV TOOLCHAIN_OS linux
ENV TOOLCHAIN_PACKAGE tar.bz2
ENV TOOLCHAIN_FILE ${TOOLCHAIN_NAME}-${TOOLCHAIN_GCC_VERSION}-${TOOLCHAIN_YEAR}-${TOOLCHAIN_QUARTER}-${TOOLCHAIN_REVISION}-${TOOLCHAIN_OS}.${TOOLCHAIN_PACKAGE}
ENV TOOLCHAIN_DOWNLOAD_URL https://developer.arm.com/-/media/Files/downloads/gnu-rm/${TOOLCHAIN_GCC_VERSION}-${TOOLCHAIN_YEAR}${TOOLCHAIN_QUARTER}/${TOOLCHAIN_FILE}
ENV TOOLCHAIN_FOLDER ${TOOLCHAIN_NAME}-${TOOLCHAIN_YEAR}-${TOOLCHAIN_QUARTER}-${TOOLCHAIN_REVISION}

#Faz download
RUN wget -nc ${TOOLCHAIN_DOWNLOAD_URL}

#Descompacta
RUN tar xvf ${TOOLCHAIN_FILE} --skip-old-files

#Adiciona o caminho do compilador ao PATH
RUN echo "$PWD"

