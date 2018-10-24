Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36042 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbeJXLeT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Oct 2018 07:34:19 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] hwmon: (ina3221) Check channel status for alarms attribute read
Date: Tue, 23 Oct 2018 19:36:20 -0700
Message-Id: <20181024023623.4231-3-nicoleotsuka@gmail.com>
In-Reply-To: <20181024023623.4231-1-nicoleotsuka@gmail.com>
References: <20181024023623.4231-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

There is nothing critically wrong to read these two attributes
without having a is_enabled() check at this point. But reading
the MASK_ENABLE register would clear the CVRF bit according to
the datasheet. So it'd be safer to fence for disabled channels
in order to add pm runtime feature.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v1->v2:
 * Returned 0 for alert flags instead of -ENODATA

 drivers/hwmon/ina3221.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index d61688f04594..26cdf3342d80 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -200,6 +200,12 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
 		return 0;
 	case hwmon_curr_crit_alarm:
 	case hwmon_curr_max_alarm:
+		/* No actual register read if channel is disabled */
+		if (!ina3221_is_enabled(ina, channel)) {
+			/* Return 0 for alert flags */
+			*val = 0;
+			return 0;
+		}
 		ret = regmap_field_read(ina->fields[reg], &regval);
 		if (ret)
 			return ret;
-- 
2.17.1
