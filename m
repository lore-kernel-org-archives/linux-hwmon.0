Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBB13DCD81
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098416; cv=none; b=HlYB4u3+NzDiwXtTGvLmuD4aaOzu7OMiCUGhQluderDmvdKUyJDsO7dtgmp44DwIcdH3xxVMS5qD+lr+8VF030x2k0IU+BaI+eVAU4Un3nrioIS1XEf80TaMJ43HKI4+W/+WsyPnh0tFkCxc6bAGMBEEkai0cqg8pMe2+oNpC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098416; c=relaxed/simple;
	bh=oPnUGbEIoGhm7UulYBzjayLSZKJBzGw93zq+ifrLJjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o4XMzi0XI9FkCXVFN1XE0bFxyRqlDFFuj9WWiVPb29SK5+sUvO6eTuNcm5rksGngYLlK8SqqL4CVukLUx+PmSUcgT20wdGds/G2avbUxTwPbU52W3qChdPwWaSRUJ53QKLfPuEYG+2dlbEzhQpM43WBvhtzgLeEY2pv+wDX5g1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFcwNm7I; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFcwNm7I"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf3781ca51so62021325ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098411; x=1781703211; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNkzX118bQy4gDLDWl9uxrYI2MD9LJ6nSBYT+pUO8gY=;
        b=kFcwNm7I8RhvQnhjtGD75uFapfcBkLukt479ZYS8CvR5MHQeRVQWhIJuX+LTu0L/WR
         WlRU4GhERYQD33ZMbpDXcRauZ5iWPl3ugqoDzfFeVon7Fp9t+W58c+ylgGOuK+NF5SqX
         86kj+b7Y75KJU+Q8K2ibHDreZtPc0K+wSLy5tenYSy0bHqDozqtmMbfThOBNA7Wdoubb
         7M8odFvOCfH3ssmKd2eHetq+HpP6wh40UB2+6jgf3HsslSsGxE3U3Ngjz5xREBcRwidS
         MOoiLLtFOJsEPjF4haBzwiLsfO9RVmevkoFly0FlezTuJKpuICGKNOiHPz+8ZViczo3t
         liwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098411; x=1781703211;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNkzX118bQy4gDLDWl9uxrYI2MD9LJ6nSBYT+pUO8gY=;
        b=aYXzDr3t0/IjULfqfegNuX17ANyqi7NtXaO3bz8aoM8A6Iiqgmi0QqgCvq74Dtu8lT
         /v6w9OeZcJuVUnjipVo5ziBeKBy31ly+Pf0yOti61RMKnFXw42d06Lq7VBzuqkkLnQgi
         6OTQcY7UqJxiqzr6Vjt5OvKw/yoQW8p79ddDFSj+J16KiojVxEepm+QApKBg/kyJER51
         XVuE4JzofN5ElBQs5yPXC7kleluOTXXjAfspvZ9M7bFOV5o73nkPTbauxEW3x/eySYtY
         5LaOV2mqe3x9yljX2pw2+iwvyl3vdVDUPNL+NkvnaD6hR0g+D0verIidS572F86CFiI3
         l4zg==
X-Gm-Message-State: AOJu0YxrSWDy3f7+N1x5I6J5j+bfux3TW8Hd5kThq3VDyk9Zk2LsR6qw
	QgThCXgKJExsuXCpqyGjg8euBHNlTpuiIU95jrFCnTfBtIS1dMMeoWNTzfNVTw==
X-Gm-Gg: Acq92OEhma9/FEOBFW/xh6ePjShLkcYmlSq8fhWB93FUsC9WEwX5V2xhSgWUmoOjmaB
	xLNzDUEPgTnxrMSZ3CRWt+T00Dcxt57jq9/ZjTmcig3Y+F9n/nBMaIuyFKwTNYyIy2QzIZNKYjG
	ebyqfhU6LtcC63zizaiL3rOhC503KVddy4Maxz8vlkGcX4OJzJlJqe+eFHJTzn2Lzwg4g0n6bnt
	nc/DApVymGE57MkuNOYgcc/f0PEbGu+j67TXk3v6zFZpI/bO+87JEOcaovr0CwNE1RIUD+lb82e
	PzO7+h9QgQicOfYxrHSxbH5zLmkrDBk63zOrEcV6KVWVjk1bifaO2GTcctjEWqJ2dUqtnmg3GO4
	X0ogd/ib9JYFRPlCGhgQrPljgmVbXHuW0SMtiZKZ+wGBrQMCWkVZBmXSXjXEuQlMAPbT4SRuZww
	6xf/uRPc78xCkmQbueK1MV3icwcnkjQBJFF8sIT9tD/F/UNdp1gG4SvS/dDOHqb2z6kwJayPhoC
	aTX
X-Received: by 2002:a17:903:248:b0:2c1:d49c:8396 with SMTP id d9443c01a7336-2c1e7b35a28mr292781385ad.1.1781098410498;
        Wed, 10 Jun 2026 06:33:30 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e2e2sm240827165ad.49.2026.06.10.06.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:33:30 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Date: Wed, 10 Jun 2026 21:31:01 +0800
Subject: [PATCH] hwmon: (pmbus/lm25066) Fix coefficients and overcurrent
 limit selection
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-lm25066-driver-fix-v1-1-ff9b39961a2a@quantatw.com>
X-B4-Tracking: v=1; b=H4sIABRnKWoC/yXMUQqDMBCE4avIPnchiU0Er1L6oHFst7RaNiqCe
 PdG+/gNzL9RggoS1cVGikWSjEOGvRQUn83wAEuXTc64YII1/P44b0LgTmWBci8rN7iW3ldVH2E
 pH7+KPJ/R2/3vNLcvxOko0b7/AF49AM92AAAA
X-Change-ID: 20260610-lm25066-driver-fix-ae435577fce1
To: Guenter Roeck <linux@roeck-us.net>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781098408; l=5923;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=oPnUGbEIoGhm7UulYBzjayLSZKJBzGw93zq+ifrLJjs=;
 b=HiYhYAqD7r0OrmKxegikGPJ5WddGHjuLM7XRNInmTqg6v8BdXS0+IntItmyjEW4gLA30sLT4L
 bZb/eHSCcu+ApgExsBJ+o0Mz/a8htTTSa81jpT3Bawh5AseTRCmVoGf
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Swap high setting and low setting coefficients in the lm25066_coeff
table for LM25056, LM25066, LM5064, LM5066, and LM5066i. The
coefficients were previously mapped incorrectly, resulting in inverted
current and power scaling.

Also, correct the overcurrent limit selection logic in probe.
Bit 4 of the DEVICE_SETUP register (LM25066_DEV_SETUP_CL) selects the
current limit range, but its active state differs depending on the
chip family:
- For lm5064, lm5066, and lm5066i, a set bit selects the low setting.
- For lm25056 and lm25066, a cleared bit selects the low setting.
The logic previously treated all chips the same, inverting the flag
status for lm25056 and lm25066.

Finally, dynamically assign the exponent (R) registers inside the
probe's low setting branches. This ensures that the proper exponent is
applied (e.g., for lm25056, high setting power exponent is -3, but
low setting power exponent is -4).

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 drivers/hwmon/pmbus/lm25066.c | 96 +++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..6b08f93801b9 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -60,25 +60,25 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 13797,
-			.b = -1833,
+			.m = 6726,
+			.b = -537,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 6726,
-			.b = -537,
+			.m = 13797,
+			.b = -1833,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 5501,
-			.b = -2908,
-			.R = -3,
-		},
-		[PSC_POWER_L] = {
 			.m = 26882,
 			.b = -5646,
 			.R = -4,
 		},
+		[PSC_POWER_L] = {
+			.m = 5501,
+			.b = -2908,
+			.R = -3,
+		},
 		[PSC_TEMPERATURE] = {
 			.m = 1580,
 			.b = -14500,
@@ -97,23 +97,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 13661,
-			.b = -5200,
+			.m = 6854,
+			.b = -3100,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 6854,
-			.b = -3100,
+			.m = 13661,
+			.b = -5200,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 736,
-			.b = -3300,
+			.m = 369,
+			.b = -1900,
 			.R = -2,
 		},
 		[PSC_POWER_L] = {
-			.m = 369,
-			.b = -1900,
+			.m = 736,
+			.b = -3300,
 			.R = -2,
 		},
 		[PSC_TEMPERATURE] = {
@@ -132,23 +132,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10742,
-			.b = 1552,
+			.m = 5456,
+			.b = 2118,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5456,
-			.b = 2118,
+			.m = 10742,
+			.b = 1552,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1204,
-			.b = 8524,
+			.m = 612,
+			.b = 11202,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 612,
-			.b = 11202,
+			.m = 1204,
+			.b = 8524,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -167,23 +167,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10753,
-			.b = -1200,
+			.m = 5405,
+			.b = -600,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5405,
-			.b = -600,
+			.m = 10753,
+			.b = -1200,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1204,
-			.b = -6000,
+			.m = 605,
+			.b = -8000,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 605,
-			.b = -8000,
+			.m = 1204,
+			.b = -6000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -202,23 +202,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 15076,
-			.b = -504,
+			.m = 7645,
+			.b = 100,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 7645,
-			.b = 100,
+			.m = 15076,
+			.b = -504,
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1701,
-			.b = -4000,
+			.m = 861,
+			.b = -965,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 861,
-			.b = -965,
+			.m = 1701,
+			.b = -4000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
@@ -468,6 +468,7 @@ static int lm25066_probe(struct i2c_client *client)
 	struct lm25066_data *data;
 	struct pmbus_driver_info *info;
 	const struct __coeff *coeff;
+	bool low_limit;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_READ_BYTE_DATA))
@@ -519,18 +520,25 @@ static int lm25066_probe(struct i2c_client *client)
 	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
 	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
 	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
-	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
-	info->R[PSC_POWER] = coeff[PSC_POWER].R;
-	if (config & LM25066_DEV_SETUP_CL) {
+	if (data->id == lm5064 || data->id == lm5066 || data->id == lm5066i)
+		low_limit = config & LM25066_DEV_SETUP_CL;
+	else
+		low_limit = !(config & LM25066_DEV_SETUP_CL);
+
+	if (low_limit) {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
 		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
+		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].R;
 		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
 		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
+		info->R[PSC_POWER] = coeff[PSC_POWER_L].R;
 	} else {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
 		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
+		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
 		info->m[PSC_POWER] = coeff[PSC_POWER].m;
 		info->b[PSC_POWER] = coeff[PSC_POWER].b;
+		info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	}
 
 	/*

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260610-lm25066-driver-fix-ae435577fce1

Best regards,
--  
Potin Lai <potin.lai@quantatw.com>

