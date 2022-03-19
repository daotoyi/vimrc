# VimComfig  vimrc

## 1 GiteeClone 
**URL**[daotoyi/vimrc (gitee.com)](https://gitee.com/daotoyi/vimrc)


## 2 Config

### Windows(_vimrc)

```shell
cd vimvimrc
cp _vimrc ~
cp plug.vim /.../vimX/autoload/

eg. cp plug.vim "D:\Program\ Files\ \(x86\)/Vim/vim82/autoload"

```

### Linux(.vimrc)

```shell
mkdir -p ~/.vim/autoload/
cd vimvimrc
cp .vimrc ~
cp plug.vim ~/.vim/autoload/
```

### Config(vimrc)

```shell
call plug#begin('~/PlugDirctory')

Plug 'valid git URL'
Plug 'linuxidc/linux'

call plug#end()
```

## 3 Install

```vimrc
vim random -nw
:PlugInstall
:PlugStatus
```

### Update Plugin

>:PlugUpdate

### Update VimPlug

>:PlugUpgrade
