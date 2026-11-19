Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051938;
	b=xLLn770HqAg8rKiGY7ZIdfLreimCypFs3YkUCaRZRfxA3hmmIM2aaM3H/BvwnmwD2HTe
	 UxtwKyvhh6DRUSYgWuUABMmzUKaMigHPFVbdZEjPFRTAW2sTt/dxnrDh+M3RVq5mmZA4M
	 kiaHnpSkvl0GD3myTETA2hQm/pgE9zu+Y2xRyrVhv3ipU3YPb18Na/dwZNwzYlSa/kogY
	 mPfxwr8jJPjc1BL4QtYP3qiS7wn9JXDbN7WZhW27Kvb6EYV/9dO0D5UA6+69o7HHJhQJC
	 vxnRaNtXa0XnLZq2RMbtGFIRr4fctTou6sYEnFbUqfpr25NPcV2gQSz14u/RXEt9ZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=XoTRP5rHfp2n6pN5yV4bVhMExAaAovGS+voZktxV1y4=;
	b=34tUHXi7bZTyI1Ebc49lrDiqlsqu7AXEy8wAEuDCTNeWsfvELHwIVXlQaTQrx84+7Pg8
	 lKHZAsATznEm3lQCUBnJmeB0nQRjMOSHwBsSHJ3mkzvGbJsBlrpFbA0lNW98qm1Q/QtQB
	 fb0ity885MWOcZvWMfLm+yDtQ2J/NyNyIUj+coCtm13F1+chkJCWesQZ/D310DN4mWegE
	 Ux6AtpdhEe+kcILxEkC/TyxAKso4VIcN9dXy6LuqDlgNQ+kij8W9poaxmtOjUbQHPpNTL
	 NUOfXyMUL+U2y7YI9Tz8UZXB3zzfr26FMewXKlJroSP/8ouy8Y1BTQRittvbgBMo0Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jKvXep5X;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6620606A335
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 01:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6620606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jKvXep5X
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0291cc0f2so1347405ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 17:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795051937; x=1795656737; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XoTRP5rHfp2n6pN5yV4bVhMExAaAovGS+voZktxV1y4=;
        b=jKvXep5Xo980U0zPFWeaCqcCBQ/E1notJYII+P+CIDaYXD/mBzJ2Tzgr2sVv2J17Lb
         CcNpj4kslHGdKhvMG8a8xx+FV9jrXqasc9pTO4ZB91jZX2NWSjOlSgwYp4RCF9kKOdGp
         M19VDMVoNLQus/FGNo9STxNKx257S8CQp7UfcsZrEbdRR1UO2mNrZEDKurIT2UDANycR
         EclhqaR1bjAwxW82QozLoohbXJMg6n0F5eMtDPzdJ5Wldm5Trdh4SL5WyBD9IiJlX6K5
         /w24D2sR1VDvhHb9N01EZAsFaJmE3AD8ObE9YKVu0O612qyGkh/cMkGSX+bunNHn/+i9
         BR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051937; x=1795656737;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoTRP5rHfp2n6pN5yV4bVhMExAaAovGS+voZktxV1y4=;
        b=ppGmkP6wPNT8HYwDf+ULy1AUCaUCaGu19AbpFI4XNTz8u0Qz1EjtUuQ+WeCEJZO8g5
         FDke0mu8+ip6K+vJ55gkL1l+0ZKC2DVRmj0MjYmlsuQcsgZS40FWJ/GA97G7B+P6SbKy
         OHxrpQHlQwpfJu7AwtDZAFqRIczIoqqHfqnYUewAFUhZFK1EtzePTbEnmXaLVVVvMt9P
         UKfnKk0p7+f1FWiiuHU0rKnBRAmOCmE8NsZOSl0drQY1w23cponoyf3+KysPvdCR22oq
         2pCJPZGSmr+dqlcoIysddLCuBgnUiTlKzzO+z3tkrsOJmzfvsWn/2MkdCnC70xJ55RPN
         1lLw==
X-Gm-Message-State: APuU4Z/K3zg+gHSENSsb7SIb4LAw5l1yZtAJqhAk3y36ZS4JAHK+/Bly
	BVvIOa3+FiUcGG5GyoQVNkcULb9k1x/avVU+seva8qvJDLh44ddoMdkzucTvH0Fti1UFblWuDU1
	Yyw==
X-Received: from pjx14.prod.google.com ([2002:a17:90b:568e:b0:3a8:8d0:61eb])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5803:b0:3b3:bd07:6646
 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr4253952a91.52.1795051936875; Wed, 18
 Nov 2026 17:32:16 -0800 (PST)
Date: Thu, 19 Nov 2026 01:32:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119013208.4089480-1-akorn@google.com>
Subject: [PATCH v2] hwmon: (pmbus) Clear only CML invalid command fault during probe
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arthur Korn <akorn@google.com>
Content-Type: text/plain; charset="UTF-8"

During driver initialization and register capability probing, pmbus_core
and the generic pmbus driver send CLEAR_FAULTS (0x03) to clear any
communication or command faults triggered while probing unsupported
registers. However, CLEAR_FAULTS unconditionally clears all latched
fault status bits across the device, including hardware power fault
registers such as STATUS_WORD, STATUS_VOUT, STATUS_IOUT, and
STATUS_MFR_SPECIFIC. As a result, a BMC reboot or driver re-probe erases
pre-existing voltage regulator fault telemetry before monitoring or
diagnostic tools can inspect it.

Simply omitting fault clearing during probe is not viable because
probing unsupported commands (such as PMBUS_PAGE on single-page PMBus
devices) asserts PB_CML_FAULT_INVALID_COMMAND in STATUS_CML. Leaving
that bit latched causes pmbus_check_status_cml() to fail subsequent
capability checks (including PMBUS_VOUT_MODE and sensor discovery) with
-EIO.

Starting with PMBus Revision 1.2, individual bits in STATUS_CML can be
cleared via Write-1-to-Clear (W1C), a mechanism pmbus_core already uses
in pmbus_get_boolean(). Introduce pmbus_clear_cml_fault() and export
pmbus_clear_cml_faults() in the "PMBUS" module namespace to write
PB_CML_FAULT_INVALID_COMMAND to PMBUS_STATUS_CML during device
initialization, register probing, and pmbus_identify() on PMBus 1.2+
devices while preserving all other latched fault bits. Fall back to
pmbus_clear_fault_page() on PMBus < 1.2 devices or if writing
PMBUS_STATUS_CML fails.

Tested on BMC hardware across 130 hwmon devices (105 PMBus devices
covering tda38740/xdpe1a2g5b, isl68137/raa228234, adm1266,
ltc4286/ltc4287, and generic pmbus regulators including TI
tps546e25/tps546b25 and factory write-protected converters), verifying
that all devices probe cleanly with no -EIO regressions. Also verified
via unbind, fault injection, and re-bind across both driver-specific and
generic pmbus_identify() paths that PB_CML_FAULT_INVALID_COMMAND in
PMBUS_STATUS_CML is cleared on probe while other STATUS_CML and
STATUS_WORD fault bits remain preserved, and verified clean fallback
when writing PMBUS_STATUS_CML is NACKed.

Signed-off-by: Arthur Korn <akorn@google.com>
---
Changes in v2:
- Fall back to pmbus_clear_fault_page() if writing PMBUS_STATUS_CML
  fails (e.g. NACK on devices that do not support W1C on STATUS_CML).
- Export pmbus_clear_cml_faults() in the "PMBUS" namespace and use it in
  pmbus_identify() (pmbus.c) so generic pmbus devices also preserve
  non-CML faults during probe.
- Re-tested on hardware covering generic pmbus_identify() fault
  preservation and the STATUS_CML write-failure fallback path.

 drivers/hwmon/pmbus/pmbus.c      |  2 +-
 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 30 +++++++++++++++++++++++++-----
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index f8189c11..f239dafb 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -113,7 +113,7 @@ static int pmbus_identify(struct i2c_client *client,
 			info->pages = 1;
 		}
 
-		pmbus_clear_faults(client);
+		pmbus_clear_cml_faults(client);
 	}
 
 	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 5525c048..8170098f 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -581,6 +581,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
 int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 			   u8 mask, u8 value);
 void pmbus_clear_faults(struct i2c_client *client);
+void pmbus_clear_cml_faults(struct i2c_client *client);
 void pmbus_check_and_notify_faults(struct i2c_client *client);
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index b3aa7f1a..a5255ffb 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -717,6 +717,26 @@ void pmbus_clear_faults(struct i2c_client *client)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
 
+static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	if (data->revision < PMBUS_REV_12 ||
+	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
+				   PB_CML_FAULT_INVALID_COMMAND) < 0)
+		pmbus_clear_fault_page(client, page);
+}
+
+void pmbus_clear_cml_faults(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	int i;
+
+	for (i = 0; i < data->info->pages; i++)
+		pmbus_clear_cml_fault(client, i);
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_clear_cml_faults, "PMBUS");
+
 static int pmbus_check_status_cml(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -745,7 +765,7 @@ static bool pmbus_check_register(struct i2c_client *client,
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
 	if (reg < PMBUS_VIRT_BASE)
-		pmbus_clear_fault_page(client, -1);
+		pmbus_clear_cml_fault(client, -1);
 	return rv >= 0;
 }
 
@@ -762,7 +782,7 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 			status = -EIO;
 	}
 
-	pmbus_clear_fault_page(client, -1);
+	pmbus_clear_cml_fault(client, -1);
 	return status >= 0;
 }
 
@@ -790,7 +810,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_fault_page(client, -1);
+	pmbus_clear_cml_fault(client, -1);
 	return rv >= 0;
 }
 
@@ -3053,9 +3073,9 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	}
 
 	if (data->info->pages)
-		pmbus_clear_faults(client);
+		pmbus_clear_cml_faults(client);
 	else
-		pmbus_clear_fault_page(client, -1);
+		pmbus_clear_cml_fault(client, -1);
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
-- 
2.56.1.703.gf848ed807c-goog

