Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45782 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbeJZI0K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Oct 2018 04:26:10 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] hwmon: (ina3221) Implement PM runtime to save power
Date: Thu, 25 Oct 2018 16:51:17 -0700
Message-Id: <20181025235122.3240-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This series patches implement PM runtime feature in the ina3221 hwmon
driver (PATCH-5). However, PATCH-[1:4] are required to make sure that
the PM runtime feature would be functional and safe.

Changelog
v3->v4:
 * Added generic pm runtime functions to hwmon class (PATCH-1)
 * Updated to pass pm pointer via _with_info API (PATCH-5)
v2->v3:
 * Dropped timeout dev_err messages as it's indicated in errno (PATCH-4)
 * Improved a dev_err message and comments (PATCH-5)
v1->v2:
 * Added device pointer check (PATCH-1)
 * Returned 0 for alert flags (PATCH-2)
 * Moved CVRF polling to data read routine (PATCH-4)
 * Bypassed i2c_client->dev in suspend/resume() (PATCH-5)

Nicolin Chen (5):
  hwmon: (core) Add pm_runtime to hwmon class
  hwmon: (ina3221) Check channel status for alarms attribute read
  hwmon: (ina3221) Serialize sysfs ABI accesses
  hwmon: (ina3221) Make sure data is ready before reading
  hwmon: (ina3221) Add PM runtime support

 drivers/hwmon/hwmon.c   |  24 ++++
 drivers/hwmon/ina3221.c | 290 ++++++++++++++++++++++++++++++----------
 include/linux/hwmon.h   |   2 +
 3 files changed, 245 insertions(+), 71 deletions(-)

-- 
2.17.1
