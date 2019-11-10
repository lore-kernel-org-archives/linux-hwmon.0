Return-Path: <SRS0=h/x4=ZC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA99C43331
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Nov 2019 14:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13A4820B7C
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Nov 2019 14:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcCHW+Xj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfKJOSI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Nov 2019 09:18:08 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42378 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKJOSI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Nov 2019 09:18:08 -0500
Received: by mail-pl1-f194.google.com with SMTP id j12so6497453plt.9
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Nov 2019 06:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=56oOc1o5bBJYxyuKfO925aa4uXU941JiLicanGKQoak=;
        b=pcCHW+XjiLsSOFFtyt7KnbTPpnLPgPBU7l9nPi+1yXMbERnVFINFCpP0WIWsc5aWKX
         aEdrsacwnV5Ky1oY3bSK6ABDIIryjomBNF9oJVhdjT1Rrc1DUL+TmNP6+hM+0Lctueoy
         O/+f0i24E8XVw1TSbvUPKXLfSPw6VrTdJLX2mxNmfCfxFpD8Suo39cCdVEvKz53n5RMF
         KMUjOCInExNaF2vS3fTNIk8N3RGxMhG6w4Z3tfUnhpKPACTWpPhPUPGY8PGT/PFdnFV1
         hEP8eomaJnLwdexuv4c7PdcleO+7OWuw6Dg2Gzh2toCiGNCG0REFWfLTFmOfPkBronk3
         PhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=56oOc1o5bBJYxyuKfO925aa4uXU941JiLicanGKQoak=;
        b=FkpunrjUW0WDkOU9zHl1Rm9xdngnAW4kGUrV2GkSFeowBORFkmXiORPtm39Hy0LmQV
         WnMlAZCXCHFQNEAiCV2NhZzLiB56Rp0Miyr8ru3IPv3rTWFhi1/GDDIPC+IeUsv244MN
         atXIgy1UYI6MLsBaTWZ+fNnNDpns5ogHuK3inh9c2CTgUO7WzptFtnN4VNbtItNFpUw9
         c3qOCWyJu3FpkeWTuoGpW09Bppo4xj39xY6y7J+1l+4qd+krs+4W9ph89CGlOFHX7eIh
         Zuh0WjCbRicmG5eScUWM8pg/HO/lMX1hJlHqwerGQCLkdnt5CkXPkhU0q0DV47ItpJQY
         +Wqw==
X-Gm-Message-State: APjAAAXFF32HFt6+j+WSSKVzdcR3JqfaBQURThE+HOPFoN1Nw17dOoDx
        iXOpEMul8zW9YQFAXPwIYao=
X-Google-Smtp-Source: APXvYqyt6yKEiiKM7l7Eb6oL8y+rCt/S6h4Kzyt/e5DVmtkuZBhXbDomEbmFWe+mhhdb/oXY/WTNPg==
X-Received: by 2002:a17:902:d717:: with SMTP id w23mr3146303ply.142.1573395487415;
        Sun, 10 Nov 2019 06:18:07 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id c13sm12213253pfo.5.2019.11.10.06.18.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 10 Nov 2019 06:18:06 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] nvme: hwmon: provide temperature min and max values for each sensor
Date:   Sun, 10 Nov 2019 23:17:46 +0900
Message-Id: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
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

This also provides alarm attributes for each temperature sensor.  But all
alarm conditions are same, because there is only a single bit in
Critical Warning field that indicates one of the temperature is outside of
a temperature threshold.

Example output from the "sensors" command:

nvme-pci-0100
Adapter: PCI adapter
Composite:    +53.0 C  (low  = -273.0 C, high = +70.0 C)
                       (crit = +80.0 C)
Sensor 1:     +56.0 C  (low  = -273.0 C, high = +65262.0 C)
Sensor 2:     +51.0 C  (low  = -273.0 C, high = +65262.0 C)
Sensor 5:     +73.0 C  (low  = -273.0 C, high = +65262.0 C)

Cc: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
This patch depends on the patch "nvme: Add hardware monitoring support" [1]
[1] http://lists.infradead.org/pipermail/linux-nvme/2019-November/027883.html

 drivers/nvme/host/nvme-hwmon.c | 98 ++++++++++++++++++++++++++++++++++++------
 include/linux/nvme.h           |  6 +++
 2 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/nvme/host/nvme-hwmon.c b/drivers/nvme/host/nvme-hwmon.c
index 5480cbb..79323b2 100644
--- a/drivers/nvme/host/nvme-hwmon.c
+++ b/drivers/nvme/host/nvme-hwmon.c
@@ -15,6 +15,46 @@ struct nvme_hwmon_data {
 	struct mutex read_lock;
 };
 
+static int nvme_get_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
+				long *temp)
+{
+	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
+	int status;
+	int ret;
+
+	if (under)
+		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
+
+	ret = nvme_get_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
+				&status);
+	if (!ret)
+		*temp = ((status & NVME_TEMP_THRESH_MASK) - 273) * 1000;
+
+	return ret <= 0 ? ret : -EIO;
+}
+
+static int nvme_set_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
+				long temp)
+{
+	unsigned int threshold = sensor << NVME_TEMP_THRESH_SELECT_SHIFT;
+	int status;
+	int ret;
+
+	temp = temp / 1000 + 273;
+	if (temp > NVME_TEMP_THRESH_MASK)
+		return -EINVAL;
+
+	threshold |= temp;
+
+	if (under)
+		threshold |= NVME_TEMP_THRESH_TYPE_UNDER;
+
+	ret = nvme_set_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold, NULL, 0,
+				&status);
+
+	return ret <= 0 ? ret : -EIO;
+}
+
 static int nvme_hwmon_get_smart_log(struct nvme_hwmon_data *data)
 {
 	int ret;
@@ -39,8 +79,12 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	switch (attr) {
 	case hwmon_temp_max:
-		*val = (data->ctrl->wctemp - 273) * 1000;
+		err = nvme_get_temp_thresh(data->ctrl, channel, false, val);
+		if (err)
+			*val = (data->ctrl->wctemp - 273) * 1000;
 		return 0;
+	case hwmon_temp_min:
+		return nvme_get_temp_thresh(data->ctrl, channel, true, val);
 	case hwmon_temp_crit:
 		*val = (data->ctrl->cctemp - 273) * 1000;
 		return 0;
@@ -73,6 +117,23 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -105,13 +166,13 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
 			return 0444;
 		break;
 	case hwmon_temp_max:
+	case hwmon_temp_min:
 		if (!channel && data->ctrl->wctemp)
-			return 0444;
+			return 0644;
+		else if (data->log.temp_sensor[channel - 1])
+			return 0644;
 		break;
 	case hwmon_temp_alarm:
-		if (!channel)
-			return 0444;
-		break;
 	case hwmon_temp_input:
 	case hwmon_temp_label:
 		if (!channel || data->log.temp_sensor[channel - 1])
@@ -126,16 +187,24 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
 static const struct hwmon_channel_info *nvme_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
 				HWMON_T_LABEL | HWMON_T_ALARM,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+				HWMON_T_LABEL | HWMON_T_ALARM),
 	NULL
 };
 
@@ -143,6 +212,7 @@ static const struct hwmon_ops nvme_hwmon_ops = {
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

