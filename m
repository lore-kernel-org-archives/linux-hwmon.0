Return-Path: <SRS0=nJvH=AY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF678C433F1
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD3D82068F
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qqnuya36"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGMTcr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMTcq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 15:32:46 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EB8C061755;
        Mon, 13 Jul 2020 12:32:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y10so18720182eje.1;
        Mon, 13 Jul 2020 12:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=54Oa99SpchuNLllZ3dNRlZUNHEm6od0HO28GgBi6dO0=;
        b=Qqnuya36onoYYDZY9/etak2zVRLJznCukLCDgDeb5ARRaiPqzznO4jFTLyCFcO4BKZ
         pYJu0ij5pq1xioZpKzVaBMPkvztH4n0DwV9H6ohhVktf/5JqcaJFqKWY+4U7p/QJMuun
         1ImK+4Cbc7KQgd1rD8OJYGVkzHfZJmNSFtdwVJSJ0JL0DbOmBd1kdyfFvxu4R8+M90jE
         g2B83wmFn93gemk+h2ueUAME4gCYy1CawZ2JWkCRMKGh9eoktjw4difK0aSA0vnF0YaQ
         wNTPyWXpk90Udj3Bod2D53EPO88GjmI2vo6CftpTDyHasbhjkWwkdBaAFLRDcdP5KgbD
         j7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=54Oa99SpchuNLllZ3dNRlZUNHEm6od0HO28GgBi6dO0=;
        b=M+CQZBn67VHHs3hxN0/NM8o9H9pZfWHBmdnKbmZPt+OqDAWMrg7a7KIWBbOVX5WXkR
         cMOOo3llH4/Ikabhhc8HXJe86NlRlZ9+FZJQW1tVmiX3C2UOjCxN77c6ANAwjFAqWlNF
         ctb0tUGVsQGq5fLjxH4sAuMY7P4gZvrrzX1DyNTSfH+zjktJ3lU5lGWan9Bkfqy/T1A5
         gwyvKRhyRRaVDfvT0sbL2K0lIKhvx18I0qr6oHnbO5Yr3bKv87nMKMNAYK+CLP1Z1MvP
         AD6atNkYclJU5LRJd1gmmqIyTPHx0vijQEUCvztaKuvgIf3uihyVoKu2/SPoDpW/6hnF
         OPFA==
X-Gm-Message-State: AOAM532Pj55hZfGK+2TWGI8fTRY05TOTy127bRbuyJjIhVHtozQ3pi44
        rELznOfml61VGAhQe1AbArk=
X-Google-Smtp-Source: ABdhPJzRuDheiSqv9fw9cVwLF7JelgJ8dpYMAnngJTGHZFsKi8msBKUMKGWs74NxFXsS2XsiqVTChw==
X-Received: by 2002:a17:907:94cf:: with SMTP id dn15mr1286271ejc.457.1594668764809;
        Mon, 13 Jul 2020 12:32:44 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id x10sm10454003ejc.46.2020.07.13.12.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:32:44 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jaap Aarts <jaap.aarts1@example.com>
Subject: [PATCH 6/6] added some comments and fixed some styling
Date:   Mon, 13 Jul 2020 21:32:27 +0200
Message-Id: <20200713193227.189751-6-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713193227.189751-1-jaap.aarts1@gmail.com>
References: <20200713193227.189751-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
---
 ...driver.patch.EXPERIMENTAL-checkpatch-fixes | 239 ++++++++++++++++++
 drivers/hwmon/asetek_gen6.c                   |  31 ++-
 2 files changed, 260 insertions(+), 10 deletions(-)
 create mode 100644 0001-skeleton-for-asetek-gen-6-driver.patch.EXPERIMENTAL-checkpatch-fixes

diff --git a/0001-skeleton-for-asetek-gen-6-driver.patch.EXPERIMENTAL-checkpatch-fixes b/0001-skeleton-for-asetek-gen-6-driver.patch.EXPERIMENTAL-checkpatch-fixes
new file mode 100644
index 000000000000..6f47a064072b
--- /dev/null
+++ b/0001-skeleton-for-asetek-gen-6-driver.patch.EXPERIMENTAL-checkpatch-fixes
@@ -0,0 +1,239 @@
+From 84c7d189d0f4227f7b249a73c2c1bd26ed4f46a6 Mon Sep 17 00:00:00 2001
+From: jaap aarts <jaap.aarts1@gmail.com>
+Date: Tue, 30 Jun 2020 13:46:14 +0200
+Subject: [PATCH 1/5] skeleton for asetek gen 6 driver
+
+---
+ drivers/hwmon/Kconfig       |   6 ++
+ drivers/hwmon/Makefile      |   1 +
+ drivers/hwmon/asetek_gen6.c | 186 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 193 insertions(+)
+ create mode 100644 drivers/hwmon/asetek_gen6.c
+
+diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
+index 288ae9f63588..521a9e0c88ca 100644
+--- a/drivers/hwmon/Kconfig
++++ b/drivers/hwmon/Kconfig
+@@ -378,6 +378,12 @@ config SENSORS_ARM_SCPI
+ 	  and power sensors available on ARM Ltd's SCP based platforms. The
+ 	  actual number and type of sensors exported depend on the platform.
+ 
++config SENSORS_ASETEK_GEN6
++	tristate "Asetek generation 6 driver"
++	help
++	  If you say yes here you get support for asetek generation 6 boards
++	  found on most AIO liquid coolers with an asetek pump.
++
+ config SENSORS_ASB100
+ 	tristate "Asus ASB100 Bach"
+ 	depends on X86 && I2C
+diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
+index 3e32c21f5efe..9683d2aae2b2 100644
+--- a/drivers/hwmon/Makefile
++++ b/drivers/hwmon/Makefile
+@@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
+ obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
+ obj-$(CONFIG_SENSORS_W83781D)	+= w83781d.o
+ obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
++obj-$(CONFIG_SENSORS_ASETEK_GEN6)	+= asetek_gen6.o
+ 
+ obj-$(CONFIG_SENSORS_AB8500)	+= abx500.o ab8500.o
+ obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
+diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
+new file mode 100644
+index 000000000000..4d530a4cb71d
+--- /dev/null
++++ b/drivers/hwmon/asetek_gen6.c
+@@ -0,0 +4,189 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * A hwmon driver for most asetek gen 6 all-in-one liquid coolers.
++ * Copyright (c) Jaap Aarts 2020
++ *
++ * Protocol reverse engineered by audiohacked
++ * https://github.com/audiohacked/OpenCorsairLink
++ */
++
++/*
++ * Supports following chips:
++ * driver h100i platinum
++ *
++ * Other products should work with this driver but no testing has been done.
++ *
++ * Note: platinum is the codename name for pro within driver
++ *
++ * Note: fan curve control has not been implemented
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/usb.h>
++#include <linux/slab.h>
++#include <linux/mutex.h>
++#include <linux/errno.h>
++#include <linux/hwmon.h>
++#include <linux/hwmon-sysfs.h>
++
++struct driver {
++	struct usb_device *udev;
++
++	char *bulk_out_buffer;
++	char *bulk_in_buffer;
++	size_t bulk_out_size;
++	size_t bulk_in_size;
++	char bulk_in_endpointAddr;
++	char bulk_out_endpointAddr;
++
++	struct usb_interface *interface; /* the interface for this device */
++	struct mutex io_mutex; /* synchronize I/O with disconnect */
++	struct semaphore
++		limit_sem; /* limiting the number of writes in progress */
++
++	struct kref kref;
++};
++
++/* devices that work with this driver */
++static const struct usb_device_id astk_table[] = {
++	{ USB_DEVICE(0x1b1c, 0x0c15) },
++	{} /* Terminating entry */
++};
++
++MODULE_DEVICE_TABLE(usb, astk_table);
++
++int init_device(struct usb_device *udev)
++{
++	int retval;
++
++	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
++				 0xffff, 0x0000, 0, 0, 0);
++	//this always returns error
++	if (retval != 0)
++		;
++
++	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
++				 0x0002, 0x0000, 0, 0, 0);
++	if (retval != 0)
++		return retval;
++
++	return 0;
++}
++int deinit_device(struct usb_device *udev)
++{
++	int retval;
++
++	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
++				 0x0004, 0x0000, 0, 0, 0);
++	if (retval != 0)
++		return retval;
++
++	return 0;
++}
++
++static void astk_delete(struct kref *kref)
++{
++	struct driver *dev = container_of(kref, struct driver, kref);
++
++	usb_put_intf(dev->interface);
++	usb_put_dev(dev->udev);
++	kfree(dev->bulk_in_buffer);
++	kfree(dev->bulk_out_buffer);
++	kfree(dev);
++}
++
++static int astk_probe(struct usb_interface *interface,
++		      const struct usb_device_id *id)
++{
++	struct driver *dev;
++	int retval = 0;
++	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
++
++	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
++	if (!dev) {
++		retval = -ENOMEM;
++		goto exit;
++	}
++
++	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
++					   &bulk_out, NULL, NULL);
++	if (retval != 0)
++		goto exit;
++
++	dev->udev = usb_get_dev(interface_to_usbdev(interface));
++	dev->interface = usb_get_intf(interface);
++
++	/* set up the endpoint information */
++	/* use only the first bulk-in and bulk-out endpoints */
++	dev->bulk_in_size = usb_endpoint_maxp(bulk_in);
++	dev->bulk_in_buffer = kmalloc(dev->bulk_in_size, GFP_KERNEL);
++	dev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
++	dev->bulk_out_size = usb_endpoint_maxp(bulk_out);
++	dev->bulk_out_buffer = kmalloc(dev->bulk_out_size, GFP_KERNEL);
++	dev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
++
++	//hwmon_init(dev);
++	retval = init_device(dev->udev);
++	if (retval) {
++		dev_err(&interface->dev, "Failled initialising this device.\n");
++		goto exit;
++	}
++
++	usb_set_intfdata(interface, dev);
++	kref_init(&dev->kref);
++	mutex_init(&dev->io_mutex);
++	sema_init(&dev->limit_sem, 8);
++exit:
++	return retval;
++}
++
++static void astk_disconnect(struct usb_interface *interface)
++{
++	struct driver *dev = usb_get_intfdata(interface);
++	//hwmon_deinit(dev);
++	usb_set_intfdata(interface, NULL);
++	kref_put(&dev->kref, astk_delete);
++	deinit_device(dev->udev);
++	/* let the user know what node this device is now attached to */
++}
++static int astk_resume(struct usb_interface *intf)
++{
++	return 0;
++}
++
++static int astk_suspend(struct usb_interface *intf, pm_message_t message)
++{
++	return 0;
++}
++
++static struct usb_driver astk_driver = {
++	.name = "Asetek gen6 driver",
++	.id_table = astk_table,
++	.probe = astk_probe,
++	.disconnect = astk_disconnect,
++	.resume = astk_resume,
++	.suspend = astk_suspend,
++	.supports_autosuspend = 1,
++};
++
++static int __init astk_init(void)
++{
++	int ret = -1;
++
++	ret = usb_register(&astk_driver);
++
++	return ret;
++}
++
++static void __exit astk_exit(void)
++{
++	usb_deregister(&astk_driver);
++}
++
++module_init(astk_init);
++module_exit(astk_exit);
++
++MODULE_LICENSE("GPL");
++MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
++MODULE_DESCRIPTION("Asetek gen6 driver");
+-- 
+2.27.0
+
diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
index 19f50d5cd179..7fc31d4b5743 100644
--- a/drivers/hwmon/asetek_gen6.c
+++ b/drivers/hwmon/asetek_gen6.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* 
+/*
  * A hwmon driver for most asetek gen 6 all-in-one liquid coolers.
  * Copyright (c) Jaap Aarts 2020
  * 
@@ -15,7 +15,7 @@
  * 
  * Note: platinum is the codename name for pro within driver, so h100i platinum = h1ooi pro
  * 
- * Note: fan curve controll has not been implemented
+ * Note: fan curve control has not been implemented
  */
 
 #include <linux/module.h>
@@ -158,6 +158,7 @@ struct curve_point extreme_curve[] = {
 };
 
 #define default_curve quiet_curve
+
 static const char SUCCESS[2] = { 0x12, 0x34 };
 
 #define SUCCES_LENGTH 3
@@ -211,6 +212,7 @@ int set_fan_rpm_curve(struct driver *cdev, struct hwmon_fan_data *fan_data,
 		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
 	return 0;
 }
+
 int set_fan_target_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
 		       long val)
 {
@@ -244,10 +246,12 @@ int set_fan_target_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
 		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
 	return 0;
 }
+
 void get_fan_target_rpm(struct hwmon_fan_data *fan_data, long *val)
 {
 	*val = fan_data->fan_target;
 }
+
 int get_fan_current_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
 			long *val)
 {
@@ -272,7 +276,7 @@ int get_fan_current_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
 
 	if (!check_succes(0x41, recv_buf) ||
 	    recv_buf[3] != fan_data->fan_channel)
-		printk(KERN_INFO "[*] Failled retreiving fan rmp %d,%d,%d/%d\n",
+		printk(KERN_INFO "[*] Failled retrieving fan rmp %d,%d,%d/%d\n",
 		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
 
 	*val = (((uint8_t)recv_buf[4]) << 8) + (uint8_t)recv_buf[5];
@@ -470,6 +474,7 @@ static int write_func(struct device *dev, enum hwmon_sensor_types type,
 exit:
 	return retval;
 }
+
 int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	      int channel, long *val)
 {
@@ -540,8 +545,9 @@ int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 exit:
 	return retval;
 }
-#define fan_config HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN
-#define pwm_config HWMON_PWM_INPUT | HWMON_PWM_ENABLE
+
+#define fan_config (HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN)
+#define pwm_config (HWMON_PWM_INPUT | HWMON_PWM_ENABLE)
 
 static const struct hwmon_ops asetek_6_ops = {
 	.is_visible = is_visible_func,
@@ -580,8 +586,8 @@ bool does_fan_exist(struct driver *cdev, int channel)
 int get_fan_count(struct driver *dev)
 {
 	int fan;
-	for (fan = 0; does_fan_exist(dev, fan); fan += 1) {
-	}
+	for (fan = 0; does_fan_exist(dev, fan); fan += 1)
+		;
 	return fan;
 }
 
@@ -594,10 +600,13 @@ void hwmon_init(struct driver *dev)
 		&dev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
 	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
 		&dev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
+	//Allocate the info table
 	struct hwmon_channel_info **aio_info =
 		devm_kzalloc(&dev->udev->dev,
 			     sizeof(struct hwmon_channel_info *) * 2,
-			     GFP_KERNEL); //2==amount of channel infos.
+			     GFP_KERNEL); //2 for each channel info.
+
+	//Allocate the fan and PWM configuration
 	u32 *fans_config = devm_kzalloc(&dev->udev->dev,
 					sizeof(u32) * (data->channel_count + 1),
 					GFP_KERNEL);
@@ -610,6 +619,7 @@ void hwmon_init(struct driver *dev)
 		devm_kzalloc(&dev->udev->dev,
 			     sizeof(char *) * data->channel_count, GFP_KERNEL);
 
+	//For each fan create a data channel a fan config entry and a pwm config entry
 	for (fan_id = 0; fan_id <= data->channel_count; fan_id++) {
 		fan = devm_kzalloc(&dev->udev->dev,
 				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
@@ -648,8 +658,8 @@ void hwmon_deinit(struct driver *dev)
 }
 
 /*
-	Devices that work with this driver.
-	More devices should work, however none have been tested.
+ * Devices that work with this driver.
+ * More devices should work, however none have been tested.
 */
 static const struct usb_device_id astk_table[] = {
 	{ USB_DEVICE(0x1b1c, 0x0c15) },
@@ -674,6 +684,7 @@ int init_device(struct usb_device *udev)
 
 	return 0;
 }
+
 int deinit_device(struct usb_device *udev)
 {
 	int retval;
-- 
2.27.0

