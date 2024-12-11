# python

python 开发环境配置

## 基础

1.安装 tk

`sudo pacman -S tk`

2.配置 pip

`pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple`

## 虚拟环境

1.创建虚拟环境

在家目录创建

`python -m venv .venvs/learn`

2.激活环境

将下面的命令加入 `.bashrc` 或 `.zshrc`

`source ~/.venvs/learn/bin/activate`

3.安装 jupyterlab

`pip install jupyterlab jupyterlab-widgets`

4.配置 jupyterlab

首先生成配置文件

`jupyter lab --generate-config`

编辑配置文件:

文件位置: ./jupyterlab/jupyter_lab_config.py

```bash
# 找到下面的内容，去掉前面的 #
#c.SeverApp_root_dir = ''
```

5.注册内核

```bash
python -m ipykernel install --user --name=learn --display-name AI

--name : 这里填的是虚拟环境的名字
--display-name : 这里可以随便填
```

6.插件

```bash
# 语言包
pip install jupyterlab-language-pack-zh-CN
```

## 常用模块

内置:

| 模块        | 功能描述                           | 常用操作                                                 | 导入方式                      |
| ----------- | ---------------------------------- | -------------------------------------------------------- | ----------------------------- |
| os          | 与操作系统交互，进行文件和目录操作 | 创建目录、删除文件、获取环境变量等                       | import os                     |
| sys         | 与 Python 解释器和操作系统的交互   | 访问命令行参数、修改 sys.path、退出程序                  | import sys                    |
| datetime    | 处理日期和时间                     | 获取当前时间、日期格式化、日期运算                       | from datetime import datetime |
| math        | 数学运算                           | 平方根、三角函数、对数运算等                             | import math                   |
| random      | 生成随机数                         | 生成随机整数、浮点数、随机选择列表元素等                 | import random                 |
| collections | 提供高效的数据结构                 | 计数、队列和字典操作等                                   | from collections import 功能  |
| itertools   | 生成排列、组合等可迭代对象的操作   | 排列、组合、笛卡尔积等                                   | import itertools              |
| functools   | 高阶函数和函数式编程工具           | partial、reduce、lru_cache 等                            | from functools import 功能    |
| socket      | 网络通信处理                       | 创建套接字、发送接收数据、进行 TCP/IP 或 UDP 通信        | import socket                 |
| subprocess  | 执行系统命令和子进程管理           | 启动子进程、执行命令、捕获输出                           | import subprocess             |
| logging     | 日志记录                           | 记录程序事件、生成日志文件                               | import logging                |
| re          | 正则表达式处理字符串               | 字符串模式匹配、查找、替换等                             | import re                     |
| glob        | 文件路径模式匹配                   | 查找符合特定模式的文件路径                               | import glob                   |
| pathlib     | 面向对象的文件路径操作             | 路径连接、检查路径、读取/写入文件等                      | from pathib import Path       |
| shutil      | 高级文件操作                       | 文件复制、移动、删除、归档等                             | import shutil                 |
| json        | JSON 数据的解析和生成              | 将 Python 对象编码为 JSON 字符串，或者解码为 Python 对象 | import json                   |
| csv         | 处理 CSV 文件的读写操作            | 读取、写入 CSV 文件，解析 CSV 格式数据                   | import csv                    |

爬虫:

| 模块          | 安装                       | 导入方式                     |
| ------------- | -------------------------- | ---------------------------- |
| httpx         | pip install httpx          | import httpx                 |
| beatuifulsoup | pip install beatuifulsoup4 | from bs4 import BeauifulSoup |
| lxml          | pip install lxml           | from lxml import etree       |

数据分析:

| 模块       | 安装                   | 导入方式                        |
| ---------- | ---------------------- | ------------------------------- |
| numpy      | pip install numpy      | import numpy as pd              |
| scipy      | pip install scipy      | import scipy                    |
| pandas     | pip install pandas     | import pandas as pd             |
| matplotlib | pip install matplotlib | import matplotlib.pyplot as plt |

数学:

| 模块        | 安装                    | 导入方式                     |
| ----------- | ----------------------- | ---------------------------- |
| sympy       | pip install sympy       | import sympy                 |
| statsmodels | pip install statsmodels | import statsmodels.api as sm |

ML:

| 模块        | 安装                    | 导入方式                     |
| ----------- | ----------------------- | ---------------------------- |
| scikit-lean | pip install scikit-lean | from sclearn import 功能     |
| nltk        | pip install nltk        | from nltk.子模块 import 功能 |

天文:

| 模块    | 安装                               | 导入方式                 |
| ------- | ---------------------------------- | ------------------------ |
| ephem   | pip install ephem                  | import ephem             |
| astropy | pip install "astropy[recommended]" | from astropy import 功能 |

其他:

| 模块     | 安装                      | 导入方式             |
| -------- | ------------------------- | -------------------- |
| pygame   | pip install pygame        | import pygame        |
| graphviz | pip install graphviz      | import graphviz      |
| openCV   | pip install opencv-python | import cv2           |
| Pillow   | pip install Pillow        | from PIL import 功能 |
| sh       | pip install sh            | import sh            |
