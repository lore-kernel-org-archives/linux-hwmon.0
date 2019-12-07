Return-Path: <SRS0=6LgM=Z5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08493C43603
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 13:38:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C67D424673
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 13:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaEc/1P/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfLGNiS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Dec 2019 08:38:18 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:45254 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfLGNiS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Dec 2019 08:38:18 -0500
Received: by mail-pj1-f67.google.com with SMTP id r11so3930728pjp.12
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Dec 2019 05:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=VyPh1knUfBF2GCrEFSxfooQHeixncuzRJStnWaVaPoU=;
        b=KaEc/1P/nayYh2xESJyfRM/8GIaNzqQdNK5hvGA3iighctE9QQtuJIKMOVkGAsyWBp
         0PgQ7Ht4eXntmcqmwL/nVRvnFFhyOODgpgfqrS3hwAGFQG8uBwmzcq+hi89MWEgPxJCE
         GBtflbOeVv3JxBYSDLCey5mrw/ww2WNA7Htz9nsle6QCYWYAgtW3z6Zj5rE+p/tU8EeR
         uYffsx6I7FqflVYKWVJojJtpRHdY7i6W0nu1Ltc0/Ewb4wlC5ECmRIKGw24f+NRqkDBL
         JfhRTa3AvOJfmb2MTToi4Ir5bOBJGLpxiVKLv7AVn+11uEEUb8Uh0R2ErOmEJM2e71Ay
         qExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=VyPh1knUfBF2GCrEFSxfooQHeixncuzRJStnWaVaPoU=;
        b=JA9KVlQM9P+8wXb1+iLNQFamFO8KDTHIIROXauuo03qMhG3R4NB3K35NMUfCa4PD//
         CDSZuwDyas8itHi2/U0xLfFPdoprL8OTNE5xuXiQfqtXqH7NXwkqO40ybGdXcfcPEb+Y
         xfz+FUra4sJTXFNzp7uNMa0qT2Dsik0aWBBIoWS6XMTGhuQODsrFP2k9vxeTlVyxlm/J
         NaxXlrgrqjhjx3c4RMhVBmh3uL4ALILSTFbp03NcbgDmJm7lVDQDAyEP3cJOzI5szx3t
         J9GBzqXMJfV8Pb2DZLz3MdV24ZKOHdS2hKOVnggOYYt+xhhwySgmcWbTPEx8bqjmp6BM
         O6QA==
X-Gm-Message-State: APjAAAX7Ou6Rr6jVlDNWqGvlhMiCSX2rYtWZ461xgL4/wrX2ZaRIcZU2
        xlvfVDboqGqacw4CLy+PNeDcQV3T
X-Google-Smtp-Source: APXvYqyjJCnEjImRz3FWBoSjY+5SEQ7yq9JfH9eZPdPMn/4B68BNoSZmGxPcV6GTBG6WgzI+DCP0PA==
X-Received: by 2002:a17:90a:350e:: with SMTP id q14mr7554911pjb.46.1575725896983;
        Sat, 07 Dec 2019 05:38:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y199sm21579614pfb.137.2019.12.07.05.38.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2019 05:38:15 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Add notification support
Date:   Sat,  7 Dec 2019 05:38:13 -0800
Message-Id: <20191207133813.20903-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

For hwmon drivers using the hwmon_device_register_with_info() API, it
is desirable to have a generic notification mechanism available. This
mechanism can be used to notify userspace as well as the thermal
subsystem if the driver experiences any events, such as warning or
critical alarms.

Implement hwmon_notify_event() to provide this mechanism. The function
generates a sysfs event and a udev event. If the device is registered
with the thermal subsystem and the event is associated with a temperature
sensor, also notify the thermal subsystem that a thermal event occurred.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I have no plan to push this since there are currently no users (and thus
no means to test the code). However, I want to make sure that the patch
is available if/when needed.

 drivers/hwmon/hwmon.c | 68 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/hwmon.h |  3 ++
 2 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1f3b30b085b9..4f52a3d73cd7 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -15,6 +15,7 @@
 #include <linux/gfp.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
@@ -31,7 +32,7 @@ struct hwmon_device {
 	const char *name;
 	struct device dev;
 	const struct hwmon_chip_info *chip;
-
+	struct list_head tzdata;
 	struct attribute_group group;
 	const struct attribute_group **groups;
 };
@@ -54,12 +55,12 @@ struct hwmon_device_attribute {
 
 /*
  * Thermal zone information
- * In addition to the reference to the hwmon device,
- * also provides the sensor index.
  */
 struct hwmon_thermal_data {
+	struct list_head node;
 	struct hwmon_device *hwdev;	/* Reference to hwmon device */
 	int index;			/* sensor index */
+	struct thermal_zone_device *tzd;/* thermal zone device */
 };
 
 static ssize_t
@@ -137,11 +138,17 @@ static const struct thermal_zone_of_device_ops hwmon_thermal_ops = {
 	.get_temp = hwmon_thermal_get_temp,
 };
 
+static void hwmon_thermal_remove_sensor(void *data)
+{
+	list_del(data);
+}
+
 static int hwmon_thermal_add_sensor(struct device *dev,
 				    struct hwmon_device *hwdev, int index)
 {
 	struct hwmon_thermal_data *tdata;
 	struct thermal_zone_device *tzd;
+	int err;
 
 	tdata = devm_kzalloc(dev, sizeof(*tdata), GFP_KERNEL);
 	if (!tdata)
@@ -159,14 +166,38 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
 		return PTR_ERR(tzd);
 
+	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
+	if (err)
+		return err;
+
+	tdata->tzd = tzd;
+	list_add(&tdata->node, &hwdev->tzdata);
+
 	return 0;
 }
+
+static void hwmon_thermal_notify(struct device *dev, int index)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+	struct hwmon_thermal_data *tzdata;
+
+	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
+		if (tzdata->index == index) {
+			thermal_zone_device_update(tzdata->tzd,
+						   THERMAL_EVENT_UNSPECIFIED);
+		}
+	}
+}
+
 #else
 static int hwmon_thermal_add_sensor(struct device *dev,
 				    struct hwmon_device *hwdev, int index)
 {
 	return 0;
 }
+
+static void hwmon_thermal_notify(struct device *dev, int index) { }
+
 #endif /* IS_REACHABLE(CONFIG_THERMAL) && ... */
 
 static int hwmon_attr_base(enum hwmon_sensor_types type)
@@ -482,6 +513,35 @@ static const int __templates_size[] = {
 	[hwmon_pwm] = ARRAY_SIZE(hwmon_pwm_attr_templates),
 };
 
+int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel)
+{
+	char sattr[MAX_SYSFS_ATTR_NAME_LENGTH];
+	const char * const *templates;
+	const char *template;
+
+	if (type >= ARRAY_SIZE(__templates))
+		return -EINVAL;
+	if (attr >= __templates_size[type])
+		return -EINVAL;
+
+	templates = __templates[type];
+	template = templates[attr];
+
+	if (type != hwmon_in)
+		channel++;
+
+	scnprintf(sattr, MAX_SYSFS_ATTR_NAME_LENGTH, template, channel);
+	sysfs_notify(&dev->kobj, NULL, sattr);
+	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+
+	if (type == hwmon_temp)
+		hwmon_thermal_notify(dev, channel);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hwmon_notify_event);
+
 static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
 {
 	int i, n;
@@ -633,6 +693,8 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	if (err)
 		goto free_hwmon;
 
+	INIT_LIST_HEAD(&hwdev->tzdata);
+
 	if (dev && dev->of_node && chip && chip->ops->read &&
 	    chip->info[0]->type == hwmon_chip &&
 	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 72579168189d..2ff3ee983d3f 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -416,6 +416,9 @@ devm_hwmon_device_register_with_info(struct device *dev,
 void hwmon_device_unregister(struct device *dev);
 void devm_hwmon_device_unregister(struct device *dev);
 
+int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel);
+
 /**
  * hwmon_is_bad_char - Is the char invalid in a hwmon name
  * @ch: the char to be considered
-- 
2.17.1

