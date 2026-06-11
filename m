Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C11F2380
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 02:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781143330; cv=none; b=SRFoaKagx+1T3Em9DPE7GfIbOXocl8DJKFEcQ69JlmWtRzjaG8Go5tOlOzFiLkTNK8aNOMgCa1copShY5n2Bvd/QejfO59iC2ITgRcK6lNS5ymnYwlvL2qqyh7KOVlOkpb8xaIQfncz2L4UJbz20Dz5JWcFn+KqNrO7fwMRXTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781143330; c=relaxed/simple;
	bh=N5GrfwoJlJUhgcp/5C8O+PoFHkF4S+0rcw6GH4/Xu2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X3KGMfmckzgfc1U8fp/47Kefiy4LzVsViKNtTYUTGs1IG0A/bqKPaFntv/JYJ6osMoPkFgxfXjz3sYqY7+lowUqJxBRi119q1NHstwBFoJAl81oLIo0Qp3M/xfA+p8dOxazUaNC0fSZ0JYJrdPL/IUeuHqu0jkQmfiVLO0ZYZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VweoZVEf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VweoZVEf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso51388035ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 19:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781143329; x=1781748129; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9e+7AoMN65MH5I2imL0Q/phclbM34ML09rP5yMAnKlg=;
        b=VweoZVEfYQp7YZjPzfDfCTqLnvES5XCVQSeRBsNKG/DSJoTaZ71/CbY1p/lh1rhOo3
         lbududfqZR7h5dsfbhldXlrNxp5Avklr6wMJsmNg4D1F69x5Ewkz3SAaM5h3FWeGvZbm
         DmemgK/fjkDo2GyjuSqDjHdq3nIMxkWkgR7EPM53MKi/WjTzO6Msv524GMDWdmP3M7fE
         b329e+GzUo+Zl4hRbXMgVhSUK7aR8Ibf0d96hNZ819IXN8Iy2OP8ucebYh+z3eoD7ZMe
         W4SMvcHA1ix8PbG/x/Zdc1rWFgdJuQqj6kev+DJvaEuZ0eZHnbJMYPgte+M7XHoTkKwC
         1/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781143329; x=1781748129;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e+7AoMN65MH5I2imL0Q/phclbM34ML09rP5yMAnKlg=;
        b=WFpzxmEMjZYvRXESWX8m+WEJhuLoXlLC1e8b9MUAm8WHRlGXjxaUDlWNMeBM4t/A05
         04znZ4kUg3RYcaoCLI1IkyjJcvZMPRHMPGtte6exqlxexyQ8LDVRKwDDY5sGJ+W5TPEp
         QIik9HiWl2rTbUwMhEQMHNDKbzu6/4CKqczP+wal8+tkM70va/l9Jbk92JtH1pldUT2h
         1LNGm4M9m9fwonda7VdQA4FgYUrXxxR5JvTyGF4epZ1cOzNsHeGVcVUvjcBdKdGkv3Rv
         mx72faUDA2GdCqgFiwK0q14+Hgar37JyzYGQaiT8VzLQe0zaLfYzz6FXLMsVqi2xxI2S
         xbRw==
X-Gm-Message-State: AOJu0YwwiB4n36T3HobQ9DJSzj5I9Gs30QK/30sLT1c9E2hJwyk4SJq3
	QlH9b5wV/g79paNOQPQxLuksxs+QRymhZJwhjGQnh0AR98jSqH8UuTCg
X-Gm-Gg: Acq92OFird9o7U53Jg7oM4raDaXXO/JmSqbJv6UXOYf7hT06QRsx2wt8eJzXRgGGRuu
	gD+EfqCLeCiVgSzMKtgLA+VS5DIp56d5+Ku05m2jF1wx8Q4WnzBBUnYTEDR9rhEioTJHiTD1FTd
	6zX7A+UECdAG0Ih/+Q3gQ8HG69gwRA94y5SYhpFAD610yUzFWkkmvSpMXEymyZvCtJJdbSPqdyq
	LwQ8+NkP5mYYanwmq30mll1zU/3IO4wEIESF5HMttpC8mLDxi13hC9XJZLIHJ1BC0JvuojWEyJN
	GnfS8jfpYgNqpW/FapkGc0+NakEeZgfVEdfiYruAX5J5ozDJbvbjqR/dYXS5UtXYH3k1PWCjzKk
	Y9de3acug+J2grJAyffiOxBqknvfqHkAhtsdJGiJUlEqKXSoWDCEQsRO9p53bhGloHaKIB2ihfW
	HaknT+807wtBynM+ghO6V5kPjtydUiylTmDEK7MZlZ3DcK7npnZuy9pEK12gc1WQinbZQXEr0gQ
	pQw0YJWEngcGw8=
X-Received: by 2002:a17:903:fa5:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2c2f1dc1e4amr7388505ad.11.1781143328590;
        Wed, 10 Jun 2026 19:02:08 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm262044005ad.50.2026.06.10.19.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 19:02:08 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Date: Thu, 11 Jun 2026 09:59:48 +0800
Subject: [PATCH v2] hwmon: (pmbus/lm25066) Fix PMBus coefficients for
 LM5064/5066/5066i
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lm25066-driver-fix-v2-1-5d28861b0d8e@quantatw.com>
X-B4-Tracking: v=1; b=H4sIAJQWKmoC/32Nyw6CMBREf4V07TVtkRJc+R+GRSm3co08bEvVE
 P7dgnuXZzIzZ2EeHaFn52xhDiN5GocE8pAx0+nhhkBtYia5VFwJDo9eFlwpaB1FdGDpDRpPeVG
 UpTUoWBpODlO8n17rH/u5uaMJ29PW6MiH0X12axRb768gChBgbdXkVaWElvrynPUQdHgdzdize
 l3XL8hbb7nJAAAA
X-Change-ID: 20260610-lm25066-driver-fix-ae435577fce1
To: Guenter Roeck <linux@roeck-us.net>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781143326; l=3980;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=N5GrfwoJlJUhgcp/5C8O+PoFHkF4S+0rcw6GH4/Xu2Y=;
 b=SfQmihP66IDC+AeldnS3TVHvn4DkuN2Kse5D7VxCl8xqKIQPIZbyFNG4wxi8NiMATjbs3i67D
 0Rkj1lbDKY5ACqGxu9G3QftvZQHweXOBgJDCjgSZuoGfQdjPmtiWUnA
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Swap the high setting and low setting coefficients in the lm25066_coeff
table for LM5064, LM5066, and LM5066i. The coefficients were previously
mapped incorrectly, resulting in inverted current and power scaling.

Additionally, dynamically assign the exponent (R) registers inside the
probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
exponent is applied (e.g., for LM25056, high setting power exponent
is -4, but low setting power exponent is -3).

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
Changes in v2:
- based on comment in v1, only swap the coefficients setting for LM5064/5066/5066i
- Link to v1: https://patch.msgid.link/20260610-lm25066-driver-fix-v1-1-ff9b39961a2a@quantatw.com
---
 drivers/hwmon/pmbus/lm25066.c | 54 ++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..6e23ada64e2f 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
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
@@ -519,18 +519,20 @@ static int lm25066_probe(struct i2c_client *client)
 	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
 	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
 	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
-	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
-	info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	if (config & LM25066_DEV_SETUP_CL) {
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

