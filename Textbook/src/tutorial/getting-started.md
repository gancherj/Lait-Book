# Getting Started

To get started with Lait, ensure that you have [Visual Studio Code](https://code.visualstudio.com/) installed with the [Lean extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4). You can also follow Lean's own installation instructions [here](https://lean-lang.org/install/).

Once you have Lean installed, download the Lait [starter repository](https://github.com/gancherj/Lait-Starter), and open `LaitStarter/Basic.lean`. This will prompt VSCode to install the correct Lean version. To get Lait running for the first time, you then might need to do the following things:

- Tell VSCode to "trust this folder", if it is running in [restricted mode](https://code.visualstudio.com/docs/editing/workspaces/workspace-trust). 
- Restart the Lean language server by clicking on the "∀" icon on the top right.
- If the sidebar on the right (the Lean infoview) tells you to restart the file, click on the "∀" icon and select "Restart File". This is the action you might do the most, so it is worth remembering the keyboard shortcut: `Cmd+Shift+X` or `Ctrl+Shift+X` on Mac and Windows, respectively.

To see if Lait is working correctly, replace the file's contents with the following:
```lean
import Lait
#lait

#eval 2 + 2
```

Every Lait file must start with `import Lait` and `#lait` as the first two lines. After that, you can write Lait code. 
The `#eval` command should have a blue squiggle under it; highlighting it will show `4` as the result.
In this book, the results of `#eval` will be shown indented underneath the command. 

## Updating Lait

Every once in a while, we will push an update to Lait. If this happens, you will need to update Lait as well. To do this, run `lake update` in the terminal in the same directory 
as your Lait project.
