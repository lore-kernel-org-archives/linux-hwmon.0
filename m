Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705E55F863
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Mar 2024 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709633776; cv=none; b=tpjo64JeCngKcUhuMrAPSN+gSvbpyWNX3Kd7p1yozxRBcGFSjDMnDmYUsIZHn6Zq5CkRBUrSs4XcPyQbkModtr3r95BY+FhPvC8ne/fkx5N+4Dg8k2KbALCSrFXYTKK1rT9PFykMflaLs85XJoPjpemY/p8b6QS7B7qtIHfCX0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709633776; c=relaxed/simple;
	bh=b6RJaB6sumGJFM2Uj0ceavLrEbxNxnUwPdzTbSlLs1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqj6tJBQrsRGD4fA6caWTvXEJjcD8R6A7sICzlFM0tTLJ3Prx+3sOndcKcfbooPK/LX+x46oT4Uoc2Axq836iNJUQur6NayZt8A28syfJDXYJGQlOo+I4tZLmB05paftEHWv3Wf1fhZUo1hU8QIgGAO934X4++yEUkOAacUQXME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Z+F4bEeA; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Z+F4bEeA"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7dacc916452so1641859241.0
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Mar 2024 02:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1709633773; x=1710238573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eAz82ZIOSvKn3Q+VG6kky/x7f26GA/KRM2I3Q+2YtI=;
        b=Z+F4bEeAe6EHrvVMD9bwsoTJz59Jz0OGNdK9l0E4v0pljjmE18Rbacu9mGm/lc5Y09
         Oa95SoEIXRm0BhFBapixbXU9XjJnS/QGLjaEDe4RF7l5vJ4PYDjq532mDMu0itMxjl5a
         aM5tFekrNJnbqSHs8XzfC95A6tS2O9BEUuaU2w09tyb7vZo/z87VSYWMUpTA8ddK6/to
         aa9DnYslNfNIHuPPDs6kfQPSH6dOu21UrLJIEW2pScqnWp3xoCkDmBc0LNIxpA0rMTAe
         wBiii4SLcGbeXikYVDdP0r/6oGzrI6E8IomVPue5LB9IRbvUq8G2c3D1zfLBqYYsRjpJ
         apKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633773; x=1710238573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eAz82ZIOSvKn3Q+VG6kky/x7f26GA/KRM2I3Q+2YtI=;
        b=SfiFlZTuGuwnhys7JNhV/mCKQPLJEKK89Kk6NW2sCtdhG0JaZvfe2B5IbvohSIiIU/
         DVso/WMKO2Y8jRiTdQeL2q4iL9A+p7wh0zkezd901zUuGQEnC+bIY7VwFsAOwSiuxhki
         8Prpf05CIsWvPIWgUQyN+HVWnAWQHbhdAcPOzC9ANDao1VnM/3mG8IMlPLGaBIA0WjkL
         SOl4Y78V2EcY0FdqBi1m6tEwNdl5uVsG7DCji7jkRUTuzSJajuo8i5LR+XL8jJy9E5vg
         Wh8QQxVXILDWpoQghT0krHdwWEb94vAhIuhb7EEfBuZk0AW8L5nGyj03N0PhP6XlHTuf
         kVKg==
X-Forwarded-Encrypted: i=1; AJvYcCWufgwSiiifmtuCpHDxSU59vKx/dCT4icvJA/h3Lr3ITszNkqemTBtAvGZHoDOP7DiKmhqr0ky4BSq0vFnqCo7/UDt3Fn2q3yPbUv8=
X-Gm-Message-State: AOJu0YwL8G5iYiBToebUVJFeQg89PVJTjjD0tVjkUjyc4kEtyk7kkxkG
	+niH8A24Pe34yeEOJ2KvopIEDgEgC/eYfQJx5NH3YcImSI/ndxZApZ1F6x6Kako=
X-Google-Smtp-Source: AGHT+IHqLKcI9j3SEC5wxY+r6RQNAXrTu2EzmDh6YpNMF0bSgCmN8TP6y/sZZAZQjlOYYACcg1oCOA==
X-Received: by 2002:a05:6102:5094:b0:471:e440:6604 with SMTP id bl20-20020a056102509400b00471e4406604mr1366885vsb.32.1709633773024;
        Tue, 05 Mar 2024 02:16:13 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h30-20020a0561023d9e00b0046d2d45d7cfsm1877089vsv.16.2024.03.05.02.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 02:16:12 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] hwmon: (pmbus/mp2975) Fix IRQ masking
Date: Tue,  5 Mar 2024 15:46:07 +0530
Message-ID: <20240305101608.2807612-1-naresh.solanki@9elements.com>
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

Changes in V2:
1. Add/Update comment
2. Update SWAP define to include both variable.
3. Add defines for each bits of SMBALERT mask.
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

