Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1822CBD9
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188676; cv=none; b=ONtFq8TUjVRVkCgcKXqjpqYlfcGX0JDDYftnZZM4MP9rMwyoNyuyIoGdXWlLJ9dwxS9zMitNhwDiUgqcvaaFxAiLjiuFs5tJEvm7nSaHTFH/hZpTgWvt8VDg7DimsOetMQhwjCnAejqGdz1ujaaKiMDPO0ZvRjOItqlE+tgYtI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188676; c=relaxed/simple;
	bh=xyQDC8GbqzF7ArVB2TLv7PIMNcNkx7/tmEYnfpsVsQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dVH53VcwsH7D+5HzX5n6/W+PODeY65Zyp1OxfY+2z2HHjG8h1TBZQzj6jv5qsNIQ973xAF1cHbslr6Dj1fdGg7fxqVdzPTBrBZXKExhFR0ASeAJAUeBUek3TtGS/7C8QdsU0e9hekOxrIrw29l6IdR+7nraWl6TLDFFIVYxlgu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnHIqjHx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnHIqjHx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a93210fcc2so6169565ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 23:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770188676; x=1770793476; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCdqqcfRfC4kbz407KtywqNG2v+O9EPEFpJxtskkRGs=;
        b=TnHIqjHxna/gjogzFDxhmgMHhyTsESndq4BXdNwthxNFr9wxYXDknlqhOzUEsNdseP
         3LSd2iwVCCSreAYi26dZUw4E9P58IctXIlqNevIhP9W6gSRTkcSsdGNQHx2HX4aHjnam
         2HUU3Rnm/V6IG3YBniqobZaw9jn1nw5zMK7ojVHXE31eX6Tm5lnikPVjpQmqOD6ijWcp
         6h7MvPQsKv2LxMNOMBX4CIH85hLDSngbjn4vxrFRH51K0AbAIa7A+q85LrKIB2eq5WJD
         ujoQchzYCpvK4FWBA3ex8mnh+/xMyyNtkBKStBkTOP3rgE1JbA4PVKSGNN2W9gU76Bnp
         U1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770188676; x=1770793476;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCdqqcfRfC4kbz407KtywqNG2v+O9EPEFpJxtskkRGs=;
        b=effMe0ds2sVE8W18iLiqSYLG4w0CHRIieUSeojBWExa7p574VngLk5woSa+RNBXd+e
         pybBJmG5DKlrVCO3u8NfvkEl6bkT8BNrPrhxHitsAc7q7HawIiVHAITOHbtPAvyqnHNx
         Af76EiW5dtOaBbmGfkfqON162pxW0RfzLaWWXU3coZJxfYoaOCBHPn3nMSuZumm7GPMB
         wk3dQHsw4EyZxl8LwvgwCKE0QG6g6hZCC5Pdf+qHuWGmN5Q3nnrpGuKKn6Hs5pmL669N
         m21bKIOtq3ua964601X60aMSpFut3Csz+/WF+Em7ZknS0aCRqwR/trWtHMkpwMhg3PyF
         n5pg==
X-Gm-Message-State: AOJu0Yy+mGbXXgkzwBQSWSo/5U8v/Hy0npfPeU2FDExO9/ObfkHyzoon
	NdRTzbb0yZoG3l+M3qK5PnjpSaBeXQWzcxurLETdQ9artxZAfPrGae/6
X-Gm-Gg: AZuq6aLlqTf2fmqok89TcWlYY05X/NXPxJyJS05bUWBdvFnoaaC6M/a4jrKniKC056Q
	yowC6izqMhGA3rhaRecPb0/ipGdtkAHxZkTGrrseahkqZjGkU0hjTdjsKOawPH3BzEgVuSA8+2r
	JNsdVEp/EcUrw2VRrZa4Su92cZ4V2Dib+mYzOTPs7yjCd2hWh1Hf1FnDtkbIs1/y/wuYakF/kh8
	pGB1k1GE2t6eZPkHjeY939vZ82Ug8D8ga0hCncJ34IHD5dofxAuZTUp/jGCXT9ywbQnOzt/8Ehu
	iuonqB/+G5j5vGpzJgk/eRNw1aR712PbR+AzfHfPM5BB5H/RWlUlBZfkjc6tIlw74AtZFK+2tew
	QahSD59iX7M9Xg3wrSxGVkK8aAs6fK8wk9qD4KSLuaNqMBR0LcxycNjvAoXEE/6AcaxGrl6EGx/
	gWZGhnk6r+YYX6wuzKwWfRv9Z5E8Cg43+sqiJNysPNO3XPWfj2/3s=
X-Received: by 2002:a17:902:d54a:b0:2a7:8088:371a with SMTP id d9443c01a7336-2a933ea1404mr24497105ad.35.1770188675637;
        Tue, 03 Feb 2026 23:04:35 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933967ca1sm13826205ad.74.2026.02.03.23.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 23:04:35 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 04 Feb 2026 15:04:16 +0800
Subject: [PATCH] hwmon: pmbus: tda38640: Add identification for
 PMBUS_VOUT_MODE
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-tda38640_direct_mode-v1-1-72511cd87b41@gmail.com>
X-B4-Tracking: v=1; b=H4sIAG/vgmkC/x3MSQqAMAxA0atI1hbaWOtwFREpJmoWDrQignh3i
 8u3+P+ByEE4Qps9EPiSKPuWYPIMxsVvMyuhZECNTqO26iRf1M7qgSTweA7rTqzIsa0MGo9lAyk
 9Ak9y/9uuf98P0n/n4mYAAAA=
X-Change-ID: 20260204-tda38640_direct_mode-d6e47121a259
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=xyQDC8GbqzF7ArVB2TLv7PIMNcNkx7/tmEYnfpsVsQg=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpgu+Czerc2ZJbkYZk3cw2Kw+zPAJl8gZunEfVt
 aoMbx12iFyJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaYLvggAKCRClg0K3CVbE
 ga7AB/9OJExDUOmDRN/l3Yh/Sbfng8v6lFTaa/8vGQRAWudSJAbZ2EvmEg8ZZs+G4W/PwiOzXYM
 QGpbv3cqVKuxSwFTmNSwsUW6cNmDhHNpkAqWmn32blyq7w2r5JJDR21WA3L7xj7VDbbdW2PvV0g
 gKcA04hu9I2fvidU+8aaq6kJXe9+IjR5J7ub4ub39OS0Tzg59fDPHW7zam6Z43WIjnyiPG3LrCg
 ZFBPGrmAITxY3Gewph594lcEz8Z0cCD7uYZCdEO4jSbg3oy6rwmRlhoqoK/OzPa0bMK1VVX4CbD
 W7paiLjUQJiJvRfHDxC4sqKbg0mcMOoDhgh4rDOxy2yHWtfH
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Add support for detecting the PMBUS_VOUT_MODE for tda38640. Both
linear and direct modes are now handled. Previously, only linear
mode was assumed, which could trigger "Failed to identify chip
capabilities" for chips in direct mode.

This change ensures proper identification of the chip regardless
of its VOUT mode.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
This patch adds proper detection of the PMBUS_VOUT_MODE for the
tda38640 PMBus driver. Previously, the driver assumed linear mode
only, which would trigger "Failed to identify chip capabilities"
for chips operating in direct mode.

Changes:
- Add support to identify both linear and direct VOUT modes.
- Prevent misidentification and improve robustness of the driver.
---
 drivers/hwmon/pmbus/tda38640.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index d902d39f49f4..410b7fc5aef5 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -23,6 +23,30 @@ struct tda38640_data {
 	u32 en_pin_lvl;
 };
 
+static int tda38640_identify(struct i2c_client *client,
+			     struct pmbus_driver_info *info)
+{
+	int vout_mode;
+
+	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
+	if (vout_mode < 0 || vout_mode == 0xff)
+		return vout_mode < 0 ? vout_mode : -ENODEV;
+	switch (vout_mode >> 5) {
+	case 0: /* Linear */
+		info->format[PSC_VOLTAGE_OUT] = linear;
+		break;
+	case 2: /* Direct */
+		info->format[PSC_VOLTAGE_OUT] = direct;
+		info->m[PSC_VOLTAGE_OUT] = 1;
+		info->b[PSC_VOLTAGE_OUT] = 0;
+		info->R[PSC_VOLTAGE_OUT] = 3;
+		break;
+	default:
+		return -ENODEV;
+	}
+	return 0;
+}
+
 #define to_tda38640_data(x)  container_of(x, struct tda38640_data, info)
 
 /*
@@ -142,7 +166,6 @@ static int svid_mode(struct i2c_client *client, struct tda38640_data *data)
 static struct pmbus_driver_info tda38640_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
-	.format[PSC_VOLTAGE_OUT] = linear,
 	.format[PSC_CURRENT_OUT] = linear,
 	.format[PSC_CURRENT_IN] = linear,
 	.format[PSC_POWER] = linear,
@@ -153,6 +176,7 @@ static struct pmbus_driver_info tda38640_info = {
 	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
 	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
 	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
+	.identify = tda38640_identify,
 #if IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR)
 	.num_regulators = 1,
 	.reg_desc = tda38640_reg_desc,

---
base-commit: 5fd0a1df5d05ad066e5618ccdd3d0fa6cb686c27
change-id: 20260204-tda38640_direct_mode-d6e47121a259

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

