Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42136 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbeKZKjb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Nov 2018 05:39:31 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.20-rc5
Date: Sun, 25 Nov 2018 15:47:10 -0800
Message-Id: <1543189630-5306-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.20-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v4.20-rc5

Thanks,
Guenter
------

The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v4.20-rc5

for you to fetch changes up to 09aaf6813cfca4c18034fda7a43e68763f34abb1:

  hwmon: (w83795) temp4_type has writable permission (2018-11-18 14:34:56 -0800)

----------------------------------------------------------------
hwmon fixes for v4.20-rc5

Fix temp4_type attribute permissions in w83795 driver
Fix tacho fault detection in mlxreg-fan driver
Fix current value calculations in ina2xx driver
Fix initial notification/warning in raspberrypi driver
Fix a NULL pointer access in ina2xx

----------------------------------------------------------------
Huacai Chen (1):
      hwmon: (w83795) temp4_type has writable permission

Nicolin Chen (2):
      hwmon (ina2xx) Fix NULL id pointer in probe()
      hwmon: (ina2xx) Fix current value calculation

Stefan Wahren (1):
      hwmon: (raspberrypi) Fix initial notify

Vadim Pasternak (1):
      hwmon: (mlxreg-fan) Fix macros for tacho fault reading

 drivers/hwmon/ina2xx.c            | 6 +++---
 drivers/hwmon/mlxreg-fan.c        | 2 +-
 drivers/hwmon/raspberrypi-hwmon.c | 6 ------
 drivers/hwmon/w83795.c            | 2 +-
 4 files changed, 5 insertions(+), 11 deletions(-)
