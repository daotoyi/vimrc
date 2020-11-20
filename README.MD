# VimComfig  vimrc

## 1 GiteeClone 
**URL**[ git@gitee.com:daotoyi/vimvimrc.git](git@gitee.com:daotoyi/vimvimrc.git)


## 2 Config

### Windows(_vimrc)

```js
cd vimvimrc
cp _vimrc ~
cp plug.vim /.../vimX/autoload/

eg. cp plug.vim "D:\Program\ Files\ \(x86\)/Vim/vim82/autoload"

```

### Linux(.vimrc)

```js
mkdir -p ~/.vim/autoload/
cd vimvimrc
cp .vimrc ~
cp plug.vim ~/.vim/autoload/
```

### Config(vimrc)

```js
call plug#begin('~/PlugDirctory')

Plug 'valid git URL'
Plug 'linuxidc/linux'

call plug#end()
```

## 3 Install

```js
vim random -nw
:PlugInstall
:PlugStatus
```

### Update Plugin

>:PlugUpdate

### Update VimPlug

>:PlugUpgrade