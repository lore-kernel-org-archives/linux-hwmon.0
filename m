Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33522 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbeH3AbO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Aug 2018 20:31:14 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.19-rc2
Date: Wed, 29 Aug 2018 13:32:40 -0700
Message-Id: <1535574760-11636-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.19-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.19-rc2

Thanks,
Guenter
------

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.19-rc2

for you to fetch changes up to d49dbfade96d5b0863ca8a90122a805edd5ef50a:

  hwmon: (nct6775) Fix potential Spectre v1 (2018-08-26 17:45:25 -0700)

----------------------------------------------------------------
hwmon fixes for v4.19-rc2

- Fix potential Spectre v1 in nct6775
- Add error checking to adt7475 driver
- Fix reading shunt resistor value in ina2xx driver

----------------------------------------------------------------
Dan Carpenter (2):
      hwmon: (adt7475) Potential error pointer dereferences
      hwmon: (adt7475) Make adt7475_read_word() return errors

Gustavo A. R. Silva (1):
      hwmon: (nct6775) Fix potential Spectre v1

Lothar Felten (1):
      hwmon: (ina2xx) fix sysfs shunt resistor read access

 Documentation/hwmon/ina2xx           |  2 +-
 drivers/hwmon/adt7475.c              | 25 +++++++++++++++++--------
 drivers/hwmon/ina2xx.c               | 13 +++++++++++--
 drivers/hwmon/nct6775.c              |  2 ++
 include/linux/platform_data/ina2xx.h |  2 +-
 5 files changed, 32 insertions(+), 12 deletions(-)
