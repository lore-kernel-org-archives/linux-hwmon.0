Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DDEC4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Oct 2022 12:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJOMHm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Oct 2022 08:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiJOMHl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Oct 2022 08:07:41 -0400
Received: from ipmail04.adl3.internode.on.net (ipmail04.adl3.internode.on.net [150.101.137.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3E5B04D4C7
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 05:07:40 -0700 (PDT)
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail04.adl3.internode.on.net with ESMTP; 15 Oct 2022 22:32:10 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29FC1eWG2725736
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 15 Oct 2022 23:02:06 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29FC1eWG2725736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1665835326; bh=Y899AK3WffUQRJEjMuhjuJSFTaKPZgwS5R2MI4zCWg8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eb/OnKRhZpxBM05WRjnVijX1LSIjvCQU+vpz4Tlmh/+R5H7CTjRD2t6Qho1R7PHVE
         MFP2ozRf5SPY8wyXMCv/92yBzBOgtifoPMpE0SraGLAOTSDznCKO6QVEzOHXwVZ3qh
         7q+GtR2QqOOr6hsdFvZoruu3CIrySPpzdTwU2Sig/scpfOqG9KSrFmTw2qV9UNdLuU
         SPUERrv6Qq4WqRNNq0XUcHFnVo+Myf/sMdzPyoA4ofnWNi8V2e0n8SX0ZVT8mY7rck
         Ve5yw0ptcMMcC/zlJnYqe4KoKXa+JgV82pSCrVN2dayFQgeKK6y2vl7O7Xse9l4GKV
         +Fk75aQeQ+OrA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH 1/1] hwmon: (it86) Create DMI matching table for various board settings
Date:   Sat, 15 Oct 2022 23:01:10 +1100
Message-Id: <20221015120110.1472074-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221015120110.1472074-1-frank@crawford.emu.id.au>
References: <20221015120110.1472074-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 15 Oct 2022 23:02:06 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Define the DMI matching table for board specific settings during the
chip initialisation and move the only current board specific setting
to this new table.

Export the table for use by udev.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 57 ++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 7bd154ba351b..b83ef7c89095 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2389,7 +2389,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 {
 	int err;
 	u16 chip_type;
-	const char *board_vendor, *board_name;
 	const struct it87_devices *config;
 
 	err = superio_enter(sioaddr);
@@ -2802,25 +2801,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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
-
 exit:
 	superio_exit(sioaddr);
 	return err;
@@ -3295,14 +3275,48 @@ static int __init it87_device_add(int index, unsigned short address,
 	return err;
 }
 
+struct it87_dmi_data {
+	u8 skip_pwm;		/* pwm channels to skip for this board  */
+};
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
+static const struct dmi_system_id it87_dmi_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "nVIDIA"),
+			DMI_MATCH(DMI_BOARD_NAME, "FN68PT"),
+		},
+		.driver_data = &nvidia_fn68pt,
+	},
+	{ }
+
+};
+MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
+
 static int __init sm_it87_init(void)
 {
+	const struct dmi_system_id *dmi = dmi_first_match(it87_dmi_table);
+	struct it87_dmi_data *dmi_data = NULL;
 	int sioaddr[2] = { REG_2E, REG_4E };
 	struct it87_sio_data sio_data;
 	unsigned short isa_address[2];
 	bool found = false;
 	int i, err;
 
+	if (dmi)
+		dmi_data = dmi->driver_data;
+
 	err = platform_driver_register(&it87_driver);
 	if (err)
 		return err;
@@ -3320,6 +3334,9 @@ static int __init sm_it87_init(void)
 		if (i && isa_address[i] == isa_address[0])
 			break;
 
+		if (dmi_data)
+			sio_data.skip_pwm |= dmi_data->skip_pwm;
+
 		err = it87_device_add(i, isa_address[i], &sio_data);
 		if (err)
 			goto exit_dev_unregister;
-- 
2.37.3

