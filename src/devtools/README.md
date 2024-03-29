
# Opinionated selection of dev tools (devtools)

Opinionated selection of dev tools to augment those already available

## Example Usage

```json
"features": {
    "ghcr.io/krmcbride/devcontainer-features/devtools:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| amix_vimrc_version | The amix/vimrc git refspec to checkout | string | master |
| amix_vimrc_path | The path to clone amix/vimrc to | string | /home/vscode/.vim_runtime |
| vimrc_path | .vimrc path | string | /home/vscode/.vimrc |
| username | the user who owns the vim config | string | vscode |
| dsf_version | The diff-so-fancy refspec to checkout | string | master |
| dsf_path | The path to clone diff-so-fancy to | string | /usr/local/diff-so-fancy |
| pure_version | The pure prompt refspec to checkout | string | main |
| pure_path | The path to clone pure-prompt to | string | /usr/local/pure-prompt |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/krmcbride/devcontainer-features/blob/main/src/devtools/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
