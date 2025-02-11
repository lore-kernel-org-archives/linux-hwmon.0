Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823A253F00
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289171; cv=none; b=XTGq+hi9ssnGGJ7MjWyxWg+cnQUn8lEWShOKvmvIRF3ifhuyl0yzTTnbE6qtXAenoMt0iZCWvdGMkQw0CrxQBV2Wx3IjVRZ96pTfl1zZsgY/t+as/SpwV3gGZFxoRmb537uA1i29dHk5mEMkqH34Sq6c0BlpS+0oJ2hFJgfi/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289171; c=relaxed/simple;
	bh=HhbbXST1S0fxR9b4etCcSkQkDB5qCS402ODXmLG00fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwZKgqA6kfzfxVzUkB2mLNbjXHLXlamLoy8AaO6OPI1MeMUXK+sZQaH9cw4NLAEAR1kJ9LGqwzcqQtE0IAdZXq3t4iMJIEguhZSGWbGpmbpXDmANd6YZIL279dT7x1199KufuVoi7isU2HPsPZ/ckAPxNEl830FEU0gXyDGOfu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXsSrz1H; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXsSrz1H"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f74c4e586so60328575ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289168; x=1739893968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi8HAh4LuNqEizuiuO+hl1UJiY/wwk6gitcnSl2atR4=;
        b=WXsSrz1HSWmhwYH3a4jHUpvTCYogmO8CHjmB6rB4cQT7mOwRyvwUpTaBPVQH+D+C+P
         +lBUatfMzmTrJ+h3R/dPi2NpRPZFIduO2yg2yyEoYb9DZoiamJqzI0YAgg6quBEsug+F
         NlSsYuf8o/gNJP/uupqDJqO+hbOYADKXPLDJT9cDzWTyJ+a2CQyRXatTIULvk6b1z+Ql
         cLjSI8nf6+JBOwPsNJmF5bkyWzt22CgoWHgfVRz9hBe+YmhsSj749dIvU8Ake4kUIdX0
         XkLZaxG8kx83yrHRTxfnhu52sqj3grzQn/16zX9CMfvIZiXEIo6uff12GBxIrZJl/ILk
         xt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289168; x=1739893968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xi8HAh4LuNqEizuiuO+hl1UJiY/wwk6gitcnSl2atR4=;
        b=t3/1eUegCBUV/gTYCV6Wsww3UL5Xt+6pfhGxHMYcmw4VeCNHMyjPsXuxAENiRThys8
         MiWgBLAKe9Nuz9g8FLy3nodjIJJKWorQ5LQ2nP1KsJLb65yBORfoo3pgb05EJj7qNJSM
         HjPTgi0E1RLxdS6RE/q3Nz+NDso6xmlEpkkvd8DJuZoxqdNeiR6ir+9Z1VPX0h4sOi1e
         QDrnkV2yWDAmUcdgi8ddKzrqPM89o6wZr07UuEFKktMYqrbujKCBHc4nRzc4lJV5Qem9
         +V9I0YZjizRc8AgFZigczOQUzgUdVj69wT6c2DNoWtREEb5Rgyffpg493fpncI0p5ehE
         18Tg==
X-Gm-Message-State: AOJu0Yy7I3y6cywjy8xj4MjmQYD+98vygWy9KL5RZSaUjTRhMrcQ1/ub
	oTuqn61rwlGF0YDq8jVVt4+8+1+QpsiH8Q62FZ3FLHau7tJTurreqMv/hA==
X-Gm-Gg: ASbGnctQpyTeriw61EKiuqNtEDVQ9yGo/tt07Jm00b4NZCkQCuhKbD1nT/FE0eiaqbM
	2kElaIGSSGUWpdgitdIBpdotfS+nGyt6xPw9umeFqDhr8DJqCE0QZpCW1XMH8WNkNrVJ2LzT+ds
	t5d/TuPzjC8I6sYwYTReFTsc19NJX24xuRy2t80pmi+hLonryzd2/6Az+CLuqwWuy/OyAi991F+
	mNTXDCnWYmem2koH9YUdu+SQ5J84qFcMV826SLwxMW2h9PBdUWG1uLryis60f6uZQ8hT0pd86ep
	ZMb+SbXVl5vi/S8nxquuJYfrdGXz
X-Google-Smtp-Source: AGHT+IGUmWX8Ayc5bUO5KnW38lQwexNgKIx0vVzkPSx0h8efRWjWDjrdauk9ZHm+IV/yvpNaCvVB2w==
X-Received: by 2002:a05:6a21:4591:b0:1e1:f281:8d07 with SMTP id adf61e73a8af0-1ee49d74562mr7000569637.10.1739289168491;
        Tue, 11 Feb 2025 07:52:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad53de9ee79sm5129395a12.40.2025.02.11.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 2/8] hwmon: (pmbus/core) Use local debugfs variable in debugfs initialization
Date: Tue, 11 Feb 2025 07:52:34 -0800
Message-ID: <20250211155240.2077464-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211155240.2077464-1-linux@roeck-us.net>
References: <20250211155240.2077464-1-linux@roeck-us.net>
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

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

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

