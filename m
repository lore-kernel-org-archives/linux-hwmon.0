Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:34392 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752628AbdFNV7z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2017 17:59:55 -0400
Received: by mail-pf0-f181.google.com with SMTP id s66so6543343pfs.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2017 14:59:55 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 3/3] drivers: w1: add hwmon temp support for w1_therm
Date: Wed, 14 Jun 2017 14:59:44 -0700
Message-Id: <20170614215944.24984-4-jaghu@google.com>
In-Reply-To: <20170614215944.24984-1-jaghu@google.com>
References: <20170614215944.24984-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This change adds hwmon temp support for w1_therm.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Change-Id: I66c0837d63b5a5839227319608eb8061b917f5fa
---
 drivers/w1/slaves/w1_therm.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 88f4cc8c3908..dba2d21fa731 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -105,8 +105,12 @@ static ssize_t w1_slave_store(struct device *device,
 static ssize_t w1_seq_show(struct device *device,
 	struct device_attribute *attr, char *buf);

+static ssize_t temp1_input_show(struct device *device,
+	struct device_attribute *attr, char *buf);
+
 static DEVICE_ATTR_RW(w1_slave);
 static DEVICE_ATTR_RO(w1_seq);
+static DEVICE_ATTR_RO(temp1_input);

 static struct attribute *w1_therm_attrs[] = {
 	&dev_attr_w1_slave.attr,
@@ -118,19 +122,27 @@ static struct attribute *w1_ds28ea00_attrs[] = {
 	&dev_attr_w1_seq.attr,
 	NULL,
 };
+static struct attribute *w1_therm_hwmon_attrs[] = {
+	&dev_attr_temp1_input.attr,
+	NULL,
+};
+
 ATTRIBUTE_GROUPS(w1_therm);
 ATTRIBUTE_GROUPS(w1_ds28ea00);
+ATTRIBUTE_GROUPS(w1_therm_hwmon);

 static struct w1_family_ops w1_therm_fops = {
 	.add_slave	= w1_therm_add_slave,
 	.remove_slave	= w1_therm_remove_slave,
 	.groups		= w1_therm_groups,
+	.hwmon_groups   = w1_therm_hwmon_groups,
 };

 static struct w1_family_ops w1_ds28ea00_fops = {
 	.add_slave	= w1_therm_add_slave,
 	.remove_slave	= w1_therm_remove_slave,
 	.groups		= w1_ds28ea00_groups,
+	.hwmon_groups   = w1_therm_hwmon_groups,
 };

 static struct w1_family w1_therm_family_DS18S20 = {
@@ -559,6 +571,38 @@ static ssize_t w1_slave_show(struct device *device,
 	return ret;
 }

+static ssize_t temp1_input_show(struct device *device,
+				struct device_attribute *attr, char *buf)
+{
+	struct w1_slave *sl = dev_get_drvdata(device);
+	u8 *family_data = sl->family_data;
+	struct therm_info info;
+	int ret;
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
+	if (!info.verdict) {
+		dev_warn(device, "Read failed CRC check\n");
+		ret = -EIO;
+		goto dec_refcnt;
+	}
+
+	ret = sprintf(buf, "%d\n",
+			w1_convert_temp(info.rom, sl->family->fid));
+
+dec_refcnt:
+	atomic_dec(THERM_REFCNT(family_data));
+	return ret;
+}
+
 #define W1_42_CHAIN	0x99
 #define W1_42_CHAIN_OFF	0x3C
 #define W1_42_CHAIN_OFF_INV	0xC3
--
2.13.1.508.gb3defc5cc-goog

