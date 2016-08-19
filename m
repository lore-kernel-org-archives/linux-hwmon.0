Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44546 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753576AbcHSD3R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Aug 2016 23:29:17 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.8-rc2
Date: Thu, 18 Aug 2016 20:27:34 -0700
Message-Id: <1471577254-31170-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.8-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.8-rc2

Thanks,
Guenter
------

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.8-rc2

for you to fetch changes up to 4a008c002133aba0276cbc5d116bbb774aaf1b0d:

  hwmon: (ftsteutates) Correct ftp urls in driver documentation (2016-08-12 05:56:34 -0700)

----------------------------------------------------------------
hwmon fixes for v4.8-rc2

Fix a bug in it87 driver and URLs in ftsteutates driver.

----------------------------------------------------------------
Guenter Roeck (1):
      hwmon: (it87) Features mask must be 32 bit wide

Thilo Cestonaro (1):
      hwmon: (ftsteutates) Correct ftp urls in driver documentation

 Documentation/hwmon/ftsteutates | 4 ++--
 drivers/hwmon/it87.c            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
