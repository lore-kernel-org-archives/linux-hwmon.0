Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE71411DE
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Mar 2025 18:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742842692; cv=none; b=hBSjOoaW/HIuT4+NqkuYTGdo2l6uJN7/mkBKHc+EVrzj/fMoMicLJvd7ece5iL8xGPOtWVplgIavkvSKIn6Y4Z81tkADl5aySJMKMHNO64Jo0Mw9mf1Zg0JUyzLcf9qHtYNAJHxJvkL/pt7gizsBVPlJWceU726WVlFpmpt79LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742842692; c=relaxed/simple;
	bh=JtCj9yaYLLnbWrZGwWO77vDysRJOjp9RTmqAEhYmjTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1YbD5tsLdUkVQvFwznYfmtww8/MSh2clT6QJCD+uKYGLKfcEHBPTG1aO60oFELdBXmrVLP4Gns4M24SvdI/m87d89L35rWJYrnPQjTOuyigaNKdFnYg3sU5UE8T06YydB2aUCoIhArTk1ZbPiuKxzLboX5xonpsVLPyL1nNEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=FyaYr9nE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="FyaYr9nE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso4150329f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Mar 2025 11:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1742842687; x=1743447487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9PuYVarMebmU2p+Nlydwxr1Lr80Vi57j8nI2AO9zgc=;
        b=FyaYr9nEpH05qGNR+I0h0Pguc3NHzfikDKuPwLvwvfFJhO+ds6WJTb/IKmPBcWptUf
         SssIpcSGjplPYjarV4bnddOge475Jm8iKfC5cjU8U1EEaCvClNeWouZ87A3tqGrlxd+f
         zdppviVKKQ38y8YljQ7GcSzvuu0pKHQZ/TmPeW8/5Jx+TkwqLfbLkxUPfq8pAKnJYzVO
         ESvqX7tYwdHe4B6R42JLqSixz7h0hGV3+jVTGGZdqU/DgL0fMEGKIxl3f8es0N1w3SLc
         jMhJSlZOJ2JOGU+ZrBVxrWSLdjuiBHhg0DEYUcY3kkCQum5raX/fwKaydk21DgNmtLdp
         jX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742842687; x=1743447487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9PuYVarMebmU2p+Nlydwxr1Lr80Vi57j8nI2AO9zgc=;
        b=Q0PoL27H5aPWdpfY+UcyzB1es1QMGQGtu/Cz0pFakuKsCqJYZ/th8SaToOfKF6EK8c
         lMF+IfIVDD69Ws3DjDNk3+nldej/gzsaz23nbCbpczh1thKCnCFMkwZi5v2IO3Z3yRlR
         mUDwXXtbkDV7QwPOrirw744kchUWZPxpZ5YfL+M5dykp/Pm/N1rclC4/eaMdzrC0xHKG
         LGX9eufI2oNbGFCSlW1zteYT5LCYItgzMoOVdgKgqqwfMTdYlvnIlzljRZhQNefJvM7C
         B0FYyzoNK3Fy4uYByGzHLWgaf0GuVqbaphCDo6K4xnZTG7g10+7RFvO19/D7UdETWF7i
         Vpig==
X-Forwarded-Encrypted: i=1; AJvYcCVhudvmKJjw9A8N5UdiZUKWqY2Vfqp8AnFX6CQXaReNcc4dX5jJOPMdS0t/kA5ykAX8QRAf+GbZc3GTjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7LVD9PwX4yoE7OxcELGj4gf/B0fdfpX1wU4VVNQ2Q1SNhgSJw
	4/yfdQ2EXP38E45TmQqsupVmg809iav2hRaG0cGS9yzr+ffI7zoLDml3nZtSdEc=
X-Gm-Gg: ASbGncshVs+naomn3fjJscwwiHYyUTUiINOQPZQOFzV9WVtghC20NgrHnkvAmILLMFk
	hCCtHCL3wB3LkzXtxOotACDSHniE2FdD0D2e8+Q3bTApTmwrr2WH6SJYakPS4zFClHSZqH8HViF
	scTJ7qBNYySdDKDqaKxZ9GyuCMPMBIUM4xBKMwCysWwTucbJ+lxVTChRZXHju4ydSbhRh9cuze1
	r27AInwJv4FfCu240Mt/KjB+94BqgFartDBdSphvd2HWDDtAlduh6u+2AYw6s4VAlBCq9Z0vJ9T
	47Kl9sW25w4wIF5Xx9v2MXaHorze9IFJ5XcpW008hsIdpg0+Z7rFOf1G0ACGF5mE+wzIeQbUFes
	r3Ymz6qpZR1feRf0zAmQIUMQ=
X-Google-Smtp-Source: AGHT+IF1prRGm/Bf5jF5cqB1ZVz5ARRbqEYu2aNlBhCbEo50tZLCWap2fGA+duSbPS2otwQmiAJ+Og==
X-Received: by 2002:a05:6000:178b:b0:391:4c0c:c807 with SMTP id ffacd0b85a97d-3997f942453mr13583965f8f.53.1742842686783;
        Mon, 24 Mar 2025 11:58:06 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3bb2b2ffsm156670915e9.1.2025.03.24.11.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 11:58:06 -0700 (PDT)
From: Your Name <naresh.solanki@9elements.com>
X-Google-Original-From: Your Name <you@example.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH] hwmon: (max6639) : Allow setting target RPM
Date: Tue, 25 Mar 2025 00:27:44 +0530
Message-ID: <20250324185744.2421462-1-you@example.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naresh Solanki <naresh.solanki@9elements.com>

Currently, during startup, the fan is set to its maximum RPM by default,
which may not be suitable for all use cases.
This patch introduces support for specifying a target RPM via the Device
Tree property "target-rpm".

Changes:
- Added `target_rpm` field to `max6639_data` structure to store the
  target RPM for each fan channel.
- Modified `max6639_probe_child_from_dt()` to read the `"target-rpm"`
  property from the Device Tree and set `target_rpm` accordingly.
- Updated `max6639_init_client()` to use `target_rpm` to compute the
  initial PWM duty cycle instead of defaulting to full speed (120/120).

Behavior:
- If `"target-rpm"` is specified, the fan speed is set accordingly.
- If `"target-rpm"` is not specified, the previous behavior (full speed
  at startup) is retained.

This allows better control over fan speed during system initialization.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/max6639.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 32b4d54b2076..ca8a8f58d133 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -80,6 +80,7 @@ struct max6639_data {
 	/* Register values initialized only once */
 	u8 ppr[MAX6639_NUM_CHANNELS];	/* Pulses per rotation 0..3 for 1..4 ppr */
 	u8 rpm_range[MAX6639_NUM_CHANNELS]; /* Index in above rpm_ranges table */
+	u32 target_rpm[MAX6639_NUM_CHANNELS];
 
 	/* Optional regulator for FAN supply */
 	struct regulator *reg;
@@ -560,8 +561,14 @@ static int max6639_probe_child_from_dt(struct i2c_client *client,
 	}
 
 	err = of_property_read_u32(child, "max-rpm", &val);
-	if (!err)
+	if (!err) {
 		data->rpm_range[i] = rpm_range_to_reg(val);
+		data->target_rpm[i] = val;
+	}
+
+	err = of_property_read_u32(child, "target-rpm", &val);
+	if (!err)
+		data->target_rpm[i] = val;
 
 	return 0;
 }
@@ -573,6 +580,7 @@ static int max6639_init_client(struct i2c_client *client,
 	const struct device_node *np = dev->of_node;
 	struct device_node *child;
 	int i, err;
+	u8 target_duty;
 
 	/* Reset chip to default values, see below for GCONFIG setup */
 	err = regmap_write(data->regmap, MAX6639_REG_GCONFIG, MAX6639_GCONFIG_POR);
@@ -639,8 +647,9 @@ static int max6639_init_client(struct i2c_client *client,
 		if (err)
 			return err;
 
-		/* PWM 120/120 (i.e. 100%) */
-		err = regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(i), 120);
+		/* Set PWM based on target RPM if specified */
+		target_duty = 120 * data->target_rpm[i] / rpm_ranges[data->rpm_range[i]];
+		err = regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(i), target_duty);
 		if (err)
 			return err;
 	}

base-commit: 2115cbeec8a3ccc69e3b7ecdf97b4472b0829cfc
-- 
2.42.0

