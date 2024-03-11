Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ACF22F07
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2024 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149012; cv=none; b=LQD+rY1ugJEA+yJeW3a4KEwHHVS8SyOnFJH1ZARnQxhtBjbTxYfrE6+hrqzcujlH2IasQkYl545OYFTj1T+J32M0oTIc5rfoUs+ojF3pGsrTFpGmlEqzrgz2cpSCz8RN7cANqVun5p/SCc6vR6Aito0CjWlXhii4LdMKfmEYQL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149012; c=relaxed/simple;
	bh=E7XSj0pyzwRnbhEItgfs1Biw2IzEoXA27lamXCSeXf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ktYBYv4YyagrUwtLG0LMHME6/MwoyovHPItaccXdDnC4wgVwTnnEnwyVQFWTh1KN/2RF0+q+IvWC6evQOLvCXc75lrrV44/NEkYgBagxuzn2v1aEdrr9VMo2h2LRSvKkFgaC67auDecYXinFqOrarIkBese2zh199/yP43vZlDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=RNrMsOVw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="RNrMsOVw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33e7946bddfso2047591f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2024 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1710149008; x=1710753808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWgXcsCIwNB8quceeSPfUi0wO64rrOVtbtRuUW+5aHM=;
        b=RNrMsOVwayeimLU72AzysCc7zW4jVvLZeH/OClzalKduO43mU8XnMcvJXHsVjgC9CZ
         dOTy5wNAMD5lcfs36huzqxuQJhlBV7RXgqu6r810x+8M0V6vKA6hs2EgHCQrx20aPTcV
         MuwBrYm5AmmHYCviu37kQl+UZaFQWrbrwfyHQYdAhO91KPJVk9Yc8QfbKb51hU4BIO04
         zrdqJZYhcewGl2/48haYC0qOk610MprOKvS1S+j4PnBlVT8KGcn3jB96OrA2LtmrTzF8
         BfkXj8iNXgcpYAYXXhL56pcM+Jel1Je5NltljqVz+jKW0FbvwV5WRyuj4l/BrethS6N/
         nSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149008; x=1710753808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWgXcsCIwNB8quceeSPfUi0wO64rrOVtbtRuUW+5aHM=;
        b=JSRCN4TpWfhrefenIXxmpvqxC/xULrwBDo77fZoDIUql3ITZzdoAvBZW2pKU+K2kxj
         txW3u0EAXIyXcO8tMpwZ66ZK391jEsDaDLxJHdBOPfaT42pQgeziTbUMUSX2zoQKH/Yk
         YhWJEx/mpQ7tzn+LR99PgjqZ8V41H4AENlPJT5u/4cTO40SXI5BAg4K0H3k0Hyl5BIf4
         ofP5Ugm/fu5vJzVdjdMCIQr2C3/BYwgW/s9gWMj4E1DmFygoBJJNVmGsNm/dcUu5nBCO
         pqhWn/TSZ/N37zy+ynUMWirJ9NeMSjrBFAkvNW/+lwrCd709MdY9WkRGmvApo8yS8TiP
         xssQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjQsuddMF326DbVhhTb3vd6o8Q50mHKt2wkWdibWsG0UpOgdYV4N8DlxIr0vK7B2Akf8SUhdatwEXF3IzzWODL27eng5KHclfgv3E=
X-Gm-Message-State: AOJu0Yz93qOhwQX7igDtYAV4ZAS+nNJm1l8onQ51NfA1HFGzuKwjGAuC
	Z/HAGGmm/gtF83nty8SouDuRPg50j3ewsXqBj7b/iMW5uIH9Y/7aGH1SwFJmHVU=
X-Google-Smtp-Source: AGHT+IEBVfmDyFFFPxjqooOh+1r0l5Xrnogd3rg+LM5RteCOwT8JZJQu9VwLkib2ZQNjIGnu5lsYuA==
X-Received: by 2002:adf:e483:0:b0:33e:67c7:e2c0 with SMTP id i3-20020adfe483000000b0033e67c7e2c0mr3767524wrm.38.1710149007639;
        Mon, 11 Mar 2024 02:23:27 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d4152000000b0033e745176f5sm5912370wrq.110.2024.03.11.02.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:23:27 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] hwmon: (pmbus/mp2975) Fix IRQ masking
Date: Mon, 11 Mar 2024 14:53:23 +0530
Message-ID: <20240311092323.3606694-1-naresh.solanki@9elements.com>
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

Changes in V3:
1. Avoid precedence issues in Macro
2. Optimise macro.

Changes in V2:
1. Add/Update comment
2. Update SWAP define to include both variable.
3. Add defines for each bits of SMBALERT mask.
---
 drivers/hwmon/pmbus/mp2975.c | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index e5fa10b3b8bc..953c02a2aeb5 100644
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
+#define SWAP(val, mask, cond, bit) (((mask) & (cond)) ? ((val) & ~BIT(bit)) : ((val) | BIT(bit)))
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
+		ret = SWAP(ret, mask, PB_CML_FAULT_INVALID_DATA, MP2973_INVALID_DATA);
+		ret = SWAP(ret, mask, PB_CML_FAULT_INVALID_COMMAND,  MP2973_INVALID_COMMAND);
+		ret = SWAP(ret, mask, PB_CML_FAULT_OTHER_COMM, MP2973_OTHER_COMM);
+		ret = SWAP(ret, mask, PB_CML_FAULT_PACKET_ERROR, MP2973_PACKET_ERROR);
+		break;
+	case PMBUS_STATUS_VOUT:
+		ret = SWAP(ret, mask, PB_VOLTAGE_UV_FAULT, MP2973_VOLTAGE_UV);
+		ret = SWAP(ret, mask, PB_VOLTAGE_OV_FAULT, MP2973_VOLTAGE_OV);
+		break;
+	case PMBUS_STATUS_IOUT:
+		ret = SWAP(ret, mask, PB_IOUT_OC_FAULT, MP2973_IOUT_OC);
+		ret = SWAP(ret, mask, PB_IOUT_OC_LV_FAULT, MP2973_IOUT_OC_LV);
+		break;
+	case PMBUS_STATUS_TEMPERATURE:
+		ret = SWAP(ret, mask, PB_TEMP_OT_FAULT, MP2973_TEMP_OT);
+		break;
+	/*
+	 * Map remaining bits to MFR specific to let the PMBUS core mask
+	 * those bits by default.
+	 */
+	case PMBUS_STATUS_MFR_SPECIFIC:
+		ret = SWAP(ret, mask, BIT(1), MP2973_VIN_UVLO);
+		ret = SWAP(ret, mask, BIT(3), MP2973_VIN_OVP);
+		ret = SWAP(ret, mask, BIT(4), MP2973_MTP_FAULT);
+		ret = SWAP(ret, mask, BIT(6), MP2973_MTP_BLK_TRIG);
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

base-commit: 8debe3c1295ef36958dae77487eed9cf6584c008
-- 
2.42.0

