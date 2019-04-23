Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EA0C282DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59249214AE
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfEqK7Eo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbfDWNdZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:25 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44806 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id y13so7498521pfm.11
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pGcObMtV4vMLhnhuHLhErwbxM+qb0J/S+nwXzNsCbJ8=;
        b=kfEqK7EoIINtCNpUipY2OcLkBRq5IadiEQhj+tFy2Ua8lyt4kt3bZFTZgw3NnZXk/j
         QEb6Q+G6NFexO6ekwYskEuDoqjgNj9oFqoPpSlfj5V8vDs6zfn+R0yAlVZMVRMk4a0QV
         Q21P1ho6n2p35yA7/Yqrzq87MMy0HxCCcGkDWMC9zIXvZJHcloa66/q+MKtV1SUESYPX
         NUE/8/Zn4mCe88xNbf1ogE+lQNEdriyfTQsCxtX4oDK5FxTSkncdhu6aiZFTEZ/IU0Hi
         ci/ZjR8YD6SPhH69hW86EhF6OfQza8uT9/ifG138IjZzRQPnpp0l/1h7tEb5tVkzIFc9
         4dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=pGcObMtV4vMLhnhuHLhErwbxM+qb0J/S+nwXzNsCbJ8=;
        b=ufLr7or1NtXnYjXRsht1dBFkPTqbe0XPuMO3kx2uuzb2HBSIevVpYxK6XKQQhn+IZ5
         J3luVCAQHudLA3GARngU+zXH5lUTHZEqQPBEaUuQM6f9jf9kzyxiPzmY/tBEZQW9m2Jz
         ushky2WLKzKClLrhteKkJGOdaVYF0E+c+rPFcNI8f2cqOZtb63Oanxqc+wbnhFeD6q7a
         WNv/hcNhdsnEYTcc0AfHx4gZ1EB/1KJYPvOIoey1v95XSciqQNmzrRBHORahHgglU8f7
         87NtmZiWiY6XwLHy4iLW9+YZDIPblTBbJLOFxeTdH4if5ccI18bydCuoBJ15aD6xzMUt
         u6Og==
X-Gm-Message-State: APjAAAWBo46QOYVbg/5s50dG5fHDgcRjASErRpWcD/Jaf+Xx0q8jLi3q
        FHuB/s3rtNDXFMjE+WHYaN2oV0lb
X-Google-Smtp-Source: APXvYqxKhuwoL9YiE4Re7XxhqO0P7Ffeb1gndK1dMOuwJ+ElfokRkWppFLZyxMtq7eCxSCLHuIXIfQ==
X-Received: by 2002:a63:e004:: with SMTP id e4mr24883474pgh.344.1556026403513;
        Tue, 23 Apr 2019 06:33:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h15sm6350512pfr.146.2019.04.23.06.33.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:22 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 05/11] hwmon: (max6650) Cache alarm_en register
Date:   Tue, 23 Apr 2019 06:33:05 -0700
Message-Id: <1556026391-15360-5-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The alarm_en register is read each time the is_visible function is called.
Since it is a configuration register, this is completely unnecessary.
Read it once and cache its value.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 8fa888b57efa..cf051f3acf26 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -128,6 +128,7 @@ struct max6650_data {
 	u8 count;
 	u8 dac;
 	u8 alarm;
+	u8 alarm_en;
 	unsigned long cooling_dev_state;
 };
 
@@ -559,8 +560,6 @@ static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct max6650_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	u8 alarm_en = i2c_smbus_read_byte_data(client, MAX6650_REG_ALARM_EN);
 	struct device_attribute *devattr;
 
 	/*
@@ -573,7 +572,7 @@ static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 	 || devattr == &sensor_dev_attr_fan1_fault.dev_attr
 	 || devattr == &sensor_dev_attr_gpio1_alarm.dev_attr
 	 || devattr == &sensor_dev_attr_gpio2_alarm.dev_attr) {
-		if (!(alarm_en & to_sensor_dev_attr(devattr)->index))
+		if (!(data->alarm_en & to_sensor_dev_attr(devattr)->index))
 			return 0;
 	}
 
@@ -696,6 +695,13 @@ static int max6650_init_client(struct max6650_data *data,
 	}
 	data->count = reg;
 
+	reg = i2c_smbus_read_byte_data(client, MAX6650_REG_ALARM_EN);
+	if (reg < 0) {
+		dev_err(dev, "Failed to read alarm configuration, aborting.\n");
+		return reg;
+	}
+	data->alarm_en = reg;
+
 	if (!of_property_read_u32(client->dev.of_node, "maxim,fan-target-rpm",
 				  &target_rpm)) {
 		max6650_set_target(data, target_rpm);
-- 
2.7.4

