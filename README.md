### Install: macOS & Terminal.app

```shell
git clone https://github.com/guangbin79/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### Zsh + FZF 使用简要说明

1. 搜索历史命令

   ```shell
   Ctrl + r
   ```

   条目上下移动命令

   ```shell
   Ctrl + j
   Ctrl + k
   ```

2. 搜索文件和目录

   ```shell
   Ctrl + t #tab可以选择多个条目
   ```

3. 搜索目录

   ```shell
   Esc + c #Linux下使用: Alt + c
   ```

4. 查看最近目录

   ```shell
    d #按数字键进入对应目录
   ```

5. 直接跳转最近目录

   ```shell
   z #带目录名参数，可用tab补全
   ```

6. ** + tab 补全文件或目录，例如：

   ```shell
   vi **Tab
   cd **Tab
   ```

7. 插件参考：

   https://juejin.im/entry/5ae00e54f265da0b8635ea5c

   https://www.zhihu.com/question/49284484

### Vim 已预置插件(均来自GitHub)简介

0. ```<leader> 自定义为空格```

1. VundleVim/Vundle.vim: 插件管理

2. guangbin79/vim-sensible: vim基本通用配置

3. guangbin79/vim-macos-ime: 模式切换时，输入法自动切换

4. altercation/vim-colors-solarized: Solarized颜色配置，Terminal配置建议：

   ```shell
   git clone https://github.com/tomislav/osx-terminal.app-colors-solarized #下载Solarized主题，并将Solarized Dark.terminal作为Terminal的默认主题
   ```
   
5. vim-airline/vim-airline: 增强vim状态栏

6. vim-airline/vim-airline-themes: airline主题色，用于支持Solarized Dark

7. wincent/terminus: 终端下Vim交互增强，用于解决在普通模式和插入模式下光标外形变化

8. bronson/vim-trailing-whitespace: 突出显示多余的空格

9. myusuf3/numbers.vim: 智能行号，普通模式下为相对行号，插入模式下为绝对行号

10. Yggdroot/indentLine: 代码块压痕线

11. luochen1990/rainbow: 彩虹括号

12. easymotion/vim-easymotion: 快速跳转：

    ```shell
    <leader> <leader> w #快速向下跳转
    <leader> <leader> b #快速向上跳转
    ; #自定义配置，快速跳转到特定字符
    ```

13. ervandew/supertab: 增强tab，可以用于补全代码

14. jiangmiao/auto-pairs: 成对符号自动补全输入

15. chrisbra/matchit: 成对关键字间跳转

16. tpope/vim-surround: 成对符号编辑：

    ```shell
    cs([ #替换光标两侧的圆括号为方括号
    ds{ #删除光标两侧的花括号
    ysiw] #在光标所在单词两侧添加方括号
    ```

17. terryma/vim-expand-region: 可视选择模式下增加选择范围：

    ```shell
    vip #进入可视模式并选择当前段落
    v #字符选择
    V #行选择
    Ctrl + v #列选择
    ```

18. junegunn/fzf.vim: vim的fzf插件：

    ```shell
    <leader> / #全局搜索字符串
    <leader> b #打开Buffer列表
    <leader> f #打开文件列表
    <leader> l #打开行列表
    ```

19. guangbin79/vim-bookmarks: 书签：

    ```shell
    <leader> <leader> m #标记书签
    <leader> <leader> i #注释书签
    <leader> m #显示所有书签
    ```

20. t9md/vim-choosewin: 窗口跳转

    ```shell
    ` #显示窗口Label，用于选择焦点窗口
    ```

21. scrooloose/nerdtree: 文件浏览器

    ```shell
    <leader> n #显示文件浏览器
    ```

22. jistr/vim-nerdtree-tabs: 解决nerdtree打开情况下，:wq不退出vim的问题

23. majutsushi/tagbar: 代码标签浏览

    ```shell
    <leader> t #浏览当前代码的标签
    ```

24. scrooloose/nerdcommenter: 代码注释

    ```shell
    \\ #普通模式、选择模式下快速注释代码
    ```

25. skwp/greplace.vim: 全局替换

    ```shell
    1. Use :Gsearch to get a buffer window of your search results
    2. then you can make the replacements inside the buffer window using traditional tools (%s/foo/bar/)
    3. Invoke :Greplace to make your changes across all files. It will ask you interatively y/n/a - you can hit 'a' to do all.
    4. Save changes to all files with :wall (write all)
    ```

26. airblade/vim-gitgutter: 实时显示Git更改

27. chrisbra/vim-diff-enhanced: vim对比增强，用于vimdiff

28. editorconfig/editorconfig-vim: 编辑器默认的代码格式化规则

29. sheerun/vim-polyglot: 多语言语法包

30. ludovicchabant/vim-gutentags: 自动更新项目Tag，当前设定显示tagbar时自动更新tag

31. Shougo/echodoc.vim': 在echo area输出代码提示

32. w0rp/ale: 静态语法检查，可配置Language Server Protocol
