Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53830DD22
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876593; cv=none; b=D2AuZh+PiC4fSxuihJRQyOquKD+W9cN+iDWBjzuvBmH6s3a92fUB1VE7mVeQ4lx0yurIgS587rUTmWKWu/gj0YuJhI0IvUQRAS3F1+8D1yGxfjtgi1iVGyoV/CtlAnXdNckSxqoGLUWGW4R8JnmYFF7PBrv0XGW1o5qEEwFW5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876593; c=relaxed/simple;
	bh=nxihr4bM6SwoIuP74JqPO4CIieT/EQFFXuYBb7z27Jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jvK60rDjeu54mccFRJPciT2ZEYCLCPUf8vT9FZ28jRLjaRvbRnhu5EY+IcenJ0kAQtEtIaqIN63MPVhIDtmezTQ6CdbDPt1Tta5SnmTv52AJYmn3F1dCxYPeTZuSfuROyqjR79fEWalJVtxOhr4ITUlqfTtiID53HoNSG/2awf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYD30+sd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYD30+sd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0c20ee83dso27568775ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 01:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765876591; x=1766481391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ye8yEV1eGUuHWu7Z7vTP0U9+3pJnrq/4OhS7TgVXGKM=;
        b=NYD30+sdPGsC6Y4scON+QHFtrF0Fq0PQyblnO4O/78ls/7iesTdKjtSdT1XMm8uNBD
         rUC0/SIQa36VtHPq4DBrC9N306EDaYlZRfe3ycuKjamKcTxCOh4Rcudmm2ry87eYyT96
         0Qg8bgGYI0z2EruKgi8kRyzdDRJZVLiSLzrAU19V6+SOLWga4RKMnK5Obtr51XYJtsVT
         OYbuBkO5KuhNDGvVJNnGJZTnDYkbfOE/EEZB9kh91ceXRFyNdcIIYwzDfaTovaVq3diZ
         77clJgYuN10/8RE6VNWyPKRZSOJ0ClEnfLk6SO2GXYhP82N24nMCKPGYbyWdEFVRH9Hh
         HRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876591; x=1766481391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ye8yEV1eGUuHWu7Z7vTP0U9+3pJnrq/4OhS7TgVXGKM=;
        b=cpsAx6ODiIuFqmSF1TUhpieSJeCLsTKeeH8wvgXblAw9OW/Qyxvh7SALA91JyaHgHQ
         Hxs85bHpKtTqOCXT9oVHBL1nqElf0yf3tQmRGTXXnf29xqoZUqZaBmYGdiqBfKOhFcnB
         jbGyfHjVTPygahmNF2IegFvcNfB3r9Zt0EhxekFZuVgImaydfxloqlH7rcb9fUI4xYXf
         BwhR4Vxu5CkGhdJwwp8m2GCaiBMeAoj1EU1udoFkVZGwZRAKjRqw9en47qSQr5RBQINP
         D4trEecLzR5Ha3/v4KHtNV50keYaU9htsLFBJ17efslK7+V+jvK5LhnZuTkXgbTQ3b2P
         AuFA==
X-Forwarded-Encrypted: i=1; AJvYcCWnlPFzn/Hj7Vs6meUffKIFZrnr1wpbx3URQsaz6FqkMAhaEGmnlroQ8zkwYmeMaPXvwFq11wpgfMGELg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfFczcDsyxECGXXO7XLEk+JbfKMLquC1akS3OPxFdsj8lDZRsT
	PlMDnVXHHvg97U4O68rFDkelu+WdYC9s3jClRIaq4sh7+gnlR5BxJjNq
X-Gm-Gg: AY/fxX4Ab+Vuzp+5Wn48z01pW5r34DdukxjEaY8JJqaHhTxmaRFEwKM71DorZToIxCt
	ynafQ+2CgahdatrXrSbKKR+WFPAqQH4SMpqL1kLOpPcZQk9FfmNQLJFpqoqdSVKcrOaRoDpZAx6
	/DTird0veiDt5ltdJVW08JkI3+84fj5/MM1ko3tmwpHnUXkh9zqz/UrdEenYyPb6aep1OdmueTV
	hZTA/EFLj0WZbh6lwVJGPDWi/jXDovhEZuqI2wvI6j3olcJE3ycPJM+HjVueINXsQcKYxlN6cSV
	xpw9/qgdVVxXqagy8G+C0O7cMHxbSFl06WPE/m6Y3DNgckk+MV8hwXNS05HVywhjDuGgy+eQTmx
	5DNlmTJ8N9/P7OBRSNzp1VDbykAHUitD4mSzvwve7BaZn6n5HmW/EKQgrBmOGOei0USsmW1R05n
	uWI/iTekNEEGTnVFXVe7Yj4d/ogm2Qi90t4WEsNkItXl1HvLd834yhWyyLlLUCaLb0KK592x4=
X-Google-Smtp-Source: AGHT+IF6aIbidUCfbgp7219SCW8FyhJj+uv7pq1JYb1F1cjKkTnBJO2LF9Y92roiq0o5WhzYVsur4A==
X-Received: by 2002:a17:902:f68a:b0:2a0:c1be:f436 with SMTP id d9443c01a7336-2a0c1bef542mr79424005ad.59.1765876591045;
        Tue, 16 Dec 2025 01:16:31 -0800 (PST)
Received: from JF.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d50f9fsm156470525ad.44.2025.12.16.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:16:30 -0800 (PST)
From: Jeff Lin <jefflin994697@gmail.com>
To: linux@roeck-us.net
Cc: jefflin994697@gmail.com,
	grantpeltier93@gmail.com,
	karanja99erick@gmail.com,
	chiang.brian@inventec.com,
	krzk@kernel.org,
	william@wkennington.com,
	tzungbi@kernel.org,
	thorsten.blum@linux.dev,
	ninad@linux.ibm.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (pmbus) Add support for multiple-function pin
Date: Tue, 16 Dec 2025 17:16:16 +0800
Message-Id: <20251216091617.2581192-2-jefflin994697@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216091617.2581192-1-jefflin994697@gmail.com>
References: <20251216091617.2581192-1-jefflin994697@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some pmbus chip support the additional multiple-function pin, which can
detect and provide the connected device's current reading. The data
format of the multiple-function ping must be confirmed with the chip
vendor, as it may vary between different chips. However, it is
problematic if the data format differs from the original 'iin' and 'iout'
and we want to show both the current from multiple-function pin and the
original 'iin' and 'iout'.

To solve the problem, add support for additional virtual current input
and virtual current output, call it 'viin' and 'viout', respectively.

Signed-off-by: Jeff Lin <jefflin994697@gmail.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 12 ++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d2e9bfb5320f..8a1c3a7a4f32 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -236,6 +236,14 @@ enum pmbus_regs {
 	PMBUS_VIRT_CURR_SAMPLES,
 	PMBUS_VIRT_POWER_SAMPLES,
 	PMBUS_VIRT_TEMP_SAMPLES,
+
+	/* Multiple function pin
+	 *
+	 * Drivers wanting to expose the value from multiple function pin
+	 * should implement support in read_word_data callback.
+	 */
+	PMBUS_VIRT_READ_IIN,
+	PMBUS_VIRT_READ_IOUT,
 };
 
 /*
@@ -381,6 +389,8 @@ enum pmbus_sensor_classes {
 	PSC_TEMPERATURE,
 	PSC_FAN,
 	PSC_PWM,
+	PSC_VIRT_CURRENT_IN,
+	PSC_VIRT_CURRENT_OUT,
 	PSC_NUM_CLASSES		/* Number of power sensor classes */
 };
 
@@ -411,6 +421,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_PWM12	BIT(20)
 #define PMBUS_HAVE_PWM34	BIT(21)
 #define PMBUS_HAVE_SAMPLES	BIT(22)
+#define PMBUS_HAVE_VIRT_IIN	BIT(23)
+#define PMBUS_HAVE_VIRT_IOUT	BIT(24)
 
 #define PMBUS_PHASE_VIRTUAL	BIT(30)	/* Phases on this page are virtual */
 #define PMBUS_PAGE_VIRTUAL	BIT(31)	/* Page is virtual */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..9a8eec5d3945 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1929,6 +1929,16 @@ static const struct pmbus_sensor_attr current_attributes[] = {
 		.gbit = PB_STATUS_IOUT_OC,
 		.limit = iout_limit_attrs,
 		.nlimit = ARRAY_SIZE(iout_limit_attrs),
+	}, {
+		.reg = PMBUS_VIRT_READ_IIN,
+		.class = PSC_VIRT_CURRENT_IN,
+		.label = "viin",
+		.func = PMBUS_HAVE_VIRT_IIN
+	}, {
+		.reg = PMBUS_VIRT_READ_IOUT,
+		.class = PSC_VIRT_CURRENT_OUT,
+		.label = "viout",
+		.func = PMBUS_HAVE_VIRT_IOUT
 	}
 };
 
@@ -2501,6 +2511,14 @@ static const struct pmbus_class_attr_map class_attr_map[] = {
 		.class = PSC_TEMPERATURE,
 		.attr = temp_attributes,
 		.nattr = ARRAY_SIZE(temp_attributes),
+	}, {
+		.class = PSC_VIRT_CURRENT_IN,
+		.attr = current_attributes,
+		.nattr = ARRAY_SIZE(current_attributes),
+	}, {
+		.class = PSC_VIRT_CURRENT_OUT,
+		.attr = current_attributes,
+		.nattr = ARRAY_SIZE(current_attributes),
 	}
 };
 
-- 
2.34.1

