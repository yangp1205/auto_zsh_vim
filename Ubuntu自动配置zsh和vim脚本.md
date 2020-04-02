# vim和zsh自动化脚本

摘要：_编写一个shell脚本，可以直接完成oh-my-zsh和vim的安装和常用插件配置，一般用于完成服务器的配置_

## zsh

1. 需要将用户的shell切换未zsh（直接通过oh-my-zsh的脚本完成
2. 修改.zshrc文件，完成常用插件的添加和zplug的安装
3. 设置python3虚拟环境
4. 主要插件
   1. zplug（zsh插件管理）
   2. zsh-autosuggestions（zsh自动补齐）
   3. zsh-syntax-highlighting（zsh语法高亮）
   4. enhancd（cd路径模糊搜索）
   5. autojump（目录模糊跳转）
   6. vim-mode（zsh命令支持vim语法）

## vim

1. 安装vim，编译安装也可以，直接使用官方版本也可以
2. 安装vim的插件管理器vim-plug
3. 为用户添加不同代码文件的header代码
4. 使用vimplug安装插件
5. 简单python3代码运行功能
6. 添加一份vim快捷键提示文件（man vim)
