Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B4A345EB2
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 22:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795392; cv=none; b=eMt35UvUnd6uta4TbAKvScEnSkHwlCcq3FvODoHMRcCa0OaHQ2yI8Zf31n4kF0gH/FMocFNhTsTcG2ywjSJ1YTDCiQ2Rr9lT3h4xDLmB8HEa7xHZgugGrMze54M95+L+HvlQlcNP1i0MfvcsduH1Zev4mhy+NUB/fwK6GmsmtsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795392; c=relaxed/simple;
	bh=3bRWRJHR2oolUlkzswcZCW6q5QwYlzsAmGwJ0DlRxpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bB9Fe1B5VFoFKm1iRO8McpmDpVhlkYTmCO7l+CvlbHHQdO0zjTZxIL7gLQ0s4VrmnHuJtTBvdWw5c9nmAcwOzJ+Yf946sDqVKNhT1mD1cQQ+dSFR7vL0Ot2HPZcEOZWWFureNQzCa6IZ7xFHZhUm2xtJwhlG+2ESShm7dPgK+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCeREx1A; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCeREx1A"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso41695315ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 15:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795384; x=1786400184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umPlPU9FyoH+PYFO+Ek3X5tyEqywCKxkkeaN/G8otu0=;
        b=sCeREx1ARyPQXATTov0kV00FeHXVK849YyGgieC+3uMDcIKY/0NAwdJRzDZ+IPNsW4
         wwRhcglnVgQXXnSbiOttEFfiMEX4oqUf2bTjBTbMv7rEU0NvoKcpHoch12T/Z6hUAMbB
         cKWJMC+dr9TSTfZkCccCyUhPTeWvh3Mwd7bAY3bpHbLURAA9GQj+ytA2tT19Z882elGJ
         4Hr/eGF3oFmhHxyEAtI0NnDBbhiEAVNJr5Zh34SCtUYWtpEV+9vvqxZEMhlRxAHGkEMd
         0FG/44z3k1XHlHJP3gr1lAAzolV0p4FE5RLMV8/MapfmHbu6WFSMeh6E7BxdYiL65Uot
         KWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795384; x=1786400184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=umPlPU9FyoH+PYFO+Ek3X5tyEqywCKxkkeaN/G8otu0=;
        b=I7q1Yx71ECIBvbxUiAKLzQrHZIdM7yMpJN3XK/O4Xvu/WFQhrcQg375f8T4Kgvdje1
         j1x/MkP+jzKmR+0z2P63tr4M9keeXTspF23+FAZJUswmzenZj35Cfx27dHLShH17Z/cn
         012G5BpUp29axy5CXahmQY+zEZx2sbpC79459rseenQ+S+eob1M/kZbntS4r/JPUz5Xg
         1FmqHlpslQDQJIFVHczm5SnTOn0wYUl1Lv5NFqlHYPtKxu6EP3McGm5RGUq85ag3aRKw
         eCfDSfSJt3IIBtHfGT2MZEtX1cFRk8jRk5HAA+gWsVJTWsggTRsAxuxV9c7Ggdg7mtQ7
         xdRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKK2of5TJP7Qexo4hIYiHnvMh+IL+W2XMgJfUca0kZ9DTeloZXbllLZ9CdqIpu896alfB8p0qepWIvfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDC91shzfni4jgUpfFaJnkcSUGCXpj9MOeq39WzoTCY0JikIVJ
	x1vo8UkegnMals0/TbaldQZUZ3teaX5Nt7Tn9FDsG3FDtphHN7icLGU+
X-Gm-Gg: AR+sD13/g/hQWstY2bLjm95GchZz8J1UULbacdAnrR194eSF+dnCKtL4uMstppNSXyI
	SoQzt0h2W5QrI+DbK8jAd5+vFKmQpSFdntIC710JbJvQxnGi2MzlejnQR4FqgDwe7dqSt5VFIuT
	rTcv/Lb86kcErR8HNm9VvKQs+uXunam5voHY4lqXlo4dJg4NkxoumJa20htHIbQI3UXOd00rbPT
	47G/Pf6QXAE5YO0J2hj2jzRo4//53vZ7bZL0mgIhcDH67uZ6JeG2rx3h5enWX5xywggYvC2eFQA
	GU+IjuxF97E93y/G5IKS9IqLT762gl4mBCJH7IuUbrkZEkaMLgYryWGIdfzBvZjypytLruBlrgw
	iOYkZTdG2qm9DwHQeN5T2C6Vuc94X61CdtVSnuIerOzIPbCfKaxTI8SUpnTHJcBbL9gLr8IXCOi
	m8aV/TY5sY7dP4EJ+5rYan9uHKRbhbFwHS5OiQP9QTKvc1oEwbtQSTcg368JdftvHZR+mfRjye6
	sGRaUTFfNTrjE9VEYAqPT2UCWKAznvaCHGG4o9EwA==
X-Received: by 2002:a05:6a21:62c4:b0:3c0:9c1a:893c with SMTP id adf61e73a8af0-3c92a96158fmr12506589637.68.1785795384448;
        Mon, 03 Aug 2026 15:16:24 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:24 -0700 (PDT)
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
Subject: [PATCH 5/6] platform/x86: wmi-msi-platform: Add MSI Claw A8 support
Date: Mon,  3 Aug 2026 15:16:13 -0700
Message-ID: <20260803221614.59324-6-derekjohn.clark@gmail.com>
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

Adds MSI Claw A8 BZ2EM support.

- Adds FPPT (PL3)
- Adds disable toggle during startup for AMDSTAPM flag. In the Windows
  DLL this feature is used when setting the device into an AI shift mode
  not exposed by this driver.
- Add limits to gen 3 for SPL, SPPT, FPPT.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 82 ++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 35cd35fc6446..8d11dad99776 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -77,11 +77,17 @@
 #define MSI_PLATFORM_SHIFT_GREEN	(MSI_PLATFORM_SHIFT_ENABLE + 1)
 #define MSI_PLATFORM_SHIFT_ECO		(MSI_PLATFORM_SHIFT_ENABLE + 2)
 #define MSI_PLATFORM_SHIFT_USER		(MSI_PLATFORM_SHIFT_ENABLE + 3)
+#define MSI_PLATFORM_SHIFT_MANUAL	(MSI_PLATFORM_SHIFT_ENABLE + 6)
 
 /* Get_Data() and Set_Data() Params */
-#define MSI_PLATFORM_PL1_ADDR	0x50
-#define MSI_PLATFORM_PL2_ADDR	0x51
-#define MSI_PLATFORM_BAT_ADDR	0xd7
+#define MSI_PLATFORM_PL1_ADDR		0x50
+#define MSI_PLATFORM_PL2_ADDR		0x51
+#define MSI_PLATFORM_PL3_ADDR		0x52
+#define MSI_PLATFORM_AMDSTAPM_ADDR	0xc5
+#define MSI_PLATFORM_BAT_ADDR		0xd7
+
+#define MSI_PLATFORM_AMDSTAPM_SUPPORTED		BIT(7)
+#define MSI_PLATFORM_AMDSTAPM_DISABLE		BIT(0)
 
 static bool force;
 module_param_unsafe(force, bool, 0);
@@ -124,10 +130,14 @@ struct msi_wmi_platform_quirk {
 	bool charge_threshold;	/* Charge threshold is supported */
 	bool dual_fans;		/* For devices with two hwmon fans */
 	bool restore_curves;	/* Restore factory curves on unload */
+	bool disable_stapm;	/* Disable AMD STAPM auto power management on load */
+	u8 custom_shift;	/* EC Shift value for PLATFORM_PROFILE_CUSTOM, 0 if unsupported */
 	int pl1_min;		/* Minimum PL1 value */
 	int pl1_max;		/* Maximum PL1 value */
 	int pl2_min;		/* Minimum PL2 value */
 	int pl2_max;		/* Maximum PL2 value */
+	int pl3_min;		/* Minimum PL3 value */
+	int pl3_max;		/* Maximum PL3 value */
 };
 
 struct msi_wmi_platform_factory_curves {
@@ -151,16 +161,19 @@ struct msi_wmi_platform_data {
 enum msi_fw_attr_id {
 	MSI_ATTR_PPT_PL1_SPL,
 	MSI_ATTR_PPT_PL2_SPPT,
+	MSI_ATTR_PPT_PL3_FPPT,
 };
 
 static const char *const msi_fw_attr_name[] = {
 	[MSI_ATTR_PPT_PL1_SPL] = "ppt_pl1_spl",
 	[MSI_ATTR_PPT_PL2_SPPT] = "ppt_pl2_sppt",
+	[MSI_ATTR_PPT_PL3_FPPT] = "ppt_pl3_fppt",
 };
 
 static const char *const msi_fw_attr_desc[] = {
 	[MSI_ATTR_PPT_PL1_SPL] = "CPU Steady package limit (PL1/SPL)",
 	[MSI_ATTR_PPT_PL2_SPPT] = "CPU Boost slow package limit (PL2/SPPT)",
+	[MSI_ATTR_PPT_PL3_FPPT] = "CPU Boost fast package limit (PL3/FPPT)",
 };
 
 #define MSI_ATTR_LANGUAGE_CODE "en_US.UTF-8"
@@ -245,6 +258,19 @@ static struct msi_wmi_platform_quirk quirk_gen2 = {
 	.pl2_min = 9,
 	.pl2_max = 37
 };
+static struct msi_wmi_platform_quirk quirk_gen3 = {
+	.shift_mode = true,
+	.charge_threshold = true,
+	.dual_fans = true,
+	.restore_curves = true,
+	.disable_stapm = true,
+	.pl1_min = 7,
+	.pl1_max = 35,
+	.pl2_min = 9,
+	.pl2_max = 40,
+	.pl3_min = 10,
+	.pl3_max = 48,
+};
 
 static const struct dmi_system_id msi_quirks[] = {
 	{
@@ -271,6 +297,14 @@ static const struct dmi_system_id msi_quirks[] = {
 		},
 		.driver_data = &quirk_gen2,
 	},
+	{
+		.ident = "MSI Claw A8 BZ2EM",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-1T8K"),
+		},
+		.driver_data = &quirk_gen3,
+	},
 	{ }
 };
 
@@ -862,6 +896,8 @@ static int data_get_addr(struct msi_wmi_platform_data *data,
 		return MSI_PLATFORM_PL1_ADDR;
 	case MSI_ATTR_PPT_PL2_SPPT:
 		return MSI_PLATFORM_PL2_ADDR;
+	case MSI_ATTR_PPT_PL3_FPPT:
+		return MSI_PLATFORM_PL3_ADDR;
 	default:
 		pr_warn("Invalid attribute id %d\n", id);
 		return -EINVAL;
@@ -1150,6 +1186,15 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 			return err;
 	}
 
+	if (data->quirks->pl3_max) {
+		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL3_FPPT,
+				       &fw_attr_type_int, data->quirks->pl3_min,
+				       data->quirks->pl3_max, &data_get_value,
+				       &data_set_value);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -1421,6 +1466,31 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 	return 0;
 }
 
+static int msi_wmi_platform_disable_stapm(struct msi_wmi_platform_data *data)
+{
+	u8 buffer[32] = { 0 };
+	int ret;
+
+	buffer[0] = MSI_PLATFORM_AMDSTAPM_ADDR;
+
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	/* Only touch it if firmware self-reports STAPM support */
+	if (!(buffer[1] & MSI_PLATFORM_AMDSTAPM_SUPPORTED))
+		return 0;
+
+	buffer[0] = MSI_PLATFORM_AMDSTAPM_ADDR;
+	buffer[1] |= MSI_PLATFORM_AMDSTAPM_DISABLE;
+
+	ret = msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *data)
 {
 	if (!data->quirks->shift_mode)
@@ -1460,6 +1530,12 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
 	if (ret < 0)
 		return ret;
 
+	if (data->quirks->disable_stapm) {
+		ret = msi_wmi_platform_disable_stapm(data);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msi_wmi_platform_ec_init(data);
 	if (ret < 0)
 		return ret;
-- 
2.55.0

