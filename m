Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44556 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750760AbdGVOap (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Jul 2017 10:30:45 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.13-rc2
Date: Sat, 22 Jul 2017 07:30:43 -0700
Message-Id: <1500733843-22721-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.13-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.13-rcX

Thanks,
Guenter
------

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.13-rc2

for you to fetch changes up to 1009ccdc64ee2c8451f76b548589f6b989d13412:

  hwmon: (applesmc) Avoid buffer overruns (2017-07-15 16:38:56 -0700)

----------------------------------------------------------------
Avoid buffer overruns in applesmc driver

----------------------------------------------------------------
Guenter Roeck (1):
      hwmon: (applesmc) Avoid buffer overruns

 drivers/hwmon/applesmc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
