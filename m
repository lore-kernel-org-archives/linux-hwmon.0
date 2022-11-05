Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BC3C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Nov 2022 23:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiKEX0M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Nov 2022 19:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKEX0L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Nov 2022 19:26:11 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9515F1056C
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Nov 2022 16:26:08 -0700 (PDT)
IronPort-SDR: Za7vMhu78VXcP7GBQYVHFxzieaSB/gPkvmhp+FVHghGXzsjjfzOHbGBh8oV/uGM55lLe8sAnQV
 HP9PoRHW1JyJzRzmV1nInoBZJd3nnhKPIuj/wAQkv3IJjr1TAGwCjO0mJyyDX0KeMQiXgrjaqJ
 iJLblzJruP07s2LHFsOnKEPMmgkrwQ99A43J2MsfgwDCm01SNZ9kxvXB/dYngrTGzLlBz8K+jY
 N8c/Jp/0LLQY1iYXmeCZ9I9P2n+XyK6YIzvm9B0r+j9yUqBSJhA4iUxzYr/zWB75d5zDcDx3/J
 iomThe6+QUQhQUPkSCk62FTg
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AADAD172Zj//Qc8jxaHgEBCxIMSYE7C4ItglqVaJ0ug?=
 =?us-ascii?q?X4PAQ8BAUQEAQGFBYR7JjYHDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gRvATkHC1IHC1gHB4FBC4FhEwsDMQ2GRSsLAQ0BATcBKIEVARKCfYMirDkzg?=
 =?us-ascii?q?QGCCAEBBoJglnKBXgmBQItHgRKDNoE9P4FOhA9uhCaGXJdIAwkDBwVJQAMLG?=
 =?us-ascii?q?A0WMgMKEzcbWA4JHxwlDQUGEgMgbgUHOg8oL2crHBsHgQwqKBUDBAQDAgYTA?=
 =?us-ascii?q?yICDSkxFAQpEw0rByNxCQIDIWoDAwQoLAMJQAcnJDwHVzoFAwIQIjoGAwkDA?=
 =?us-ascii?q?iJYdTASFAUDDRclCAVOBAg6AgUGUxICChEDEg8qSA5KPjkWBidEATQPDhQDX?=
 =?us-ascii?q?k0dgQMEmwYBawc9HDWCMAFDkls6jg2hNoNxgU2ea0yBRII0pR2XMSCCK59Dg?=
 =?us-ascii?q?RiEKAIKBxaBaQ6CAE0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dDBaCC?=
 =?us-ascii?q?ow4YTsCBwsBAQMJil4BAQ?=
IronPort-PHdr: A9a23:0NdtcR0GysMwoagNsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:MbJtFaC2Cy+2JhVW/x7lw5YqxClBgxIJ4kV8jS/XYbTApGgngmQGx
 jROCGyEMvaKZmCnLdknatzloUIC6pfWmNVgGQRpry4xE3kToMaUD9rBcx/6Y33Idp3OEkg65
 JUQZoLpIZFvRBcwhD/0YuC79yUUOYJk51bYILSZUsykbVY8EE/NsTo6x6hhxNQAbeGRW2thg
 /uryyHiEAbNNwBcYjp8B52r8HuDjNyq0N/PlgFWiVhj5TcyplFNZH4tDfjZw0jQHuG4KtWHq
 9Prl9lVyI94EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPqsTbJIhhUlrZzqhlc5O1
 IVd7oaKRTwiBKbswc0mdyMfKnQrVUFG0OevzXmXu82P1AvNaXLzzfJ0AAc7OJBe++oxCHwmG
 f4wdmhLNEzZwbjmhujnFoGAhex6RCXvFI0Fs3dj5TrDBOkoRorPBajP+JlZ0HE5m6iiGN6CP
 JRCMGcxNUiojxtnKgwYLrcAnMmTr2jQSGZerE2vhfZ07D2GpOB2+OO1a4qPII3iqd9utkKZo
 H/WumTmBxYcHMKQxCDD8X+2gOLL2yThV+o6ELy+6+5CmlqezW9WFQZQU1anydG7hkO6RdtFJ
 mQP5zEj66M18SSWosLVAUX9+iLe+0RMHoAMT6sh9AiRy6GS/x6WBy4PSTsHYcFOWNIKqSIC3
 EG2g4P5XiZVvIaec3m9r56viQn1AH1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJJZaPWrRVkcJ
 BjU8kADa6UvYd0jkv7grQ+e31pAsrCQE1dvvl2JNo6wxlohDLNJcbBE/nDy0J6sxq6iX1WHs
 WlsdyO2trhWVflheASrTfpFJ7a0+/bNDzTYjEUHInXM32r1viT/J8UKsHQkeBsvKdoNZT7iJ
 lPLtgIX75hWenK3BUOWX25TI5hzpUQDPY6+PhwxUjaoSsIsHONg1Hs2DXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmzyNGsujlE39juP2iJuppVEtbgbmggcRsv3snekp2
 4wFXyd3408BAbKjPXe/HXA7cw9SdyVT6W/KRzx/LbbYclA8SQnN+tfN2bxpeop5kr5Tm/ugw
 51OchEw9bYLvlWZc1riV5yVQO63Bc4XQLNSFXdEAGtELFB6Pdv1sfhCJ8tsFVTlncQ6pcNJo
 zA+U53oKpxypv7volzxtLHx895vcgqFnwWLM3b3aTQzZccwFQfT88DqeRHjsiQLE2y2uY03v
 uT4hA/cRJMCQSVkDdrXMazxkgvg7SdDxe8iDVHVJtRzeVn39NY4ISLGjsgxf5MGJyLcl2mT2
 AuhCBsFofXA/t0u+97TiKHa84qkSrMsHkdTE2TBw6yxMC3WojiqzYNaCbbadirUS23z4qnka
 OBIifDwdvQaxQ4Yv415Grdt7KQ/+9q2+eEHllU0QyuWYg3yWL16I3SA0c1ejYF3x+dU6VmsR
 0aC2thGIrHXasnrJ14mIlZ3ZOq0yqBGkzbf2v05PUHm6XIl57GAS0hTYUWBhSEBfrt4NIQpn
 bUotMIMsVftgBs2KZCNlClL+WOWIjoNVrhht51cCZKy0lgnzVRLYJr9DC7q4cjRNYgUYxl1f
 GKZ1PjYmrBR5kveaH5tR3LD6upqg8hcsh590w5QLluErdPJm/sr0UAD6j8wVAlUkElK3r4hI
 GRtLEEpd6yC8y0z3podByX2R1sEXk3coBCtjUAVnXHYRA+0TmPMamY6PKCE4RlBoW5bezFa+
 pCeyXrkCGi0IZmgjnRsBEM1+eb+SdFR9xHZnJz1FcqyGchoaDXotaaieG4Upka1Gsg2nkDG+
 7Vn8esYhXcX7sLMT3DX07Wn6Ik=
IronPort-HdrOrdr: A9a23:Io/Or6jbWNa9pytLEzFinpmlHnBQXvQji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhP03J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUQiTXeVfBPXZsl/d8kTFn4Y36U
 4KSchD4bPLY2STAqvBkW+F+q4bsby6GbiT9J3jJmlWPHpXgn5bnn5E4tfyKDwPeDV7
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 06 Nov 2022 09:56:05 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 2A5NPrt13088158
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 6 Nov 2022 10:25:59 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 2A5NPrt13088158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667690759; bh=JPOYFI8XCtZnl+vf7OTnvdV2n/X1C3YhAp+WiD2ReJY=;
        h=From:To:Cc:Subject:Date:From;
        b=jAEIqYV7Qtqep/NQ7M265UOzyWFhn82i0s6N2xBj4hYrblHfUqg/2LYRzYU/EAz4Y
         PbY2AiHvYcWINV4hCSuiIN4eWO8iZr1YnNnpFpFgY2v+Gq4q+t55AkD5rRyS6ROIWZ
         8MmCj3NA0B8Nk98p5gux8+rcoVNsuBunl/JC6sv1waAPH+vhpRgobetoqWd60BZ6KF
         f4DRDBAJftamOAanh8Mk+brpvvUXLI1MMOne2+ebpW9skRCsj/9uyiwCS8FJFUIIXU
         MmXCam+bgDP9OQ7WXbR6mJcWbQYt4XSZ3z4x2aGWXHN2yS6Ru6ebVa5WMu1J2dPhGx
         8rZhAphkUK9Dw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v5 1/1] hwmon: (it87) Add DMI table for future extensions
Date:   Sun,  6 Nov 2022 10:25:32 +1100
Message-Id: <20221105232531.1619387-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 06 Nov 2022 10:25:59 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add in DMI matching table to match various board quirks and settings.
This will be useful for future extentions, but will start with the
existing definition of the Shuttle SN68PT.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

Changes in this patch set:

* Define the DMI matching table for board specific settings during the
  chip initialisation and move the only current board specific setting
  to this new table.

* Export the table for use by udev.

v2: updates following comments:

* Converted to use callback function.

* Moved call to callback funtion to sio_data into it87_find in line
  with other settings for sio_data.  This requires dmi_data also passed
  to access additional data.

* Added macro for defining entries in DMI table to simplify future 
  additions.

* Note dmi_data is defined in sm_it87_init to simplify tests and for
  future additions.

v3: further updates following comments:

* Proper use of callback functions for DMI functions.  This also
  involves saving dmi_data in a static variable for use as required.

* Moved to dmi_check_system() for testing DMI table.

v4: further cleanups following comments

* Note the macro IT87_DMI_MATCH_VND includes callback argument for use
  by a future update.

v5: corrected patch submission format.

 drivers/hwmon/it87.c | 72 ++++++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 73ed21ab325b..9997f76b1f4a 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -567,6 +567,14 @@ struct it87_data {
 	s8 auto_temp[NUM_AUTO_PWM][5];	/* [nr][0] is point1_temp_hyst */
 };
 
+/* Board specific settings from DMI matching */
+struct it87_dmi_data {
+	u8 skip_pwm;		/* pwm channels to skip for this board  */
+};
+
+/* Global for results from DMI matching, if needed */
+static struct it87_dmi_data *dmi_data;
+
 static int adc_lsb(const struct it87_data *data, int nr)
 {
 	int lsb;
@@ -2393,7 +2401,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 {
 	int err;
 	u16 chip_type;
-	const char *board_vendor, *board_name;
 	const struct it87_devices *config;
 
 	err = superio_enter(sioaddr);
@@ -2812,24 +2819,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	if (sio_data->beep_pin)
 		pr_info("Beeping is supported\n");
 
-	/* Disable specific features based on DMI strings */
-	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
-	board_name = dmi_get_system_info(DMI_BOARD_NAME);
-	if (board_vendor && board_name) {
-		if (strcmp(board_vendor, "nVIDIA") == 0 &&
-		    strcmp(board_name, "FN68PT") == 0) {
-			/*
-			 * On the Shuttle SN68PT, FAN_CTL2 is apparently not
-			 * connected to a fan, but to something else. One user
-			 * has reported instant system power-off when changing
-			 * the PWM2 duty cycle, so we disable it.
-			 * I use the board name string as the trigger in case
-			 * the same board is ever used in other systems.
-			 */
-			pr_info("Disabling pwm2 due to hardware constraints\n");
-			sio_data->skip_pwm = BIT(1);
-		}
-	}
+	/* Set values based on DMI matches */
+	if (dmi_data)
+		sio_data->skip_pwm |= dmi_data->skip_pwm;
 
 exit:
 	superio_exit(sioaddr);
@@ -3307,6 +3299,46 @@ static int __init it87_device_add(int index, unsigned short address,
 	return err;
 }
 
+/* callback function for DMI */
+static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
+{
+	dmi_data = dmi_entry->driver_data;
+
+	if (dmi_data && dmi_data->skip_pwm)
+		pr_info("Disabling pwm2 due to hardware constraints\n");
+
+	return 1;
+}
+
+/*
+ * On the Shuttle SN68PT, FAN_CTL2 is apparently not
+ * connected to a fan, but to something else. One user
+ * has reported instant system power-off when changing
+ * the PWM2 duty cycle, so we disable it.
+ * I use the board name string as the trigger in case
+ * the same board is ever used in other systems.
+ */
+static struct it87_dmi_data nvidia_fn68pt = {
+	.skip_pwm = BIT(1),
+};
+
+#define IT87_DMI_MATCH_VND(vendor, name, cb, data) \
+	{ \
+		.callback = cb, \
+		.matches = { \
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor), \
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, name), \
+		}, \
+		.driver_data = data, \
+	}
+
+static const struct dmi_system_id it87_dmi_table[] __initconst = {
+	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
+	{ }
+
+};
+MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
+
 static int __init sm_it87_init(void)
 {
 	int sioaddr[2] = { REG_2E, REG_4E };
@@ -3319,6 +3351,8 @@ static int __init sm_it87_init(void)
 	if (err)
 		return err;
 
+	dmi_check_system(it87_dmi_table);
+
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
 		isa_address[i] = 0;
-- 
2.38.1

