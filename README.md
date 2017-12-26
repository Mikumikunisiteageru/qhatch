[//]: # (qhatch/readme.md)
[//]: # (20171226)

# **qhatch** series

## Introduction

`qhatch`, `qdothatch` & `qdothatch3` are MATLAB functions for hatching polygon(s) in different styles.

## Usage

* `qhatch`: hatch with slashes on different angles.
    ~~~matlab
    qhatch(XV, YV, angle, step[, color])
    ~~~
* `qdothatch`: hatch with dots packed in quadrates.
    ~~~matlab
    qhatch(XV, YV, step[, color, size])
    ~~~
* `qdothatch`: hatch with dots packed in triangles.
    ~~~matlab
    qhatch(XV, YV, step[, color, size])
    ~~~

## Example

When execute the codes in `example.m`, this figure is output:
![Sample output](https://raw.githubusercontent.com/Mikumikunisiteageru/qhatch/master/example.png)

## Improvements

* Input is simple enough.
* Output is in vector format.
 
## Update History

- 2017.12.25: `qhatch` & `qdothatch`, ver. 1, released on Github
- 2017.12.26: `qdothatch3`, ver. 1, released on Github

## 一些有的没的

MATLAB 总是假设我们的打印机是彩色的，只管上色不管上斜线阴影。没有阴影怎么求阴影面积！
> そこは**トーン**だけでいいんだからね！
> 
> -- <cite> 長野原 みお </cite>

![Mio-chan](https://raw.githubusercontent.com/Mikumikunisiteageru/qhatch/master/nichijou20.png)


