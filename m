Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2E1C77B73
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 04:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjDPEZl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 00:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDPEZj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 00:25:39 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EE2C2738
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Apr 2023 21:25:38 -0700 (PDT)
IronPort-SDR: 643b78b9_xGcjUe+ijjAolYOlUiOEJHtZSFneNSEBGXyZV3gPMXczuLZ
 VokQ0zOt/qpIawAo1g3vnXj8FvY4vKCpGu5rPnQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2C6AACkdztkjPQc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YItgk+WAp9dDwEPAQFEBAEBhQYChTwmNwYOAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQEWFaA2GBAIBAycLAQ0BATcBDxk4VwYBEoJ+gl2vB?=
 =?us-ascii?q?DOBAYIIAQEGgmKaaoFeCYFBAYt0gRaDNnpCP4FOgRWBPIE+b4sGmlaBNHEFg?=
 =?us-ascii?q?SAOSnKBBAIJAhFrgRAIaoF5QAINZAsOb4FJgU6BXAQCFEQOVAMJAwcFSUADC?=
 =?us-ascii?q?xgNFjoTLDUUIFxsLRISBQMLFSpHBAg4Bhs0EQIIDxIPLEQMQjczEwZcASkLD?=
 =?us-ascii?q?hEDTkIZbASCCgYBJiSeLnEBWQE0MIIHohOiHoQIgVmfFE2BRqd8l3cgohIta?=
 =?us-ascii?q?4QsAgoHFoF5gX9NHxmDIk8DGQ+OIAwNCRWBdZFRYz0CBwsBAQMJi0UBAQ?=
IronPort-PHdr: A9a23:bPvjURB5tjeBIsukjnoNUyQVWBdPi9zP1kY94Js7kPRFaK288ZP4M
 ArS4OgrjVOPVJiIo/tegL/QtKbtEXcF/Y7Hqn0Hd4BBEh4d3Msak1ZyX8eMBR/3cKG6PXVoT
 s9IDQc39HrjbiBo
IronPort-Data: A9a23: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
 z3FFqHYZXBdGq1UeNs=
IronPort-HdrOrdr: A9a23:BQ6dA6iTuUjiv/VpBbbjddj5X3BQXgAji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhIU3J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUS6TXeVfBOjZslvd8lPFh4xgPM
 5bGsAUNDSzNykcsS+Q2mmF+rgbruVuf82T9J/jJg9WPGRXgrlbnntE4xigYzBLrdZ9dOEE/E
 v13Ls8mwad
X-Talos-CUID: =?us-ascii?q?9a23=3ATeZDgml61++uAwQf06LWp2bilJXXOVP81H7RIxP?=
 =?us-ascii?q?mM2sqcaOzUnKT1P9didU7zg=3D=3D?=
X-Talos-MUID: 9a23:J3xdoQQ37T1rKcEVRXTHphxyEZ1ZzZ+TJ2kDk6UK4pa4OxdJbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 16 Apr 2023 13:55:30 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33G4PCj23415316
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 16 Apr 2023 14:25:25 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33G4PCj23415316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681619125; bh=6XICiCPdXs6FtG/wrztpNl5BiWU75gOuSnpQhcWafkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ei9V3gkrrBLAqBDQdxfoEew0kSM2QGQXVkMxFzezF7B8FWg+Iv1kP8t7xnZijMH9i
         qPiDzhcyad1r4ZZuWD3wnycxEM8IrnFBlfzhBhDVB9E98VxJK/Krpzc5bkE0WWu4sc
         8u/tqEM3l9x4wk/1/mgTu/rl0njTIC3kPggMAdIEZv96AxH5u2Qmg6vZvqiUxehEJY
         pqJahNydMgY5H4fNHGrfy0czwovHExsq3BSs8reRnEJMRnsUcavBZozH9/VjzaIVTv
         hBG70bQrCIaoxrsk0ed3I2I/AajZbuJW1JUXzzHXiaSIf1kvd88tejutDeyY3pqaIj
         SSpH8X1oX/vCg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/4] hwmon: (it87) Disable SMBus access for environmental controller registers.
Date:   Sun, 16 Apr 2023 14:25:07 +1000
Message-Id: <20230416042510.1929077-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230416042510.1929077-1-frank@crawford.emu.id.au>
References: <20230416042510.1929077-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 16 Apr 2023 14:25:25 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add functions to disable and re-enable access by the SMBus for specific
chips.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * No change.

---
 drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index f774a0732a7c..b74dd861f0fe 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -162,8 +162,11 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
 #define IT87952E_DEVID 0x8695
-#define IT87_ACT_REG  0x30
-#define IT87_BASE_REG 0x60
+
+/* Logical device 4 (Environmental Monitor) registers */
+#define IT87_ACT_REG	0x30
+#define IT87_BASE_REG	0x60
+#define IT87_SPECIAL_CFG_REG	0xf3	/* special configuration register */
 
 /* Logical device 7 registers (IT8712F and later) */
 #define IT87_SIO_GPIO1_REG	0x25
@@ -284,6 +287,8 @@ struct it87_devices {
 	u32 features;
 	u8 peci_mask;
 	u8 old_peci_mask;
+	u8 smbus_bitmap;	/* SMBus enable bits in extra config register */
+	u8 ec_special_config;
 };
 
 #define FEAT_12MV_ADC		BIT(0)
@@ -533,6 +538,8 @@ struct it87_sio_data {
 	u8 skip_fan;
 	u8 skip_pwm;
 	u8 skip_temp;
+	u8 smbus_bitmap;
+	u8 ec_special_config;
 };
 
 /*
@@ -547,6 +554,9 @@ struct it87_data {
 	u8 peci_mask;
 	u8 old_peci_mask;
 
+	u8 smbus_bitmap;	/* !=0 if SMBus needs to be disabled */
+	u8 ec_special_config;	/* EC special config register restore value */
+
 	unsigned short addr;
 	const char *name;
 	struct mutex update_lock;
@@ -701,6 +711,39 @@ static const unsigned int pwm_freq[8] = {
 	750000,
 };
 
+static int smbus_disable(struct it87_data *data)
+{
+	int err;
+
+	if (data->smbus_bitmap) {
+		err = superio_enter(data->sioaddr);
+		if (err)
+			return err;
+		superio_select(data->sioaddr, PME);
+		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
+			     data->ec_special_config & ~data->smbus_bitmap);
+		superio_exit(data->sioaddr, has_conf_noexit(data));
+	}
+	return 0;
+}
+
+static int smbus_enable(struct it87_data *data)
+{
+	int err;
+
+	if (data->smbus_bitmap) {
+		err = superio_enter(data->sioaddr);
+		if (err)
+			return err;
+
+		superio_select(data->sioaddr, PME);
+		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
+			     data->ec_special_config);
+		superio_exit(data->sioaddr, has_conf_noexit(data));
+	}
+	return 0;
+}
+
 /*
  * Must be called with data->update_lock held, except during initialization.
  * We ignore the IT87 BUSY flag at this moment - it could lead to deadlocks,
@@ -2859,6 +2902,15 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	if (dmi_data)
 		sio_data->skip_pwm |= dmi_data->skip_pwm;
 
+	if (config->smbus_bitmap) {
+		u8 reg;
+
+		superio_select(sioaddr, PME);
+		reg = superio_inb(sioaddr, IT87_SPECIAL_CFG_REG);
+		sio_data->ec_special_config = reg;
+		sio_data->smbus_bitmap = reg & config->smbus_bitmap;
+	}
+
 exit:
 	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
 	return err;
@@ -3094,6 +3146,8 @@ static int it87_probe(struct platform_device *pdev)
 	data->addr = res->start;
 	data->sioaddr = sio_data->sioaddr;
 	data->type = sio_data->type;
+	data->smbus_bitmap = sio_data->smbus_bitmap;
+	data->ec_special_config = sio_data->ec_special_config;
 	data->features = it87_devices[sio_data->type].features;
 	data->peci_mask = it87_devices[sio_data->type].peci_mask;
 	data->old_peci_mask = it87_devices[sio_data->type].old_peci_mask;
-- 
2.39.2

