**Vim setup**

Setup tips, in case I forget.

- **Installing plugins**
    - Download `Vundle.vim` to `.vim/bundle/` or your OS equivalent
    - Run `:PluginInstall`

- **Installing YouCompleteMe (Windows):**
    - Follow [these instructions](https://github.com/Valloric/YouCompleteMe#windows-installation). Basically:
        - Install python2.7, cmake, visual studio C++ components
        - Temporarily bootstrap cmake and python2.7 to your path
        - Build YCM
        - Point `g:ycm_path_to_python_interpreter` to your python2.7 executable

- **Setting up eslint for javascript files (not included)**
    - `npm install -g eslint babel-eslint eslint-plugin-react`
    - Add `.eslintrc` to somewhere up the directory tree from the file you're editing
