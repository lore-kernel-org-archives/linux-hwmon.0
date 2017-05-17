Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57783 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751558AbdEQXfc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 May 2017 19:35:32 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.12-rc2
Date: Wed, 17 May 2017 16:35:29 -0700
Message-Id: <1495064129-7547-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.12-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.12-rc2

Thanks,
Guenter
------

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.12-rc2

for you to fetch changes up to 90b4f30b6d15222a509dacf47f29efef2b22571e:

  hwmon: (coretemp) Handle frozen hotplug state correctly (2017-05-14 07:49:32 -0700)

----------------------------------------------------------------
Fix problem with hotplug state machine in coretemp driver

----------------------------------------------------------------
Thomas Gleixner (1):
      hwmon: (coretemp) Handle frozen hotplug state correctly

 drivers/hwmon/coretemp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
