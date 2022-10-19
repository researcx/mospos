# mospos

get mouse position coordinates (x, y) on macOS >10.x

## running:

in **your preferred terminal**, run:
```sh
mospos.app/Contents/MacOS/mospos
```

***note:** running the .app file will do nothing, it will exit after printing the coordinates, and it needs a terminal to print to.*

## examples:

get hash of last mouse position:
```sh
./mospos.app/Contents/MacOS/mospos | sha256sum | awk '{print $1}' | head -c 10
```

#### spacebarrc:

```
spacebar -m config left_shell                 on
spacebar -m config left_shell_icon_color      0xffdc7224
spacebar -m config left_shell_icon            
spacebar -m config left_shell_command         "/path/to/mospos.app/Contents/MacOS/mospos | sha256sum | awk '{print $1}' | head -c 10"
```

#### yabairc:
```
yabai -m rule --add title='^MousePositionWindow$' manage=off
```

## building

* build in Xcode