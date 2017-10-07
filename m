Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38909 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753008AbdJGAvh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Oct 2017 20:51:37 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.14-rc4
Date: Fri,  6 Oct 2017 17:51:35 -0700
Message-Id: <1507337495-5949-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.14-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.14-rc4

Thanks,
Guenter
------

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.14-rc4

for you to fetch changes up to 74007ae6316ebe40260e44f8ab558f9b1ccc04e5:

  hwmon: (xgene) Fix up error handling path mixup in 'xgene_hwmon_probe()' (2017-10-01 08:46:54 -0700)

----------------------------------------------------------------
Fix up error path in xgene driver

----------------------------------------------------------------
Christophe Jaillet (1):
      hwmon: (xgene) Fix up error handling path mixup in 'xgene_hwmon_probe()'

 drivers/hwmon/xgene-hwmon.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)
