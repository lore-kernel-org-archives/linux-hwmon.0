Return-Path: <SRS0=o4ty=ZG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30E2C432C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 15:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1803206D5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 15:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbMc98Cr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfKNPk1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Nov 2019 10:40:27 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:34803 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfKNPk1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Nov 2019 10:40:27 -0500
Received: by mail-pf1-f176.google.com with SMTP id n13so4505145pff.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Nov 2019 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R2+zodGVtvQoiEBKHSA6Mn33Zg1Y72Q25ujavzGtPdg=;
        b=NbMc98CrhfbDtbnNgJ+nqKURZmp0zWK2p8rZca8DdEMJmHfaHM9qH+6+Yfm6BdbGBt
         SjwWZtjcNVwsBd3HyuJwSuHwDDUclRPhtSUDac0M/qQw/tpMvaJVrgeco1sq+Q7UrJjn
         7kbwfVqmWh98Frf0e0RkuhEV/gGXNjs+njK/GCmlQYpoCgBao9t6R7cz6ThZkWKJWVNd
         aMAgY/WYID5VyE1JJv/2BEterm14oxg8LsTe8TAy1HA+T/VemiznZJywAmaUYbNtveoj
         C8JDLgis5IZFCc7ToTw6eTz2VNQDsRSGugUbMpnakwEIsdu2l/OtDrWrjB+23M5GswqG
         Z8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R2+zodGVtvQoiEBKHSA6Mn33Zg1Y72Q25ujavzGtPdg=;
        b=bdud4hrGnaB+AMsDexwU+Au5R0Ko7uBKZuI6OwKqDeA+S7gVFAuZAN1Mer3/RVAc1y
         1a2sOq5yj+fv3gaFrRZJKsycOH/lAzi1a15UXChRb8C5ZeO7dsgqW0mVg6kgGKLrzRlk
         UFjr2zBr0WIsw3DeoSAY4tdRLFGirzdvhFkY8jHfpPQojBJytmO64ffzPv+Sppwizes9
         DiuT4M64G0m2pmXZw/3H1r5uYSMjnU1ooO2JsOfEWIBJqRy6fYYmC5YBq9qXRa/kaRQk
         90FAXUDTPtvpB8fA0DOqX27Ufl85XinZ3hrRVIfyH398U/VnSBPSNL0AcTlcrLjgRqz2
         ts2g==
X-Gm-Message-State: APjAAAXtDy8f3BF8mq+81YgKQQUACc15wHR8dACkkjsZliBQJKLPGtlW
        aDL1u7CHWCv+0QSY5CWY9q4=
X-Google-Smtp-Source: APXvYqw2g4ndHVQNTcWEt5PWEF9YT0GVPS6a9Hh3cmuJz8aSHsDQW1cywIoZISAzJwHzP3Me0HR8bA==
X-Received: by 2002:a17:90a:1a08:: with SMTP id 8mr13490426pjk.12.1573746026077;
        Thu, 14 Nov 2019 07:40:26 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id 206sm11490858pfu.45.2019.11.14.07.40.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Nov 2019 07:40:25 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/2] nvme: hwmon: provide temperature min and max values for each sensor
Date:   Fri, 15 Nov 2019 00:40:00 +0900
Message-Id: <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According to the NVMe specification, the over temperature threshold and
under temperature threshold features shall be implemented for Composite
Temperature if a non-zero WCTEMP field value is reported in the Identify
Controller data structure.  The features are also implemented for all
implemented temperature sensors (i.e., all Temperature Sensor fields that
report a non-zero value).

This provides the over temperature threshold and under temperature
threshold for each sensor as temperature min and max values of hwmon
sysfs attributes.

The WCTEMP is already provided as a temperature max value for Composite
Temperature, but this change isn't incompatible.  Because the default
value of the over temperature threshold for Composite Temperature is
the WCTEMP.

Now the alarm attribute for Composite Temperature indicates one of the
temperature is outside of a temperature threshold.  Because there is only
a single bit in Critical Warning field that indicates a temperature is
outside of a threshold.

Example output from the "sensors" command:

nvme-pci-0100
Adapter: PCI adapter
Composite:    +33.9°C  (low  = -273.1°C, high = +69.8°C)
                       (crit = +79.8°C)
Sensor 1:     +34.9°C  (low  = -273.1°C, high = +65261.8°C)
Sensor 2:     +31.9°C  (low  = -273.1°C, high = +65261.8°C)
Sensor 5:     +47.9°C  (low  = -273.1°C, high = +65261.8°C)

This also adds helper macros for kelvin from/to milli Celsius conversion,
and replaces the repeated code in nvme-hwmon.c.

Cc: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/nvme/host/nvme-hwmon.c | 106 ++++++++++++++++++++++++++++++++++-------
 include/linux/nvme.h           |   6 +++
 2 files changed, 96 insertions(+), 16 deletions(-)

diff --git a/drivers/nvme/host/nvme-hwmon.c b/drivers/nvme/host/nvme-hwmon.c
index 5480cbb..97a84b4 100644
--- a/drivers/nvme/host/nvme-hwmon.c
+++ b/drivers/nvme/host/nvme-hwmon.c
@@ -9,12 +9,57 @@
 
 #include "nvme.h"
 
+/* These macros should be moved to linux/temperature.h */
+#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
+#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)
+
 struct nvme_hwmon_data {
 	struct nvme_ctrl *ctrl;
 	struct nvme_smart_log log;
 	struct mutex read_lock;
 };
 
+static int nvme_get_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
+				long *temp)
+{
+	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
+	u32 status;
+	int ret;
+
+	if (under)
+		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
+
+	ret = nvme_get_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
+				&status);
+	if (ret > 0)
+		return -EIO;
+	if (ret < 0)
+		return ret;
+	*temp = KELVIN_TO_MILLICELSIUS(status & NVME_TEMP_THRESH_MASK);
+
+	return 0;
+}
+
+static int nvme_set_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
+				long temp)
+{
+	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
+	int ret;
+
+	temp = MILLICELSIUS_TO_KELVIN(temp);
+	threshold |= clamp_val(temp, 0, NVME_TEMP_THRESH_MASK);
+
+	if (under)
+		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
+
+	ret = nvme_set_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
+				NULL);
+	if (ret > 0)
+		return -EIO;
+
+	return ret;
+}
+
 static int nvme_hwmon_get_smart_log(struct nvme_hwmon_data *data)
 {
 	int ret;
@@ -39,10 +84,11 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	switch (attr) {
 	case hwmon_temp_max:
-		*val = (data->ctrl->wctemp - 273) * 1000;
-		return 0;
+		return nvme_get_temp_thresh(data->ctrl, channel, false, val);
+	case hwmon_temp_min:
+		return nvme_get_temp_thresh(data->ctrl, channel, true, val);
 	case hwmon_temp_crit:
-		*val = (data->ctrl->cctemp - 273) * 1000;
+		*val = KELVIN_TO_MILLICELSIUS(data->ctrl->cctemp);
 		return 0;
 	default:
 		break;
@@ -59,7 +105,7 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			temp = get_unaligned_le16(log->temperature);
 		else
 			temp = le16_to_cpu(log->temp_sensor[channel - 1]);
-		*val = (temp - 273) * 1000;
+		*val = KELVIN_TO_MILLICELSIUS(temp);
 		break;
 	case hwmon_temp_alarm:
 		*val = !!(log->critical_warning & NVME_SMART_CRIT_TEMPERATURE);
@@ -73,6 +119,23 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	return err;
 }
 
+static int nvme_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct nvme_hwmon_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_temp_max:
+		return nvme_set_temp_thresh(data->ctrl, channel, false, val);
+	case hwmon_temp_min:
+		return nvme_set_temp_thresh(data->ctrl, channel, true, val);
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
 static const char * const nvme_hwmon_sensor_names[] = {
 	"Composite",
 	"Sensor 1",
@@ -105,8 +168,10 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
 			return 0444;
 		break;
 	case hwmon_temp_max:
-		if (!channel && data->ctrl->wctemp)
-			return 0444;
+	case hwmon_temp_min:
+		if ((!channel && data->ctrl->wctemp) ||
+		    (channel && data->log.temp_sensor[channel - 1]))
+			return 0644;
 		break;
 	case hwmon_temp_alarm:
 		if (!channel)
@@ -126,16 +191,24 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
 static const struct hwmon_channel_info *nvme_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
-				HWMON_T_LABEL | HWMON_T_ALARM,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL),
 	NULL
 };
 
@@ -143,6 +216,7 @@ static const struct hwmon_ops nvme_hwmon_ops = {
 	.is_visible	= nvme_hwmon_is_visible,
 	.read		= nvme_hwmon_read,
 	.read_string	= nvme_hwmon_read_string,
+	.write		= nvme_hwmon_write,
 };
 
 static const struct hwmon_chip_info nvme_hwmon_chip_info = {
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 269b2e8..347a44f 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -803,6 +803,12 @@ struct nvme_write_zeroes_cmd {
 
 /* Features */
 
+enum {
+	NVME_TEMP_THRESH_MASK		= 0xffff,
+	NVME_TEMP_THRESH_SELECT_SHIFT	= 16,
+	NVME_TEMP_THRESH_TYPE_UNDER	= 0x100000,
+};
+
 struct nvme_feat_auto_pst {
 	__le64 entries[32];
 };
-- 
2.7.4

