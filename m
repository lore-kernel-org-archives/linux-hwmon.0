Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916F1C64ED6
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Feb 2023 11:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbjB1LYa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 28 Feb 2023 06:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbjB1LYK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Feb 2023 06:24:10 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF96EF83
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Feb 2023 03:23:39 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p26so6136274wmc.4
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Feb 2023 03:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677583411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXmjkOh9eXvrRm2J04oJvypw5mYaRO/S2JmWwbjlE4k=;
        b=soFl3x2mfMMF67I1FvokputhjZuMW2otf4WTnRYVuV+k0mQ/OS+fZdLqmnd3H6OG40
         OkwqOSBW3UecWgcNxcHsSeCNOPkN1GE9jymZncVh/LfB3gXEkvPKtCEDXHmZbBtHL11x
         Pthf2ZgB5Afbg/MXm18ge1cBvHUlXy9yVwciggl7ITvUnVO6U2Knf767eVqWTuBWrL8Z
         Iei3Mwbk5rYDseKP50HVTiX9cc1nSZoXlH7oeuJ2Oz7Qpi1n/IPHb1eOsrQDtDPYSz13
         /AbZBMJaTOhBkSIKA+bULSgW/pDu5a9ttyNypyLnA0wPkjPWc4j/4KkdeUHED+PvokAK
         mInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677583411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXmjkOh9eXvrRm2J04oJvypw5mYaRO/S2JmWwbjlE4k=;
        b=yxBwRSRnc+6jLrDgoZh0KYHTkunRVd4lvpEwt7PLl9DwNIp4XlG1mvc9LXvH1KPjVb
         B6RQ22VFvqImF25EzKOtteMpMR81NfeHyoPSgb9EzE69ky9KWXA6wf9NsnS9UiAH4Vb4
         o3rag/CHOxFHxUdnxubceG58xHOigmMaZLnByQqVjvhprPX/jfxCTZT1MztX6PJ1OjAq
         3MzJlyQK9P2cT5EquP6YF5Dll2d/XpubwbXvAwEhD9DCk/12jZo0K6HTZvgAIV4gaABB
         lUTT2JT996IcbqAe0Vk1OO6pRU0jQCvUH7Vi0zd8Aqhvz9h5nLdh2PnmhMseqkDMGqTX
         mWvQ==
X-Gm-Message-State: AO0yUKVkIa1n7deonvDpldh32+j3pXgDRGN42poLeOhgf4OMFJl8Yn5i
        fNxgBoQkS32ZXR9+gQdx+kpvkg==
X-Google-Smtp-Source: AK7set9dvRwH1Z/L2mUIbhq8bSGuKvT3+MG29F5DU0+ncVgMRWB1EKJBS587C1/MWBMg9p20wtzp4A==
X-Received: by 2002:a05:600c:1ca3:b0:3ea:e7f6:fc2e with SMTP id k35-20020a05600c1ca300b003eae7f6fc2emr1742726wms.6.1677583411474;
        Tue, 28 Feb 2023 03:23:31 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6830:6390:2815:b6a5])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6545000000b002c5501a5803sm9598130wrv.65.2023.02.28.03.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:23:31 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Amit Kucheria <amitk@kernel.org>,
        linux-acpi@vger.kernel.org (open list:ACPI THERMAL DRIVER),
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING)
Subject: [PATCH v4 12/19] thermal: Add a thermal zone id accessor
Date:   Tue, 28 Feb 2023 12:22:31 +0100
Message-Id: <20230228112238.2312273-13-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
References: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In order to get the thermal zone id but without directly accessing the
thermal zone device structure, add an accessor.

Use the accessor in the hwmon_scmi and acpi_thermal.

No functional change intented.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/thermal.c         | 2 +-
 drivers/hwmon/scmi-hwmon.c     | 2 +-
 drivers/thermal/thermal_core.c | 6 ++++++
 include/linux/thermal.h        | 6 ++++++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 392b73b3e269..255efa73ed70 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -842,7 +842,7 @@ static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz)
 		goto acpi_bus_detach;
 
 	dev_info(&tz->device->dev, "registered as thermal_zone%d\n",
-		 tz->thermal_zone->id);
+		 thermal_zone_device_id(tz->thermal_zone));
 
 	return 0;
 
diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 046ac157749d..364199b332c0 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -220,7 +220,7 @@ static int scmi_thermal_sensor_register(struct device *dev,
 			sensor->name);
 	} else {
 		dev_dbg(dev, "Sensor '%s' attached to thermal zone ID:%d\n",
-			sensor->name, tzd->id);
+			sensor->name, thermal_zone_device_id(tzd));
 	}
 
 	return 0;
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 913ba9ca9792..46dedfe061df 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1390,6 +1390,12 @@ const char *thermal_zone_device_type(struct thermal_zone_device *tzd)
 }
 EXPORT_SYMBOL_GPL(thermal_zone_device_type);
 
+int thermal_zone_device_id(struct thermal_zone_device *tzd)
+{
+	return tzd->id;
+}
+EXPORT_SYMBOL_GPL(thermal_zone_device_id);
+
 /**
  * thermal_zone_device_unregister - removes the registered thermal zone device
  * @tz: the thermal zone device to remove
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 21686e676b3d..eb80cee4f64f 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -367,6 +367,7 @@ thermal_zone_device_register_with_trips(const char *, struct thermal_trip *, int
 
 void *thermal_zone_device_priv(struct thermal_zone_device *tzd);
 const char *thermal_zone_device_type(struct thermal_zone_device *tzd);
+int thermal_zone_device_id(struct thermal_zone_device *tzd);
 
 int thermal_zone_bind_cooling_device(struct thermal_zone_device *, int,
 				     struct thermal_cooling_device *,
@@ -449,6 +450,11 @@ static inline const char *thermal_zone_device_type(struct thermal_zone_device *t
 	return NULL;
 }
 
+static inline int thermal_zone_device_id(struct thermal_zone_device *tzd)
+{
+	return -ENODEV;
+}
+
 static inline int thermal_zone_device_enable(struct thermal_zone_device *tz)
 { return -ENODEV; }
 
-- 
2.34.1

