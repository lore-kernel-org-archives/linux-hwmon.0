Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5737F3C1404
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348862; cv=none; b=poRzFxBt4sm/HuduokMOA222fVgH4rvoCwkPHrrBEbtP8fTagRiqYfa9zRcGAQozRStKo09t05k2lW/YkG8QTGZrIprBHHj+/74+9p/F0ZI7thKtfStcPkogYMvLqb6BzZM0xwrxKpl7oHMfdntZRX6S3aid9R1JaODfag6URDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348862; c=relaxed/simple;
	bh=F4LO7wmBLLIwQF+4rvvhzn4HaS/bCVrX06hJixd63Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIqgCzd3BkhpfiE4ui+7XY9UsvaAqF9alu5ldXSBtOjC+prdPCOA8lQfrdqgmYexJK6gP62E1suPoIq8Dd4U4xYDCRNFQJ+hzycECayRSC97duYxhfoBt07stFT7WlvD0wK/KTskyAxokAAE8pYTyYh/IwBJebCCxoq+7RFtFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZU23ykz; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZU23ykz"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso955133a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787348861; x=1787953661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkDDTrK1TveWR5ufs0Rnfw82A2Z1a3+coe/mtCRQsac=;
        b=IZU23ykzsGxzVPT+PBOlLNvMBm8ESNMYGLYt4Qp5pm0BWNPnaivAjQGXZd2CL9ZEFW
         8z8uwfP7EjM1p/zVRgSClgQul3bTdFTxKvZETKXnMLWcY0jBKNEQmHp3ZuSnwiTsml6d
         ZXJ9QRoyGG4Pb+LPb3QnBC9QPZQBMG1nfKHLICOfaLP1z2lnj3kaQxYW9vwk9FxxCtzM
         SdtLK3vHMeeWUbgPdJ2UsMtzZl0iYkLMBxerxsJu37wU6py1+5FgtaL5NAGcwzwGphAA
         PJY68alBVfNIcnftIiaYfdNEvd5EF3hytbZFjOSP7yGZNvOwoLZ6GrtOYuKHsZwIastM
         zWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348861; x=1787953661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkDDTrK1TveWR5ufs0Rnfw82A2Z1a3+coe/mtCRQsac=;
        b=pyTjGy+4QDrNiCQZNoRCUmBn1z2Ol0NECHoAXV11VgRbLYBGY2MJ5xE8PYnZykwUpc
         oJnCGF/vXQ8LwfNmzgE+QleJVYJTdS0pO2nKtY0ZaVo9nL4MdHvRC1n/9z1pDovDRZSE
         tyIzhmJA4ETnGbgHNuzXJ9qepGyqHHEXFmXRjeeajczpz/JiOiDmoDPJzl2qY0XTbeYI
         AW46k9si1VV9xpRTyCzJqhhgwDcJTNuaUUdk5q0KYoJ2dUa8nUsKy7Ik7ZKHuPtynEAc
         pQUhKYa2KRZJIkL8VdnPHHRLiqh1/9nTrE0oUBc1o2mvaH4AqWHUtTMH1GhUSrwt4NYO
         3Amw==
X-Forwarded-Encrypted: i=1; AHgh+RoD1vVPINJPMGdW9qR+T+OYNztKBjW0wNQ2aD1iUUhuyfXfVV52PSr6uov9E6tnnO4B9lE1HLT2qFUeuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n0v4rZHHJJoR4MQ3ZFvvokUlwkLqs3yKao/rkfcKOETRtDWaRr
	D9FsFRNh/kF2bBdYnOU/T8sbr2w1hV8zbRNhL/OmwIA2acv3QBMl2Yj2
X-Gm-Gg: AR+sD12CWiMgi9jPHfcmX8Qkx6Xz9WDOY+/N2GDSMW7keaUxHi2yi4lJuAheyzQ/BtX
	IVaOOwNyNt6i0de5mcyztgTj0nolnwnIceIc1kZoG4SAMQT2yU533RwpPltzphvWIwCVrQT9mHC
	FEiPpeE5r+YM0fPQzucaDuxXqLz3DZ1noCsBGeCyGXNMbXpEtFVd/SyS5Olcz8WEUtwAQBaMlPB
	T1ve5XBsQ3+7ELULaEWdD5EkIEhqfkdwRMtF1EBCG2aCnX1r1KQNTCdWeIsRWMbq5/6EZt7cec7
	q0JPTC4Y05q4ZTqFQeHhdivgx9oVA3mKzlSTZbmP/wLtKr6nS4RUz+WMr71dsCG9OvPCnaE1U4o
	r/jr8nikyX/ylBfv5dSHNfLlFnYyzk8lOwTia4zltG55PgBh6Ze0yuuRsBjyOTi2GSlGukxtmOC
	ispz41ipeGOKnbp0CtoXrkHsFJWyISbJuJ7SwpQo5nz2iObEsp4+dVybOj6OXhwyRcKJ0G2JI+5
	cypr9aAsBDoh3yA79g=
X-Received: by 2002:a05:6a20:684a:b0:3cd:1037:36d6 with SMTP id adf61e73a8af0-3cd2fa5643bmr19087616637.0.1787348860697;
        Fri, 21 Aug 2026 14:47:40 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm45664198eec.14.2026.08.21.14.47.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 14:47:39 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 1/3] platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
Date: Sat, 22 Aug 2026 03:17:25 +0530
Message-ID: <20260821214728.87773-2-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821214728.87773-1-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Selected Legion Go firmware exposes Full Speed as Other Mode feature
0x04020000. Capability Data does not describe this feature, so
lenovo-wmi-other currently ignores it.

Probe the feature during HWMON setup on those products. If the read
succeeds and returns a Boolean value, expose it as pwm1_enable. Value 0
selects Full Speed, and value 2 returns fan control to firmware automatic
mode. Reject all other values.

Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 .../wmi/devices/lenovo-wmi-other.rst          |   7 ++
 drivers/platform/x86/lenovo/wmi-other.c       | 108 +++++++++++++++++-
 2 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 011054d64eac..75f2deaaef16 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -49,6 +49,13 @@ The following HWMON attributes are implemented:
 Due to the internal RPM divisor, the current/target RPMs are rounded down to
 its nearest multiple. The divisor itself is not necessary to be a power of two.
 
+Legion Go fan controls
+----------------------
+
+On supported Legion Go models, Other Mode feature ``0x04020000`` controls
+Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. Value 0
+enables Full Speed, and value 2 returns fan control to firmware.
+
 LENOVO_CAPABILITY_DATA_01
 -------------------------
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..c180933e1d18 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -32,6 +32,7 @@
 #include <linux/component.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/export.h>
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
@@ -83,6 +84,7 @@ enum lwmi_feature_id_psu {
 	LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR =	0x02,
 };
 
+#define LWMI_FEATURE_ID_FAN_FULLSPEED 0x02
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
 #define LWMI_TYPE_ID_CROSSLOAD	0x01
@@ -102,6 +104,10 @@ enum lwmi_feature_id_psu {
 #define LWMI_CHARGE_TYPE_STANDARD	0x00
 #define LWMI_CHARGE_TYPE_LONGLIFE	0x01
 
+#define LWMI_ATTR_ID_FAN_FULLSPEED					\
+	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_FULLSPEED, \
+		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
+
 #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
@@ -115,6 +121,50 @@ enum lwmi_feature_id_psu {
 
 static DEFINE_IDA(lwmi_om_ida);
 
+static const struct dmi_system_id lwmi_fan_dmi_table[] = {
+	{
+		.ident = "Lenovo Legion Go 8APU1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go S 8APU1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go S 8ARP1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go 8ASP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
+		},
+	},
+	{
+		.ident = "Lenovo Legion Go 8AHP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
+		},
+	},
+	{}
+};
+
+static bool lwmi_fan_supported(void)
+{
+	return dmi_check_system(lwmi_fan_dmi_table);
+}
+
 enum attribute_property {
 	DEFAULT_VAL,
 	MAX_VAL,
@@ -144,6 +194,7 @@ struct lwmi_om_priv {
 	int ida_id;
 
 	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
+	bool fullspeed_supported;
 
 	struct {
 		bool capdata00_collected : 1;
@@ -237,6 +288,38 @@ static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val,
 	return (retval == 0 || retval == 1) ? 0 : -EIO;
 }
 
+static int lwmi_om_fullspeed_get(struct lwmi_om_priv *priv, long *enable)
+{
+	struct wmi_method_args_32 args = {
+		.arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
+	};
+	u32 value;
+	int ret;
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_GET,
+				    (u8 *)&args, sizeof(args), &value);
+	if (ret)
+		return ret;
+
+	if (value > 1)
+		return -ERANGE;
+
+	*enable = value ? 0 : 2;
+	return 0;
+}
+
+static int lwmi_om_fullspeed_set(struct lwmi_om_priv *priv, bool fullspeed)
+{
+	struct wmi_method_args_32 args = {
+		.arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
+		.arg1 = fullspeed,
+	};
+
+	/* The WMI method has no return value. */
+	return lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_SET,
+				     (u8 *)&args, sizeof(args), NULL);
+}
+
 /**
  * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attributes
  * @drvdata: Driver private data
@@ -255,6 +338,10 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 	struct lwmi_om_priv *priv = (struct lwmi_om_priv *)drvdata;
 	bool visible = false;
 
+	if (type == hwmon_pwm && priv->fullspeed_supported && channel == 0 &&
+	    attr == hwmon_pwm_enable)
+		return 0644;
+
 	if (type == hwmon_fan) {
 		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
 			return 0;
@@ -311,6 +398,9 @@ static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	u32 retval = 0;
 	int err;
 
+	if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0)
+		return lwmi_om_fullspeed_get(priv, val);
+
 	if (type == hwmon_fan) {
 		switch (attr) {
 		/*
@@ -366,6 +456,17 @@ static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	u32 raw, min_rpm, max_rpm;
 	int err;
 
+	if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0) {
+		switch (val) {
+		case 0:
+			return lwmi_om_fullspeed_set(priv, true);
+		case 2:
+			return lwmi_om_fullspeed_set(priv, false);
+		default:
+			return -EINVAL;
+		}
+	}
+
 	if (type == hwmon_fan) {
 		switch (attr) {
 		case hwmon_fan_target:
@@ -420,6 +521,7 @@ static const struct hwmon_channel_info * const lwmi_om_hwmon_info[] = {
 			   HWMON_F_MIN | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
 			   HWMON_F_MIN | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
 	NULL
 };
 
@@ -440,6 +542,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
  */
 static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 {
+	long enable;
 	int i, valid;
 
 	if (WARN_ON(priv->hwmon_dev))
@@ -458,6 +561,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 	if (relax_fan_constraint)
 		dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with caution\n");
 
+	priv->fullspeed_supported =
+		lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
+
 	valid = 0;
 	for (i = 0; i < LWMI_FAN_NR; i++) {
 		if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
@@ -474,7 +580,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 		}
 	}
 
-	if (valid == 0) {
+	if (valid == 0 && !priv->fullspeed_supported) {
 		dev_warn(&priv->wdev->dev,
 			 "fan reporting/tuning is unsupported on this device\n");
 		return;
-- 
2.55.0

