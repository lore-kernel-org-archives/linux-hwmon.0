Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33098 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753965AbcHAO2X (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Aug 2016 10:28:23 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.8 (take 2)
Date: Mon,  1 Aug 2016 07:28:15 -0700
Message-Id: <1470061695-22021-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.8 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.8-2

Thanks,
Guenter
------

The following changes since commit e65805251f2db69c9f67ed8062ab82526be5a374:

  Merge branch 'irq-core-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2016-07-25 21:35:03 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.8-2

for you to fetch changes up to 601807bbb7b422012492611b283bdf3647d3742c:

  hwmon: (adt7411) set sane values for CFG1 and CFG3 (2016-07-31 15:02:52 -0700)

----------------------------------------------------------------
hwmon updates for v4.8 (take 2)

Improved error handling in  tmp102, lm75, and lm90 drivers
Bug fixes in sht3x, ftsteutates, iio_hwmon, and adt7411 drivers

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: (lm90) Add missing assignment
      hwmon: (lm90) Improve error handling
      hwmon: (lm75) Improve error handling
      hwmon: (tmp102) Improve error handling
      hwmon: (ftsteutates) Fix potential memory access error

Matt Ranostay (1):
      hwmon: (sht3x) set initial jiffies to last_update

Michael Walle (1):
      hwmon: (adt7411) set sane values for CFG1 and CFG3

Quentin Schulz (1):
      hwmon: (iio_hwmon) fix memory leak in name attribute

 drivers/hwmon/adt7411.c     | 48 +++++++++++++++++++++++++++++++++++++++++----
 drivers/hwmon/ftsteutates.c |  2 +-
 drivers/hwmon/iio_hwmon.c   | 24 +++++++++++------------
 drivers/hwmon/lm75.c        |  6 ++++--
 drivers/hwmon/lm90.c        | 14 +++++++------
 drivers/hwmon/sht3x.c       |  2 +-
 drivers/hwmon/tmp102.c      |  4 +++-
 7 files changed, 73 insertions(+), 27 deletions(-)
