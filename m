Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D0BC4167B
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Dec 2022 13:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiL1N5v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:57:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiL1N5u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Dec 2022 08:57:50 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDCCBC9B
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Dec 2022 05:57:49 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id l8-20020a056830054800b006705fd35eceso9881374otb.12
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Dec 2022 05:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aZoVoXiQBc68tqQe6+rkxUgeuJw9SK3gDNLTv2csP4o=;
        b=K+05YitJ9vtO6GosdwNwYCZF+3LHJe+zwkIprDGJFd+o//S1rX+f9NDTYavVWfXk0+
         C2EyG607iBhBSV/FLWX8xpAha/zfoW9zMjVsPMCFaga5kAiq/hZurCGtiIVw7brHMCiP
         YDICCSbOkHVtvEJC50N++7sUSpOdLnN7agJZXhbTn+JZhBR/5jffaphfyC0EdL1E8oON
         fv8fVqQoExj0XhTiXRHs8oSI8LZ291ZUUdJOmz6a//iYO33p3g68zvFZfzOXd19k3nho
         R1RPsOkhGsoAUZZE7fkyTxEKz+ppx6PFRsPOHsBV5Io8X+3oG3aEOubRHAsSdNpiZfN8
         R5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZoVoXiQBc68tqQe6+rkxUgeuJw9SK3gDNLTv2csP4o=;
        b=7FxKuklSdX0mSxtnluZWMTHkTSh0BTWly64d2JsZTOelL0Ut3BllZ8kRsp9AfLtrpM
         IVTERdoAVXl4m7LemaOllSPh6OU+oTFgm+PyLD5J5estLdSzHMyQtK1e9slWe46VWY0F
         Rb3vpEkoclmAR6Wuew+y5NXGLbk8Sk06UOJq0yY8kAsHYNMCgFKeWH7pHmYxKWUUMt+P
         yCKkQH9D2f+5JLoKcKxAUw2MX21Fsi920Jwx5+HY7wMJN445NtXyGveyxiVpk7xnsIHA
         Ass63zO/Q5moA8HKVLdoYGCWtQu4wo0LjmUcuKkcI0tP75NTrBFdUTD8k6ILvfg9WyZV
         1NAQ==
X-Gm-Message-State: AFqh2kq37A1+c4fan12W0zW1WVBffW3Det/bHcVicQs4kzaLEuk5bdbP
        hW+Th88G8xBHkYsP2QFNVB3jqx3QCsY=
X-Google-Smtp-Source: AMrXdXuZSm0/nXZHnJH0EzHZCibsYkPPIK26fCbyXh6rym5lf71kHIed7RVNhVKiULlY45pwt1dsFg==
X-Received: by 2002:a05:6830:2a86:b0:670:9d63:6dcc with SMTP id s6-20020a0568302a8600b006709d636dccmr14568170otu.2.1672235868241;
        Wed, 28 Dec 2022 05:57:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a16-20020a0568300b9000b00670763270fcsm7809990otv.71.2022.12.28.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:57:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sebastian Arnhold <sebastian.arnhold@posteo.de>,
        Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Date:   Wed, 28 Dec 2022 05:57:44 -0800
Message-Id: <20221228135744.281752-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

NCT6799D is mostly compatible to NCT6798D, with minor variations.

Note that NCT6798D and NCT6799D have a new means to select temperature
sources, and to report temperatures from those sources. This is not
currently implemented, meaning that most likely not all temperatures
are reported.

Initial support. Compile tested only.

Cc: Sebastian Arnhold <sebastian.arnhold@posteo.de>
Cc: Ahmad Khalifa <ahmad@khalifa.ws>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c     | 55 ++++++++++++++++++++++++++++++--
 drivers/hwmon/nct6775-i2c.c      |  2 ++
 drivers/hwmon/nct6775-platform.c | 41 ++++++++++++++++++++++--
 drivers/hwmon/nct6775.h          |  2 +-
 4 files changed, 94 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index da9ec6983e13..d415ae8f3b4b 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -33,6 +33,7 @@
  *                                           (0xd451)
  * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
  *                                           (0xd429)
+ * nct6799d    14      7       7       2+6    0xd802 0xc1    0x5ca3
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -73,6 +74,7 @@ static const char * const nct6775_device_names[] = {
 	"nct6796",
 	"nct6797",
 	"nct6798",
+	"nct6799",
 };
 
 /* Common and NCT6775 specific data */
@@ -381,7 +383,7 @@ static const u16 NCT6779_REG_TEMP_OVER[ARRAY_SIZE(NCT6779_REG_TEMP)] = {
 	0x39, 0x155 };
 
 static const u16 NCT6779_REG_TEMP_OFFSET[] = {
-	0x454, 0x455, 0x456, 0x44a, 0x44b, 0x44c };
+	0x454, 0x455, 0x456, 0x44a, 0x44b, 0x44c, 0x44d, 0x449 };
 
 static const char *const nct6779_temp_label[] = {
 	"",
@@ -654,6 +656,44 @@ static const char *const nct6798_temp_label[] = {
 #define NCT6798_TEMP_MASK	0xbfff0ffe
 #define NCT6798_VIRT_TEMP_MASK	0x80000c00
 
+static const char *const nct6799_temp_label[] = {
+	"",
+	"SYSTIN",
+	"CPUTIN",
+	"AUXTIN0",
+	"AUXTIN1",
+	"AUXTIN2",
+	"AUXTIN3",
+	"AUXTIN4",
+	"SMBUSMASTER 0",
+	"SMBUSMASTER 1",
+	"Virtual_TEMP",
+	"Virtual_TEMP",
+	"",
+	"AUXTIN5",
+	"",
+	"",
+	"PECI Agent 0",
+	"PECI Agent 1",
+	"PCH_CHIP_CPU_MAX_TEMP",
+	"PCH_CHIP_TEMP",
+	"PCH_CPU_TEMP",
+	"PCH_MCH_TEMP",
+	"Agent0 Dimm0",
+	"Agent0 Dimm1",
+	"Agent1 Dimm0",
+	"Agent1 Dimm1",
+	"BYTE_TEMP0",
+	"BYTE_TEMP1",
+	"PECI Agent 0 Calibration",	/* undocumented */
+	"PECI Agent 1 Calibration",	/* undocumented */
+	"",
+	"Virtual_TEMP"
+};
+
+#define NCT6799_TEMP_MASK	0xbfff2ffe
+#define NCT6799_VIRT_TEMP_MASK	0x80000c00
+
 /* NCT6102D/NCT6106D specific data */
 
 #define NCT6106_REG_VBAT	0x318
@@ -1109,6 +1149,7 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6796:
 	case nct6797:
 	case nct6798:
+	case nct6799:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
 		  (reg & 0xfff0) == 0x4c0 ||
 		  reg == 0x402 ||
@@ -1462,6 +1503,7 @@ static int nct6775_update_pwm_limits(struct device *dev)
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			err = nct6775_read_value(data, data->REG_CRITICAL_PWM_ENABLE[i], &reg);
 			if (err)
 				return err;
@@ -3109,6 +3151,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			err = nct6775_write_value(data, data->REG_CRITICAL_PWM[nr], val);
 			if (err)
 				break;
@@ -3807,10 +3850,12 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 	case nct6796:
 	case nct6797:
 	case nct6798:
+	case nct6799:
 		data->in_num = 15;
 		data->pwm_num = (data->kind == nct6796 ||
 				 data->kind == nct6797 ||
-				 data->kind == nct6798) ? 7 : 6;
+				 data->kind == nct6798 ||
+				 data->kind == nct6799) ? 7 : 6;
 		data->auto_pwm_num = 4;
 		data->has_fan_div = false;
 		data->temp_fixed_num = 6;
@@ -3859,6 +3904,11 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 			data->temp_mask = NCT6798_TEMP_MASK;
 			data->virt_temp_mask = NCT6798_VIRT_TEMP_MASK;
 			break;
+		case nct6799:
+			data->temp_label = nct6799_temp_label;
+			data->temp_mask = NCT6799_TEMP_MASK;
+			data->virt_temp_mask = NCT6799_VIRT_TEMP_MASK;
+			break;
 		}
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
@@ -3918,6 +3968,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
 			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
 			break;
diff --git a/drivers/hwmon/nct6775-i2c.c b/drivers/hwmon/nct6775-i2c.c
index e1bcd1146191..779ce65db1a1 100644
--- a/drivers/hwmon/nct6775-i2c.c
+++ b/drivers/hwmon/nct6775-i2c.c
@@ -87,6 +87,7 @@ static const struct of_device_id __maybe_unused nct6775_i2c_of_match[] = {
 	{ .compatible = "nuvoton,nct6796", .data = (void *)nct6796, },
 	{ .compatible = "nuvoton,nct6797", .data = (void *)nct6797, },
 	{ .compatible = "nuvoton,nct6798", .data = (void *)nct6798, },
+	{ .compatible = "nuvoton,nct6799", .data = (void *)nct6799, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, nct6775_i2c_of_match);
@@ -104,6 +105,7 @@ static const struct i2c_device_id nct6775_i2c_id[] = {
 	{ "nct6796", nct6796 },
 	{ "nct6797", nct6797 },
 	{ "nct6798", nct6798 },
+	{ "nct6799", nct6799 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nct6775_i2c_id);
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index bf43f73dc835..906394b26781 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -36,6 +36,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6796D",
 	"NCT6797D",
 	"NCT6798D",
+	"NCT6799D",
 };
 
 static unsigned short force_id;
@@ -86,6 +87,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6796_ID		0xd420
 #define SIO_NCT6797_ID		0xd450
 #define SIO_NCT6798_ID		0xd428
+#define SIO_NCT6799_ID		0xd800
 #define SIO_ID_MASK		0xFFF8
 
 /*
@@ -408,7 +410,7 @@ static int nct6775_resume(struct device *dev)
 	if (data->kind == nct6791 || data->kind == nct6792 ||
 	    data->kind == nct6793 || data->kind == nct6795 ||
 	    data->kind == nct6796 || data->kind == nct6797 ||
-	    data->kind == nct6798)
+	    data->kind == nct6798 || data->kind == nct6799)
 		nct6791_enable_io_mapping(sio_data);
 
 	sio_data->sio_exit(sio_data);
@@ -555,7 +557,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 	} else {
 		/*
 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
-		 * NCT6797D, NCT6798D
+		 * NCT6797D, NCT6798D, NCT6799D
 		 */
 		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
 		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
@@ -565,12 +567,17 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
 		int cr2d = sio_data->sio_inb(sio_data, 0x2d);
 		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
+		bool vsb_ctl_en = cr2f & BIT(0);
 		bool dsw_en = cr2f & BIT(3);
 		bool ddr4_en = cr2f & BIT(4);
+		bool as_seq1_en = cr2f & BIT(7);
 		int cre0;
+		int cre6;
 		int creb;
 		int cred;
 
+			cre6 = sio_data->sio_inb(sio_data, 0xe0);
+
 		sio_data->sio_select(sio_data, NCT6775_LD_12);
 		cre0 = sio_data->sio_inb(sio_data, 0xe0);
 		creb = sio_data->sio_inb(sio_data, 0xeb);
@@ -673,6 +680,29 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
 			pwm7pin |= cr2d & BIT(7);
 			pwm7pin |= creb & BIT(2);
+			break;
+		case nct6799:
+			fan4pin = cr1c & BIT(6);
+			fan5pin = cr1c & BIT(7);
+
+			fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
+			fan6pin |= cre6 & BIT(5);
+			fan6pin |= creb & BIT(5);
+			fan6pin |= !as_seq1_en && (cr2a & BIT(4));
+
+			fan7pin = cr1b & BIT(5);
+			fan7pin |= !vsb_ctl_en && !(cr2b & BIT(2));
+			fan7pin |= creb & BIT(3);
+
+			pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
+			pwm6pin |= !as_seq1_en && !(cred & BIT(2)) && (cr2a & BIT(3));
+			pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+			pwm6pin |= cre6 & BIT(3);
+
+			pwm7pin = !vsb_ctl_en && !(cr1d & (BIT(2) | BIT(3)));
+			pwm7pin |= creb & BIT(2);
+			pwm7pin |= cr2d & BIT(7);
+
 			break;
 		default:	/* NCT6779D */
 			break;
@@ -828,6 +858,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 	case nct6796:
 	case nct6797:
 	case nct6798:
+	case nct6799:
 		break;
 	}
 
@@ -866,6 +897,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			tmp |= 0x7e;
 			break;
 		}
@@ -995,6 +1027,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	case SIO_NCT6798_ID:
 		sio_data->kind = nct6798;
 		break;
+	case SIO_NCT6799_ID:
+		sio_data->kind = nct6799;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
@@ -1023,7 +1058,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
 	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
 	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
-	    sio_data->kind == nct6798)
+	    sio_data->kind == nct6798 || sio_data->kind == nct6799)
 		nct6791_enable_io_mapping(sio_data);
 
 	sio_data->sio_exit(sio_data);
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index be41848c3cd2..44f79c5726a9 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -5,7 +5,7 @@
 #include <linux/types.h>
 
 enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
-	     nct6793, nct6795, nct6796, nct6797, nct6798 };
+	     nct6793, nct6795, nct6796, nct6797, nct6798, nct6799 };
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
 #define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
-- 
2.36.2

