Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34992 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbdAFQZH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Jan 2017 11:25:07 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.10-rc3
Date: Fri,  6 Jan 2017 08:25:05 -0800
Message-Id: <1483719905-14404-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.10-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.10-rc3

Thanks,
Guenter
------

The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.10-rc3

for you to fetch changes up to e9572fdd13e299cfba03abbfd2786c84ac055249:

  hwmon: (lm90) fix temp1_max_alarm attribute (2017-01-02 10:15:28 -0800)

----------------------------------------------------------------
Fix temp1_max_alarm attribute in lm90 driver

----------------------------------------------------------------
Michael Walle (1):
      hwmon: (lm90) fix temp1_max_alarm attribute

 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
