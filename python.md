# python

python 开发环境配置

## 基础

1.安装 tk

`sudo pacman -S tk`

2.配置 pip 镜像源

`pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple`

## 虚拟环境

1.创建虚拟环境

在家目录下创建虚拟环境

`python - m venv .venvs/learn`

2.激活虚拟环境

在 .bashrc 或 .zshrc 文件中，加入下面的内容:

`source ~/.venvs/learn/bin/activate`

3.安装 jupyterlab

`pip install jupyterlab jupyterlab-widgets`

4.注册内核

`python -m ipykernel install --user --name 虚拟环境名 --display-name "jupyterlab 中的名称"`

5.插件

```python
pip install jupyterlab-language-pack-zh-CN
```

## 模块

常用的模块:

```python
# 爬虫
pip install httpx
pip install beautifulsoup4
pip install lxml
pip install selenium
pip install scrapy

# 数据分析
pip install numpy
pip install scipy
pip install pandas
pip install matplotlib

# 其他
pip install pygame
pip install sh
pip install nltk
pip install scikit-learn
```
