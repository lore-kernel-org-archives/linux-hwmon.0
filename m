Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:44411 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752914AbdLBQLA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Dec 2017 11:11:00 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.15-rc2
Date: Sat,  2 Dec 2017 08:10:58 -0800
Message-Id: <1512231058-14421-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.15-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.15-rc2

Thanks,
Guenter
------

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.15-rc2

for you to fetch changes up to 68615eb01f82256c19e41967bfb3eef902f77033:

  hwmon: (jc42) optionally try to disable the SMBUS timeout (2017-11-30 13:12:44 -0800)

----------------------------------------------------------------
hwmon fixes for v4.15-rc2

Drop reference to obsolete maintainer tree
Fix overflow bug in pmbus driver
Fix SMBUS timeout problem in jc42 driver

For the SMBUS timeout handling, we had a brief discussion if this should
be considered a bug fix or a feature. Peter says "it fixes real problems
where the application misbehave due to faulty content when reading from
an eeprom", and he needs the patch in his company's v4.14 images. This is
good enough for me and warrants backport to stable kernels.

----------------------------------------------------------------
Jean Delvare (1):
      hwmon: Drop reference to Jean's tree

Peter Rosin (1):
      hwmon: (jc42) optionally try to disable the SMBUS timeout

Robert Lippert (1):
      hwmon: (pmbus) Use 64bit math for DIRECT format values

 Documentation/devicetree/bindings/hwmon/jc42.txt |  4 ++++
 MAINTAINERS                                      |  1 -
 drivers/hwmon/jc42.c                             | 21 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c                 | 21 ++++++++++++---------
 4 files changed, 37 insertions(+), 10 deletions(-)
