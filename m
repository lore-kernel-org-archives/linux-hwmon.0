Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585036;
	b=3bIR81UNjszlYM9ooPo3fOAsJ4nlI/dH0SDo5+wYN9dMyV/fvCsqFTViV5CXO0wk0L28
	 FcD96eiUJ3eORBBlO3Exm0WRhxs0b4lXKEbJ/mmv5w9KyUdpwaCQYzWuCj1SbvDLtGUXd
	 aa+4Z3m6jtuaTyEm8PjqMp4Ef8YcvEAoSs4/wmeu9ej19n07CRpM62lKwEiUQE+UXGEmG
	 Um6Xo7B+RrIg0WuzQt9+i/ZSPln1UKwTVYhdZ8VNFVs41xKnqdXNtjZNfBE3K7/ddSUtV
	 eVGm/1tAX1ejp2Yq3gwBDQZQbFufQiy9ksslFSdf/+RzOl9Zy6i3egoDaCnzt7PubhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=o3rc6H2PJBP0VEIUZixLOQruDmTF4QhjMKpNZAOYmo0=;
	b=vMTXnAUBrUUZ98G8ruPdR6G/jXkb9XlPdL1PkJSpCliPglyxACydilMgGRfguN5SvmZY
	 M+euxylF1frB0BpyGtc92m6Vbc/fFVlMmVV1AZj8idYqwhZLHwIKbzYHnKjOzDwuc0z6f
	 AG3mB2XRePSncLLaV5YTNBZDSN1CDgqFLP46v+SImBa+3gKwBXcnNzCbIFeKJWTKRTQG8
	 EgnbkMJj44Q523G++VYNdnYJE9JoCApmhHiDVzKimk/VCVESnQ+9QZMNDLHwlMayDIhJg
	 QHcEPRxgDVg67bawRQXkUJtKwTBUbTPItdU7K82KBiCugzJccy4ExGiR9keZdmpySlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FNoDj3W6;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD7606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 05:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDD7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FNoDj3W6
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4ca90ed93so1907209a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 21:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795585036; x=1796189836; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3rc6H2PJBP0VEIUZixLOQruDmTF4QhjMKpNZAOYmo0=;
        b=FNoDj3W6jHuyyqt8pGsKEdYQuCJvnojzxuQDtySz0KjKhNdMzMjs34zC/skEIqk6AC
         59m9p6OHnWL6Bs1ulXHMUOmDxrSc/NciZYi20oqp3+lSrVkmnX37+mVsQvsaa6Tv240Y
         996EWNmzEn9cne7K51l22ZvIHYbd8bjO+636lGIWmugQye9TaI5t0AUUQ/jjrbgTJeRC
         40a0QQtf3rVkmS5rOgj/1tbtNTCvU6LivlClOO5ODCPDy3eAthr5bA5DuBZF2vaz7d/z
         YdYDiPVf/PGUrgHebaplf+yhb3elhiP+9fB37evg1HRMc4JBOnKBXDMEUY8EEPDx7QbY
         561w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585036; x=1796189836;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3rc6H2PJBP0VEIUZixLOQruDmTF4QhjMKpNZAOYmo0=;
        b=SKxCfH1ebYOyCC2o7Vrp1oB2FwGFKhO3vPKgRrdssF1NyLW5AXUGw+/qozM5Q1lisk
         mM2GNlKAQa8V1i4WUBBU24GVFvLaGH+EJHzIgt5JC+yxIaVaNAZnvJTZmIXlCu8kk9ov
         BTzh223M0Sd99clS0YK82yWNxP27eblnHf5gIBoCfpiwW+iVVSeKOnVIfBmRbRRdpaA2
         l0C+wBJV02YHk3eA7IbTYadeLuuFiBnU0qH7uxTrFD3Ac7h2vmnYGcCidBj1gvb9emQJ
         vO1S372ydX/6JoQGWsrQ2ZUx56AW3y+05Wt8dJdgxm1fyne1kmCdTUcR9z5yiX8qDR2K
         8xHQ==
X-Gm-Message-State: APuU4Z9jr27Ga0Ek/n6f9Z9F5Nx+D6edstfuEWn4c3aoZhdFwEm1hyQG
	THbcZVhPo8TOHHFXZIH1KpLMfjJaFJv+2GY/dB+fWkKeCLYEkfPomjuwou7ZMDYtfNitR4o5vGX
	f7Q==
X-Received: from plig8.prod.google.com ([2002:a17:903:4588:b0:2f0:2206:68e8])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:298d:b0:2e9:740c:36c
 with SMTP id d9443c01a7336-2f03f1ba67amr162001195ad.41.1795585035378; Tue, 24
 Nov 2026 21:37:15 -0800 (PST)
Date: Wed, 25 Nov 2026 05:37:10 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125053711.3098007-1-akorn@google.com>
Subject: [PATCH] hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML is read-only
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arthur Korn <akorn@google.com>
Content-Type: text/plain; charset="UTF-8"

Some PMBus 1.2 devices (such as ADI ADM1273 and ADM1281) report
PMBUS_REVISION = 0x22 and implement STATUS_CML (0x7e) as read-only:
they ACK SMBus byte writes to PMBUS_STATUS_CML without clearing latched
fault bits, and only clear STATUS_CML via CLEAR_FAULTS (0x03).

During pmbus_init_common(), probing an unsupported register such as
PMBUS_WRITE_PROTECT (0x10) latches PB_CML_FAULT_INVALID_COMMAND in
STATUS_CML. When pmbus_clear_cml_fault() writes to PMBUS_STATUS_CML and
sees ret == 0, PB_CML_FAULT_INVALID_COMMAND remains latched, causing
subsequent pmbus_check_status_cml() calls during attribute discovery to
fail with -EIO.

Verify on non-write-protected devices that PB_CML_FAULT_INVALID_COMMAND
and PB_CML_FAULT_INVALID_DATA actually cleared when a CML fault is
expected or cleared unconditionally. If either bit remains set after the
write, disable STATUS_CML write-1-to-clear for the device and fall back
to pmbus_clear_fault_page(). Skipping the readback on supported register
probes (rv >= 0) avoids extra SMBus traffic in the common path.

Tested on BMC hardware across 130 hwmon devices including 4x ADI
ADM1273-1A (adm1275), Renesas RAA228234 (isl68137), Infineon XDPE1A2G5B
(tda38740), ADI ADM1266, and factory write-protected converters,
verifying clean ADM1273-1A probe/re-bind fallback to CLEAR_FAULTS and
preservation of companion STATUS_CML fault bits on W1C-capable VRs.

Fixes: d9d30e1cb9ca ("hwmon: (pmbus) Clear only CML command and data faults during probe")
Signed-off-by: Arthur Korn <akorn@google.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 40 ++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2772860..82dfa82 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -727,15 +727,31 @@ void pmbus_clear_faults(struct i2c_client *client)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
 
-static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
+#define PB_CML_FAULT_CLEAR_MASK	(PB_CML_FAULT_INVALID_COMMAND | \
+				 PB_CML_FAULT_INVALID_DATA)
+
+static void pmbus_clear_cml_fault(struct i2c_client *client, int page,
+				  bool verify)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
+	int ret;
+
+	if (data->has_status_cml) {
+		ret = _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
+					     PB_CML_FAULT_CLEAR_MASK);
+		if (ret >= 0 && verify &&
+		    !(data->flags & PMBUS_WRITE_PROTECTED)) {
+			ret = _pmbus_read_byte_data(client, page,
+						    PMBUS_STATUS_CML);
+			if (ret >= 0 && (ret & PB_CML_FAULT_CLEAR_MASK))
+				ret = -EIO;
+		}
+		if (ret >= 0)
+			return;
+		data->has_status_cml = false;
+	}
 
-	if (!data->has_status_cml ||
-	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
-				   PB_CML_FAULT_INVALID_COMMAND |
-				   PB_CML_FAULT_INVALID_DATA) < 0)
-		pmbus_clear_fault_page(client, page);
+	pmbus_clear_fault_page(client, page);
 }
 
 void pmbus_clear_cml_faults(struct i2c_client *client)
@@ -744,7 +760,7 @@ void pmbus_clear_cml_faults(struct i2c_client *client)
 	int i;
 
 	for (i = 0; i < data->info->pages; i++)
-		pmbus_clear_cml_fault(client, i);
+		pmbus_clear_cml_fault(client, i, true);
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_cml_faults, "PMBUS");
 
@@ -776,7 +792,7 @@ static bool pmbus_check_register(struct i2c_client *client,
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
 	if (reg < PMBUS_VIRT_BASE)
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -793,7 +809,7 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 			status = -EIO;
 	}
 
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, status < 0);
 	return status >= 0;
 }
 
@@ -821,7 +837,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -3094,7 +3110,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (data->info->pages)
 		pmbus_clear_cml_faults(client);
 	else
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, true);
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
@@ -3742,7 +3758,7 @@ static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg,
 	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
 	 * is not supported by the chip.
 	 */
-	pmbus_clear_cml_fault(client, page);
+	pmbus_clear_cml_fault(client, page, true);
 
 	return ret;
 }
-- 
2.56.1.750.gf70dc682cf-goog

