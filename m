Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4264D59E
	for <linux-hwmon@vger.kernel.org>; Mon,  4 Mar 2024 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709570705; cv=none; b=N0VzoOaeRSLbdaLHIoEO8P6EojgF/aYJq/CPGwHboXMgcjwy1cD5JCe3tQ+lNRmTtinSMh5idR+vXAVVZCOJYdu5A8BbiHEQHcmiJWUEsNbnM6ifeS9LhMDvk7VWexfJ3QvHF1VuNxJ5bgebAfxLClY000Ozh/T+jrKqZQ7565o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709570705; c=relaxed/simple;
	bh=c0nOlOGVKnbvZd0aqgDLKYGxvgeBthYhCQaGDdivyEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TPa0cSqsp4Z1uWbCBnHFVwtT6cqkEKVkr5wS7gfxvNOpQWBlLE12E8sxqBPhxWjqGlOC5Vrm+pK+FqwvItvCg5+qHRHq3woTo/GwiU4+RcONCQs6ViWrtAlwWuBRUikPmBzhpdXKQWK/z1k4/d60WanEeM/qggjgEQ61SSQshPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=SdOoF4mr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="SdOoF4mr"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a28a6cef709so772455266b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Mar 2024 08:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1709570702; x=1710175502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0FiBP+//kknF4KTWR0RQTkCl2jmVnjkFryXNaTnTKI=;
        b=SdOoF4mrSlAdjK9UaeVBwgi4DdH+MCwVNUgesfP1i8NU1A4JVITvV2ls/TY5iHa++C
         /ARcvjNIn/LzZmI6l6VWNXW7TRPG7On8w2U74KlwEG04Gh7usZxOxB07mPh1zNC3Wz1P
         +dgftEU4v3RH3DNHmLwps3hGNfKjmrllrRDb/refdSZBMowKw3RdblLSmRDtxeR184eS
         5DDCw0RI2USWcRfW2h6kSONvYfODJ15egDv75sUijxsWfbv1/iDcL0KudUkjs4XDhncO
         nIbCG1pmpm4MGxyFxNPpb7ssSKszDa2AJiEraCb+rxreyKr94UNVBNENtr9da+5r0g0C
         Q3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570702; x=1710175502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0FiBP+//kknF4KTWR0RQTkCl2jmVnjkFryXNaTnTKI=;
        b=fjCAOW5ZjAfvAurCQdz7uzgnECXu2XxFTPz2ycY4jJTzArl8hcMFINESfZBzRnnqES
         mW/6A+txZT5im0LEkHSVm295fkHUAryYiesl7v2LjiN2mNOgEgXdbfoSV55ufvmD+fYq
         HauoERjv4KSq+CuGaWvbi5ZwSi0IRRYuSwmeWHKJ6eo+z2R+bCU2WvszG4RlGUdd6o2y
         wUSJ0T/4X7UkHZflHL6Ft4JHhTjWhxngm3D3Qby6URaw4IY29F+YdzutaLvBNRKSL0Pj
         h+GXqdUL7GxP1oX6dccPxfijps5Avfti5P4/8unP+errFkkeKuEhEdVouKlSP3yGcvMQ
         RPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmYXaBw+WODktFRQYrzU8+ltvE0NMxgfh1CbWbZ+CF7WuisDsj8TK4WsewkjQs2KIzUZ3ko8q6RwIc5miMqLLH1m+rwkaYFSoqvn4=
X-Gm-Message-State: AOJu0YyEns28JR0dWP/RzE76dGV46IZ3m6owpqcjH89KvX5pnzXbVz5+
	Iy8K7HC0FBIWhGFgXeXharXKdLYipqC8qyj1Y6++YclAy/hB8wbYMCUUzueSXkY=
X-Google-Smtp-Source: AGHT+IFthzWupti03xmrvDkDDb409q1iZzMy1+qIF98CiKTob9vlGgRjPGGQxXx6uxpB2vQieX3Pow==
X-Received: by 2002:a17:906:b014:b0:a44:c6b4:ee4b with SMTP id v20-20020a170906b01400b00a44c6b4ee4bmr4831161ejy.25.1709570701689;
        Mon, 04 Mar 2024 08:45:01 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id tj7-20020a170907c24700b00a413d1eda4bsm5039616ejc.87.2024.03.04.08.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 08:45:01 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (pmbus/mp2975) Fix IRQ masking
Date: Mon,  4 Mar 2024 22:14:45 +0530
Message-ID: <20240304164446.4153915-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The MP2971/MP2973 use a custom 16bit register format for
SMBALERT_MASK which doesn't follow the PMBUS specification.

Map the PMBUS defined bits used by the common code onto the custom
format used by MPS and since the SMBALERT_MASK is currently never read
by common code only implement the mapping for write transactions.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/pmbus/mp2975.c | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index e5fa10b3b8bc..766026204d88 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -392,6 +392,82 @@ static int mp2973_read_word_data(struct i2c_client *client, int page,
 	return ret;
 }
 
+static int mp2973_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	u8 target, mask;
+	int ret;
+
+	if (reg != PMBUS_SMBALERT_MASK)
+		return -ENODATA;
+
+	/*
+	 * Vendor-specific SMBALERT_MASK register with 16 maskable bits.
+	 */
+	ret = pmbus_read_word_data(client, 0, 0, PMBUS_SMBALERT_MASK);
+	if (ret < 0)
+		return ret;
+
+	target = word & 0xff;
+	mask = word >> 8;
+
+/*
+ * Set/Clear 'bit' in 'ret' based on condition followed by define for each bit in SMBALERT_MASK.
+ * Also bit 2 & 15 are reserved.
+ */
+#define SWAP(cond, bit) (ret = (mask & cond) ? (ret & ~BIT(bit)) : (ret | BIT(bit)))
+
+#define MP2973_TEMP_OT		0
+#define MP2973_VIN_UVLO		1
+#define MP2973_VIN_OVP		3
+#define MP2973_MTP_FAULT	4
+#define MP2973_OTHER_COMM	5
+#define MP2973_MTP_BLK_TRIG	6
+#define MP2973_PACKET_ERROR	7
+#define MP2973_INVALID_DATA	8
+#define MP2973_INVALID_COMMAND	9
+#define MP2973_IOUT_OC_LV	10
+#define MP2973_IOUT_OC		11
+#define MP2973_VOUT_MAX_MIN_WARNING 12
+#define MP2973_VOLTAGE_UV	13
+#define MP2973_VOLTAGE_OV	14
+
+	switch (target) {
+	case PMBUS_STATUS_CML:
+		SWAP(PB_CML_FAULT_INVALID_DATA, MP2973_INVALID_DATA);
+		SWAP(PB_CML_FAULT_INVALID_COMMAND,  MP2973_INVALID_COMMAND);
+		SWAP(PB_CML_FAULT_OTHER_COMM, MP2973_OTHER_COMM);
+		SWAP(PB_CML_FAULT_PACKET_ERROR, MP2973_PACKET_ERROR);
+		break;
+	case PMBUS_STATUS_VOUT:
+		SWAP(PB_VOLTAGE_UV_FAULT, MP2973_VOLTAGE_UV);
+		SWAP(PB_VOLTAGE_OV_FAULT, MP2973_VOLTAGE_OV);
+		break;
+	case PMBUS_STATUS_IOUT:
+		SWAP(PB_IOUT_OC_FAULT, MP2973_IOUT_OC);
+		SWAP(PB_IOUT_OC_LV_FAULT, MP2973_IOUT_OC_LV);
+		break;
+	case PMBUS_STATUS_TEMPERATURE:
+		SWAP(PB_TEMP_OT_FAULT, MP2973_TEMP_OT);
+		break;
+	/*
+	 * Map remaining bits to MFR specific to let the PMBUS core mask
+	 * those bits by default.
+	 */
+	case PMBUS_STATUS_MFR_SPECIFIC:
+		SWAP(BIT(1), MP2973_VIN_UVLO);
+		SWAP(BIT(3), MP2973_VIN_OVP);
+		SWAP(BIT(4), MP2973_MTP_FAULT);
+		SWAP(BIT(6), MP2973_MTP_BLK_TRIG);
+		break;
+	default:
+		return 0;
+	}
+#undef SWAP
+
+	return pmbus_write_word_data(client, 0, PMBUS_SMBALERT_MASK, ret);
+}
+
 static int mp2975_read_word_data(struct i2c_client *client, int page,
 				 int phase, int reg)
 {
@@ -907,6 +983,7 @@ static struct pmbus_driver_info mp2973_info = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
 		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
 	.read_word_data = mp2973_read_word_data,
+	.write_word_data = mp2973_write_word_data,
 #if IS_ENABLED(CONFIG_SENSORS_MP2975_REGULATOR)
 	.num_regulators = 1,
 	.reg_desc = mp2975_reg_desc,

base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
-- 
2.42.0

