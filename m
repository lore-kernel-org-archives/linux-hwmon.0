Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:39311 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936883AbdKRDYS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Nov 2017 22:24:18 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.15 (take 2)
Date: Fri, 17 Nov 2017 19:24:15 -0800
Message-Id: <1510975455-30949-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon updates for Linux v4.15 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.15-take2

Thanks,
Guenter
------

The following changes since commit e60e1ee60630cafef5e430c2ae364877e061d980:

  Merge tag 'drm-for-v4.15' of git://people.freedesktop.org/~airlied/linux (2017-11-15 20:42:10 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.15-take2

for you to fetch changes up to 7adce422dd90bd673ef5c4da32c896bf740e3277:

  hwmon: (w83793) Remove duplicate NULL check (2017-11-16 01:03:19 -0800)

----------------------------------------------------------------
hwmon updates/fixes for v4.15 - take 2

Minor bug fix in k10temp driver
Take advantage of added NULL check in i2c_unregister_device()

----------------------------------------------------------------
Andy Shevchenko (4):
      hwmon: (w83781d) Remove duplicate NULL check
      hwmon: (w83791d) Remove duplicate NULL check
      hwmon: (w83792d) Remove duplicate NULL check
      hwmon: (w83793) Remove duplicate NULL check

Guenter Roeck (1):
      hwmon: (k10temp) Correct model name for Ryzen 1600X

 drivers/hwmon/k10temp.c |  2 +-
 drivers/hwmon/w83781d.c | 12 ++++--------
 drivers/hwmon/w83791d.c | 15 +++++----------
 drivers/hwmon/w83792d.c | 15 +++++----------
 drivers/hwmon/w83793.c  | 15 +++++----------
 5 files changed, 20 insertions(+), 39 deletions(-)
