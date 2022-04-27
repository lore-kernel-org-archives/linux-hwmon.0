Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8A3C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 13:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbiD0NFj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 09:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbiD0NFi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 09:05:38 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA2853E22
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651064547;
  x=1682600547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VmamUpVTVhSN7Z1PyeWOu2spnVJSlFbrGllMZKM0Hgg=;
  b=d29c47tXhO686+zKb9vkknw/DykXNNvrGBrbmi6lZAG9WSdx+AXG6AN8
   9FiyC4Hk4nbvP1wy233sIhI+SK/y/JxnMsA4tBjtdmdwS0RS5H0fLT1r1
   twiz8vnI+na2TpDWXv4sarLj73wPjnamBK5rkdJrgIy2RO6TeYn8KHSou
   CK0wt6+5m6xCHneSAhte/GQYkmz5jGGQ8XDJLbFW/GeNk6+9dwFdec0Os
   tZ/kIElgs2Uhs6tjzakjILjlM3IQWY6xLyUfwJdDp2fDkhCVscAjDkj6d
   lynjymOcath+VVgMaItzY57/ejfLTZWm5aydIWUuHoPSVvyiq6QO6bxoT
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 0/3] hwmon: (pmbus/ltc2978) Add regulator ops
Date:   Wed, 27 Apr 2022 15:02:10 +0200
Message-ID: <20220427130213.1557793-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi!

The LTC2978 driver supports a wide range of power regulator chips, but it
has limited functionality for using it in a dynamic regulator framework.
Since standard functions for setting and getting voltage are missing as
pmbus core operations this patchset adds it.

These patches have been tested on an ARTPEC-8 developer board with a group
of LTC2977 power regulators.

Kind regards
Mårten Lindahl

Changes in v2:
 - Add pmbus core _pmbus_write_byte_data to check for driver specific callback
 - Change pmbus_update_byte_data to use _pmbus_read/write_byte_data
 - Change pmbus_regulator_is_enabled to use _pmbus_read_byte_data
 - Export pmbus core functions enable/disable/is_enabled

Changes in v3:
 - Split patch "hwmon: (pmbus/ltc2978) Use driver specific ops if they exist"
   into two patches: (1) pmbus core, (2) ltc2978.
 - Move ltc2978_regulator_get/set_voltage functions to pmbus core.

Mårten Lindahl (3):
  hwmon: (pmbus) Use driver specific ops if they exist
  hwmon: (pmbus/ltc2978) Add chip specific write_byte_data
  hwmon: (pmbus) Add get_voltage/set_voltage ops

 drivers/hwmon/pmbus/ltc2978.c    |  12 ++++
 drivers/hwmon/pmbus/pmbus.h      |   2 +
 drivers/hwmon/pmbus/pmbus_core.c | 101 +++++++++++++++++++++++++------
 3 files changed, 95 insertions(+), 20 deletions(-)

-- 
2.30.2

