Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C936349B1C
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 22:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795386; cv=none; b=CBStwNcwibVCVkDOXLJZQbRSIpoOFPk12YEAqow2iaQOsNYddHn0I2DZqSmB0xFE4c3iM2E+5TCYyRo1kvYwGILfBHBtsIAP+2NX+ZlmIfrIvOEpG9F834QT/Sc552aGhKscqL/Qsa9g0NdyOEGOHxOPBZix5XM6u/2TiDjfCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795386; c=relaxed/simple;
	bh=ODSEOHVW4KYU9xP2cIISQVh2g4cADrCkR6ETTeHmPoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtPr3M6ax1fnm8kbT3ZWaOeCjy7JVOXIwYAyJQmF3IGi47E0lvlRgS1DYfSyUDOcI1+c4nl69FmBztDWQj++W5/wWt7k/d+XfwTpLO4NfnjXET4S/6xKji5eZwHkG/mw1jSNozEpqfr1Lpom4FUU41QH+N8PYvFLVGjnKUThHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8bXM6do; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8bXM6do"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cad8076b01so43451335ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 15:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795384; x=1786400184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtKu0FT85uYm4ILu5Mq1OuaF/iNH/TftNn4lcGyvoLs=;
        b=d8bXM6doaHydHzm6dzFOTn3SCRvyLcTVDpPyP7wmAcp6XXXCw/36DwNmzblGsPzaES
         Eh+WCh9n4xGq6/afaevwQOqTX64K5FmseuGSgMkprXgJ3CTC0LBAxh2s2m83ksTnUIvw
         T5FMqPBb/76hIPjmC8/c30ri1kuGX/f8eb8Yy/tFlPfZSiprQNVZN5zLRz66ZBaxVpZQ
         Z3bmLyGO3hzUypiRpiVHqYGRAp8+YkwFx3RAMxRTvtDEHX5QQbxlcWCA92L1MHYkZLVB
         S/KEZzhqncWHVKzUa/qRPxQkxGSW2KFwbl+fv41gUsYWFEgp3O+wcYo8n301rE4dQjij
         aeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795384; x=1786400184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtKu0FT85uYm4ILu5Mq1OuaF/iNH/TftNn4lcGyvoLs=;
        b=bC/4CRnNPQspOD8FuenqWDzckEqarLwXuET1JsT4phUYLc4xPvI0xI4OigIpeyXzoR
         A/wxIIctyQBRcsv29+5SmPk/0aCgA6pD6jGjyrWz3gWkyPFme2N1Op1dduZn0oTbpTuz
         bjXhy5jjvYVsu88GCfxBO6GLvf+GDobR81D4bb65zvdpGOF2KUnu3JriS4WyC/6V9Y5E
         1SAHXf8KHKIcAdG1WzHkDOXDmfk2poOlRqeDPCp+0OHMZ+apWUtCsS7JNM0aENLFK65E
         ONFUGkN7qMlSiphKVcCU6WqbqdvDx9zV1ceh5Lk0r12H2ssf1UsSROBcUNhc1qDTdn5R
         0uQg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3E5SW7701Lb5unepbyn5mTj5JCaoPTbiaSs2z9l/Pc2DTO/djA7WvcId+RKiI9VnEXcmPa0vwZZ1ASQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZNw+v2eWxIgshy9lH+ySLmGHkiibEZ2rNuyjyfyWugR85+rSm
	iAEN6lckZyr0NFReC/8TcORX2iwUs1PA84XGW/ofh7xvvWMJqi3LlyZs
X-Gm-Gg: AR+sD11+ic0VQPz7JCn44z1/4kTEVyYasYu0JR3y4K9SuWsy+asWzYxOboI9hUr7aBV
	NLY38NhoDsLnew7J5tCTbKvKYjkpy2yILh3z/LBHPBFd2V5bhSrQQ1OiAdc5QUosdxAt1BGawjS
	zwDzzv/zGH6o7JJYk1eFW2GJqzoM6skdtL4P2G7FWe0YE2xTu178RQwQPVAj0BzxXRukqQpzYH7
	j5ZCWMpgfFOhuhTZTIevM6ym5AwhIpb1VGsElXBRfEEylprkX8o4khgt70UqlzNPPnV/ZCofTCN
	S8NLIwOTk2fH+lUqpv14XB/XaxxHTPvgp2wN3DlEVUA19F0ITEUZrv+A9aEFCu1NzO+eKah85HV
	nX4+kQ6J244G/20O0n4GxZvb5yTCXR22vDD+5FTIz/yIE4G7DMJtl4GLonPG22skUkcqDGQF8ON
	RnGhD0H4iq+sfvJ6CbVkJ5XNpqJOMGp6kl3FgY2Pc80w7tT8lGHrSM6Z0VDdDIv2IULJ+ujXia2
	nQRj9kI4P3Bkfd6B/6HWR+DXZcp2Ru+7he4t2dINg==
X-Received: by 2002:a05:6a21:696:b0:3c3:a7ab:135a with SMTP id adf61e73a8af0-3c92a749b53mr11060704637.20.1785795383620;
        Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 4/6] platform/x86: msi-wmi-platform: Clean up devices
Date: Mon,  3 Aug 2026 15:16:12 -0700
Message-ID: <20260803221614.59324-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current driver has multiple minor mistakes. Fix them all in one
cleanup patch.

- Device names are inconsistent/incorrect for the quirk table
- Per the Windows DLL, PL2 must always be at least 1W higher than
  PL1. Give PL1 and PL2 different minimum values.
- Copy buffer before write to ensure payload is sent instead of stale
  data

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index fdc2f6f4ca7e..35cd35fc6446 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -124,8 +124,9 @@ struct msi_wmi_platform_quirk {
 	bool charge_threshold;	/* Charge threshold is supported */
 	bool dual_fans;		/* For devices with two hwmon fans */
 	bool restore_curves;	/* Restore factory curves on unload */
-	int pl_min;		/* Minimum PLx value */
+	int pl1_min;		/* Minimum PL1 value */
 	int pl1_max;		/* Maximum PL1 value */
+	int pl2_min;		/* Minimum PL2 value */
 	int pl2_max;		/* Maximum PL2 value */
 };
 
@@ -229,8 +230,9 @@ static struct msi_wmi_platform_quirk quirk_gen1 = {
 	.charge_threshold = true,
 	.dual_fans = true,
 	.restore_curves = true,
-	.pl_min = 8,
+	.pl1_min = 8,
 	.pl1_max = 43,
+	.pl2_min = 9,
 	.pl2_max = 45
 };
 static struct msi_wmi_platform_quirk quirk_gen2 = {
@@ -238,14 +240,15 @@ static struct msi_wmi_platform_quirk quirk_gen2 = {
 	.charge_threshold = true,
 	.dual_fans = true,
 	.restore_curves = true,
-	.pl_min = 8,
+	.pl1_min = 8,
 	.pl1_max = 30,
+	.pl2_min = 9,
 	.pl2_max = 37
 };
 
 static const struct dmi_system_id msi_quirks[] = {
 	{
-		.ident = "MSI Claw (gen 1)",
+		.ident = "MSI Claw A1M",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T41"),
@@ -253,7 +256,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		.driver_data = &quirk_gen1,
 	},
 	{
-		.ident = "MSI Claw AI+ 7",
+		.ident = "MSI Claw 7 AI+ A2VM",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T42"),
@@ -261,7 +264,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		.driver_data = &quirk_gen2,
 	},
 	{
-		.ident = "MSI Claw AI+ 8",
+		.ident = "MSI Claw 8 AI+ A2VM",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T52"),
@@ -1131,7 +1134,7 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 
 	if (data->quirks->pl1_max) {
 		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL1_SPL,
-					&fw_attr_type_int, data->quirks->pl_min,
+					&fw_attr_type_int, data->quirks->pl1_min,
 					data->quirks->pl1_max, &data_get_value,
 					&data_set_value);
 		if (err)
@@ -1140,7 +1143,7 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 
 	if (data->quirks->pl2_max) {
 		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL2_SPPT,
-				       &fw_attr_type_int, data->quirks->pl_min,
+				       &fw_attr_type_int, data->quirks->pl2_min,
 				       data->quirks->pl2_max, &data_get_value,
 				       &data_set_value);
 		if (err)
@@ -1259,6 +1262,7 @@ static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user
 		return ret;
 
 	down_write(&data->buffer_lock);
+	memcpy(data->buffer, payload, data->length);
 	ret = msi_wmi_platform_query(data->data, data->method, data->buffer,
 				     data->length);
 	up_write(&data->buffer_lock);
@@ -1266,10 +1270,6 @@ static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user
 	if (ret < 0)
 		return ret;
 
-	down_write(&data->buffer_lock);
-	memcpy(data->buffer, payload, data->length);
-	up_write(&data->buffer_lock);
-
 	return length;
 }
 
-- 
2.55.0

