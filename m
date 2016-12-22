Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48905 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938770AbcLVSzg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 13:55:36 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v4.10 (take 2)
Date: Thu, 22 Dec 2016 10:55:34 -0800
Message-Id: <1482432934-22961-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull a final set of hwmon updates for Linux v4.10 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.10-t2

As mentioned in the tag, this patch series was auto-generated using coccinelle.
I would like to have it applied either now or right after -rc1, at your
preference.

The series passed my own build tests (kerneltests.org:hwmon-next) as well
as 0day tests.

Thanks,
Guenter
------

The following changes since commit 52bce91165e5f2db422b2b972e83d389e5e4725c:

  splice: reinstate SIGPIPE/EPIPE handling (2016-12-21 10:59:34 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.10-t2

for you to fetch changes up to 506f231aca4d861a053a55c060703a94ca2338a3:

  hwmon: (tmp401) use permission-specific DEVICE_ATTR variants (2016-12-22 07:10:09 -0800)

----------------------------------------------------------------
hwmon updates for v4.10 take 2: use permission-specific DEVICE_ATTR variants

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies
the source code, improves readbility, and reduces the chance of
inconsistencies.

The patches in this series were auto-generated using coccinelle.

----------------------------------------------------------------
Julia Lawall (66):
      hwmon: (adm1021) use permission-specific DEVICE_ATTR variants
      hwmon: (adm1026) use permission-specific DEVICE_ATTR variants
      hwmon: (adm1031) use permission-specific DEVICE_ATTR variants
      hwmon: (adm9240) use permission-specific DEVICE_ATTR variants
      hwmon: (adt7470) use permission-specific DEVICE_ATTR variants
      hwmon: (adt7x10) use permission-specific DEVICE_ATTR variants
      hwmon: (asb100) use permission-specific DEVICE_ATTR variants
      hwmon: (atxp1) use permission-specific DEVICE_ATTR variants
      hwmon: (ds1621) use permission-specific DEVICE_ATTR variants
      hwmon: (f71882fg) use permission-specific DEVICE_ATTR variants
      hwmon: (fschmd) use permission-specific DEVICE_ATTR variants
      hwmon: (g760a) use permission-specific DEVICE_ATTR variants
      hwmon: (g762) use permission-specific DEVICE_ATTR variants
      hwmon: (gl520sm) use permission-specific DEVICE_ATTR variants
      hwmon: (gpio-fan) use permission-specific DEVICE_ATTR variants
      hwmon: (core) use permission-specific DEVICE_ATTR variants
      hwmon: (i5500_temp) use permission-specific DEVICE_ATTR variants
      hwmon: (i5k_amb) use permission-specific DEVICE_ATTR variants
      hwmon: (jz4740) use permission-specific DEVICE_ATTR variants
      hwmon: (lm63) use permission-specific DEVICE_ATTR variants
      hwmon: (lm70) use permission-specific DEVICE_ATTR variants
      hwmon: (lm80) use permission-specific DEVICE_ATTR variants
      hwmon: (lm85) use permission-specific DEVICE_ATTR variants
      hwmon: (lm87) use permission-specific DEVICE_ATTR variants
      hwmon: (lm92) use permission-specific DEVICE_ATTR variants
      hwmon: (lm93) use permission-specific DEVICE_ATTR variants
      hwmon: (max1111) use permission-specific DEVICE_ATTR variants
      hwmon: (max1619) use permission-specific DEVICE_ATTR variants
      hwmon: (max197) use permission-specific DEVICE_ATTR variants
      hwmon: (mc13783-adc) use permission-specific DEVICE_ATTR variants
      hwmon: (mcp3021) use permission-specific DEVICE_ATTR variants
      hwmon: (nct6683) use permission-specific DEVICE_ATTR variants
      hwmon: (nsa320) use permission-specific DEVICE_ATTR variants
      hwmon: (pcf8591) use permission-specific DEVICE_ATTR variants
      hwmon: (sht15) use permission-specific DEVICE_ATTR variants
      hwmon: (sis5595) use permission-specific DEVICE_ATTR variants
      hwmon: (smsc47m1) use permission-specific DEVICE_ATTR variants
      hwmon: (smsc47m192) use permission-specific DEVICE_ATTR variants
      hwmon: (via-cputemp) use permission-specific DEVICE_ATTR variants
      hwmon: (via686a) use permission-specific DEVICE_ATTR variants
      hwmon: (w83627ehf) use permission-specific DEVICE_ATTR variants
      hwmon: (w83627hf) use permission-specific DEVICE_ATTR variants
      hwmon: (w83781d) use permission-specific DEVICE_ATTR variants
      hwmon: (w83792d) use permission-specific DEVICE_ATTR variants
      hwmon: (w83791d) use permission-specific DEVICE_ATTR variants
      hwmon: (pc87427) use permission-specific DEVICE_ATTR variants
      hwmon: (f71805f) use permission-specific DEVICE_ATTR variants
      hwmon: (w83793) use permission-specific DEVICE_ATTR variants
      hwmon: (vt8231) use permission-specific DEVICE_ATTR variants
      hwmon: (k10temp) use permission-specific DEVICE_ATTR variants
      hwmon: (dme1737) use permission-specific DEVICE_ATTR variants
      hwmon: (it87) use permission-specific DEVICE_ATTR variants
      hwmon: (lm90) use permission-specific DEVICE_ATTR variants
      hwmon: (nct6775) use permission-specific DEVICE_ATTR variants
      hwmon: (pc87360) use permission-specific DEVICE_ATTR variants
      hwmon: (lm78) use permission-specific DEVICE_ATTR variants
      hwmon: (sch5627) use permission-specific DEVICE_ATTR variants
      hwmon: (k8temp) use permission-specific DEVICE_ATTR variants
      hwmon: (adm1025) use permission-specific DEVICE_ATTR variants
      hwmon: (lm83) use permission-specific DEVICE_ATTR variants
      hwmon: (emc2103) use permission-specific DEVICE_ATTR variants
      hwmon: (max6650) use permission-specific DEVICE_ATTR variants
      hwmon: (lm95234) use permission-specific DEVICE_ATTR variants
      hwmon: (adt7475) use permission-specific DEVICE_ATTR variants
      hwmon: (fam15h_power) use permission-specific DEVICE_ATTR variants
      hwmon: (tmp401) use permission-specific DEVICE_ATTR variants

 drivers/hwmon/adm1021.c      |  14 ++---
 drivers/hwmon/adm1025.c      |  16 +++---
 drivers/hwmon/adm1026.c      | 128 ++++++++++++++++++++++---------------------
 drivers/hwmon/adm1031.c      |  15 +++--
 drivers/hwmon/adm9240.c      |  28 +++++-----
 drivers/hwmon/adt7470.c      |  48 +++++++---------
 drivers/hwmon/adt7475.c      |  28 +++++-----
 drivers/hwmon/adt7x10.c      |   7 +--
 drivers/hwmon/asb100.c       |  36 ++++++------
 drivers/hwmon/atxp1.c        |  35 ++++++------
 drivers/hwmon/dme1737.c      |  18 +++---
 drivers/hwmon/ds1621.c       |  16 +++---
 drivers/hwmon/emc2103.c      |  36 ++++++------
 drivers/hwmon/f71805f.c      |  16 +++---
 drivers/hwmon/f71882fg.c     |   6 +-
 drivers/hwmon/fam15h_power.c |  34 ++++++------
 drivers/hwmon/fschmd.c       |   6 +-
 drivers/hwmon/g760a.c        |  22 ++++----
 drivers/hwmon/g762.c         |  86 ++++++++++++++---------------
 drivers/hwmon/gl520sm.c      |  48 ++++++++--------
 drivers/hwmon/gpio-fan.c     |  54 +++++++++---------
 drivers/hwmon/hwmon.c        |   4 +-
 drivers/hwmon/i5500_temp.c   |   6 +-
 drivers/hwmon/i5k_amb.c      |   4 +-
 drivers/hwmon/it87.c         |  20 +++----
 drivers/hwmon/jz4740-hwmon.c |   6 +-
 drivers/hwmon/k10temp.c      |  12 ++--
 drivers/hwmon/k8temp.c       |   4 +-
 drivers/hwmon/lm63.c         |  48 ++++++++--------
 drivers/hwmon/lm70.c         |   6 +-
 drivers/hwmon/lm78.c         |  38 ++++++-------
 drivers/hwmon/lm80.c         |   4 +-
 drivers/hwmon/lm83.c         |   4 +-
 drivers/hwmon/lm85.c         |  22 ++++----
 drivers/hwmon/lm87.c         |  43 ++++++++-------
 drivers/hwmon/lm90.c         |   8 +--
 drivers/hwmon/lm92.c         |  10 ++--
 drivers/hwmon/lm93.c         |  39 ++++++-------
 drivers/hwmon/lm95234.c      |  12 ++--
 drivers/hwmon/max1111.c      |   4 +-
 drivers/hwmon/max1619.c      |   4 +-
 drivers/hwmon/max197.c       |   6 +-
 drivers/hwmon/max6650.c      |  44 ++++++++-------
 drivers/hwmon/mc13783-adc.c  |   6 +-
 drivers/hwmon/mcp3021.c      |   6 +-
 drivers/hwmon/nct6683.c      |  17 +++---
 drivers/hwmon/nct6775.c      |   4 +-
 drivers/hwmon/nsa320-hwmon.c |  12 ++--
 drivers/hwmon/pc87360.c      |  26 ++++-----
 drivers/hwmon/pc87427.c      |   4 +-
 drivers/hwmon/pcf8591.c      |  24 ++++----
 drivers/hwmon/sch5627.c      |   4 +-
 drivers/hwmon/sht15.c        |   4 +-
 drivers/hwmon/sis5595.c      |  36 ++++++------
 drivers/hwmon/smsc47m1.c     |  10 ++--
 drivers/hwmon/smsc47m192.c   |  14 ++---
 drivers/hwmon/tmp401.c       |  11 ++--
 drivers/hwmon/via-cputemp.c  |   6 +-
 drivers/hwmon/via686a.c      |   8 +--
 drivers/hwmon/vt8231.c       |  59 ++++++++++----------
 drivers/hwmon/w83627ehf.c    |   8 +--
 drivers/hwmon/w83627hf.c     |  53 +++++++++---------
 drivers/hwmon/w83781d.c      |  34 ++++++------
 drivers/hwmon/w83791d.c      |  23 ++++----
 drivers/hwmon/w83792d.c      |  15 +++--
 drivers/hwmon/w83793.c       |   6 +-
 66 files changed, 709 insertions(+), 726 deletions(-)
