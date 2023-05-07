Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6473AC77B7D
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 May 2023 10:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjEGKlc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 May 2023 06:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjEGKla (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 May 2023 06:41:30 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3F99B12E88
        for <linux-hwmon@vger.kernel.org>; Sun,  7 May 2023 03:41:28 -0700 (PDT)
IronPort-SDR: 64578055_9YX/6XJsv10XgGXqFEcMrl35UwvNZLI5OmGDXpQDpgL+7w1
 qNppgnHSY2ezS1/CN0J8DglhaW67FkUae5cHPdQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AYAgBgf1dkjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?UaCLoJPtWcPAQ8BAUQEAQGFBgKFRiY4EwECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBgQUAQEBAUBFhWgNhgUCAQMnCwENAQE3AQ8ZOFcGARKCfoJdrBEzg?=
 =?us-ascii?q?QGCCAEBBoJkmmqBXgmBQYwOgRaDN3pCP4FOglGCLYsGj32JG4EwdIEnP22BB?=
 =?us-ascii?q?AIJAhFpgRAIaIF0QAINZAsLbIFAgUCBSwQCEUIMFF0CaxoIEgETAwcHAgGBG?=
 =?us-ascii?q?BA6BwQ+MgcJH2gDCQMHBUlAAwsYDRY3ESw1FB8tIIEJGGMEggUGASUkmwmBD?=
 =?us-ascii?q?oJpxCCECYFanxdNgUaoAy6XVCCjNIQtAgoHFoF6gX5NHxmDIk8DGQ+OIBmCE?=
 =?us-ascii?q?5FRYz0CBwsBAQMJi0UBAQ?=
IronPort-PHdr: A9a23:oJH4th0ScuS5hX3QsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23: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
 cpU70iY0sJdGX21bb17CiSHvNpa
IronPort-HdrOrdr: A9a23:P08ppqtDgMWfPzm6yMwMJLEZ7skDrNV00zEX/kB9WHVpm6yj/f
 xGUs576faSskdpZJlD8ersBEDkex/hHPFOkOos1NuZMzUO/VHYSL2KjrGSpQEIZReOlNK1vJ
 0IG8ND4Z/LfD9HZK3BgDVQfexP/DEJnZrY/ds2t00dKD2Cc5sQkzuRFDzrb3GemzM2fqbQxf
 Knl7B6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3Afhu/32rW4qcrETFArVjASYzmUZ4GcVPXyWjeGR+?=
 =?us-ascii?q?1FWdNUoXKEXPM94oxxg=3D=3D?=
X-Talos-MUID: 9a23:8ZHy2wTtl8s+7uLZRXTc1A5pJs026Z6PI1tUjpQ8+PjZZCJJbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 07 May 2023 20:11:26 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 347Af9h43600390
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 7 May 2023 20:41:22 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 347Af9h43600390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1683456082; bh=KlpgLjBgGCeblGfGf/Vl6optTbJVCLXWwrHhA1WO7cA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H0F13GJzm5a02MZFrfND+pVggeqrnNBxl31ifdfzT98ySXbmtFlM4iZKSXLybgJP4
         kMJ3eONzpUMsFq50J4JeQVsWSFDYn6ia45TIt4mgs8SAuAaG0soJcf/c/eFgv2+vM+
         vreG+EhF15L/rPe6qxIlkf1wcPT5vulWAAWy/7USs7T/JqgW2LbloOU5sSCy8zis5E
         siX/U5Nv2RGPE9/DzXuTLw3L2NJzRz1MiHRy8VoTg9iJupK/2J14/wMAKBz6lcT01e
         thVMjFsBlN0DPUXT7cp6TyQTvIceU0uJtavYafROKahAGKoyN4QpexN+2MkwBpmAd7
         jvw4QBd/bioVw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/2] hwmon: (it87) Generalise support for FAN_CTL ON/OFF
Date:   Sun,  7 May 2023 20:41:05 +1000
Message-Id: <20230507104106.1808726-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230507104106.1808726-1-frank@crawford.emu.id.au>
References: <20230507104106.1808726-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 07 May 2023 20:41:22 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add feature flag FEAT_FANCTL_ONOFF for chips that support configuration
bits for management of fan control off.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4c3641d28a6a..6fa9e928177e 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -320,6 +320,7 @@ struct it87_devices {
 #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
+#define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -534,6 +535,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
+#define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -1240,11 +1242,12 @@ static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
 
 static int pwm_mode(const struct it87_data *data, int nr)
 {
-	if (data->type != it8603 && nr < 3 && !(data->fan_main_ctrl & BIT(nr)))
-		return 0;				/* Full speed */
+	if (has_fanctl_onoff(data) && nr < 3 &&
+	    !(data->fan_main_ctrl & BIT(nr)))
+		return 0;			/* Full speed */
 	if (data->pwm_ctrl[nr] & 0x80)
-		return 2;				/* Automatic mode */
-	if ((data->type == it8603 || nr >= 3) &&
+		return 2;			/* Automatic mode */
+	if ((!has_fanctl_onoff(data) || nr >= 3) &&
 	    data->pwm_duty[nr] == pwm_to_reg(data, 0xff))
 		return 0;			/* Full speed */
 
@@ -1481,7 +1484,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 		return err;
 
 	if (val == 0) {
-		if (nr < 3 && data->type != it8603) {
+		if (nr < 3 && has_fanctl_onoff(data)) {
 			int tmp;
 			/* make sure the fan is on when in on/off mode */
 			tmp = it87_read_value(data, IT87_REG_FAN_CTL);
@@ -1521,7 +1524,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 		data->pwm_ctrl[nr] = ctrl;
 		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
 
-		if (data->type != it8603 && nr < 3) {
+		if (has_fanctl_onoff(data) && nr < 3) {
 			/* set SmartGuardian mode */
 			data->fan_main_ctrl |= BIT(nr);
 			it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
-- 
2.40.0

