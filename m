Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848C83208
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Feb 2025 01:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064981; cv=none; b=DNRUvWWHKYPPeK5vOYiQ/vt74LrnsgO/8l4t6iPuI2+ZKD1rRa1Guv1Jo/FqBYqGkBz1iR07EANsObpsQWrvkXiy0fwcDfDa1iv//HR7lIXE83BI+Sn/xY6crEi+sdaW01GGCjKrkeyNIump45kl8E5pKC+hMqPEbfCVYwbUSrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064981; c=relaxed/simple;
	bh=0gtCcaKoR51/0SKKOO3Bx+lIzEFxBjM6jgf6uVskXjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXt8aLZQy3o+q3Rym+j1Fje/yhd2f9gO75Apj2K/UiPrLtT5vp8QKXxXy0UVxVcwnNC/EM9mABUA1nqElsltTbSK6n76YZTkX7c5qqQZ3XAhqQPaBEyedxPdzLR4lXkoSGE66491bUXNf166gIgj09uxzFAJsCGtVw+O1FXKjOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuDBC1Yk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuDBC1Yk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so5113581a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Feb 2025 17:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064978; x=1739669778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auSut3l/BfrCkvqBADZ+CIIp70IVDk1JOPfDRR8nfyg=;
        b=MuDBC1Ykbq3ObxvdYWg8WueaCu7vpXfzYVpSF+qfU6rV9nvmbsM4U9cEPmIHXFETEq
         t0dPCio0+hER8aYIcEgpWDU1r1QNdTSKjBbhRhgtPwfdAcyKFLKBTEHN4y8uZKNhfWrG
         Cm3rrlTmZ/NcCqIUBT3UIAkhjDfL9pb/9CuwXN+wFP8EKNGwK7BGasnvpuG4N1eWo24R
         ASyv40AruhaloGE6HazRhbjUCgafTeYI4p9TDVPcGh3erC4uY6BjkKN4XuWKU5Yn7qeH
         1piqwH+daN0aaOJYkey5Uz3scuvYepaxKBaBJjHfCJzv/C8IQd0dJ+7IG0tmSpQct7Xz
         bXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064978; x=1739669778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auSut3l/BfrCkvqBADZ+CIIp70IVDk1JOPfDRR8nfyg=;
        b=N2OHnYmoiJLMmf5QO+qK3zVRlemmkf5pLSTlgjVNlIbEV9uvECQlFUg3gH2m+2b+CC
         T+DDkioQf6HMVa4zV/hs/KyWT/gaVMK3uaiiJIxuAYZ7QNJqpf5p8pW+NinulX28Ci2R
         0hjtGqwjz5dZ/e2lIJTA+WL71oHBNlT0f2teraqpVfPKeslMRQwR69ZQ/SdO98YHUrlC
         O/VY9xp0ZIQxsjtRG1Kic4bLdBUB1TD8jWELjEfG9zQIQZfevIX1McaWWCOiP3GUv2vC
         EhOCPKrwJ34vcYp6Tfj9oezbBzqEKkiG0ijvUOAUfQQ1PL14B6ZJzh4NqB2WxyzO6n1Y
         fXBQ==
X-Gm-Message-State: AOJu0Yz0u5Vao7GPtzMQFmmxTXexsTohbbpaWwZ3NKs4INY/xXyAGHJ2
	MbbsybWFW9XtaNMcqGsUZDSniAOg6/xOpCpM/O2SVK08GNArrxyScwVi/g==
X-Gm-Gg: ASbGncvZIsEJOPlJgOGTjJqoBYIaO5VGhaRkrgoy5qRRlwZRzM0EvU3XsfAuuoe3TOq
	TwnMwYi41piBH3c8b7nJ3TZwckhtfxvriPjTPgRa6p+Xkl5ErBI6RnhDJsD70NH6qc8LNWpkGwG
	JyNzJpSZEiw8mkDMIUWwOVgk/yerfBykHRuZSeBuqKpZXmjiJt5ZS1mz2z55JoMmAoTXWROucVc
	TlpJmjAglwBdZ8ppkvfM0pTHpm29TZeqrna9Wm2JlrCWPXRD1p83zBsdW6tWJJX+6eZEqelYcAH
	C5FfYFLegoMZTe5kEij3hO8vTEsB
X-Google-Smtp-Source: AGHT+IEqmlfMWmtxHY47tyQj8ntVTBsIFppOZ+jn5eLDIKAsK8D/cr5yNeP5BqWqJMrVQn7aW519gg==
X-Received: by 2002:a05:6a00:4f8c:b0:728:b601:86df with SMTP id d2e1a72fcca58-7305d450c49mr12690121b3a.10.1739064977850;
        Sat, 08 Feb 2025 17:36:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7e6dsm5160366b3a.70.2025.02.08.17.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:36:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/8] hwmon: (pmbus/core) Use local debugfs variable in debugfs initialization
Date: Sat,  8 Feb 2025 17:26:11 -0800
Message-ID: <20250209012617.944499-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250209012617.944499-1-linux@roeck-us.net>
References: <20250209012617.944499-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for the next patch in the series, use a local debugfs
variable during debugfs initialization.

No functional change intended.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 49 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e38d69d723c0..472375b62379 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3507,6 +3507,7 @@ static void pmbus_remove_debugfs(void *data)
 static int pmbus_init_debugfs(struct i2c_client *client,
 			      struct pmbus_data *data)
 {
+	struct dentry *debugfs;
 	int i, idx = 0;
 	char name[PMBUS_NAME_SIZE];
 	struct pmbus_debugfs_entry *entries;
@@ -3518,12 +3519,12 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 * Create the debugfs directory for this device. Use the hwmon device
 	 * name to avoid conflicts (hwmon numbers are globally unique).
 	 */
-	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
-					   pmbus_debugfs_dir);
-	if (IS_ERR_OR_NULL(data->debugfs)) {
-		data->debugfs = NULL;
+	debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
+				     pmbus_debugfs_dir);
+	if (IS_ERR_OR_NULL(debugfs))
 		return -ENODEV;
-	}
+
+	data->debugfs = debugfs;
 
 	/*
 	 * Allocate the max possible entries we need.
@@ -3548,7 +3549,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_REVISION;
-		debugfs_create_file("revision", 0444, data->debugfs,
+		debugfs_create_file("revision", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops);
 	}
@@ -3557,7 +3558,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_MFR_ID;
-		debugfs_create_file("mfr_id", 0444, data->debugfs,
+		debugfs_create_file("mfr_id", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops_mfr);
 	}
@@ -3566,7 +3567,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_MFR_MODEL;
-		debugfs_create_file("mfr_model", 0444, data->debugfs,
+		debugfs_create_file("mfr_model", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops_mfr);
 	}
@@ -3575,7 +3576,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_MFR_REVISION;
-		debugfs_create_file("mfr_revision", 0444, data->debugfs,
+		debugfs_create_file("mfr_revision", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops_mfr);
 	}
@@ -3584,7 +3585,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_MFR_LOCATION;
-		debugfs_create_file("mfr_location", 0444, data->debugfs,
+		debugfs_create_file("mfr_location", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops_mfr);
 	}
@@ -3593,7 +3594,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_MFR_DATE;
-		debugfs_create_file("mfr_date", 0444, data->debugfs,
+		debugfs_create_file("mfr_date", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops_mfr);
 	}
@@ -3602,7 +3603,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		entries[idx].client = client;
 		entries[idx].page = 0;
 		entries[idx].reg = PMBUS_MFR_SERIAL;
-		debugfs_create_file("mfr_serial", 0444, data->debugfs,
+		debugfs_create_file("mfr_serial", 0444, debugfs,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops_mfr);
 	}
@@ -3615,7 +3616,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].client = client;
 			entries[idx].page = i;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops_status);
 		}
@@ -3625,7 +3626,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_VOUT;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_vout", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3635,7 +3636,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_IOUT;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_iout", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3645,7 +3646,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_INPUT;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_input", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3655,7 +3656,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_TEMPERATURE;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_temp", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3665,7 +3666,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_CML;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_cml", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3675,7 +3676,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_OTHER;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_other", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3686,7 +3687,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_MFR_SPECIFIC;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_mfr", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3696,7 +3697,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_FAN_12;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan12", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
@@ -3706,14 +3707,14 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 			entries[idx].page = i;
 			entries[idx].reg = PMBUS_STATUS_FAN_34;
 			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan34", i);
-			debugfs_create_file(name, 0444, data->debugfs,
+			debugfs_create_file(name, 0444, debugfs,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
 	}
 
-	return devm_add_action_or_reset(data->dev,
-					pmbus_remove_debugfs, data->debugfs);
+	return devm_add_action_or_reset(data->dev, pmbus_remove_debugfs,
+					debugfs);
 }
 #else
 static int pmbus_init_debugfs(struct i2c_client *client,
-- 
2.45.2

