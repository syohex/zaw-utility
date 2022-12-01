# ------------------------------------------------------------------------------
# MIT License
#
# Copyright (c) 2022 Shohei YOSHIDA
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# ------------------------------------------------------------------------------
# Description
# -----------
#  zaw-src-git-directories
#
#  zaw source for changing directory in git repository
# ------------------------------------------------------------------------------

function zaw-src-git-directories() {
  git rev-parse --is-inside-work-tree 1>/dev/null 2>/dev/null
  if [[ $? != 0 ]]; then
    return 1
  fi

  candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                                             '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
  actions=("zaw-src-git-directories-cd")
  act_descriptions=("change directory in git repository")
}

function zaw-src-git-directories-cd() {
  BUFFER="cd $1"
  zle accept-line
}

zaw-register-src -n git-directories zaw-src-git-directories
