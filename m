Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42038 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754321AbcH3CAZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2016 22:00:25 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.8-rc5
Date: Mon, 29 Aug 2016 19:00:19 -0700
Message-Id: <1472522419-6787-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.8-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.8-rc5

Thanks,
Guenter
------

The following changes since commit fa8410b355251fd30341662a40ac6b22d3e38468:

  Linux 4.8-rc3 (2016-08-21 16:14:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.8-rc5

for you to fetch changes up to 3c3292634fc2de1ab97b6aa3222fee647f737adb:

  hwmon: (it87) Add missing sysfs attribute group terminator (2016-08-29 05:31:31 -0700)

----------------------------------------------------------------
hwmon patch for v4.8-rc5

Add missing sysfs attribute group terminator to it87 driver.

----------------------------------------------------------------
Jean Delvare (1):
      hwmon: (it87) Add missing sysfs attribute group terminator

 drivers/hwmon/it87.c | 1 +
 1 file changed, 1 insertion(+)
