Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD0BC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 May 2022 14:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236640AbiEUONc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 May 2022 10:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiEUONb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 May 2022 10:13:31 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B0C5DE58
        for <linux-hwmon@vger.kernel.org>; Sat, 21 May 2022 07:13:27 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id s23-20020a9d7597000000b0060ae566f9a1so4610734otk.1
        for <linux-hwmon@vger.kernel.org>; Sat, 21 May 2022 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JJPhtwbO1JCkK2eVknYPBEjb1kVg3GJ53jY/iCidxpo=;
        b=f6CS5FGWlFXdA04Y4XQ1pk7NAKP4gQvKAXDmI1AUPF+OjHXFALTn1T5hsszgNkpupn
         gyFt5pPiJsMDSzWiAJHx+yKsVSwGWDx8R2piABk+6MbuBznFTEkqwPwEv0CzjjOLMI2d
         ul5syjk07l2XfP/S4uIf43PFxIBaIMnNrNtefOm8oSq0gFd1APhAayX2j2c4ADIRKxZP
         clFFTz/3K+ILDk36C27fhBzeo/sPQjjA/He+1DW8Y0ovbnS9EsK3UZzcRcK52RXEvCKx
         3ojwqUSEdXaUINODHLoAQZDaBsMPhmDRW2k7etZJP9LJKZpXLuBX0FzgQCrLuoNkPiz8
         LJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=JJPhtwbO1JCkK2eVknYPBEjb1kVg3GJ53jY/iCidxpo=;
        b=i7jaDTwgX9A5y5ZZksPQ+dhmma/Vg+9sjRdVW7xQ5F2rIlq269fQZKO8gepk3KdBre
         CTlcjwazBHHoWIi5v7ZdVXomDNOYajZbAVsuEtLUJSBThu+grw2UoT6EbKngWxAHpQ3k
         Y9vZe8XxJmxFtg75SkrkXN/q0SjPh9mq9Qy8kQrIg4g7PWfoTsoVtQUwZKXBS9wgmq3D
         97kirIwaFAwRb+S44VBwZQ7l1jiNAgDNGtz/Z7966Do5p/Zn5V8Gj3z9jUZjL4bG3VnD
         ECb1x8tp962b3jtUTvFp4zNjI1VqET5dGuYKy/uYFy/DYQ/VFSVKyjp876fsMmtvDQXe
         l3mg==
X-Gm-Message-State: AOAM531q0P0P7L4Y5JJGYQ2bzAOE/2jk0HXGWaYIFKqu0Sa3xgVM8V5K
        yC4zE48N3AFgo02t0yv+v+gZLVqecDJhMg==
X-Google-Smtp-Source: ABdhPJz0WNF4OyW+MhzhTJHwqOnt/GkbtFb3U0nXduT3y6uVfSnUETQRLPbv0rf0e8qEAn9poz9wYQ==
X-Received: by 2002:a05:6830:1386:b0:60a:ea5b:6de3 with SMTP id d6-20020a056830138600b0060aea5b6de3mr4230231otq.323.1653142406389;
        Sat, 21 May 2022 07:13:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i23-20020a4addd7000000b0035eb4e5a6bdsm2312574oov.19.2022.05.21.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 07:13:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] hwmon: (pmbus) Move pec attribute to I2C device
Date:   Sat, 21 May 2022 07:13:23 -0700
Message-Id: <20220521141323.119651-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Enabling and disabling PEC for PMBus devices is currently only supported
with a debugfs attribute, which requires debugfs to be enabled and is
thus less than perfect. Take the lm90 driver as example and add a 'pec'
attribute to the I2C device if both the I2C adapter and the PMBus device
support it. Remove the now obsolete 'pec' attribute from debugfs.

Cc: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/ABI/testing/sysfs-class-hwmon |  9 +++
 Documentation/hwmon/pmbus-core.rst          |  9 +++
 drivers/hwmon/pmbus/pmbus_core.c            | 89 ++++++++++++---------
 3 files changed, 68 insertions(+), 39 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
index 653d4c75eddb..7271781a23b2 100644
--- a/Documentation/ABI/testing/sysfs-class-hwmon
+++ b/Documentation/ABI/testing/sysfs-class-hwmon
@@ -938,3 +938,12 @@ Description:
 		- 1: enable
 
 		RW
+
+What:		/sys/class/hwmon/hwmonX/device/pec
+Description:
+		PEC support on I2C devices
+
+		- 0, off, n: disable
+		- 1, on, y: enable
+
+		RW
diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index e7e0c9ef10be..84c5a4e40c40 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -121,6 +121,15 @@ Specifically, it provides the following information.
   non-standard PMBus commands to standard commands, or to augment standard
   command return values with device specific information.
 
+PEC Support
+===========
+
+Many PMBus devices support SMBus PEC (Packet Error Checking). If supported
+by both the I2C adapter and by the PMBus chip, it is by default enabled.
+If PEC is supported, the PMBus core driver adds an attribute named 'pec' to
+the I2C device. This attribute can be used to control PEC support in the
+communication with the PMBus chip.
+
 API functions
 =============
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 84b05dbd7de8..bb21f1e79289 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2522,6 +2522,42 @@ static int pmbus_read_status_word(struct i2c_client *client, int page)
 	return _pmbus_read_word_data(client, page, 0xff, PMBUS_STATUS_WORD);
 }
 
+/* PEC attribute support */
+
+static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
+			char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
+}
+
+static ssize_t pec_store(struct device *dev, struct device_attribute *dummy,
+			 const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	bool enable;
+	int err;
+
+	err = kstrtobool(buf, &enable);
+	if (err < 0)
+		return err;
+
+	if (enable)
+		client->flags |= I2C_CLIENT_PEC;
+	else
+		client->flags &= ~I2C_CLIENT_PEC;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(pec);
+
+static void pmbus_remove_pec(void *dev)
+{
+	device_remove_file(dev, &dev_attr_pec);
+}
+
 static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			     struct pmbus_driver_info *info)
 {
@@ -2608,6 +2644,20 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			return ret;
 	}
 
+	if (client->flags & I2C_CLIENT_PEC) {
+		/*
+		 * If I2C_CLIENT_PEC is set here, both the I2C adapter and the
+		 * chip support PEC. Add 'pec' attribute to client device to let
+		 * the user control it.
+		 */
+		ret = device_create_file(dev, &dev_attr_pec);
+		if (ret)
+			return ret;
+		ret = devm_add_action_or_reset(dev, pmbus_remove_pec, dev);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -2916,42 +2966,6 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
 			 NULL, "0x%04llx\n");
 
-static int pmbus_debugfs_get_pec(void *data, u64 *val)
-{
-	struct i2c_client *client = data;
-
-	*val = !!(client->flags & I2C_CLIENT_PEC);
-
-	return 0;
-}
-
-static int pmbus_debugfs_set_pec(void *data, u64 val)
-{
-	int rc;
-	struct i2c_client *client = data;
-
-	if (!val) {
-		client->flags &= ~I2C_CLIENT_PEC;
-		return 0;
-	}
-
-	if (val != 1)
-		return -EINVAL;
-
-	rc = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-	if (rc < 0)
-		return rc;
-
-	if (!(rc & PB_CAPABILITY_ERROR_CHECK))
-		return -EOPNOTSUPP;
-
-	client->flags |= I2C_CLIENT_PEC;
-
-	return 0;
-}
-DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_pec, pmbus_debugfs_get_pec,
-			 pmbus_debugfs_set_pec, "%llu\n");
-
 static void pmbus_remove_debugfs(void *data)
 {
 	struct dentry *entry = data;
@@ -2987,9 +3001,6 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	if (!entries)
 		return -ENOMEM;
 
-	debugfs_create_file("pec", 0664, data->debugfs, client,
-			    &pmbus_debugfs_ops_pec);
-
 	for (i = 0; i < data->info->pages; ++i) {
 		/* Check accessibility of status register if it's not page 0 */
 		if (!i || pmbus_check_status_register(client, i)) {
-- 
2.35.1

