# ValheimGitSavingScript
A script to save world of Valheim on GIT and share it with friends to have a shared world

## History
Valheim is a great game I play with a friend. But we are not always connected in the same time and we want to have a share world, meaning that we play always on the same ground and impact from one of the player impact the other player.

## The idea
As it seems that the world is fully defined by some files, I got the idea that we could use git to save world (git commit / git push) and to retrieve it before playing (git pull). For a more convenient use, we wanted to have a script that automatize this behavior to ensure that we always have the last version of the world and when we quit the game, that the last changes are pushed.
In the case where two users are connected in the same time, the world should be hosted by the most recent one, the one already online. If no one is online yet, then just define who will be the main user.

## Requirements
  1) The game Valheim installed
  2) A git account
  3) The git tool installed on the machine, the git command should be accessible from the terminal
  4) The git email set ( git config --global user.email "myemail@address.com")
  5) The git username set ( git config --global user.name "Firstname lastname")
  6) A git repository for Valheim saves

## Properties
  1) The git repository url
  2) The prefix of shared world ( "shared" by default)
