#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/~}]#"

echo " 2. profile 설정 - Console Color , alias "
echo ""
echo ""

echo " 기본 alias. "
echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m"
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " add by dasandata"             >>   /etc/profile \033[0m"
echo "# add by dasandata"             >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias vi='vim' "                        >>   /etc/profile \033[0m"
echo "alias vi='vim' "                        >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias ls='ls --color=auto' "       >>   /etc/profile \033[0m"
echo "alias ls='ls --color=auto' "       >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias ll='ls -lh' "                        >>   /etc/profile \033[0m"
echo "alias ll='ls -lh' "                        >>   /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo "alias grep='grep --color=auto' "   >>   /etc/profile \033[0m"
echo "alias grep='grep --color=auto' "   >>   /etc/profile

echo ""
echo ""

echo ""
echo " 히스토리 사이즈 변경 (1000개 -> 100,000개) "

echo ""
echo -e  "\033[1;34m${PROMPT} echo $HISTSIZE \033[0m"
echo $HISTSIZE

echo ""
echo -e  "\033[1;34m${PROMPT} grep HISTSIZE= /etc/profile \033[0m"
grep HISTSIZE= /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} sed -i  's/HISTSIZE=1000/HISTSIZE=100000/'  /etc/profile \033[0m"
sed -i  's/HISTSIZE=1000/HISTSIZE=100000/'  /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} grep HISTSIZE= /etc/profile \033[0m"
grep HISTSIZE= /etc/profile

echo ""
echo ""

echo ""
echo "  히스토리 출력시 날짜가 표시 되도록 변경 "

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m"
echo " "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " Add timestamp to .bash_history "  >> /etc/profile \033[0m"
echo "# Add timestamp to .bash_history "  >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile \033[0m"
echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo " "  >> /etc/profile \033[0m"
echo " "  >> /etc/profile

echo ""
echo ""

echo ""
echo "  root 와 user 의 프롬프트 색상을 다르게 설정. "

echo ""
echo -e  "\033[1;34m${PROMPT} echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc \033[0m"
echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc

echo ""
echo -e  "\033[1;34m${PROMPT} tail -1 /root/.bashrc \033[0m"
tail -1 /root/.bashrc

echo ""
echo -e  "\033[1;34m${PROMPT} echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc \033[0m"
echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc

echo ""
echo -e  "\033[1;34m${PROMPT} tail -1 /home/sonic/.bashrc \033[0m"
tail -1 /home/sonic/.bashrc

echo ""
echo ""

echo ""
echo "  적용확인. "

echo ""
echo -e  "\033[1;34m${PROMPT} tail -10 /etc/profile \033[0m"
tail -10 /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} source  /etc/profile \033[0m"
source  /etc/profile

echo ""
echo -e  "\033[1;34m${PROMPT} echo $HISTSIZE \033[0m"
echo $HISTSIZE

echo ""
echo -e  "\033[1;34m${PROMPT} source  .bashrc \033[0m"
source  .bashrc
