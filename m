Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:47098 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbeIZMyY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Sep 2018 08:54:24 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 0/2] hwmon: ina3221: Add power and enable sysfs nodes
Date: Tue, 25 Sep 2018 23:42:43 -0700
Message-Id: <20180926064245.4091-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This series of patch is to add three sets of sysfs nodes for ina3221
hwmon driver. PATCH-1 adds two power sysfs nodes while PATCH-2 adds
an enable node.

Note: both two patches are rebased upon the following patch:
        "hwmon: ina3221: Read channel input source info from DT"
      As this patch is still under review (waiting for an ack from DT
      binding side), these two patches can only go through review at
      this point -- needs to wait for the patch above getting merged
      first.

Nicolin Chen (2):
  hwmon: ina3221: Add power sysfs nodes
  hwmon: ina3221: Add enable sysfs nodes

 Documentation/hwmon/ina3221 |   5 +
 drivers/hwmon/ina3221.c     | 228 +++++++++++++++++++++++++++++++++---
 2 files changed, 218 insertions(+), 15 deletions(-)

-- 
2.17.1
