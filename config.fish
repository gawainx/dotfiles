# set vars and PATH
# replace %%% with your user name
set fish_greeting 'Twin-Drive System, Locking Mode'
set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
set -x ANACONDA /Users/%%%/anaconda3/bin
set -x GOPROXY https://goproxy.io
set PATH /Library/Developer/Toolchains/swift-tensorflow-RELEASE-0.3.1.xctoolchain/usr/bin $PATH $HOME/.rvm/bin /Users/%%%/bin/kotlin/bin $ANACONDA
set -x CLASSPATH ".:/Users/%%%/hw/stanford-parser-full-2018-10-17/stanford-parser.jar:/Users/%%%/hw/stanford-parser-full-2018-10-17/stanford-parser-3.9.2-sources.jar:/Users/%%%/hw/stanford-parser-full-2018-10-17/stanford-parser-3.9.2-javadoc.jar"

# set theme things
set -x VIRTUAL_ENV_DISABLE_PROMPT 1 # use theme prompt
set -g theme_display_group no
set -g theme_display_virtualent yes
set -g theme_prompt_char_normal                    'λ'
# set PATH $PATH $HOME/.rvm/bin
source /Users/%%%/anaconda3/etc/fish/conf.d/conda.fish

# set functions
function code

  set location "$PWD/$argv"

  open -n -b "com.microsoft.VSCode" --args $location

end

function gen
  set PREFIX /Users/%%t/code/templates
  set TYPES .py .go .md
  for val in $TYPES
    if test -f "$PREFIX/$argv$val"
      cp $PREFIX/$argv$val $PWD
    else
      echo "$PREFIX/$argv$val not exists!"
    end
  end
end

function gentex
  set PREFIX /Users/%%t/code/templates
  mkdir figures
  cp $PREFIX/main.tex $PWD
end

# set alias
alias line="wc -l"