Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D03136E3F
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Mar 2025 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742653567; cv=none; b=c8ir5INf4UmBl+cb2cWW4lWx/56PT2mBswW82X30JWjGm8uPj841iqGApI9cTvn8teoOZisWUsZ/hBLKIjmAepBbxpTx/13ghjtdxuCgNsah0iYdxoWGb8215i+ciReBRUZEKuUTnO+0AxuohZg8sL8rLIlUAJE7bThw3xAocKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742653567; c=relaxed/simple;
	bh=GdVgc4pc9sVit+WbeaojM0aG8v5gSJ8wcb+izeN1zC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hwp6PTDQDSjpIy9GpADZH7f1bD7grfQLeofY1dV1spdqhUMPqIja1QD8s0Ex95HYhBX82MbUI1FfAla43G3CVWCQyIXKspYZZuaeoeiM0b7HPEZq42lPNHdJbx8rNoL/A0qkGFeU06TfHRxmKbzGyQWM3RUKdr+2BBFwD7r0RFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8rDnwFy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8rDnwFy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22398e09e39so60965935ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Mar 2025 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742653565; x=1743258365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5irf75h/r/zK2HuzAGrLKAdXIhMWWIwhMmhbrcyYgfs=;
        b=K8rDnwFyNf04Z04M8pkIVwhLcGgpp083LoECTdv2iihINi2JrMjVFGwZ469QmWRhy8
         UCWp7ZH10+mCV//nGCmRNC4qt6dcTr0kgb098XF9Dy4ZLH7minl7kxhBoL3APg4RqHn9
         e0Qsmmv3Y+lG1veO6146g5vdZWNiABNMIwCk1RAW4DpPuXA8JlC9Rg6V3yZe5f49NLaN
         uTtyds4Vw5Gm6r3Bsy4DmVgWDMtpMVhE+o8Avz/fBp7LzRosPuU4diCJTqEwydoVTyO+
         ZUWQk4XR73b8GaJzrZRePJuHtDPSbw+7wtcMmensEmj7Xfj+vxr6XxGVKjdINbTjER8f
         +Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742653565; x=1743258365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5irf75h/r/zK2HuzAGrLKAdXIhMWWIwhMmhbrcyYgfs=;
        b=PkCP3h5zn+hvAiQanEXi7laHAn0XLT3+e0m/wFz8rLUA/TA6rAp9pMLjfT0g0JhZyS
         XTc+WiEqlRzU7gDJM+ykkUnKOdfhmDkkqAkdqIAKn2FycOz344juKEGbO3hsztjZbkkt
         fBBPcqHWEXN5/NunMImtF1cQI+QbtxhGsNN1G3R73Qcwrp54pzF0kfXJZH8a8pY0c58A
         SGpyLC7EdmYNWFxbWS/8n7DoRdYpAvVY7TvQyDCXjcBjx578NemoNzJJNy+PHbhi+WP/
         NZ4PWuDRhnlEyVtHQy8ihblpMVoIOf185ZwQ9ttAcb1sLXtMIewZaIfh3P34fTIYebqX
         jN+g==
X-Gm-Message-State: AOJu0YzFA+AHppIppmCp2YrrTW/9BCrbmpre/YWilZYXDJSguFFBOueT
	hCnmJx+QYqX5fkRX2EHa38XGPmUNodafMJYTgq7xaHOTdwDjPrDzjy5Vtg==
X-Gm-Gg: ASbGncvyLfVpUdUiYTr7K28tX15MTcsXuEqfpmWEe8z6UZtCAPv2yuPej86CiZ5S5ko
	kdvqYTeJq/fUwL80fxqP8IC1FttEe6L9Vb0eyIZ1elIvuvKn5X9ejjmhHbzNtcQ736flJqKxkpT
	t+0x13LMF3QYNRvYE2cRguoBIIBHwJWkPkV39aYaGwDTuE8pxfn2iIUzibS3j0uxdINP8ftPbRk
	7hc9S5a8mQtphXDASmWqEu0Fr1RcTBLMaLOB2eZEZ7A88Rjatd+CwUAgBNGkLwdGqwxG3px9es0
	D3nGeySTh39VFqsV5i6zyy+kodTZFpITdC2tL+nG7bZIGdz3KeFy7/pCSg==
X-Google-Smtp-Source: AGHT+IF+aS2cFWj8yL6EAFhqbrWS5WIKG92tYS12WGmk7mtsrOa8ekNlwd2OCsnJTJhIHlVRHApUog==
X-Received: by 2002:a17:903:1aae:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-22780e0b477mr127230425ad.32.1742653564777;
        Sat, 22 Mar 2025 07:26:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61b525sm8198510a91.35.2025.03.22.07.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 07:26:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Cedricjustine.Encarnacion@analog.com
Subject: [PATCH RFT/RFC] hwmon: (pmbus) Do not set regulators_node for single-channel chips
Date: Sat, 22 Mar 2025 07:26:02 -0700
Message-ID: <20250322142602.560042-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Single-channel regulators do not need and should not have a "regulators"
node. We can not entirely remove it due to existing bindings. To solve the
problem for new drivers, provide additional macros PMBUS_REGULATOR_ONE_NODE
and PMBUS_REGULATOR_STEP_ONE_NODE and convert existing drivers to use those
macros. The exception is the ir38064 driver because its devicetree files
and its description do not require or use the nested regulators node.

Modify PMBUS_REGULATOR_STEP_ONE and PMBUS_REGULATOR_ONE to set the
regulators_node pointer to NULL.

Cc: Cedricjustine.Encarnacion@analog.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RFT: Untested. Open question is if not setting .regulators_node is
     sufficient to solve the problem.
RFC: Open question is if existing bindings (if unused in-tree) should
     be converted to not require the nested "regulators" node.

 drivers/hwmon/pmbus/lm25066.c  |  2 +-
 drivers/hwmon/pmbus/mpq7932.c  |  4 ++--
 drivers/hwmon/pmbus/pmbus.h    | 18 +++++++++++++++---
 drivers/hwmon/pmbus/tda38640.c |  2 +-
 drivers/hwmon/pmbus/tps25990.c |  2 +-
 5 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 40b0dda32ea6..dd7275a67a0a 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -437,7 +437,7 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
 
 #if IS_ENABLED(CONFIG_SENSORS_LM25066_REGULATOR)
 static const struct regulator_desc lm25066_reg_desc[] = {
-	PMBUS_REGULATOR_ONE("vout"),
+	PMBUS_REGULATOR_ONE_NODE("vout"),
 };
 #endif
 
diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
index c1e2d0cb2fd0..8f10e37a7a76 100644
--- a/drivers/hwmon/pmbus/mpq7932.c
+++ b/drivers/hwmon/pmbus/mpq7932.c
@@ -51,8 +51,8 @@ static const struct regulator_desc mpq7932_regulators_desc[] = {
 };
 
 static const struct regulator_desc mpq7932_regulators_desc_one[] = {
-	PMBUS_REGULATOR_STEP_ONE("buck", MPQ7932_N_VOLTAGES,
-				 MPQ7932_UV_STEP, MPQ7932_BUCK_UV_MIN),
+	PMBUS_REGULATOR_STEP_ONE_NODE("buck", MPQ7932_N_VOLTAGES,
+				      MPQ7932_UV_STEP, MPQ7932_BUCK_UV_MIN),
 };
 #endif
 
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index ddb19c9726d6..ccc38e367195 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -508,11 +508,11 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,
 
 #define PMBUS_REGULATOR(_name, _id)   PMBUS_REGULATOR_STEP(_name, _id, 0, 0, 0)
 
-#define PMBUS_REGULATOR_STEP_ONE(_name, _voltages, _step, _min_uV)  \
+#define __PMBUS_REGULATOR_STEP_ONE(_name, _node, _voltages, _step, _min_uV)  \
 	{							\
 		.name = (_name),				\
 		.of_match = of_match_ptr(_name),		\
-		.regulators_node = of_match_ptr("regulators"),	\
+		.regulators_node = of_match_ptr(_node),		\
 		.ops = &pmbus_regulator_ops,			\
 		.type = REGULATOR_VOLTAGE,			\
 		.owner = THIS_MODULE,				\
@@ -522,7 +522,19 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,
 		.init_cb = pmbus_regulator_init_cb,		\
 	}
 
-#define PMBUS_REGULATOR_ONE(_name)   PMBUS_REGULATOR_STEP_ONE(_name, 0, 0, 0)
+/*
+ * _NODE macros are defined for historic reasons and MUST NOT be used in new
+ * drivers.
+ */
+#define PMBUS_REGULATOR_STEP_ONE_NODE(_name, _voltages, _step, _min_uV)  \
+	__PMBUS_REGULATOR_STEP_ONE(_name, "regulators", _voltages, _step, _min_uV)
+
+#define PMBUS_REGULATOR_ONE_NODE(_name)	PMBUS_REGULATOR_STEP_ONE_NODE(_name, 0, 0, 0)
+
+#define PMBUS_REGULATOR_STEP_ONE(_name, _voltages, _step, _min_uV)  \
+	__PMBUS_REGULATOR_STEP_ONE(_name, NULL, _voltages, _step, _min_uV)
+
+#define PMBUS_REGULATOR_ONE(_name)	PMBUS_REGULATOR_STEP_ONE(_name, 0, 0, 0)
 
 /* Function declarations */
 
diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index 07fe58c24485..d902d39f49f4 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -15,7 +15,7 @@
 #include "pmbus.h"
 
 static const struct regulator_desc __maybe_unused tda38640_reg_desc[] = {
-	PMBUS_REGULATOR_ONE("vout"),
+	PMBUS_REGULATOR_ONE_NODE("vout"),
 };
 
 struct tda38640_data {
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 0d2655e69549..c13edd7e1abf 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -333,7 +333,7 @@ static int tps25990_write_byte_data(struct i2c_client *client,
 
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
 static const struct regulator_desc tps25990_reg_desc[] = {
-	PMBUS_REGULATOR_ONE("vout"),
+	PMBUS_REGULATOR_ONE_NODE("vout"),
 };
 #endif
 
-- 
2.45.2

