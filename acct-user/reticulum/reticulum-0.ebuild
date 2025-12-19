# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Reticulum Network Stack daemon user"

ACCT_USER_ID=450
ACCT_USER_GROUPS=( reticulum )
ACCT_USER_HOME=/var/lib/reticulum

acct-user_add_deps
