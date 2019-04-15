Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8699EC10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 21:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E0F8206B6
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 21:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rS1EfD5Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfDOVoJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 17:44:09 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:39034 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfDOVoJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 17:44:09 -0400
Received: by mail-vk1-f202.google.com with SMTP id b75so8340407vke.6
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=VV7XloQhp0B7U8+StMP/7Qa3JavzJTcqnL1vFl0AldQ=;
        b=rS1EfD5QdTwcrhBrJC2NhQIiMPe6W3Ijka6bASxyxxfM+RuiFfZbMV4/0uB2zsFVGo
         VnAHfapCB7ND02qzfe6kZmSOuafKCqUSqMfLWNwUHcv0ZzO/EZy205NeesRqindtfBnx
         QVyH0M/+rd1SIfgPmlyeU/XE/RdqjPTr66oxhxoTiG3VfwWEezBv7i9RDUmUnCwLb1FJ
         G2dizn+lJp+qah62pXHFrACdaOsVJrsW2QIgayi0vgtph3mqGzW28Ob8uGRztC228BAd
         HT1kJS4PWtnjWiKwWT/h12NxRukQzzpwOsB/mYrP8FoJo5E6xRO6C6hbsmWfBIEZWIuF
         LbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=VV7XloQhp0B7U8+StMP/7Qa3JavzJTcqnL1vFl0AldQ=;
        b=W+3uXD9ocX3Pyc9ekNO4Ceb73M3LQuvvL4Vm9OawZl8C6A+BjRgJe5ed4gqCMuGfY/
         wfotFdHfrj1QJx5gUKp8lKEV4FK2gZUCBeq23iqaYJ/0YZ68Zj5Sc0z18toeU78DBaF1
         ljeH7k9zB1C602l54RfnRMS0y0lYQTt8L5QyIYLWRPgEoxGf2ddMfk5kY6f/owbDfsTG
         ioaKQ7aYSmzMBjkHxycI8PE5ujt6r2OIhBL+w9U/gyMYbkra6DRDXBd2+eU7eaI+UHmd
         uKrZVsyvVgF9q8j7OoYyZRmUlJ+Gar8EQxQPLOtt//hiB7T4Dw2Uae01itu686Y9wDt+
         muiw==
X-Gm-Message-State: APjAAAXr/PQBLOID2HEZ67Zylg4PgSoItK0G8QbkVr27qgMBydFCntfE
        kqvt2RBA4mqAPZKKcbJsran9nF8OvP7Z
X-Google-Smtp-Source: APXvYqyT7YNDoAsQ9k6ucFSPExKmhs62/MHzRZA2QyPMVDAqw1Rp0L0mJ95fjsXmvQWo7FcvQOPuYMj2eFTP
X-Received: by 2002:a67:e24b:: with SMTP id w11mr475329vse.0.1555364648321;
 Mon, 15 Apr 2019 14:44:08 -0700 (PDT)
Date:   Mon, 15 Apr 2019 14:44:05 -0700
Message-Id: <20190415214405.120110-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH v5 1/2] pmbus: support for custom sysfs attributes
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
V5:
 None
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

