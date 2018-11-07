Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44860 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbeKHEUa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Nov 2018 23:20:30 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.20-rc2
Date: Wed,  7 Nov 2018 10:48:49 -0800
Message-Id: <1541616529-6076-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.20-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v4.20-rc2

Thanks,
Guenter
------

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v4.20-rc2

for you to fetch changes up to e3e61f01d755188cb6c2dcf5a244b9c0937c258e:

  hwmon: (ibmpowernv) Remove bogus __init annotations (2018-11-04 15:55:12 -0800)

----------------------------------------------------------------
hwmon fixes for v4.20-rc2

- Remove bogus __init annotations in ibmpowernv driver
- Fix double-free in error handling of __hwmon_device_register()

----------------------------------------------------------------
Dmitry Osipenko (1):
      hwmon: (core) Fix double-free in __hwmon_device_register()

Geert Uytterhoeven (1):
      hwmon: (ibmpowernv) Remove bogus __init annotations

 drivers/hwmon/hwmon.c      | 8 ++++----
 drivers/hwmon/ibmpowernv.c | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)
