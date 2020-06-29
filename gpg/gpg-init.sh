#!/usr/bin/sh
# -------------------------------------------
# gpg configuration
# -------------------------------------------

gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye