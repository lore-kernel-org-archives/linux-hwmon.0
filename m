Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693094;
	b=jAgN1KSLulJe7kAd8dkV3X+fjILZX3lALBiVZvLQAoBo0qqZpBR56O+mj5Sc7FrR6+Ai
	 AcBf/OW5F9GXPp9pSIR5n7h2QC6NRe/WTQR0FidX5njwQFrplyPvLbbg/bdAAn4yoEoVE
	 Lhhm4cfcRO+WDg8XP6W+2uiESAMzOWMSUcF+yPe6sVVymGv5ggBDS7AbOCDw/iK58Ha4i
	 Kq+IHJ+T97FDfmqZA+5uhmTPcuW1gTUU1bRKq/cP/EmEtquptgwauGxtbm9T1Lea73lpU
	 KFuiVCCRMH+/NyIqi/cOcMkMrWPi2IgwZJzP4youpPhZPn2ulxNMcTZO01/387qAQ9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 Received:From:In-Reply-To:References:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PvzZaQo4TExZDGysK79p9G1Wm3IQxbPB+Hhiw9JblnA=;
	b=1ievNgzqFEp9MXMVLT3sjoMOXMnmcnRztwuyvzJH3iSbEVpmwkrFL47eSH6esOTPFwlt
	 6fDCnvyTGkxBSKLD2vZuIm0VassGxvCqxi1edCtJF1Ekm3tdt0VbXM4FHh9Vh679uBzUe
	 zE4WspJRXei3W9QNfXrWDdGJ+X/205EPDqhkqNdzHJ7HMKfbBH42uOp3fTkzr/7BSg2iw
	 WBuNvaWpWVuBkTcivCPfCK/+DOKqpS5P//fpIx9ikwP96yVyb/NPqHzP24EGApGF7aU7O
	 hC4EgZpIXnJaOi06IouBKV072vmQpkq219n3xP/RFGNHujXrCsVGq3kBg3fKsULdyeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1QcmWzM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26B606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 11:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B26B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1QcmWzM
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55d2b4a99d4so63712471cf.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 03:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693093; cv=none;
        d=google.com; s=arc-20260327;
        b=bPysWbEWFcx/GaSqhDc4+ZrEcWyQhZnmggEXSgfkKcsxQzj68oJEoLjv8xt9gba8dD
         bIzgtjtB7qy0tbKsrJ+oaNKBCqx8jUpZAvdyOh15EzE/2UwHs/mcPWTVO5ARjRLSaNoZ
         PXgmynGVrftMlwWrnWxci+UXRaOOqVEHrbBpjjCDBDLcsJhzdMdUs7yuLXjtst7b8P1v
         CYp1KsZKY+QaJEjPLqj/LucpWrRVMtxdaoIN+Tiv48LF9LjkffeuAx/ntEm9Y8abh/I0
         8IdOgiquNc6m3d1VPV+9JDm0UVx2Bp4QkaJxt78SYgAocpJ2RI0bb3mzA8Lo7YZyhWkW
         nFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=PvzZaQo4TExZDGysK79p9G1Wm3IQxbPB+Hhiw9JblnA=;
        fh=0C/NacxPb8rIaU32p77Pdl7otf8ET0q++Gp87p+c9qI=;
        b=akQ53F/I88At83a6vAwRURO+x2ooxb8UNI2+Is7OgrrKgthTdDf4qKgK8Ave8BBMXW
         2bk5iyRRZpH/bptDR1H28q/0cDHFYsX4gMvkwkH8j1FfQQJF/0rjCt3Ow2aomwgZTKHY
         JX2MNMGB/CrpxsUR+MfoKmjNc6oyJmH17PXzx4+uqf+H3RQtoYNKpaFjmYM8NvgWoB04
         iXe+YjN7msxSKyC6gn1ErCSMeJSJEoycZJKkS7pdcvFlFmMMaaCNEfiBKjW7NWPjMWCa
         g5IVbDXN4cFyESPvgRMSHMVsBHDrbsicki6j7IepUnkb52vQsAT0M7q4VDrZBF7lVutE
         Hh5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693093; x=1796297893; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvzZaQo4TExZDGysK79p9G1Wm3IQxbPB+Hhiw9JblnA=;
        b=p1QcmWzMvi4qxRr1hd47F09VQG8yzIjypa8b88ITN99G/2U8wtfif09HFrbndglPnS
         /zKUxB+LVsIED3xBMdVxBvw02iaEZuhOWafPZHAcbjkrmzcGTGu3UGGtfVz3zq2Z88wX
         MwIJf2Uz+FUcaa86RWI76dvq8I7wdLG1TYmvI7cz1ZyMIQWdgAQT+v9ZsSZWgdlkzzJY
         iKz/pQ//k9KpQ1C9NlUYjnbI4G+52bk+L9jJ58sWgps1xSCLajNMkfTc+E3VZtswSkV5
         fOumhuzZbPNTPkQNDPdstKuTQ1kYpLixPLK/DH9hB4TECMPwJ2SsciW8ta1yTU5IwDby
         fVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693093; x=1796297893;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PvzZaQo4TExZDGysK79p9G1Wm3IQxbPB+Hhiw9JblnA=;
        b=GQzMZCIb4J3i34n+n61drDhUgrOuJSxVudw5qztS2lF2pdfitrSxo3ljd2p/eTHZHe
         nr1pcWkzrs5v1S9KFGvDiOX869jDAgov33edk3vkZamA8Ospk9QesnbbHkaKbTnCfLwJ
         TADZuGfnwZJGrszW5be5OUDcp3IbIffYA6SrN3k1L7G2RopCElJPLuXnk+OmbLDWXcPI
         WvD1MUVRhLGRMy9lBxQlfSsT141ja4i1rJxZ9nmxXGqRWG436Dl23SXdVubpP82q+Lc0
         5RhNRYpXQxkMwWPNGSkSxGvF8gCgNHL0v+zV0AKQxvYjDaS+UvlNJqp4RS6OPSe6y12+
         lc4w==
X-Gm-Message-State: APuU4Z86+xQpjkAKLTR2Cn5AYk6DIgF88gWvJbE+rhV7NEpFe4xRzxuL
	slafZYvF+vtcUuyFgBIiJpyk7TkBI94a1a7ZnXKU7CZZcbtLKcBJdkq86CIb3DwupQV+AEArmYx
	oRD7qzXkWV3nry4gDShRXTv7vuQ3Lk4UzZg==
X-Gm-Gg: AZFdTZf2l9Ft9HWo6qlZ21GKIeSoXParlfYQ2zjY9Zg4lzGTOnO9GFLX0h3VBcVkwqQ
	VnHcH6plPzdIlzo4qso9urjgVxpGWkb2j7HpUEk/r1ioKOv1XgDp+H4Ter4QApz5y9bY8CoZ4dH
	QeX0mPx9rTwpkt/Gq4drpl8LyoN42/Xn3POJUfPQNAcWaM1FZBeNtI+pYL3M7zQC6nb83xeBQAw
	EDzstIm4hTD+qkhMkFy53hheD9ET7OYx3ORrKOKBiHgbI7j8F+GT1rKgjOz9+8m28PS3RpGoO6v
	GwkY9osAW/ijdGjzSXB+eN9kLynSCES1KpaHymfRkAkm1qvFcjZtSOhcv+gQPu6T4cJsPU8QF3I
	LLdW6hUpk2SdhIhJAAu+XShimIZ8KOwmcOEZYdg==
X-Received: by 2002:ac8:5714:0:b0:536:48df:345a with SMTP id
 d75a77b69052e-55d76a4f90amr367252341cf.32.1795693093187; Thu, 26 Nov 2026
 03:38:13 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 05:38:11 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 11:38:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 11:38:05 +0000
From: jdenheijer74@gmail.com
In-Reply-To: <CAP-m2G6VwPqTOZ_uQEAsWnb=j4yFj+_N0V33gOTL5kRYwwYbvg@mail.gmail.com>
References: <CAP-m2G6VwPqTOZ_uQEAsWnb=j4yFj+_N0V33gOTL5kRYwwYbvg@mail.gmail.com>
Date: Thu, 26 Nov 2026 05:38:11 -0600
X-Gm-Features: Aa3M54qhG3Azk6Lt9HCVOvu1gLC1r_aAC017-jNjO9mGKCVwcpBB0q2bYGRo1Mw
Message-ID: <CAP-m2G7H42FoYGgOGNOspUHBD6xwQ+=T8YgJ+p_FKv1r=QJrTA@mail.gmail.com>
Subject: [RFC PATCH 2/3] hwmon: (asus-ec-sensors) add opt-in MAXIMUS XI HERO
 EXT fan RPM
To: linux-hwmon@vger.kernel.org
Cc: eugene.shalygin@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"

BIOS 2004 reads the three optional extension fan tachometers by writing
selector 0x0a, 0x0b or 0x0c to EC bank-0 register 0x43 and reading the
high and low RPM bytes from 0x57/0x58.

Before the first read, or after a lost latch, the BIOS getter sets bit 7
of 0xd4 and bits 0-2 of 0x89. Reuse the upstream MAXIMUS IX EXTREME
selector path, but add this initialization only for the exact non-WiFi
MAXIMUS XI HERO DMI name. Keep the optional-card support default-off:
a reliable live card-presence detector has not been established.

Signed-off-by: John den Heijer <jdenheijer74@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 76 ++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 6e06256a5..45beba10f 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -37,6 +37,7 @@
 #include <linux/unaligned.h>

 static char *mutex_path_override;
+static bool enable_ext_fan;

 /* Writing to this EC register switches EC bank */
 #define ASUS_EC_BANK_REGISTER	0xff
@@ -45,6 +46,9 @@ static char *mutex_path_override;
  * group of registers reports (e.g. one of the fans of the fan extension card).
  */
 #define ASUS_EC_SELECT_REGISTER	0x43
+#define ASUS_EC_EXT_FAN_RPM_MIN	0xa5
+#define ASUS_EC_EXT_FAN_ENABLE_REGISTER	0xd4
+#define ASUS_EC_EXT_FAN_CHANNEL_REGISTER	0x89
 #define SENSOR_LABEL_LEN	16

 /*
@@ -414,6 +418,12 @@ static const struct ec_sensor_info
sensors_family_intel_300[] = {
 	[ec_sensor_fan_vrm_hs] = EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
 	[ec_sensor_fan_water_flow] =
 		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc),
+	[ec_sensor_fan_ext_1] =
+		EC_SENSOR_SELECT("EXT_FAN1", hwmon_fan, 2, 0x00, 0x57, 0x0a),
+	[ec_sensor_fan_ext_2] =
+		EC_SENSOR_SELECT("EXT_FAN2", hwmon_fan, 2, 0x00, 0x57, 0x0b),
+	[ec_sensor_fan_ext_3] =
+		EC_SENSOR_SELECT("EXT_FAN3", hwmon_fan, 2, 0x00, 0x57, 0x0c),
 	[ec_sensor_temp_water_in] =
 		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
 	[ec_sensor_temp_water_out] =
@@ -484,6 +494,7 @@ static const struct ec_sensor_info
sensors_family_intel_700[] = {

 struct ec_board_info {
 	unsigned long sensors;
+	bool ext_fan_capable;
 	/*
 	 * Defines which mutex to use for guarding access to the state and the
 	 * hardware. Can be either a full path to an AML mutex or the
@@ -593,6 +604,16 @@ static const struct ec_board_info
board_info_maximus_xi_hero = {
 	.family = family_intel_300_series,
 };

+static const struct ec_board_info board_info_maximus_xi_hero_ext = {
+	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
+		SENSOR_FAN_CPU_OPT | SENSOR_FAN_WATER_FLOW,
+	.ext_fan_capable = true,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX,
+	.family = family_intel_300_series,
+};
+
 static const struct ec_board_info board_info_maximus_z690_formula = {
 	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
 		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
@@ -1004,7 +1025,7 @@ static const struct dmi_system_id dmi_table[] = {
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E HERO",
 					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO",
-					&board_info_maximus_xi_hero),
+					&board_info_maximus_xi_hero_ext),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO (WI-FI)",
 					&board_info_maximus_xi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS X HERO",
@@ -1135,6 +1156,9 @@ static bool unlock_global_acpi_lock(struct
lock_data *data)
 struct ec_sensors_data {
 	const struct ec_board_info *board_info;
 	const struct ec_sensor_info *sensors_info;
+	unsigned long sensor_mask;
+	bool ext_fan_enabled;
+	bool ext_fan_initialized;
 	struct ec_sensor *sensors;
 	/*
 	 * EC registers to read from: (select << 16) + (bank << 8) + index,
@@ -1224,8 +1248,8 @@ static void setup_sensor_data(struct ec_sensors_data *ec)
 	ec->nr_banks = 0;
 	ec->nr_registers = 0;

-	for_each_set_bit(i, &ec->board_info->sensors,
-			 BITS_PER_TYPE(ec->board_info->sensors)) {
+	for_each_set_bit(i, &ec->sensor_mask,
+			 BITS_PER_TYPE(ec->sensor_mask)) {
 		s->info_index = i;
 		s->cached_value = 0;
 		ec->nr_registers +=
@@ -1306,6 +1330,30 @@ static int asus_ec_bank_switch(u8 bank, u8 *old)
 	return ec_write(ASUS_EC_BANK_REGISTER, bank);
 }

+static int asus_ec_prepare_ext_fans(struct ec_sensors_data *ec)
+{
+	u8 enabled, channels;
+	int status;
+
+	status = ec_read(ASUS_EC_EXT_FAN_ENABLE_REGISTER, &enabled);
+	if (status)
+		return status;
+	if (ec->ext_fan_initialized && (enabled & BIT(7)))
+		return 0;
+
+	status = ec_write(ASUS_EC_EXT_FAN_ENABLE_REGISTER, enabled | BIT(7));
+	if (status)
+		return status;
+	status = ec_read(ASUS_EC_EXT_FAN_CHANNEL_REGISTER, &channels);
+	if (status)
+		return status;
+	status = ec_write(ASUS_EC_EXT_FAN_CHANNEL_REGISTER,
+			  channels | GENMASK(2, 0));
+	if (!status)
+		ec->ext_fan_initialized = true;
+	return status;
+}
+
 static int asus_ec_block_read(const struct device *dev,
 			      struct ec_sensors_data *ec)
 {
@@ -1325,6 +1373,11 @@ static int asus_ec_block_read(const struct device *dev,
 		dev_warn(dev,
 			"Concurrent access to the ACPI EC detected.\nRace condition possible.");
 	}
+	if (ec->ext_fan_enabled) {
+		status = asus_ec_prepare_ext_fans(ec);
+		if (status)
+			goto restore_bank;
+	}

 	/* read registers minimizing bank switches. */
 	for (ibank = 0; ibank < ec->nr_banks; ibank++) {
@@ -1373,6 +1426,7 @@ static int asus_ec_block_read(const struct device *dev,
 			break;
 	}

+restore_bank:
 	restore_status = asus_ec_bank_switch(prev_bank, NULL);
 	if (!status)
 		status = restore_status;
@@ -1503,8 +1557,11 @@ static int asus_ec_hwmon_read(struct device
*dev, enum hwmon_sensor_types type,
 		return ret;

 	sensor_info = get_sensor_info(state, sidx);
+	ec_sensor = get_ec_sensor_type(state, sidx);
+	if (state->ext_fan_enabled && ec_sensor >= ec_sensor_fan_ext_1 &&
+	    ec_sensor <= ec_sensor_fan_ext_3 && value < ASUS_EC_EXT_FAN_RPM_MIN)
+		value = 0;
 	if (sensor_info->type == hwmon_temp) {
-		ec_sensor = get_ec_sensor_type(state, sidx);
 		if ((environment_temp_sensors & BIT(ec_sensor)) &&
 		    is_blank_temperature_value(value))
 			return -ENODATA;
@@ -1601,6 +1658,12 @@ static int asus_ec_probe(struct platform_device *pdev)
 	ec_data->next_update = INITIAL_JIFFIES;
 	dev_set_drvdata(dev, ec_data);
 	ec_data->board_info = pboard_info;
+	ec_data->sensor_mask = pboard_info->sensors;
+	ec_data->ext_fan_enabled = pboard_info->ext_fan_capable &&
+				   enable_ext_fan;
+	if (ec_data->ext_fan_enabled)
+		ec_data->sensor_mask |= SENSOR_FAN_EXT_1 |
+					SENSOR_FAN_EXT_2 | SENSOR_FAN_EXT_3;

 	switch (ec_data->board_info->family) {
 	case family_amd_400_series:
@@ -1645,7 +1708,7 @@ static int asus_ec_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}

-	ec_data->nr_sensors = hweight_long(ec_data->board_info->sensors);
+	ec_data->nr_sensors = hweight_long(ec_data->sensor_mask);
 	ec_data->sensors = devm_kzalloc_objs(dev, struct ec_sensor,
 					     ec_data->nr_sensors);
 	if (!ec_data->sensors)
@@ -1745,6 +1808,9 @@ module_exit(asus_ec_exit);
 module_param_named(mutex_path, mutex_path_override, charp, 0);
 MODULE_PARM_DESC(mutex_path,
 		 "Override ACPI mutex path used to guard access to hardware");
+module_param(enable_ext_fan, bool, 0);
+MODULE_PARM_DESC(enable_ext_fan,
+		 "Enable Fan Extension Card sensors on ROG MAXIMUS XI HERO");

 MODULE_AUTHOR("Eugene Shalygin <eugene.shalygin@gmail.com>");
 MODULE_DESCRIPTION(
-- 
2.53.0
