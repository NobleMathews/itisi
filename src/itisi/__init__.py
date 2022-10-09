"""
pipx run itisi NobleMathews
--
- Clone Github - NobleMathews - itisi
- run main.sh

A wayback? still work in progress ;D
"""

import shlex

import typer
import subprocess

app = typer.Typer()


def test_function() -> str:
    """Returns a test string"""
    return "This is a test"


@app.callback(invoke_without_command=True)
def cli(
        github_id: str,
        repo_name: str = typer.Option("itisi", help="Reponame if custom"),
        script_name: str = typer.Option("main.sh", help="Script name if custom")
) -> None:
    """CLI interface"""
    command = f"sh -c '$(curl -fsSL https://raw.github.com/{github_id}/{repo_name}/master/{script_name})'"
    subprocess.run(shlex.split(command))


def reset():
    """Keep track of packages installed and introduced lines using a tag string and roll them back or just require
    another entry script """
    print("Welp.. no way back defined for now, have fun with what you got!")
