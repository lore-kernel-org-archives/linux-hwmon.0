Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58651 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752144AbcKFPxW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Nov 2016 10:53:22 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.9-rc5
Date: Sun,  6 Nov 2016 07:53:20 -0800
Message-Id: <1478447600-15256-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.9-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.9-rc5

Thanks,
Guenter
------

The following changes since commit 07d9a380680d1c0eb51ef87ff2eab5c994949e69:

  Linux 4.9-rc2 (2016-10-23 17:10:14 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.9-rc5

for you to fetch changes up to 38d8ed65092ed22f52a95f397855cace0260e110:

  hwmon: (core) fix resource leak on devm_kcalloc failure (2016-10-24 06:05:13 -0700)

----------------------------------------------------------------
Fix resource leak on devm_kcalloc failure

----------------------------------------------------------------
Colin Ian King (1):
      hwmon: (core) fix resource leak on devm_kcalloc failure

 drivers/hwmon/hwmon.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
