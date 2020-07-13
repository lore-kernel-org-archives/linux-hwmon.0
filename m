Return-Path: <SRS0=nJvH=AY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A48BC433EA
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B81F2068F
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 19:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwQtVCBZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgGMTcp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMTco (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 15:32:44 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADB0C061755;
        Mon, 13 Jul 2020 12:32:44 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id br7so4868932ejb.5;
        Mon, 13 Jul 2020 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yfqv2DxIW2ZuTZ7+N9tKoXEvxywixJvsQwu17sGFozY=;
        b=EwQtVCBZpFbsdbp3XszEd/0+/8g7igwTVSZFenQFHkb0AUfSvh9Z3txY+imj0wd9Z6
         Pfa1ZMQAjhOEUPA/BuXqngNmVTrNOEmh5dKXbs2YH8j5kaX5ot7kUxidrVzMAfq7pcqJ
         XnNGEcFGLHuahhqN92bR7ZrRBUnwi0H/JGfQp9jf4HURhGeRkHcRsgK8i+J47tHg+uQn
         RDkC4Yw6N6zNHOsBB09bxl06Lxg101qefRgdh+l58RB73l21kcHYY5ao5ZAjU8i6rHF7
         kaDTudHDG+iG29D3y741H3+ELIpQqwDS3m9Kruxt4gBMGtjEiIjQ/AgBIzp/uVlKb89e
         CQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yfqv2DxIW2ZuTZ7+N9tKoXEvxywixJvsQwu17sGFozY=;
        b=ng0tVFZoxkq4qFoMBu7rASxJVwAiSI9Ut8c61H1yPLXq3TJ1beHPGt/sEjJ0lylYbd
         TwND4vOS3j0t03TrGGXeIplCFbOtV78CEaqB1llsGbwPV2ya+hpTU5JagXqXO8a5dLeJ
         /VveiWpHLxtHxzLqkXI0g3ZL71gg4YOWVySp6E+JZ+NVYtDEf9G8fAM8vrFgX7R5A5ck
         rCRNLk6GhIifCvD8OWSU7aGt7EAmgyWXJvQtcxyWILfZcj86pBFpA+RmdkqHBVoJFowW
         HATixOuAIN2NNpS3pJyblizzBBzOrOyZs4WZdmCcvtwQsfHEHpd23tUad/KZ4zY6knqF
         3XCA==
X-Gm-Message-State: AOAM531gn4y0T+z4tBgrgZafzV01XBGfs0LFwHe6HLGbiR3pVN/WLNQN
        MJPpbkoBgDi02k+3jd0uJZA=
X-Google-Smtp-Source: ABdhPJzpvwaKBT7xd/QHdFEA8inpKlwLIy07uYKCmIzadFlhIv5tBhyEPotmQY1HppL/zNvDGBPG7w==
X-Received: by 2002:a17:906:c24e:: with SMTP id bl14mr1195065ejb.285.1594668763096;
        Mon, 13 Jul 2020 12:32:43 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id x10sm10454003ejc.46.2020.07.13.12.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:32:42 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jaap Aarts <jaap.aarts1@example.com>
Subject: [PATCH 4/6] automatic fan count detection
Date:   Mon, 13 Jul 2020 21:32:25 +0200
Message-Id: <20200713193227.189751-4-jaap.aarts1@gmail.com>
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
 drivers/hwmon/asetek_gen6.c | 146 ++++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 50 deletions(-)

diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
index 5c3bd456f881..d657ecc78908 100644
--- a/drivers/hwmon/asetek_gen6.c
+++ b/drivers/hwmon/asetek_gen6.c
@@ -9,11 +9,11 @@
 
 /*
  * Supports following chips: 
- * driver h100i platinum
+ * h100i platinum
  * 
  * Other products should work with this driver but no testing has been done.
  * 
- * Note: platinum is the codename name for pro within driver
+ * Note: platinum is the codename name for pro within driver, so h100i platinum = h1ooi pro
  * 
  * Note: fan curve controll has not been implemented
  */
@@ -50,7 +50,7 @@ struct curve_point {
 	uint8_t pwm;
 };
 
-struct fan_hwmon_data {
+struct hwmon_fan_data {
 	char fan_channel;
 	long fan_target;
 	unsigned char fan_pwm_target;
@@ -62,7 +62,6 @@ struct hwmon_data {
 	struct driver *dev;
 	int channel_count;
 	void **channel_data;
-	int fan_1_index;
 };
 
 struct curve_point default_curve[] = {
@@ -105,10 +104,10 @@ static bool check_succes(char command, char ret[SUCCES_LENGTH])
 {
 	char success[SUCCES_LENGTH] = { command };
 	strncpy(&success[1], SUCCESS, SUCCES_LENGTH - 1);
-	return strncmp(ret, success, SUCCES_LENGTH) == 0;
+	return strncmp(ret, success, SUCCES_LENGTH - 1) == 0;
 }
 
-int set_fan_rpm_curve(struct driver *cdev, struct fan_hwmon_data *fan_data,
+int set_fan_rpm_curve(struct driver *cdev, struct hwmon_fan_data *fan_data,
 		      struct curve_point point[7])
 {
 	int retval;
@@ -145,14 +144,12 @@ int set_fan_rpm_curve(struct driver *cdev, struct fan_hwmon_data *fan_data,
 	if (retval != 0)
 		return retval;
 
-	if (!check_succes(
-		    send_buf[0],
-		    recv_buf) /* || recv_buf[3] != fan_data->fan_channel */)
+	if (!check_succes(send_buf[0], recv_buf))
 		printk(KERN_INFO "[*] Failled setting fan curve %d,%d,%d/%d\n",
 		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
 	return 0;
 }
-int set_fan_target_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
+int set_fan_target_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
 		       long val)
 {
 	int retval;
@@ -180,17 +177,16 @@ int set_fan_target_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
 		return retval;
 
 	//no error
-	if (!check_succes(send_buf[0], recv_buf) ||
-	    recv_buf[3] != fan_data->fan_channel)
+	if (!check_succes(send_buf[0], recv_buf))
 		printk(KERN_INFO "[*] Failled setting fan rpm %d,%d,%d/%d\n",
 		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
 	return 0;
 }
-void get_fan_target_rpm(struct fan_hwmon_data *fan_data, long *val)
+void get_fan_target_rpm(struct hwmon_fan_data *fan_data, long *val)
 {
 	*val = fan_data->fan_target;
 }
-int get_fan_current_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
+int get_fan_current_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
 			long *val)
 {
 	int retval;
@@ -221,7 +217,7 @@ int get_fan_current_rpm(struct driver *cdev, struct fan_hwmon_data *fan_data,
 	return 0;
 }
 
-int set_fan_target_pwm(struct driver *cdev, struct fan_hwmon_data *fan_data,
+int set_fan_target_pwm(struct driver *cdev, struct hwmon_fan_data *fan_data,
 		       long val)
 {
 	int retval;
@@ -248,8 +244,7 @@ int set_fan_target_pwm(struct driver *cdev, struct fan_hwmon_data *fan_data,
 		return retval;
 
 	//no error
-	if (!check_succes(send_buf[0], recv_buf) ||
-	    recv_buf[3] != fan_data->fan_channel)
+	if (!check_succes(send_buf[0], recv_buf))
 		printk(KERN_INFO "[*] Failled setting fan pwm %d,%d,%d/%d\n",
 		       recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
 	return 0;
@@ -298,7 +293,7 @@ static int write_func(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct hwmon_data *data = dev_get_drvdata(dev);
 	struct driver *cdev = data->dev;
-	struct fan_hwmon_data *fan_data;
+	struct hwmon_fan_data *fan_data;
 	int retval = 0;
 
 	switch (type) {
@@ -404,7 +399,7 @@ int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 {
 	struct hwmon_data *data = dev_get_drvdata(dev);
 	struct driver *cdev = data->dev;
-	struct fan_hwmon_data *fan_data;
+	struct hwmon_fan_data *fan_data;
 	int retval = 0;
 	if (channel >= data->channel_count)
 		return -EAGAIN;
@@ -469,14 +464,8 @@ int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 exit:
 	return retval;
 }
-static const struct hwmon_channel_info *dual_fan[] = {
-	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_MODE,
-			   HWMON_PWM_INPUT | HWMON_PWM_MODE),
-
-	NULL
-};
+#define fan_config HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN
+#define pwm_config HWMON_PWM_INPUT | HWMON_PWM_MODE
 
 static const struct hwmon_ops asetek_6_ops = {
 	.is_visible = is_visible_func,
@@ -484,40 +473,93 @@ static const struct hwmon_ops asetek_6_ops = {
 	.write = write_func,
 };
 
-static const struct hwmon_chip_info lm75_chip_info = {
-	.ops = &asetek_6_ops,
-	.info = dual_fan,
-};
+bool does_fan_exist(struct driver *cdev, int channel)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+
+	send_buf[0] = 0x43;
+	send_buf[1] = channel;
+	send_buf[2] = (600 >> 8);
+	send_buf[3] = 600;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return false;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
+	if (retval != 0)
+		return false;
+
+	if (!check_succes(send_buf[0], recv_buf))
+		return false;
+	return true;
+}
+
+int get_fan_count(struct driver *dev)
+{
+	int fan;
+	for (fan = 0; does_fan_exist(dev, fan); fan += 1) {
+	}
+	return fan;
+}
 
 void hwmon_init(struct driver *dev)
 {
+	int fan_id;
 	struct device *hwmon_dev;
+	struct hwmon_fan_data *fan;
 	struct hwmon_data *data = devm_kzalloc(
 		&dev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
 	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
 		&dev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
-	struct fan_hwmon_data *fan1 = devm_kzalloc(
-		&dev->udev->dev, sizeof(struct fan_hwmon_data), GFP_KERNEL);
-	struct fan_hwmon_data *fan2 = devm_kzalloc(
-		&dev->udev->dev, sizeof(struct fan_hwmon_data), GFP_KERNEL);
-	data->channel_count = 2; //amount of fans
+	struct hwmon_channel_info **aio_info =
+		devm_kzalloc(&dev->udev->dev,
+			     sizeof(struct hwmon_channel_info *) * 2,
+			     GFP_KERNEL); //2==amount of channel infos.
+	u32 *fans_config = devm_kzalloc(&dev->udev->dev,
+					sizeof(u32) * (data->channel_count + 1),
+					GFP_KERNEL);
+	u32 *pwms_config = devm_kzalloc(&dev->udev->dev,
+					sizeof(u32) * (data->channel_count + 1),
+					GFP_KERNEL);
+
+	data->channel_count = get_fan_count(dev); //amount of fans
 	data->channel_data =
 		devm_kzalloc(&dev->udev->dev,
 			     sizeof(char *) * data->channel_count, GFP_KERNEL);
 
-	hwmon_info->ops = &asetek_6_ops;
-	hwmon_info->info = dual_fan;
+	for (fan_id = 0; fan_id <= data->channel_count; fan_id++) {
+		fan = devm_kzalloc(&dev->udev->dev,
+				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
+		fan->fan_channel = fan_id;
+		fan->mode = 2;
+		data->channel_data[fan_id] = fan;
+		fans_config[fan_id] = fan_config;
+		pwms_config[fan_id] = pwm_config;
+	}
+	fans_config[data->channel_count] = 0;
+	pwms_config[data->channel_count] = 0;
 
-	fan1->fan_channel = 0;
-	fan1->mode = 2;
-	fan2->fan_channel = 1;
-	fan2->mode = 2;
+	aio_info[0] = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_channel_info), GFP_KERNEL);
+	aio_info[0]->type = hwmon_fan;
+	aio_info[0]->config = fans_config;
 
-	data->fan_1_index = 0;
-	data->dev = dev;
-	data->channel_data[0] = fan1;
-	data->channel_data[1] = fan2;
+	aio_info[1] = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_channel_info), GFP_KERNEL);
+	aio_info[1]->type = hwmon_pwm;
+	aio_info[1]->config = pwms_config;
+
+	hwmon_info->ops = &asetek_6_ops;
+	hwmon_info->info = (const struct hwmon_channel_info **)aio_info;
 
+	data->dev = dev;
 	hwmon_dev = devm_hwmon_device_register_with_info(
 		&dev->udev->dev, "driver_fan", data, hwmon_info, NULL);
 	printk(KERN_INFO "[*] Setup hwmon\n");
@@ -528,10 +570,14 @@ void hwmon_deinit(struct driver *dev)
 	hwmon_device_unregister(&dev->udev->dev);
 	printk(KERN_INFO "[*] HWMON DISCONNECT\n");
 }
-/* devices that work with this driver */
+
+/*
+	Devices that work with this driver.
+	More devices should work, however none have been tested.
+*/
 static const struct usb_device_id astk_table[] = {
 	{ USB_DEVICE(0x1b1c, 0x0c15) },
-	{} /* Terminating entry */
+	{},
 };
 
 MODULE_DEVICE_TABLE(usb, astk_table);
@@ -604,13 +650,14 @@ static int astk_probe(struct usb_interface *interface,
 	dev->bulk_out_buffer = kmalloc(dev->bulk_out_size, GFP_KERNEL);
 	dev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
 
-	hwmon_init(dev);
 	retval = init_device(dev->udev);
 	if (retval) {
 		dev_err(&interface->dev, "Failled initialising this device.\n");
 		goto exit;
 	}
 
+	hwmon_init(dev);
+
 	usb_set_intfdata(interface, dev);
 	kref_init(&dev->kref);
 	mutex_init(&dev->io_mutex);
@@ -626,7 +673,6 @@ static void astk_disconnect(struct usb_interface *interface)
 	usb_set_intfdata(interface, NULL);
 	kref_put(&dev->kref, astk_delete);
 	deinit_device(dev->udev);
-	/* let the user know what node this device is now attached to */
 }
 static int astk_resume(struct usb_interface *intf)
 {
-- 
2.27.0

