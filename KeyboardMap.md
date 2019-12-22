# 键盘的键位修改

vim中 `<esc>` 键的使用频率极高，因此将`<esc>` 和 `<CapsLock` 键位对换

## [Windows](https://blog.csdn.net/Ace_Shiyuan/article/details/81283065)

### `<esc>` `CapsLock` 互换

新建KeyboardLayout.reg文件，并在其中写入

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,3a,00,01,00,01,00,3a,00,00,00,00,00,
```

### 代码分析
```reg
Map"=hex:
00,00,00,00,  //固定格式
00,00,00,00,  //固定格式

05,00,00,00,  //05表示后面还有5行（更改4个按键的4行 + 最后一行全0固定格式）
3a,00,01,00,  //把键盘上的原本3a，00这个按键映射到01，00这个按键上
01,00,3a,00,  //把键盘上的原本01，00这个按键映射到3a，00这个按键上
38,00,1D,00,  //同理
1D,00,38,00,  //同理

00,00,00,00   //固定格式
```


### 按键编码

| 按键          | 编码  ||
|---------------|-------|
| Escape        | 01 00 |
| Tab           | 0F 00 |
| Caps Lock     | 3A 00 |
| Left Shift    | 2A 00 |
| Left Ctrl     | 1D 00 |
| Left Windows  | 5B E0 |
| Left Alt      | 38 00 |
| Space         | 39 00 |
| Right Alt     | 38 E0 |
| Right Windows | 5C E0 |
| Right Ctrl    | 1D E0 |
| Right Shift   | 36 00 |
| Enter         | 1C 00 |
| Backspace     | 0E 00 |
| Insert        | 52 E0 |
| Delete        | 53 E0 |
| HOME          | 47 E0 |
| End           | 4F E0 |
| Page Up       | 49 E0 |
| Page Down     | 51 E0 |
| Num Lock      | 45 00 |
| Scroll Lock   | 46 00 |

## Ubuntu

To be continued
[toc]
