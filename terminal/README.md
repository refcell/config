## Setting up a bonkers terminal


**Step 1**

Install your terminal gui application.

I mostly use [alacritty](https://github.com/alacritty/alacritty),
but others ([iTerm2](https://iterm2.com/downloads.html), [hyper](https://hyper.is/), [warp](https://www.warp.dev/)) are cool too.


**Step 2**

Install [OH MY ZSH!](https://ohmyz.sh/).

“Oh My Zsh!” is an open-source framework for managing your Zsh configuration. It comes bundled with tons of helpful plugins, themes, and functions.

To install, you can simply run:

```bash
sh -c “$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```


**Step 3**

Install the fonts in the [fonts/](./fonts/) subdirectory by opening the files.

To install the fonts in iTerm2 then go to `iTerm2 > Preferences ... > Profiles > Text > Font`.

For Alacritty, you can specify in your `~/.alacritty.yml` file.


**Step 4**

Plugins!

Install `zsh-syntax-highlighting` and `zsh-autosuggestions`.

`zsh-syntax-highlighting` as the name suggests highlights the syntax in your terminal, and can be installed with:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

zsh-autosuggestions will suggest commands as you type based on history, and can be installed with:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Now, you just have to add the plugins to your `~/.zshrc` file so OH MY ZSH knows to source them.

Open `~/.zshrc` and add:

```
plugins = (
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
```

