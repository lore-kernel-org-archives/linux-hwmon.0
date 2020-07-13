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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BD2C433E4
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74C2F2068F
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxApHa3h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGMTco (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMTcn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 15:32:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FC8C061755;
        Mon, 13 Jul 2020 12:32:42 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a1so18664537ejg.12;
        Mon, 13 Jul 2020 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3tozMBGjpipE8A7Zgrh/XJBKD7AlEt72S9l99jpLqeM=;
        b=VxApHa3hJPggYC+rEAWen5/qDg9RazGycltvUnMiYCsdyLHsj7qvsCnB8cWRlnLHJX
         1Vgrf7j7/EKORH9CuNCj8izwhxqOMbl9qz3Y7JceRKy54XS8anlZ3hDaU8mI8o/IqVLR
         AugBBP9T525nkOt2EWMmLE6fD+Yg7ZNpZeGs1+u3GMMh/6pEeD18WSamV9evudW4amTz
         kKEXEr9XniKPog7qoq+uO5KDxEkjME1Qf/SK0vMo3QxwbFTyJ3lF1eV+KsRZ5vUqXUnC
         Ya02YiPREvw69KXN8oWkJbr0WJJjerQnWW4zNpfuofQx6BkIFRDOdwEN8mx9aKqcJMbT
         7HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3tozMBGjpipE8A7Zgrh/XJBKD7AlEt72S9l99jpLqeM=;
        b=qC71p9tomjfdRLAV9Yv5MUVLAb8q30OI55ZRQRNy2q06PMFcyWRL0QP6EzVCeSS210
         Q8EZePxBhfuVQ4EP8RA2atqJRut+2Qs5bcswb00vf4jjTF27KodgmF5MKcIgdiq7R7Vl
         0fuwq+lAthTG+Y+2anc36QLWGAmAc2EV43GNrxokrieSpo2Mvwz9OTIt2+0S82kmIEf+
         jvsrqw09e9xXgPOn9IfoRB1brR2hpu8tL3qekxhHyVB8I1x9bgjNhuXmMcTkAwrLrpTr
         dMLMoQUesd3s3zfeEFs9sslLUzTamRoQzPTb0rnq1NifoCrytgXOqVw9BrFgbDoMlbi3
         vCYQ==
X-Gm-Message-State: AOAM530pEOeCdoNt5YKup+8apRdu1rRZQ3ep4LERaBd2JpBFZanBDdy/
        yad51C5bZJLaAvC3N/n64fo=
X-Google-Smtp-Source: ABdhPJwbPRhCycG7wWM+Z1epowqZgV+vnjwi6pLQPETmlr5goUkfmlY2hCM96C+V/08ZAPZxJTphdg==
X-Received: by 2002:a17:906:a28b:: with SMTP id i11mr1222495ejz.524.1594668761520;
        Mon, 13 Jul 2020 12:32:41 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id x10sm10454003ejc.46.2020.07.13.12.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:32:40 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jaap Aarts <jaap.aarts1@example.com>
Subject: [PATCH 2/6] fan support for asetek gen 6 driver
Date:   Mon, 13 Jul 2020 21:32:23 +0200
Message-Id: <20200713193227.189751-2-jaap.aarts1@gmail.com>
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
 drivers/hwmon/asetek_gen6.c | 315 +++++++++++++++++++++++++++++++++++-
 1 file changed, 312 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
index 4d530a4cb71d..b82a678717ab 100644
--- a/drivers/hwmon/asetek_gen6.c
+++ b/drivers/hwmon/asetek_gen6.c
@@ -4,7 +4,7 @@
  * Copyright (c) Jaap Aarts 2020
  * 
  * Protocol reverse engineered by audiohacked
- * https://github.com/audiohacked/OpenCorsairLink
+ * https://github.com/audiohacked/OpendriverLink
  */
 
 /*
@@ -45,6 +45,315 @@ struct driver {
 	struct kref kref;
 };
 
+struct curve_point {
+	uint8_t temp;
+	uint8_t pwm;
+};
+
+struct fan_hwmon_data {
+	char fan_channel;
+	long fan_target;
+	unsigned char fan_pwm_target;
+	long mode;
+	struct curve_point curve[7];
+};
+
+struct hwmon_data {
+	struct driver *dev;
+	int channel_count;
+	void **channel_data;
+	int fan_1_index;
+};
+
+struct curve_point default_curve[] = {
+	{
+		.temp = 0x10,
+		.pwm = 0x19,
+	},
+	{
+		.temp = 0x14,
+		.pwm = 0x19,
+	},
+	{
+		.temp = 0x20,
+		.pwm = 0x27,
+	},
+	{
+		.temp = 0x28,
+		.pwm = 0x32,
+	},
+	{
+		.temp = 0x32,
+		.pwm = 0x4b,
+	},
+	{
+		.temp = 0x37,
+		.pwm = 0x5a,
+	},
+	{
+		.temp = 0x3c,
+		.pwm = 0x64,
+	},
+
+};
+
+static const char SUCCESS[2] = { 0x12, 0x34 };
+
+#define SUCCES_LENGTH 3
+
+static bool check_succes(char command, char ret[SUCCES_LENGTH])
+{
+	char success[SUCCES_LENGTH] = { command };
+	strncpy(&success[1], SUCCESS, SUCCES_LENGTH - 1);
+	return strncmp(ret, success, SUCCES_LENGTH) == 0;
+}
+
+int set_fan_target_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
+		       long val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+
+	fan_data->fan_target = val;
+	fan_data->fan_pwm_target = 0;
+
+	send_buf[0] = 0x43;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = (fan_data->fan_target >> 8);
+	send_buf[3] = fan_data->fan_target;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
+	if (retval != 0)
+		return retval;
+
+	//no error
+	if (!check_succes(send_buf[0], recv_buf) ||
+	    recv_buf[3] != fan_data->fan_channel)
+		printk(KERN_INFO "[*] Failled setting fan rpm %d,%d,%d/%d\n",
+		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+	return 0;
+}
+void get_fan_target_rpm(struct fan_hwmon_data *fan_data, long *val)
+{
+	*val = fan_data->fan_target;
+}
+int get_fan_current_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
+			long *val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+
+	send_buf[0] = 0x41;
+	send_buf[1] = fan_data->fan_channel;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 2, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	if (!check_succes(0x41, recv_buf) ||
+	    recv_buf[3] != fan_data->fan_channel)
+		printk(KERN_INFO "[*] Failled retreiving fan rmp %d,%d,%d/%d\n",
+		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+
+	*val = (((uint8_t)recv_buf[4]) << 8) + (uint8_t)recv_buf[5];
+	return 0;
+}
+
+umode_t is_visible_func(const void *d, enum hwmon_sensor_types type, u32 attr,
+			int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+			break;
+		case hwmon_fan_target:
+			return 0644;
+			break;
+		case hwmon_fan_min:
+			return 0444;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int write_func(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct driver *cdev = data->dev;
+	struct fan_hwmon_data *fan_data;
+	int retval = 0;
+
+	switch (type) {
+	case hwmon_fan:;
+		switch (attr) {
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = set_fan_target_rpm(cdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+cleanup:
+	up(&cdev->limit_sem);
+cleanup_interface:
+	usb_autopm_put_interface(cdev->interface);
+exit:
+	return retval;
+}
+int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	      int channel, long *val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct driver *cdev = data->dev;
+	struct fan_hwmon_data *fan_data;
+	int retval = 0;
+	if (channel >= data->channel_count)
+		return -EAGAIN;
+
+	switch (type) {
+	case hwmon_fan:;
+		switch (attr) {
+		case hwmon_fan_input:
+			fan_data = data->channel_data[channel];
+
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = get_fan_current_rpm(cdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+
+			get_fan_target_rpm(fan_data, val);
+			break;
+		case hwmon_fan_min:
+			*val = 200;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+cleanup:
+	up(&cdev->limit_sem);
+cleanup_interface:
+	usb_autopm_put_interface(cdev->interface);
+exit:
+	return retval;
+}
+static const struct hwmon_channel_info *dual_fan[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_TARGET),
+	NULL
+};
+
+static const struct hwmon_ops asetek_6_ops = {
+	.is_visible = is_visible_func,
+	.read = read_func,
+	.write = write_func,
+};
+
+static const struct hwmon_chip_info lm75_chip_info = {
+	.ops = &asetek_6_ops,
+	.info = dual_fan,
+};
+
+void hwmon_init(struct driver *dev)
+{
+	struct device *hwmon_dev;
+	struct hwmon_data *data = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
+	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
+	struct fan_hwmon_data *fan1 = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct fan_hwmon_data), GFP_KERNEL);
+	struct fan_hwmon_data *fan2 = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct fan_hwmon_data), GFP_KERNEL);
+	data->channel_count = 2; //amount of fans
+	data->channel_data =
+		devm_kzalloc(&dev->udev->dev,
+			     sizeof(char *) * data->channel_count, GFP_KERNEL);
+
+	hwmon_info->ops = &asetek_6_ops;
+	hwmon_info->info = dual_fan;
+
+	fan1->fan_channel = 0;
+	fan1->mode = 2;
+	fan2->fan_channel = 1;
+	fan2->mode = 2;
+
+	data->fan_1_index = 0;
+	data->dev = dev;
+	data->channel_data[0] = fan1;
+	data->channel_data[1] = fan2;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(
+		&dev->udev->dev, "driver_fan", data, hwmon_info, NULL);
+	printk(KERN_INFO "[*] Setup hwmon\n");
+}
+
+void hwmon_deinit(struct driver *dev)
+{
+	hwmon_device_unregister(&dev->udev->dev);
+	printk(KERN_INFO "[*] HWMON DISCONNECT\n");
+}
 /* devices that work with this driver */
 static const struct usb_device_id astk_table[] = {
 	{ USB_DEVICE(0x1b1c, 0x0c15) },
@@ -121,7 +430,7 @@ static int astk_probe(struct usb_interface *interface,
 	dev->bulk_out_buffer = kmalloc(dev->bulk_out_size, GFP_KERNEL);
 	dev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
 
-	//hwmon_init(dev);
+	hwmon_init(dev);
 	retval = init_device(dev->udev);
 	if (retval) {
 		dev_err(&interface->dev, "Failled initialising this device.\n");
@@ -139,7 +448,7 @@ static int astk_probe(struct usb_interface *interface,
 static void astk_disconnect(struct usb_interface *interface)
 {
 	struct driver *dev = usb_get_intfdata(interface);
-	//hwmon_deinit(dev);
+	hwmon_deinit(dev);
 	usb_set_intfdata(interface, NULL);
 	kref_put(&dev->kref, astk_delete);
 	deinit_device(dev->udev);
-- 
2.27.0

