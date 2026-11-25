Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630449;
	b=x7bS+xAWN2mSKOD9cSUspo9iRb6uglKJvID9YWN7inZZHljM/KEEmvfNS6y/TOrNAASK
	 VuEjeSc+nKqsAH4mVrqDHZVPv8UjZxYgzBc96IlV8svYOnnvo3Dd6O9m86tRYEb1jjZS1
	 lpd7rbdrHyLVDUhTTcYAzNGJyrv7mPr4N7q49c1aT0IiHF1LEI6+5R2ZcKYwwR5L5KcS5
	 Q9m0vC94HkkTMOJNKLyVlXHMbzHUvmNRxX+fPVYgartFLXiYVCIQIBYN1kGMJhN20o+so
	 /0hxYLx1O8OyZoPbbywON/k/uEGA4H2VQyZ8q/+O5bHyeAtFd3fWPH6QqZoNvaQnzaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=ZwRGu5/OnsrkftCiXnzxko3YG0ZahDFZFdz2PcRV2x8=;
	b=UpraV/HOq2r7v4hzfCWGr5xD+FE1pung2CGEDEq8CEvyI+nI13v3d9f1Up2CYVuYO2xc
	 MsyEA2rgpj2rk1+ja3wJ8g66belCP8kCA2JLuZucbS2itAV+Qdwh9AfGs9NUbkeLovW/H
	 cgFEnVGV4Xf+4nTtj/NIMHg/EC6GfRe1FEXtoDnpQF9eZO+w10f7/jtz31D9Q9wwcKOuD
	 UsWyDBApzW/t3cHwVBGe0SVKeeUM652fP1RR32RGRIBndjIAXBWqLFb2v339p30z0s9HK
	 7pgmae7FQ/XWpK+NtjvaM2FjeEFtiittevpWMIdQX6rww94XwqtnK1N8ZvmT3iv2HHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fYFigY7U;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D52B606A33C
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 18:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D52B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fYFigY7U
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed05b3eaecso56050545ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 10:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630445; x=1796235245; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwRGu5/OnsrkftCiXnzxko3YG0ZahDFZFdz2PcRV2x8=;
        b=fYFigY7UGADzFtuwZ4CdiHTrw81fCOevqJLylObrq+14GOCRGptZ2TtcwB/hcYZuvb
         1Hj49IFBxCHz6/zfONylSsBdJBV48gIOy6U6OCt5WEROs+zCmbEbooB5QVKxcOI01PvW
         A+a4ss2uf2ixTdM8xZxQvJ1R4/85C7sPj00so08g+dKYSR5dkvn4OLOpkDY+JWCGJ0h2
         m90BJrUzNum+M6B8bAdavr4fT0zhQL3hlqv+eL13tCg/qE3wiQ6RkOjVruFBpQfSSqZw
         wsULl8v/RW6tFZ6R2CjAXQQuCY3qxXhdXk1Oq8PDRBBbzmWYNMYPufL6cDsZhuV+W5hi
         XhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630445; x=1796235245;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwRGu5/OnsrkftCiXnzxko3YG0ZahDFZFdz2PcRV2x8=;
        b=HNCamEGnKV95knWpWm+xr6mV0XQ1j8KqF5YTMp1C2ioeWBlvyBAasRWC+HrdHAOQ0F
         aldgtcizrk7yDAnaYo69JpGc/LSblgX2IP7fE3Lf9EhJcFrwbE8v2wJah/ThO5OE0yeA
         n2raMVopSj7r096LywEn0mJANCLKuM+jIdHurG0+QLIf/dxWdYyyWwFJM8QTYOibJdyP
         tSqByk01uRCW5qCKqBwzcFWa9SEl/m/uOLD2AwYEo8tpzY64eiy/RHN+k+fytBY0q1FE
         wS8sVCBulPdCHtdk8r/pUtt0RW6IcDQeP8CNH+KB7f3PUUX4rY/5VEWfgt0EGXoQHOxE
         mQGw==
X-Gm-Message-State: APuU4Z+E6wahl8iq4M3LCDwzpxCmvO86KiH2T0xteVlgdVQ+oVOykQa6
	Io9lyqtKeFvdcWuUH3L8ubsfcg8HMzxpxthmZOwWXhevUNvmGoFyV5brUqDzy0U4MyN+Eze4P8h
	BmQ==
X-Received: from plha17.prod.google.com ([2002:a17:902:ecd1:b0:2f0:6f2e:4b9f])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b88:b0:2ef:de6e:9877
 with SMTP id d9443c01a7336-2f03f1fd49dmr195687415ad.57.1795630444372; Wed, 25
 Nov 2026 10:14:04 -0800 (PST)
Date: Wed, 25 Nov 2026 18:13:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125181336.3298961-1-akorn@google.com>
Subject: [PATCH v2] hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML
 is read-only
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
expected or cleared unconditionally. If the write succeeds and either
bit remains set on readback, disable STATUS_CML write-1-to-clear for the
device and fall back to pmbus_clear_fault_page(). Do not clear
has_status_cml when _pmbus_write_byte_data() returns an error, so
per-page write failures (such as -EOPNOTSUPP on read-only virtual pages
like max16601 page 1) fall back for that page without disabling
STATUS_CML write-1-to-clear on other pages. Skipping the readback on
supported register probes (rv >= 0) avoids extra SMBus traffic in the
common path.

Tested on BMC hardware across ADI ADM1273-1A (adm1275), Maxim
MAX16600B.04 (max16601, 3 virtual pages across VCORE, sensor IIN/PIN,
and VSA), Renesas RAA228234 (isl68137), Infineon XDPE1A2G5B (tda38740),
ADI ADM1266, and factory write-protected converters.

Fixes: d9d30e1cb9ca ("hwmon: (pmbus) Clear only CML command and data faults during probe")
Signed-off-by: Arthur Korn <akorn@google.com>
---
v2:
  - Only clear data->has_status_cml when _pmbus_write_byte_data()
    succeeds and the post-write readback shows PB_CML_FAULT_CLEAR_MASK
    still set, so per-page write failures (such as -EOPNOTSUPP on
    max16601's read-only virtual page 1) do not disable STATUS_CML W1C
    for other pages. (Sashiko, Guenter Roeck)
  - Verified STATUS_CML W1C and virtual-page behavior on MAX16600B.04
    (max16601) hardware.
  - Link to v1: https://lore.kernel.org/linux-hwmon/20261125053711.3098007-1-akorn@google.com/

 drivers/hwmon/pmbus/pmbus_core.c | 41 ++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2772860..b7f2f01 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -727,15 +727,32 @@ void pmbus_clear_faults(struct i2c_client *client)
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
+			if (ret >= 0 && (ret & PB_CML_FAULT_CLEAR_MASK)) {
+				data->has_status_cml = false;
+				ret = -EIO;
+			}
+		}
+		if (ret >= 0)
+			return;
+	}
 
-	if (!data->has_status_cml ||
-	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
-				   PB_CML_FAULT_INVALID_COMMAND |
-				   PB_CML_FAULT_INVALID_DATA) < 0)
-		pmbus_clear_fault_page(client, page);
+	pmbus_clear_fault_page(client, page);
 }
 
 void pmbus_clear_cml_faults(struct i2c_client *client)
@@ -744,7 +761,7 @@ void pmbus_clear_cml_faults(struct i2c_client *client)
 	int i;
 
 	for (i = 0; i < data->info->pages; i++)
-		pmbus_clear_cml_fault(client, i);
+		pmbus_clear_cml_fault(client, i, true);
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_cml_faults, "PMBUS");
 
@@ -776,7 +793,7 @@ static bool pmbus_check_register(struct i2c_client *client,
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
 	if (reg < PMBUS_VIRT_BASE)
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -793,7 +810,7 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 			status = -EIO;
 	}
 
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, status < 0);
 	return status >= 0;
 }
 
@@ -821,7 +838,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -3094,7 +3111,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (data->info->pages)
 		pmbus_clear_cml_faults(client);
 	else
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, true);
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
@@ -3742,7 +3759,7 @@ static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg,
 	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
 	 * is not supported by the chip.
 	 */
-	pmbus_clear_cml_fault(client, page);
+	pmbus_clear_cml_fault(client, page, true);
 
 	return ret;
 }
-- 
2.56.1.750.gf70dc682cf-goog

