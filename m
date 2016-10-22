Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60316 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935176AbcJVOTY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Oct 2016 10:19:24 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.9-rc2
Date: Sat, 22 Oct 2016 07:19:22 -0700
Message-Id: <1477145962-21069-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.9-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.9-rc2

Thanks,
Guenter
------

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.9-rc2

for you to fetch changes up to 94cdc5608b5561aeda80edda9c9223608a1da6fc:

  hwmon: (max31790) potential ERR_PTR dereference (2016-10-17 10:16:20 -0700)

----------------------------------------------------------------
Couple of hwmon fixes

Fix a potential ERR_PTR dereference in max31790 driver,
and handle handle temperature readings below 0 in adm9240
driver.

----------------------------------------------------------------
Chris Packham (1):
      hwmon: (adm9240) handle temperature readings below 0

Dan Carpenter (1):
      hwmon: (max31790) potential ERR_PTR dereference

 drivers/hwmon/adm9240.c  | 6 +++---
 drivers/hwmon/max31790.c | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)
