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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4265FC433E1
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D0562068F
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjwT/kS+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgGMTcn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMTcm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 15:32:42 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE9CC061755;
        Mon, 13 Jul 2020 12:32:42 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id rk21so18698527ejb.2;
        Mon, 13 Jul 2020 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gvo7e15l43Z5S4xNTRm4U/LuPogwATOegPrQ3t4WKpA=;
        b=cjwT/kS+1z2UhsutsAFO9N8+eJ0DN9LL0Lva1oqSXSQ+Jy4vEFdNn4ItiENyOnuKVE
         Tss2GVGi98asR5hbuCmUIlONJOYNoC3sK/0IANka0VnR/Bu+LihJ1Ihjum2WheFbGqAp
         h+D59fjiOqw0fU6hB+BYFqy8y6Fq29CgpPGA7nrS2wsEibxEs7jMP8r3OVlHV/vsRONE
         5pAsgX2OXUXR9PSZ7Ucc5V04gX6oXaje87l0QnInwiYjQL+2GFFwFD3cNMytHbCediL3
         mzNFKBLTM2zDF+pS+kzCtgQpJImSdQdqBjaYwL79H82b+BNymrwDigHqIOvM0Hfd1p7n
         6pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gvo7e15l43Z5S4xNTRm4U/LuPogwATOegPrQ3t4WKpA=;
        b=mdEhG2ziA1nJF7RI5kCA2ly/QaezsJ9VKyW+AG0VdjerPsdyk5tkgmWJxs5auGQmC+
         hMN/Pyp5GUUk2OqM9mU97DBXbzmHOxIgsADaZDrMeEZCD3kj2GV3JaR56Jc4tTukNM5G
         2K2P+jhVbD5D8TSuZQWex644E1JhAdTRqJ59WSjavvLFAbUw+MFLzNpfBKbPXGwkl7wn
         YpiBt1lGkQfClbmPsUHY/V21AERfPl8f7POIxmWnTUP2wBF6j9oAKbCbcY8B446B/d33
         bzUewXmUFRUzA8ofckZJvLMj5u6Li+GRdDrP6cnC/XSl1JEvs7VpYOHEBorfJ02nGHkX
         KqRA==
X-Gm-Message-State: AOAM532YEtgTKvKK2w6id3psIU5a6jC+Sa7fQUqejghkaBkgIvYR7UAA
        OWN3gWhkM06PCfZyEHPKIPBdkpuM403qVQ==
X-Google-Smtp-Source: ABdhPJz4qqHVL7216XzMCmDmDbXy1ENAFfFdtD81uNnwtY5RSUnRPLntRMFe1Sziv0fP5j76l/UK/Q==
X-Received: by 2002:a17:906:f53:: with SMTP id h19mr1178125ejj.491.1594668760712;
        Mon, 13 Jul 2020 12:32:40 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id x10sm10454003ejc.46.2020.07.13.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:32:40 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jaap Aarts <jaap.aarts1@example.com>
Subject: [PATCH 1/6] skeleton for asetek gen 6 driver
Date:   Mon, 13 Jul 2020 21:32:22 +0200
Message-Id: <20200713193227.189751-1-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
---
 drivers/hwmon/Kconfig       |   6 ++
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/asetek_gen6.c | 186 ++++++++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/hwmon/asetek_gen6.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 288ae9f63588..521a9e0c88ca 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -378,6 +378,12 @@ config SENSORS_ARM_SCPI
 	  and power sensors available on ARM Ltd's SCP based platforms. The
 	  actual number and type of sensors exported depend on the platform.
 
+config SENSORS_ASETEK_GEN6
+	tristate "Asetek generation 6 driver"
+	help
+	  If you say yes here you get support for asetek generation 6 boards
+	  found on most AIO liquid coolers with an asetek pump.
+
 config SENSORS_ASB100
 	tristate "Asus ASB100 Bach"
 	depends on X86 && I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3e32c21f5efe..9683d2aae2b2 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
 obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
 obj-$(CONFIG_SENSORS_W83781D)	+= w83781d.o
 obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
+obj-$(CONFIG_SENSORS_ASETEK_GEN6)	+= asetek_gen6.o
 
 obj-$(CONFIG_SENSORS_AB8500)	+= abx500.o ab8500.o
 obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
new file mode 100644
index 000000000000..4d530a4cb71d
--- /dev/null
+++ b/drivers/hwmon/asetek_gen6.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* 
+ * A hwmon driver for most asetek gen 6 all-in-one liquid coolers.
+ * Copyright (c) Jaap Aarts 2020
+ * 
+ * Protocol reverse engineered by audiohacked
+ * https://github.com/audiohacked/OpenCorsairLink
+ */
+
+/*
+ * Supports following chips: 
+ * driver h100i platinum
+ * 
+ * Other products should work with this driver but no testing has been done.
+ * 
+ * Note: platinum is the codename name for pro within driver
+ * 
+ * Note: fan curve controll has not been implemented
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/usb.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+
+struct driver {
+	struct usb_device *udev;
+
+	char *bulk_out_buffer;
+	char *bulk_in_buffer;
+	size_t bulk_out_size;
+	size_t bulk_in_size;
+	char bulk_in_endpointAddr;
+	char bulk_out_endpointAddr;
+
+	struct usb_interface *interface; /* the interface for this device */
+	struct mutex io_mutex; /* synchronize I/O with disconnect */
+	struct semaphore
+		limit_sem; /* limiting the number of writes in progress */
+
+	struct kref kref;
+};
+
+/* devices that work with this driver */
+static const struct usb_device_id astk_table[] = {
+	{ USB_DEVICE(0x1b1c, 0x0c15) },
+	{} /* Terminating entry */
+};
+
+MODULE_DEVICE_TABLE(usb, astk_table);
+
+int init_device(struct usb_device *udev)
+{
+	int retval;
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
+				 0xffff, 0x0000, 0, 0, 0);
+	//this always returns error
+	if (retval != 0)
+		;
+
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+				 0x0002, 0x0000, 0, 0, 0);
+	if (retval != 0)
+		return retval;
+
+	return 0;
+}
+int deinit_device(struct usb_device *udev)
+{
+	int retval;
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+				 0x0004, 0x0000, 0, 0, 0);
+	if (retval != 0)
+		return retval;
+
+	return 0;
+}
+
+static void astk_delete(struct kref *kref)
+{
+	struct driver *dev = container_of(kref, struct driver, kref);
+
+	usb_put_intf(dev->interface);
+	usb_put_dev(dev->udev);
+	kfree(dev->bulk_in_buffer);
+	kfree(dev->bulk_out_buffer);
+	kfree(dev);
+}
+
+static int astk_probe(struct usb_interface *interface,
+		      const struct usb_device_id *id)
+{
+	struct driver *dev;
+	int retval = 0;
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev) {
+		retval = -ENOMEM;
+		goto exit;
+	}
+
+	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
+					   &bulk_out, NULL, NULL);
+	if (retval != 0)
+		goto exit;
+
+	dev->udev = usb_get_dev(interface_to_usbdev(interface));
+	dev->interface = usb_get_intf(interface);
+
+	/* set up the endpoint information */
+	/* use only the first bulk-in and bulk-out endpoints */
+	dev->bulk_in_size = usb_endpoint_maxp(bulk_in);
+	dev->bulk_in_buffer = kmalloc(dev->bulk_in_size, GFP_KERNEL);
+	dev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
+	dev->bulk_out_size = usb_endpoint_maxp(bulk_out);
+	dev->bulk_out_buffer = kmalloc(dev->bulk_out_size, GFP_KERNEL);
+	dev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
+
+	//hwmon_init(dev);
+	retval = init_device(dev->udev);
+	if (retval) {
+		dev_err(&interface->dev, "Failled initialising this device.\n");
+		goto exit;
+	}
+
+	usb_set_intfdata(interface, dev);
+	kref_init(&dev->kref);
+	mutex_init(&dev->io_mutex);
+	sema_init(&dev->limit_sem, 8);
+exit:
+	return retval;
+}
+
+static void astk_disconnect(struct usb_interface *interface)
+{
+	struct driver *dev = usb_get_intfdata(interface);
+	//hwmon_deinit(dev);
+	usb_set_intfdata(interface, NULL);
+	kref_put(&dev->kref, astk_delete);
+	deinit_device(dev->udev);
+	/* let the user know what node this device is now attached to */
+}
+static int astk_resume(struct usb_interface *intf)
+{
+	return 0;
+}
+
+static int astk_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	return 0;
+}
+
+static struct usb_driver astk_driver = {
+	.name = "Asetek gen6 driver",
+	.id_table = astk_table,
+	.probe = astk_probe,
+	.disconnect = astk_disconnect,
+	.resume = astk_resume,
+	.suspend = astk_suspend,
+	.supports_autosuspend = 1,
+};
+
+static int __init astk_init(void)
+{
+	int ret = -1;
+	ret = usb_register(&astk_driver);
+
+	return ret;
+}
+
+static void __exit astk_exit(void)
+{
+	usb_deregister(&astk_driver);
+}
+
+module_init(astk_init);
+module_exit(astk_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
+MODULE_DESCRIPTION("Asetek gen6 driver");
-- 
2.27.0

