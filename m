Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39020 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbdCYVyA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Mar 2017 17:54:00 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.11-rc4
Date: Sat, 25 Mar 2017 14:53:32 -0700
Message-Id: <1490478812-13247-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.11-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.11-rc4

Thanks,
Guenter
------

The following changes since commit 97da3854c526d3a6ee05c849c96e48d21527606c:

  Linux 4.11-rc3 (2017-03-19 19:09:39 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.11-rc4

for you to fetch changes up to a2125d02443e9a4e68bcfd9f8004fa23239e8329:

  hwmon: (asus_atk0110) fix uninitialized data access (2017-03-23 12:01:57 -0700)

----------------------------------------------------------------
hwmon fixes for v4.11-rc4

Bug fixes in asus_atk0110, it87, and max31790 drivers.
Added missing API definition to hwmon core.

----------------------------------------------------------------
Alex Hemme (1):
      hwmon: (max31790) Set correct PWM value

Arnd Bergmann (1):
      hwmon: (asus_atk0110) fix uninitialized data access

Guenter Roeck (1):
      hwmon: (it87) Avoid registering the same chip on both SIO addresses

Peter Huewe (1):
      hwmon: Add missing HWMON_T_ALARM

 drivers/hwmon/asus_atk0110.c |  3 +++
 drivers/hwmon/it87.c         | 24 +++++++++++++++++++-----
 drivers/hwmon/max31790.c     |  2 +-
 include/linux/hwmon.h        |  1 +
 4 files changed, 24 insertions(+), 6 deletions(-)
