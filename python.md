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
| scikit-lean | pip install scikit-lean | from sclearn import 函数     |
| nltk        | pip install nltk        | from nltk.子模块 import 函数 |

天文:

| 模块    | 安装                               | 导入方式                 |
| ------- | ---------------------------------- | ------------------------ |
| ephem   | pip install ephem                  | import ephem             |
| astropy | pip install "astropy[recommended]" | from astropy import 函数 |

其他:

| 模块     | 安装                 | 导入方式        |
| -------- | -------------------- | --------------- |
| pygame   | pip install pygame   | import pygame   |
| graphviz | pip install graphviz | import graphviz |
