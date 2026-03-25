Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC72DE709
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462600; cv=none; b=D0JVJkwmdkW86sb3LbOS8iSIJPdtq2dFsLyLrUtoTPQolmC/tlhIUDRtQj3lhONQj/u9shWnyGli0lcEwAUJChyM93i5YAhprRp9xreL10aT4hXuNAlviVEjF5urNysRfs9xNlMS1pxG9tPb2F6h+GTS/5+9eSKkfukv7uySNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462600; c=relaxed/simple;
	bh=TPNIT5B/hzIppje9LRvDTIkwb7/j7rwtwNsjfN7Fnak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXNZ2VqOW8Wtj8b5npVvHBCP2K1GcS/hCaBAuNSxJgMqb40kUMO8lIkA3PmgOL7fHQi3naNPIoiAdFKuBC9u8Oa/gQOvDy0hJb+uH2i80qWEIRT6Z7jRJeIwghjQWfr9xWfHbn+0K4j5g8D3tXQOrCIOTPfIcU2oK7rd+BUJ9+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+E8ESfc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+E8ESfc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b04fc8851cso1156425ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462597; x=1775067397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+EhV/KTov9zfKfytMuVz0Aquz4kmJntbxzK8RLzan8=;
        b=C+E8ESfcJWjk2qwk49Vll0kgRtW4iXiztHUyyR4d7V54w2TZ50DDHO/dCsUy1hbCLE
         mwTfKVkphA26JGeKy3+y8t4kvAMdRz+Qt/uv4lzlvNa34S2DwacSkS3oXhAjjwpOGVlV
         +7Qx0qN6ji32CUeUpcWUYaGrOqQublBE0bviYyhlkhqV63Ioxp7OJW7YCd/DvrT17i72
         AiPlGBUJBju/JrzF/Vg5uCEgDyrLEVUctRrBMmURLFCZJQ04gqqXLsb2AOSCxDS1yAIx
         9/qa8R+RXsoPeZPFdpb4g1VVJydt8J5rKkbocMUpQWddh6JvzuZd+fQPthrP8OiQHxFs
         4E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462597; x=1775067397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+EhV/KTov9zfKfytMuVz0Aquz4kmJntbxzK8RLzan8=;
        b=VgceraA3nWJ3nxRn6wh4laFr7TBzYcne/72n1ManFs/mOa10/afD5n2bW3SRirgOwp
         7qtJY3Rhx/c0ugMlYUKu6hg6tJta8Epk3Jsvziu39d7wdXX2Ei/MGLCdKF4etZqDmYGn
         HRMUE9dQ9XkflZsyQ4iJqgxKKR2zRMFAQ25/ZNJFDnGEVhtQiiXGIuQAVMhQXF6nuaTI
         20YJtHwEF3nTOF9MtJ9OoDS83NStcECywZ6h/E1afu+PvpcdwSLD1xdTjkahA8YCPQ3q
         VfrRmNAXfpeV3LaA30p+Ozd6Y3Z0PZGlmBkLEaK2W/4F7xzOZ+Vztei6PMgAb3m6LnzO
         g/nQ==
X-Gm-Message-State: AOJu0Yyhg3ICNaoGOyxmAjWQx+hQ+wFiOXuM29+gGYhcW8u5XJyXDJwo
	2jWjr++VbvCabw7CKmHFXFDSfHtfBaymzbmytikykIJ0RHBB1bKruMsNRgyvgw==
X-Gm-Gg: ATEYQzxIoKBJZDqpuG6D7dwnkez+grTh+8tOGPeklkLsHxfH4B2ezexifIWTmO9OmI1
	ssAD6Y+7B89E9PZBciOYDpdYVJXhamXQuTbVGTiWD25xfY+05LcmHchh3IJ1iHt2vq7h5dCV6la
	eP12V8dX0c5kmwFw/GAJNme5nytvgXmCa70Y2buuatWYzLWLJurZnTUbZ2eTUCuloZu/iUMGA0Y
	vGNCCcqZATNNpCvOYiKQ4rEfs/xhWGnLLUNHj0zpQMMowcl/8mvql2fNdNE+YUv+0b1yX230Kl6
	hRgvwB4YiUOhbOJwHBkecqTHF+5ooYohcpRVHNxgglXqfj4E6Iam7WTtqV/Uq9x1T427GKazkm1
	XWD14qyLwJq6m9IdlJ+LZ5Yo2w0E6JxilD4LjwnI0cpaVdyh4sT0yMsN1fMKkf1OhCkcXhtQcdf
	9C6nXQW/kdcanhnRfU0iULrtP5yF7gOzzANyuY
X-Received: by 2002:a17:902:d58c:b0:2b0:5050:261d with SMTP id d9443c01a7336-2b0b0b1dbb3mr46808065ad.50.1774462597504;
        Wed, 25 Mar 2026 11:16:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc911530sm6521905ad.78.2026.03.25.11.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:16:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] hwmon: (pmbus) Mark lowest/average/highest/rated attributes as read-only
Date: Wed, 25 Mar 2026 11:16:27 -0700
Message-ID: <20260325181631.17259-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325181631.17259-1-linux@roeck-us.net>
References: <20260325181631.17259-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writing those attributes is not supported, so mark them as read-only.

Prior to this change, attempts to write into these attributes returned
an error.

Mark boolean fields in struct pmbus_limit_attr and in struct
pmbus_sensor_attr as bit fields to reduce configuration data size.
The data is scanned only while probing, so performance is not a concern.

Fixes: 6f183d33a02e6 ("hwmon: (pmbus) Add support for peak attributes")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 48 ++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..ecd1dddcbe0f 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1495,8 +1495,9 @@ static int pmbus_add_label(struct pmbus_data *data,
 struct pmbus_limit_attr {
 	u16 reg;		/* Limit register */
 	u16 sbit;		/* Alarm attribute status bit */
-	bool update;		/* True if register needs updates */
-	bool low;		/* True if low limit; for limits with compare functions only */
+	bool readonly:1;	/* True if the attribute is read-only */
+	bool update:1;		/* True if register needs updates */
+	bool low:1;		/* True if low limit; for limits with compare functions only */
 	const char *attr;	/* Attribute name */
 	const char *alarm;	/* Alarm attribute name */
 };
@@ -1511,9 +1512,9 @@ struct pmbus_sensor_attr {
 	u8 nlimit;			/* # of limit registers */
 	enum pmbus_sensor_classes class;/* sensor class */
 	const char *label;		/* sensor label */
-	bool paged;			/* true if paged sensor */
-	bool update;			/* true if update needed */
-	bool compare;			/* true if compare function needed */
+	bool paged:1;			/* true if paged sensor */
+	bool update:1;			/* true if update needed */
+	bool compare:1;			/* true if compare function needed */
 	u32 func;			/* sensor mask */
 	u32 sfunc;			/* sensor status mask */
 	int sreg;			/* status register */
@@ -1544,7 +1545,7 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
 			curr = pmbus_add_sensor(data, name, l->attr, index,
 						page, 0xff, l->reg, attr->class,
 						attr->update || l->update,
-						false, true);
+						l->readonly, true);
 			if (!curr)
 				return -ENOMEM;
 			if (l->sbit && (info->func[page] & attr->sfunc)) {
@@ -1707,23 +1708,28 @@ static const struct pmbus_limit_attr vin_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_READ_VIN_AVG,
 		.update = true,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_VIN_MIN,
 		.update = true,
+		.readonly = true,
 		.attr = "lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_VIN_MAX,
 		.update = true,
+		.readonly = true,
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_VIN_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_VIN_MIN,
+		.readonly = true,
 		.attr = "rated_min",
 	}, {
 		.reg = PMBUS_MFR_VIN_MAX,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -1776,23 +1782,28 @@ static const struct pmbus_limit_attr vout_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_READ_VOUT_AVG,
 		.update = true,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_VOUT_MIN,
 		.update = true,
+		.readonly = true,
 		.attr = "lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_VOUT_MAX,
 		.update = true,
+		.readonly = true,
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_VOUT_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_VOUT_MIN,
+		.readonly = true,
 		.attr = "rated_min",
 	}, {
 		.reg = PMBUS_MFR_VOUT_MAX,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -1852,20 +1863,24 @@ static const struct pmbus_limit_attr iin_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_READ_IIN_AVG,
 		.update = true,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_IIN_MIN,
 		.update = true,
+		.readonly = true,
 		.attr = "lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_IIN_MAX,
 		.update = true,
+		.readonly = true,
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_IIN_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_IIN_MAX,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -1889,20 +1904,24 @@ static const struct pmbus_limit_attr iout_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_READ_IOUT_AVG,
 		.update = true,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_IOUT_MIN,
 		.update = true,
+		.readonly = true,
 		.attr = "lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_IOUT_MAX,
 		.update = true,
+		.readonly = true,
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_IOUT_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_IOUT_MAX,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -1943,20 +1962,24 @@ static const struct pmbus_limit_attr pin_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_READ_PIN_AVG,
 		.update = true,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_PIN_MIN,
 		.update = true,
+		.readonly = true,
 		.attr = "input_lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_PIN_MAX,
 		.update = true,
+		.readonly = true,
 		.attr = "input_highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_PIN_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_PIN_MAX,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -1980,20 +2003,24 @@ static const struct pmbus_limit_attr pout_limit_attrs[] = {
 	}, {
 		.reg = PMBUS_VIRT_READ_POUT_AVG,
 		.update = true,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_POUT_MIN,
 		.update = true,
+		.readonly = true,
 		.attr = "input_lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_POUT_MAX,
 		.update = true,
+		.readonly = true,
 		.attr = "input_highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_POUT_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_POUT_MAX,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -2049,18 +2076,22 @@ static const struct pmbus_limit_attr temp_limit_attrs[] = {
 		.sbit = PB_TEMP_OT_FAULT,
 	}, {
 		.reg = PMBUS_VIRT_READ_TEMP_MIN,
+		.readonly = true,
 		.attr = "lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_TEMP_AVG,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_TEMP_MAX,
+		.readonly = true,
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_TEMP_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_MAX_TEMP_1,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -2090,18 +2121,22 @@ static const struct pmbus_limit_attr temp_limit_attrs2[] = {
 		.sbit = PB_TEMP_OT_FAULT,
 	}, {
 		.reg = PMBUS_VIRT_READ_TEMP2_MIN,
+		.readonly = true,
 		.attr = "lowest",
 	}, {
 		.reg = PMBUS_VIRT_READ_TEMP2_AVG,
+		.readonly = true,
 		.attr = "average",
 	}, {
 		.reg = PMBUS_VIRT_READ_TEMP2_MAX,
+		.readonly = true,
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_TEMP2_HISTORY,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_MAX_TEMP_2,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
@@ -2131,6 +2166,7 @@ static const struct pmbus_limit_attr temp_limit_attrs3[] = {
 		.sbit = PB_TEMP_OT_FAULT,
 	}, {
 		.reg = PMBUS_MFR_MAX_TEMP_3,
+		.readonly = true,
 		.attr = "rated_max",
 	},
 };
-- 
2.45.2

