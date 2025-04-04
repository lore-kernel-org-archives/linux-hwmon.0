Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E621CDFAC
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Apr 2025 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767817; cv=none; b=VEdMD5ILQjFUfz73avgl+mNwifT07XMoNB7qkIl6wAn85bvVEGmf/e9l9Kd76L4uQ1qsx+q9VtRFJaWSVJYSF3u8UQq9A5ai+a7zhs19SlwVmAX2GDoF8bJsRvm9+9UFSwqlsZi1q21oa3wd9FRt/fRwC53JouCc9YFPUj/QXQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767817; c=relaxed/simple;
	bh=PDZ8wopAz0p6dRYwWVh9TziS/j8jc0WTBI7vNoZgTPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IziowZsHWy/C21Rq/9J+Wy8wQRr2/nMLo9s8PuhVw84eX9yIrI8fmNvTEbT8q74YmINgdwn0LI12f6ooHWTtKBFkcsJKC4x+CTTZUc5V+dyPVsYTB4EHMTVPVeJBp+0uU/vm0o5dY6Rqv9djGqEkkJTaA8ALK/y3M6nOYG25Q+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=PUMQG8so; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="PUMQG8so"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1385801f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Apr 2025 04:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1743767813; x=1744372613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=doiI8VQYK1ufpJ8YlTdC9R6WZr99FG3ISjHW2FSinYk=;
        b=PUMQG8soi16HrQk0BkopQQjfrFjQdYudXQRisBysJuKFHO4AZDrWZJXBn6JFl2mPJj
         DXUFM+r7PyGRa7SVK3d0pFWG64RZTuEnKfSHSiVx0AoKZ3QhZFO8L9MGnAaJYj6m4ufn
         lvDlVcx0E0pdcm/ZRUou3sBQ3gu4Pa04OYcdklwC9YYtBmw7us3xHWRZsSGfNvWxN0J1
         veoC7XT60MWN93YSYE1q60++TGnTRyze89LPbF8rRYQvAGclr/gUX1z6Mz2xQGbCKCmS
         qooaTucXYRLSN06jPdHzoi9nTjDJU4QXXOH4l20iAzuDc2yecCzzncrXSkns4VZ/FDd5
         TebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767813; x=1744372613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doiI8VQYK1ufpJ8YlTdC9R6WZr99FG3ISjHW2FSinYk=;
        b=RLo7POgIFnlMUNxGQhRCFFYUlrAL8/uvUXnCLMQ7jN31Dt7UeW0YaCPsR17uD8SQmd
         0TYcP6rOxb2vr64zDKwoLiDxb+SJZRcFeAwq8+cDgVEDNcoQJ5awHCndf9DePI3KJSjT
         R1q/XH6/f5iJj+AnALnzrHaLm1Ghevia1ojRPT3BNMcWbN8NkrtvKaDwBI1DvySRlCcA
         GdspIlHMDIJg2cPI3Kcp5TevpJOV9OAQ1mx4ZEWf7j2Cv4/s6EMHiJMdMr0jsPXEV9Cx
         xFybC+zV6+fuaI5uHnqmlfqDPgSi0nADxB1kWgUPA3t923kkQ2d/3iHlpDOcmd6ULl4l
         Np9w==
X-Forwarded-Encrypted: i=1; AJvYcCWjcscho7Q1YkhEWVMCIcu7Nr+IiH9JzFA9n5PEXP4IiDqcTJnLaPvKlyeGf+NFcxrZsOXv2+vXkZoc2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOM4E47yCoF1bwXU+4tmzgUUbimDGajVRu8hmbNE8dLKkEfBCR
	i9UObZnw1VVLDBlBR58ghCYw/dFx8XK0LgX2a9dyZstZ+zqPaqaCNifC0Gf4dLA1tkmajFGwrp8
	v
X-Gm-Gg: ASbGncuet13zsT6QvlrVEbzhms99WdWRN77vl1LLcSO5VXPAESqK2LBb/dytqO6J12o
	dyxK55xn1qezFWbyltuNXeIXiq6wMDgo7rYf5VkmB69DUV2+w4gJUOsqk/2RkzuD+kotIkVlqv8
	d5SiYGypqKLrcWdYWDDvsyyAZs7ClB+QC/GBI/fxW778h1O6MdJk3y0ZlAyLgmgPwrmL3B0Yo6u
	k4VCiNelsC+a2mRxPXmteSSQ1hFhUaBmHZSAy5tky4KfpQeSs4zt28ehg92RdAPMwCmjgRP0eWJ
	H4oKkbR305Pq48OxrNkuprMCboUHBILCFnJ7+UVNfwRagREmOL5Cl+H5PBUxlmXtuaTslTT6yHV
	y1QvjPdjl/MnDxxcFFO6xRZA=
X-Google-Smtp-Source: AGHT+IEeD0LudfIMzIZ39+meQ1M9f+OiYAkIG6t3WyDlnjQ7l93eVXpcifm9jo92oB6MspeMv7DRSA==
X-Received: by 2002:a05:6000:220f:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39cb35b24famr2899682f8f.9.1743767813392;
        Fri, 04 Apr 2025 04:56:53 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226f1fsm4236219f8f.95.2025.04.04.04.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:56:52 -0700 (PDT)
From: Your Name <naresh.solanki@9elements.com>
X-Google-Original-From: Your Name <you@example.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Subject: [RESEND PATCH v2] hwmon: (max6639) : Allow setting target RPM
Date: Fri,  4 Apr 2025 17:26:45 +0530
Message-ID: <20250404115646.2000563-1-you@example.com>
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
Changes in v2:
- Pre-init target_rpm[] to 4000 RPM
- Validate if target_rpm[] is within configured range.
---
 drivers/hwmon/max6639.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 32b4d54b2076..a06346496e1d 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -80,6 +80,7 @@ struct max6639_data {
 	/* Register values initialized only once */
 	u8 ppr[MAX6639_NUM_CHANNELS];	/* Pulses per rotation 0..3 for 1..4 ppr */
 	u8 rpm_range[MAX6639_NUM_CHANNELS]; /* Index in above rpm_ranges table */
+	u32 target_rpm[MAX6639_NUM_CHANNELS];
 
 	/* Optional regulator for FAN supply */
 	struct regulator *reg;
@@ -563,6 +564,10 @@ static int max6639_probe_child_from_dt(struct i2c_client *client,
 	if (!err)
 		data->rpm_range[i] = rpm_range_to_reg(val);
 
+	err = of_property_read_u32(child, "target-rpm", &val);
+	if (!err)
+		data->target_rpm[i] = val;
+
 	return 0;
 }
 
@@ -573,6 +578,7 @@ static int max6639_init_client(struct i2c_client *client,
 	const struct device_node *np = dev->of_node;
 	struct device_node *child;
 	int i, err;
+	u8 target_duty;
 
 	/* Reset chip to default values, see below for GCONFIG setup */
 	err = regmap_write(data->regmap, MAX6639_REG_GCONFIG, MAX6639_GCONFIG_POR);
@@ -586,6 +592,8 @@ static int max6639_init_client(struct i2c_client *client,
 	/* default: 4000 RPM */
 	data->rpm_range[0] = 1;
 	data->rpm_range[1] = 1;
+	data->target_rpm[0] = 4000;
+	data->target_rpm[1] = 4000;
 
 	for_each_child_of_node(np, child) {
 		if (strcmp(child->name, "fan"))
@@ -639,8 +647,12 @@ static int max6639_init_client(struct i2c_client *client,
 		if (err)
 			return err;
 
-		/* PWM 120/120 (i.e. 100%) */
-		err = regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(i), 120);
+		/* Set PWM based on target RPM if specified */
+		if (data->target_rpm[i] >  rpm_ranges[data->rpm_range[i]])
+			data->target_rpm[i] = rpm_ranges[data->rpm_range[i]];
+
+		target_duty = 120 * data->target_rpm[i] / rpm_ranges[data->rpm_range[i]];
+		err = regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(i), target_duty);
 		if (err)
 			return err;
 	}

base-commit: 2115cbeec8a3ccc69e3b7ecdf97b4472b0829cfc
-- 
2.42.0

