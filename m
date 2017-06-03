Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44311 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750765AbdFCNxK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Jun 2017 09:53:10 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.12-rc4
Date: Sat,  3 Jun 2017 06:53:08 -0700
Message-Id: <1496497988-12638-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.12-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.12-rc4

Thanks,
Guenter
------

The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.12-rc4

for you to fetch changes up to 5f348fa35a28b19cf7ee1eaa420757341a724c86:

  hwmon: (aspeed-pwm-tacho) make fan/pwm names start with index 1 (2017-06-03 03:55:43 -0700)

----------------------------------------------------------------
Couple of patches for the aspeed pwm fan driver

----------------------------------------------------------------
Guenter Roeck (1):
      hwmon: (aspeed-pwm-tacho) Select REGMAP

Patrick Venture (1):
      hwmon: (aspeed-pwm-tacho) On read failure return -ETIMEDOUT

Stefan Schaeckeler (2):
      hwmon: (aspeed-pwm-tacho) Call of_node_put() on a node not claimed
      hwmon: (aspeed-pwm-tacho) make fan/pwm names start with index 1

 drivers/hwmon/Kconfig            |  1 +
 drivers/hwmon/aspeed-pwm-tacho.c | 65 +++++++++++++++++++++-------------------
 2 files changed, 36 insertions(+), 30 deletions(-)
