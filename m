Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E3CC43334
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Jul 2022 21:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbiGJV0y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Jul 2022 17:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiGJV0Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Jul 2022 17:26:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B94167FC
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Jul 2022 14:25:32 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id z12so4758863wrq.7
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Jul 2022 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9mNF5y6hvbSSl4tvgsF8Kv2RwpFYIr8c+Kq7IgCFys=;
        b=3sVLc/Zx5AnBXFBVcki0r+XQWrRbNr9YCtqlE7/2AIs8jkvPMqD4lVuuEuqp2ZxTYQ
         wIjB2uIl9wZz9ni2iFJYKnXyAqb0LwQPT8sqlyV4FWIksYWkFe5AROsQbCjgaFnrf0Fp
         qAjWUI5Nf2doAN6M5MOFX2O3VhHmnAThxRds7y32hMldcABdPPjtCs7ZamgfP0SRwssJ
         jHh/MNnrEQBnfcbublg2qCPnW7VPmtGs8wi1MJMuVcFNH17CXGRo1EjHYw453lVTyFV4
         /QFVR+fVkE0O6kE795qD1o03VPzlwykftJLWjuitXjWeZ3q+M0zSEO+6qOS9q1wOUpj7
         ZBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9mNF5y6hvbSSl4tvgsF8Kv2RwpFYIr8c+Kq7IgCFys=;
        b=4Nik+uCEzNqGldlLB9MU/+E50UzlBOaJp2zV0PsqkbxOBKnPD8tW4ojMKJUkh3lCPJ
         vZdWfrLeD9puXkf5Qo1zegUtl0BUxcD9oY6+wSebHD2TJJratoah2oWjUxVSwGtsD/T7
         eBb/MJfYBrUtK/clsPu33bXOt/BMqnAcUIlm+V7twS/8c941j4MYeVRGr8XXt5xFJDrU
         QY9Rs6Dr5nhwo/xHF//9QZ/g08Eb1zL4MjPBjXDEOTl+gXF1iMaAqUdesTUMXMBu354S
         CdKSAET55mMoPmwEF6iMLYMv1ExOf7HOCXRSzEa4UIGNnIUzT6R/d4vbuzZnyjfPJRzQ
         VaFw==
X-Gm-Message-State: AJIora9LXcoGHf+vg1rcst2U2HB9WNc9z4FTUbXeX63kMkyQjpHo5bUv
        whzonDauJF86LkVspVqsjBVd1g==
X-Google-Smtp-Source: AGRyM1uyUPnikVLSWpibuGwqhmWE7zhM23GgVORCpj5IlAD6nOWU0REwHevqrsVReAOv+YqdqT90JA==
X-Received: by 2002:a5d:4283:0:b0:21d:7ae3:71a3 with SMTP id k3-20020a5d4283000000b0021d7ae371a3mr13967643wrq.233.1657488316965;
        Sun, 10 Jul 2022 14:25:16 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:25:16 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linexp.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, khilman@baylibre.com, abailon@baylibre.com,
        amitk@kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING)
Subject: [PATCH v1 26/33] hwmon/drivers: Switch to new of thermal API
Date:   Sun, 10 Jul 2022 23:24:16 +0200
Message-Id: <20220710212423.681301-27-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710212423.681301-1-daniel.lezcano@linexp.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach.

Use this new API.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/hwmon/hwmon.c      | 14 +++++++-------
 drivers/hwmon/scpi-hwmon.c | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 2e2cd79d89eb..a98c35fbce87 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -151,9 +151,9 @@ static DEFINE_IDA(hwmon_ida);
  * between hwmon and thermal_sys modules.
  */
 #ifdef CONFIG_THERMAL_OF
-static int hwmon_thermal_get_temp(void *data, int *temp)
+static int hwmon_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct hwmon_thermal_data *tdata = data;
+	struct hwmon_thermal_data *tdata = tz->devdata;
 	struct hwmon_device *hwdev = to_hwmon_device(tdata->dev);
 	int ret;
 	long t;
@@ -168,9 +168,9 @@ static int hwmon_thermal_get_temp(void *data, int *temp)
 	return 0;
 }
 
-static int hwmon_thermal_set_trips(void *data, int low, int high)
+static int hwmon_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
-	struct hwmon_thermal_data *tdata = data;
+	struct hwmon_thermal_data *tdata = tz->devdata;
 	struct hwmon_device *hwdev = to_hwmon_device(tdata->dev);
 	const struct hwmon_chip_info *chip = hwdev->chip;
 	const struct hwmon_channel_info **info = chip->info;
@@ -203,7 +203,7 @@ static int hwmon_thermal_set_trips(void *data, int low, int high)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops hwmon_thermal_ops = {
+static struct thermal_zone_device_ops hwmon_thermal_ops = {
 	.get_temp = hwmon_thermal_get_temp,
 	.set_trips = hwmon_thermal_set_trips,
 };
@@ -227,8 +227,8 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
 	tdata->dev = dev;
 	tdata->index = index;
 
-	tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
-						   &hwmon_thermal_ops);
+	tzd = devm_thermal_of_zone_register(dev, index, tdata,
+					    &hwmon_thermal_ops);
 	if (IS_ERR(tzd)) {
 		if (PTR_ERR(tzd) != -ENODEV)
 			return PTR_ERR(tzd);
diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 5187c6dd5a4f..9c89db8e56a7 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -62,9 +62,9 @@ static void scpi_scale_reading(u64 *value, struct sensor_data *sensor)
 	}
 }
 
-static int scpi_read_temp(void *dev, int *temp)
+static int scpi_read_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct scpi_thermal_zone *zone = dev;
+	struct scpi_thermal_zone *zone = tz->devdata;
 	struct scpi_sensors *scpi_sensors = zone->scpi_sensors;
 	struct scpi_ops *scpi_ops = scpi_sensors->scpi_ops;
 	struct sensor_data *sensor = &scpi_sensors->data[zone->sensor_id];
@@ -121,7 +121,7 @@ scpi_show_label(struct device *dev, struct device_attribute *attr, char *buf)
 	return sprintf(buf, "%s\n", sensor->info.name);
 }
 
-static const struct thermal_zone_of_device_ops scpi_sensor_ops = {
+static struct thermal_zone_device_ops scpi_sensor_ops = {
 	.get_temp = scpi_read_temp,
 };
 
@@ -275,10 +275,10 @@ static int scpi_hwmon_probe(struct platform_device *pdev)
 
 		zone->sensor_id = i;
 		zone->scpi_sensors = scpi_sensors;
-		z = devm_thermal_zone_of_sensor_register(dev,
-							 sensor->info.sensor_id,
-							 zone,
-							 &scpi_sensor_ops);
+		z = devm_thermal_of_zone_register(dev,
+						  sensor->info.sensor_id,
+						  zone,
+						  &scpi_sensor_ops);
 		/*
 		 * The call to thermal_zone_of_sensor_register returns
 		 * an error for sensors that are not associated with
-- 
2.25.1

