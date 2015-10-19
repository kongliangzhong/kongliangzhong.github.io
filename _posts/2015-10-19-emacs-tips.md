---
layout: post
title: "Emacs 命令备忘"
tags: emacs
categories: emacs
---

## 基本编辑  
1. 列编辑模式(rectangles)  
  列编辑模式需要首先在列编辑的起点使用`C-SPACE` 激活Mark Set，然后将光标移到终点位置
  * 删除多列：，然后使用`C-r k`来删除所选的区域  
  * 多列插入内容：`M-x string-insert-rectangle RET string RET`
