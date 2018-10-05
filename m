Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32904 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbeJFHAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Oct 2018 03:00:17 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (ina3221) Apply _info API
Date: Fri,  5 Oct 2018 16:59:03 -0700
Message-Id: <20181005235905.29403-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This series of patches applies _info API of hwmon core to
the ina3221 hwmon driver.

Nicolin Chen (2):
  hwmon: (core) Add hwmon_in_enable attribute
  hwmon: (ina3221) Use _info API to register hwmon device

 drivers/hwmon/hwmon.c   |   1 +
 drivers/hwmon/ina3221.c | 528 +++++++++++++++++++---------------------
 include/linux/hwmon.h   |   2 +
 3 files changed, 248 insertions(+), 283 deletions(-)

-- 
2.17.1
