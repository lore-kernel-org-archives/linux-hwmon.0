Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50548 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933297AbeFUQib (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jun 2018 12:38:31 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.18-rc2
Date: Thu, 21 Jun 2018 09:38:30 -0700
Message-Id: <1529599110-4073-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.18-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.18-rc2

Thanks,
Guenter
------

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.18-rc2

for you to fetch changes up to 91bb8f45f73f19a0150c233c0f11cdeb6d71d1e9:

  hwmon: (nct6775) Fix loop limit (2018-06-16 16:40:36 -0700)

----------------------------------------------------------------
hwmon fixes for v4.18-rc2

- Fix a loop limit in nct6775 driver
- Disable fan support for Dell XPS13 9333

----------------------------------------------------------------
Guenter Roeck (1):
      hwmon: (nct6775) Fix loop limit

Helge Eichelberg (1):
      hwmon: (dell-smm) Disable fan support for Dell XPS13 9333

 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 drivers/hwmon/nct6775.c        | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)
