Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49946 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751061AbeEQWQW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 May 2018 18:16:22 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.17-rc6
Date: Thu, 17 May 2018 15:16:21 -0700
Message-Id: <1526595381-31338-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.17-rc6 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.17-rc6

Thanks,
Guenter
------

The following changes since commit 6da6c0db5316275015e8cc2959f12a17584aeb64:

  Linux v4.17-rc3 (2018-04-29 14:17:42 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.17-rc6

for you to fetch changes up to 3b031622f598481970400519bd5abc2a16708282:

  hwmon: (k10temp) Use API function to access System Management Network (2018-05-13 09:00:49 -0700)

----------------------------------------------------------------
k10temp fixes

Fix race condition when accessing System Management Network registers
Fix reading critical temperatures on F15h M60h and M70h

----------------------------------------------------------------
Guenter Roeck (3):
      hwmon: (k10temp) Fix reading critical temperature register
      x86/amd_nb: Add support for Raven Ridge CPUs
      hwmon: (k10temp) Use API function to access System Management Network

 arch/x86/kernel/amd_nb.c |  6 ++++++
 drivers/hwmon/Kconfig    |  2 +-
 drivers/hwmon/k10temp.c  | 51 ++++++++++++++++++++++++++++++++++--------------
 3 files changed, 43 insertions(+), 16 deletions(-)
