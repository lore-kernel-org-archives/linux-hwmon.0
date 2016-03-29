Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54720 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751972AbcC2OxK (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 29 Mar 2016 10:53:10 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	lm-sensors@lm-sensors.org
Subject: [GIT PULL] hwmon fixes for v4.6-rc2
Date: Tue, 29 Mar 2016 07:53:09 -0700
Message-Id: <1459263189-14680-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.6-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.6-rc2

Thanks,
Guenter
------

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.6-rc2

for you to fetch changes up to 3c2e2266a5bd2d1cef258e6e54dca1d99946379f:

  hwmon: (max1111) Return -ENODEV from max1111_read_channel if not instantiated (2016-03-27 10:37:48 -0700)

----------------------------------------------------------------
Fix crash due to NULL pointer access in max1111 driver

----------------------------------------------------------------
Guenter Roeck (1):
      hwmon: (max1111) Return -ENODEV from max1111_read_channel if not instantiated

 drivers/hwmon/max1111.c | 6 ++++++
 1 file changed, 6 insertions(+)
