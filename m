Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:36487 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752097AbdFNV7y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2017 17:59:54 -0400
Received: by mail-pf0-f175.google.com with SMTP id x63so6514037pff.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2017 14:59:53 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 2/3] drivers: w1: refactor w1_slave_show to make the temp reading functionality separate
Date: Wed, 14 Jun 2017 14:59:43 -0700
Message-Id: <20170614215944.24984-3-jaghu@google.com>
In-Reply-To: <20170614215944.24984-1-jaghu@google.com>
References: <20170614215944.24984-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Inside the w1_slave_show function refactor the code to read the temp into a
separate function.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Change-Id: I35741f1345cd2bcb0754ca25c0258843af7ba579
---
 drivers/w1/slaves/w1_therm.c | 82 +++++++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 82611f197b0a..88f4cc8c3908 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -64,6 +64,12 @@ struct w1_therm_family_data {
 	atomic_t refcnt;
 };

+struct therm_info {
+	u8 rom[9];
+	u8 crc;
+	u8 verdict;
+};
+
 /* return the address of the refcnt in the family data */
 #define THERM_REFCNT(family_data) \
 	(&((struct w1_therm_family_data *)family_data)->refcnt)
@@ -427,33 +433,23 @@ static ssize_t w1_slave_store(struct device *device,
 	return ret ? : size;
 }

-static ssize_t w1_slave_show(struct device *device,
-	struct device_attribute *attr, char *buf)
+static ssize_t read_therm(struct device *device,
+			  struct w1_slave *sl, struct therm_info *info)
 {
-	struct w1_slave *sl = dev_to_w1_slave(device);
 	struct w1_master *dev = sl->master;
-	u8 rom[9], crc, verdict, external_power;
-	int i, ret, max_trying = 10;
-	ssize_t c = PAGE_SIZE;
-	u8 *family_data = sl->family_data;
+	u8 external_power;
+	int ret, max_trying = 10;

 	ret = mutex_lock_interruptible(&dev->bus_mutex);
 	if (ret != 0)
 		goto post_unlock;

-	if (!sl->family_data) {
-		ret = -ENODEV;
-		goto pre_unlock;
-	}
-
-	/* prevent the slave from going away in sleep */
-	atomic_inc(THERM_REFCNT(family_data));
-	memset(rom, 0, sizeof(rom));
+	memset(info->rom, 0, sizeof(info->rom));

 	while (max_trying--) {

-		verdict = 0;
-		crc = 0;
+		info->verdict = 0;
+		info->crc = 0;

 		if (!w1_reset_select_slave(sl)) {
 			int count = 0;
@@ -496,30 +492,57 @@ static ssize_t w1_slave_show(struct device *device,
 			if (!w1_reset_select_slave(sl)) {

 				w1_write_8(dev, W1_READ_SCRATCHPAD);
-				count = w1_read_block(dev, rom, 9);
+				count = w1_read_block(dev, info->rom, 9);
 				if (count != 9) {
 					dev_warn(device, "w1_read_block() "
 						"returned %u instead of 9.\n",
 						count);
 				}

-				crc = w1_calc_crc8(rom, 8);
+				info->crc = w1_calc_crc8(info->rom, 8);

-				if (rom[8] == crc)
-					verdict = 1;
+				if (info->rom[8] == info->crc)
+					info->verdict = 1;
 			}
 		}

-		if (verdict)
+		if (info->verdict)
 			break;
 	}

+pre_unlock:
+	mutex_unlock(&dev->bus_mutex);
+
+post_unlock:
+	return ret;
+}
+
+static ssize_t w1_slave_show(struct device *device,
+			     struct device_attribute *attr, char *buf)
+{
+	struct w1_slave *sl = dev_to_w1_slave(device);
+	u8 *family_data = sl->family_data;
+	struct therm_info info;
+	int ret;
+	ssize_t c = PAGE_SIZE;
+	int i;
+
+	if (!sl->family_data)
+		return -ENODEV;
+
+	/* prevent the slave from going away in sleep */
+	atomic_inc(THERM_REFCNT(family_data));
+
+	ret = read_therm(device, sl, &info);
+	if (ret)
+		goto dec_refcnt;
+
 	for (i = 0; i < 9; ++i)
-		c -= snprintf(buf + PAGE_SIZE - c, c, "%02x ", rom[i]);
+		c -= snprintf(buf + PAGE_SIZE - c, c, "%02x ", info.rom[i]);
 	c -= snprintf(buf + PAGE_SIZE - c, c, ": crc=%02x %s\n",
-		      crc, (verdict) ? "YES" : "NO");
-	if (verdict)
-		memcpy(family_data, rom, sizeof(rom));
+		      info.crc, (info.verdict) ? "YES" : "NO");
+	if (info.verdict)
+		memcpy(family_data, info.rom, sizeof(info.rom));
 	else
 		dev_warn(device, "Read failed CRC check\n");

@@ -528,13 +551,10 @@ static ssize_t w1_slave_show(struct device *device,
 			      ((u8 *)family_data)[i]);

 	c -= snprintf(buf + PAGE_SIZE - c, c, "t=%d\n",
-		w1_convert_temp(rom, sl->family->fid));
+			w1_convert_temp(info.rom, sl->family->fid));
 	ret = PAGE_SIZE - c;

-pre_unlock:
-	mutex_unlock(&dev->bus_mutex);
-
-post_unlock:
+dec_refcnt:
 	atomic_dec(THERM_REFCNT(family_data));
 	return ret;
 }
--
2.13.1.508.gb3defc5cc-goog

