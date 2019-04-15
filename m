Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB60EC10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B401D20854
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WfDvC9rZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfDOUlQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:41:16 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:56230 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfDOUlQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 16:41:16 -0400
Received: by mail-qk1-f201.google.com with SMTP id g25so15670649qkm.22
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 13:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=6RpyJ7V3QOyGtawbbTU+A9ftABBhvn1N+03kz8ftCDM=;
        b=WfDvC9rZV94DlskbGrG8tLDLgtWo5YjrbBXaz2DqHCqDmuqOf5RHlHPa7NMoSp70KI
         844ky/W2nWOwSOcibTzgSKdw4vQk8wUSlba4jr5XgKByM8bMZ5n4XYpsJUCnstGoBP+F
         nXBHiZBvIqY0wq6GsIpRv76tKHQ5XQPVAM6xY/C2KrsIud9FSyCK8JhJ/8XQiiZUKBTN
         W0eVdZoKHtJ8Bd9JIVXEZqE1OTwbE7Q7oso2Zbibze/6v1s9OwFJ3DO/FmSmBmIVVBLY
         ST2zv8G4CCbwDLMbvW6DJVZ4/cuS2SRdi4hTt1bHXN2XR1hAlm/39uaLEUrZZlYcSghM
         UFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=6RpyJ7V3QOyGtawbbTU+A9ftABBhvn1N+03kz8ftCDM=;
        b=lllL6SPUi5sA2TsSaDutqBnWifayoscjl0rBhQ0Wgd43dQSdM2Kz1AT43wi8q7qtRx
         sMD/XK0wWvwY58ynORu5OzGcdMt/Wd7al3N4VPatFhUdI2pQQHNK+NEPV5CgPjXWGwRv
         Yx+DDUwEQnTBHSG+8zY9axm99kRk6rI60svCOQAMU4T6v126XoFoToO5kGD2akMVF7wm
         Og300GMpyom0jr9aOwpXykgcxf6ZcSc6l9UaZnevuuQX6KuwaZSyVwhzcDfiBjgo0zO+
         F5vLewmNNo+Pp1XPZUKq7Zb161J8TRAZSISRt7vhoeA2bcvToh97IIPTCKcabiPBkET5
         gq5g==
X-Gm-Message-State: APjAAAUZnBUvg5mPjTMfg0VS43hAVq7KgKl/r1D2qXNn8GxRIXcMtc6q
        BjxCkySFd79jYlM5iPvOyppn/Ro0zA1E
X-Google-Smtp-Source: APXvYqzLI3Ur6INkFfmQmD7LFzzknqjDaGhdZCHwMsJ3xVHPWgEAjZKvWNKgygGyFZhDCsh+cTnV6ojTp9og
X-Received: by 2002:a37:ad0a:: with SMTP id f10mr8669343qkm.45.1555360875271;
 Mon, 15 Apr 2019 13:41:15 -0700 (PDT)
Date:   Mon, 15 Apr 2019 13:41:11 -0700
Message-Id: <20190415204111.93737-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH v4 1/2] pmbus: support for custom sysfs attributes
From:   Patrick Venture <venture@google.com>
To:     venture@google.com, linux@roeck-us.net, jdelvare@suse.com
Cc:     krzysztof.adamski@nokia.com, linux-hwmon@vger.kernel.org,
        alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: krzysztof.adamski@nokia.com

This patch makes it possible to pass custom struct attribute_group array
via the pmbus_driver_info struct so that those can be added to the
attribute groups passed to hwmon_device_register_with_groups().

This makes it possible to register custom sysfs attributes by PMBUS
drivers similar to how you can do this with most other busses/classes.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
v4:
 None
v3:
 - staged before v3 hwmon/pmbus/isl68137 driver
---
 drivers/hwmon/pmbus/pmbus.h      |  3 +++
 drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 1d24397d36ecd..fb267ec116235 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -417,6 +417,9 @@ struct pmbus_driver_info {
 	/* Regulator functionality, if supported by this chip driver. */
 	int num_regulators;
 	const struct regulator_desc *reg_desc;
+
+	/* custom attributes */
+	const struct attribute_group **groups;
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e2366428a9a91..d6170a802c0f7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -103,7 +103,7 @@ struct pmbus_data {
 	int max_attributes;
 	int num_attributes;
 	struct attribute_group group;
-	const struct attribute_group *groups[2];
+	const struct attribute_group **groups;
 	struct dentry *debugfs;		/* debugfs device directory */
 
 	struct pmbus_sensor *sensors;
@@ -2305,6 +2305,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	struct device *dev = &client->dev;
 	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
 	struct pmbus_data *data;
+	size_t groups_num = 0;
 	int ret;
 
 	if (!info)
@@ -2319,6 +2320,15 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	if (!data)
 		return -ENOMEM;
 
+	if (info->groups)
+		while (info->groups[groups_num])
+			groups_num++;
+
+	data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
+				    GFP_KERNEL);
+	if (!data->groups)
+		return -ENOMEM;
+
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
 	data->dev = dev;
@@ -2346,6 +2356,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	}
 
 	data->groups[0] = &data->group;
+	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
 	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
 							    data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
-- 
2.21.0.392.gf8f6787159e-goog

