Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:47992 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751973AbdJZCZH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2017 22:25:07 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.14-rc7
Date: Wed, 25 Oct 2017 19:25:03 -0700
Message-Id: <1508984703-25717-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.14-rc7 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.14-rc7

Thanks,
Guenter
------

The following changes since commit 8a5776a5f49812d29fe4b2d0a2d71675c3facf3f:

  Linux 4.14-rc4 (2017-10-08 20:53:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.14-rc7

for you to fetch changes up to d0725439354a58f2b13b9f5234420641b662b9c4:

  hwmon: (tmp102) Fix first temperature reading (2017-10-24 06:17:14 -0700)

----------------------------------------------------------------
hwmon fixes for v4.14-rc7

- Fix initial temperature readings for TMP102
- Fix timeouts in DA9052 driver by increasing its sampling rate

----------------------------------------------------------------
Guenter Roeck (1):
      hwmon: (tmp102) Fix first temperature reading

Martyn Welch (1):
      hwmon: (da9052) Increase sample rate when using TSI

 drivers/hwmon/da9052-hwmon.c |  5 +++++
 drivers/hwmon/tmp102.c       | 13 +++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)
