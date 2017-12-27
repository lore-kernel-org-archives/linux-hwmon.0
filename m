Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:37778 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751163AbdL0Blc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Dec 2017 20:41:32 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.15-rc6
Date: Tue, 26 Dec 2017 17:41:29 -0800
Message-Id: <1514338889-22929-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.15-rc6 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.15-rc6

Thanks,
Guenter
------

The following changes since commit 464e1d5f23cca236b930ef068c328a64cab78fb1:

  Linux 4.15-rc5 (2017-12-23 20:47:16 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.15-rc6

for you to fetch changes up to 47c332deb8e89f6c59b0bb2615945c6e7fad1a60:

  hwmon: Deal with errors from the thermal subsystem (2017-12-26 11:53:24 -0800)

----------------------------------------------------------------
hwmon fixes for v4.16-rc6

Handle errors from thermal subsystem

----------------------------------------------------------------
Linus Walleij (1):
      hwmon: Deal with errors from the thermal subsystem

 drivers/hwmon/hwmon.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)
