#!/bin/sh

xdg-mime query default "$(xdg-mime query filetype "$1")"
