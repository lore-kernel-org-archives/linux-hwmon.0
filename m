Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B639FC38A02
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Oct 2022 08:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJ3IjP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Oct 2022 04:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiJ3IjO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Oct 2022 04:39:14 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 278AA6262
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Oct 2022 01:39:00 -0700 (PDT)
IronPort-SDR: S6hE/xi6pBNjQpnOupE2iGZHwb7AIjYFUCW2dzkknmDJCNniByFRGbw1VV0WPoYMVG0HFAj7qa
 3V84WGuzW9gPkNEX99vRYJSvgwuFAheGEpfj9HclXOrkig0iyxefQuGaRNRefULLFmceAu6Xl2
 2typS5WY5zeBAI9Bt6CFhJLS0vJHRbomXt+435udEZoLWnH3D5ETlvN7OEkJ3RisD7w+4i6cUq
 7YTmwYcKF7GDszSH6TfeUNgOgob6DedcWcyiAr5NCKJ3qsZRgTuAkNX1QKwMVGez/CssbGq/eZ
 eDpghRqkasvor0aUBQA9Ytri
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2DJCQCRNl5jjPQc8jxaHgEBCxIMSYE7C4ItglmVaJ8hD?=
 =?us-ascii?q?wEPAQFEBAEBhQWEfCY3Bg4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEF?=
 =?us-ascii?q?AEBAQE/GAE5BwtSBwtYBweBQQuBYRMLAzENhkUrCwENAQE3ASiBFQESgn2DI?=
 =?us-ascii?q?a1KM4EBgggBAQaCYIMugV0JgT0BizeBEYM2gT0/gU6BFYJ6boQmhluWZwMJA?=
 =?us-ascii?q?wcFSUADCxgNFjIDChM6G1gOCR8cJQ0FBhIDIG4FBzoPKC9nKxwbB4EMKigVA?=
 =?us-ascii?q?wQEAwIGEwMgAg0pMRQEKRMNKwcjcQkCAyJqAwMEKCwDCUAHJyY8B1g6BQMCE?=
 =?us-ascii?q?CI8BgMJAwIiWHUwEhQFAw0XJQgFTwQIOgIFBlISAgoRAxIPLEcOSj45FgYnR?=
 =?us-ascii?q?AE0Dw4WA2JRHploAWsHPRw1gjABQ5JbOo4LoSyDcIFMnmhMgUSnT5crIKFsg?=
 =?us-ascii?q?RiEKAIKBxaBeIF/TR8ZgyJPAQIBAQENAQIBAQMBAgEBAQkBAQEBjh0MDQmCC?=
 =?us-ascii?q?ow4YTsCBwsBAQMJij4BAQ?=
IronPort-PHdr: A9a23:kNg4zxNgXJZ7AFH91jkl6nczWUAX0o4cdiYf64Y8zblUe7ut+I7ue
 kHa+LNsgBnAQNaT4uhP3uzRta2oQmkc+dCbvXUFbJEJVgdQh8kaxV5/CceJW0Gnc664Nn5oF
 84bDA1u9CnkWXU=
IronPort-Data: A9a23:UliZ0at3m0DbObSLEpxd/q01PefnVJVYMUV32f8akzHdYApBsoF/q
 tZmKTuEbv2CZmHxKNxzb47ioxkOsJbSy9AxQAc/pX0zESoa9MSYCY+SJxyuZH3MIsSdRh5ts
 8tEMoCYdZ49HnLX/02EP+m6pxGQ94nRFuKmUrKs1gOd5ONAYH184f62s7dh2uaEufDgX0XV/
 4maT/T3YDdJ4RYtWo4pw/vrRC1H7KyaVAww5jTSVdgT1LMJvyR94Do3fMldHlOgKmVmNrfSq
 9XrkNlVyljkEyIFUbtJpFpannoiGdY+NSDW4pZftjPLbhJq/kTe2Y5jXBYQhNs+Zzihx7hMJ
 NtxWZOYSgYlI5XAtvQkc1pzISpQELYb/LzjLi3q2SCT5xWun3rEyfRyFwc9J4QH9OFtDSdD8
 OFeKTxLZw3ra+Cenur9ELU2wJ5zapO3YOvzuVk5pd3dJfg8SJbAa67Q7MBW2y08wM1LALDfa
 4wQdFKDaTycOEAfZQZJV8NWcOGAnHj8ciMC+Q6s5qM54XjK/B5+9rjPP4+AEjCNbZ4NxRbC/
 DOuE37CKhUbMsGPjDqa93WqrvHAkDm9W48IErC8sPlwjzW7wm0VFQ0+T1y2qvr8l1X4Xd9DQ
 2QW9icqs6Eo+WSwU8LwGRa/pRa5UgU0BYIVSbFgrVvdj/CIv0CCGmEYTzUHdMQptYk9Qjls3
 0Lhc87V6SJHs7yZVEqR2KetjXCZCyM7AHRfYSwgQl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wxmSgBg2t3/auZVic2GEUD7byGE48OSHlFsum07Skr8s1ojPNb7D2C9wQKDhcusOrp1WXGog
 RDoceCl/ewIAIDleMelGr1VRNlFC96jPSKUullyA5lpyD2p9mXLQGy9yG8mYR01aINeKXqzP
 BOVoh9Y+J5YemeyYq4xaIW0Tc03pUQBKTgHfqyMBjatSsIqHONiwM2ITRTKt4wKuBF9+ZzTw
 b/BLa6R4YwmIapm1iGqYOwWzKUmwCszrUuKG86kl0r3i+HFOC7OIVvgDLdoRr5nhE9jiFuLm
 +uzy+PQkX2zrcWkPHiIqtRDRbz0BSZgXsymwyCoSgJzClE+QzF7Ua65LUIJZ5Rq16VTiurS+
 HyhMnK0O3Kh7UAr3T6iMyg5AJuxB8kXkJ7OFXB0VX6yxWMZaJqihI9GMcNfkU8PqLU9kZaZj
 pAtJ629Pxi4Ym+Zq2hFM8et/NUKmdbCrVvmAhdJqQMXJ/ZILzElMPe9Fuc23CVRXCexq+Ukp
 LisilHSTZYZHlQwB9zfd/yo1V/3sH0A3uN+GULVe4EBdELp+YlsCirwkv5ufZ9QdE+cn2DF2
 lbEGwocqMnMv5QxrovDi5eEmIH1QeFwKVULTWDU4IG/OTTe4mf+k5RLV/yFfG6BWW6toPeia
 OxZwuvSKvoCmFoW4YNwH6wynfA1/dLwqbhAwkJpGWiNbljtA645eiuK2sxGt6tswL5FuFLoB
 B7SoIYDYuqEYZq3HkQQKQwpavW4+csVwjSCv+4oJEja5TNs+OTVW0tlPy6K1H5XIoxqYdEsz
 uoWscIL7xCy10gxOdGcgyEKq2mBIyBSU6gjsZ1GUobnhhBxkQNIYIDHTCTs6Y6BbM9AdEQvP
 3mViOzLmu0ElEbFdnMyE1nL3PZc3MpQ5E0QkwZZeFnZyMDYgvIX3QFK9WplRApiziJBj7B5N
 F90Zh98Kqi59jt1gNROAjK3EAZbCRzHpkH8lwkTmGvCQxX6X2DBNjZna7jVuRpFqScGLn0Bo
 O3e03rsTTfhOt3p0Sp0Uklg7fX+FIQj+grHkcGhPsKEA5hjP2S53/XxPDFXpku1G941iW3Gu
 fJuoLR6Z5r9ZHwZrKAMAoWH0agdFUKfL2tYTPA/oK4EEAkwot1pNeRi9qxpRv5wGg==
IronPort-HdrOrdr: A9a23:0CjBgq7AwSU5vgLSeAPXwObXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rsiMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1NSZLW3bURWTXeNfBOLZqlWKJ8SUzI5gPM
 lbHZSXh7DLfD5HZL7BkWyF+s4bsaO6Gb6T9JzjJqhWPHhXg3AJ1XYANjqm
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 30 Oct 2022 19:08:57 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29U8chih2230542
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 30 Oct 2022 19:38:49 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29U8chih2230542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667119130; bh=hO4mqcvrvaXr7I8jZOUrg+XuyFN0yy3meyK21aESv2Q=;
        h=From:To:Cc:Subject:Date:From;
        b=Poel503DZ2LDPe91Q5+CUqTtPIPa95enGHmq2874AxpKBjE0sJ/N1No+h0DT8xkPx
         jt3DswI/GFdhEA7blgMIcyOOpenQSLIalPgvqqS9WE1nlhtIvFB9bMu3o0jgO6A9q/
         HnjJlM4oCb24KMAS/8mxLrelRgFi86Hw8WWll4cU0xZ1vU2dNj+0fuemxt1R/nkocC
         y3kcHFLa20pbbMeZNxNx5G3hwqRCdKTnjhBA/tSaHBl8Pe9LDGaeQHuYjZxUFB8ruY
         XCRQoao6hA6UHKyWKF18F4N6rNlLPrGHrcXbAVTS4A8LSBKJQUMz7kndWnwpo5RKjw
         uf24u8E9nqTYA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 1/1] hwmon: (it87) Add DMI table for future extensions
Date:   Sun, 30 Oct 2022 19:38:41 +1100
Message-Id: <20221030083841.3433967-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 30 Oct 2022 19:38:50 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

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

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 72 ++++++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 73ed21ab325b..6eac15a5f647 100644
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
+static struct it87_dmi_data *dmi_data = NULL;
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
+	if (dmi_data && dmi_data->skip_pwm)
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
+	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", &it87_dmi_cb, &nvidia_fn68pt),
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
2.37.3

