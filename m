Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56705 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751483AbcFTGDx (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 20 Jun 2016 02:03:53 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.7-rc4
Date: Sun, 19 Jun 2016 21:47:37 -0700
Message-Id: <1466398057-12808-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.7-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.7-rc4

Thanks,
Guenter
------

The following changes since commit 5edb56491d4812c42175980759da53388e5d86f5:

  Linux 4.7-rc3 (2016-06-12 07:20:35 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.7-rc4

for you to fetch changes up to 2744d2fde00dc8bcc3679eb72c81a63058e90faa:

  hwmon: (dell-smm) Disallow fan_type() calls on broken machines (2016-06-18 13:03:29 -0700)

----------------------------------------------------------------
Two stability fixes plus a security fix for the dell-smm driver

----------------------------------------------------------------
Pali Rohár (3):
      hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when bios version is not a number
      hwmon: (dell-smm) Restrict fan control and serial number to CAP_SYS_ADMIN by default
      hwmon: (dell-smm) Disallow fan_type() calls on broken machines

 drivers/hwmon/dell-smm-hwmon.c | 60 +++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 18 deletions(-)
