Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142668;
	b=SDPaNPVCyKJRtfE+LZQXQCSCHDiTEwNWAJLe6RbKNdI5jKt0zp5ZZyYztWZoISnuHsKS
	 DK+jVGE/29QRtWD18JrM+/pxs2FuExXshcYxyZDvGdRw7p5+/sl/+/z/XPwSm8VxpMpti
	 p66kANXcKOF7CA9kfZzjGuuo9QSxQnP/MBhpj4WRus9o0XChcxPt6k1xOZEiBa5FHoV52
	 l1fwncS3ykzZ8FGwyuUXkIeKNlsArZbKI+GhyohS0nVS4D0eij8NS8ILadcTu2OOz+0JT
	 Y+6r2+VaIK4rwpbVMLCZF1msPh5CT09cwdjIKYzDlP7hYwoLxTKcXJ4hNWd+cG0/tCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=01bqa38GgzDIRjN+9NmcZUUepQ6Tt3tbyMhDUCGMoKQ=;
	b=N9sfFpZiaqyiLBFkEBEnHS933E5XmGfcuDX+LWzK4VdKx3yNGZhDC46Q0YYJQAeP3Ch6
	 ErZ/71rT9czFBny1Rhmk1d3QKyeuczEL2r9/VKOM2Mw1rE044gxqEsQzfY0fDmB5r6t6U
	 1W4QUGvQ6MLzbOyirVRkhUTZA7BbROt632rSNWTSvDWAO+eUglCINXdRjQCEHGMm9dI+J
	 8lKn54yBqyRAH0drfoQnqLMwMW4+LKPSJ8qdEnpG3AhUFum50VSaZ7KEx8y5RTQUjdoMS
	 OgO3oeoYRqgoC/3zmLGWatNys9U5DZrPptBMjExaa/pNMYF5XSHKT7TeQrJJHo8Uv9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZjfZ6dm7;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5CA606A331
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 02:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB5CA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZjfZ6dm7
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso509607a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 18:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795142667; x=1795747467; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01bqa38GgzDIRjN+9NmcZUUepQ6Tt3tbyMhDUCGMoKQ=;
        b=ZjfZ6dm7gJ3l0enKo9GYxmXvMIYGO7NwWTCW9vQqiGv3HGPqVNTavkwyWvSbFEtp7L
         QdD5j47ODZJyvfpqAkvtIn9ALOpK5UPApzj5FoOBpuPutpqqb6LhO1PEDKTzMuJqhNZd
         O+DCEAjO/YxIecjrQuvYTHDDfqqvrGvKZjYKWcY4vR4vGdd06EoI6UGaHk3Ei6nxELZO
         RGSma25trcMfMi4aZL/nhy71GXRPDiVigwRy3rpZ+Xsl8CYSORFcplcihkAhmiH3hEH/
         CbW6xdNONdeCuwgps/td6oNpvTMp3piCj4Oap0mHfNDDq8D684SbC4K/Rje/O37LQ1s0
         jbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142667; x=1795747467;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01bqa38GgzDIRjN+9NmcZUUepQ6Tt3tbyMhDUCGMoKQ=;
        b=M+oXkAvZRVBmLZxjnFuQMdOoKtz3c4ao6LA5ZbrXT19ezSS/H/zTqSp072fMf7jAdo
         j55XTGht/qMpbM0KSnfdQLK51YyNUAVAaIzlG6Xi7ijmhdlGTuVxXT+XaS3q/ELlHlUM
         gaQkAcEl2wcKMFgKApQqecUCpS+diLGVC+uBgJHuurt7g8ZDxdndckwIB/GTbPGKhGv0
         tqaeQAxuhRV2hp/fhOxuA0lEAwVP6XYyNh4xBMoZx2L3FyhxWoYwZkHYnchXQG4tAaQV
         v8zWrIQ01RXB/vO5zFcjU+ErdsH0mIZJLmRi7F98zkf48qTTf+FKC3coBMVLZjVcIxJX
         cTmg==
X-Gm-Message-State: APuU4Z/3Ih+v6ZnTYLWu/SiWUk7SBPhwqb27FszPRyBaSRDUj5+o0u64
	EvT5ILqQ/kYa+47qkpu+9twz4t0UgYd7fDZ1LCwMKAxc2w/Tt27W4msgS3S+pb2iu9auM7tD84S
	9QQ==
X-Received: from pgjk26-n1.prod.google.com ([2002:a05:6a02:81da:10b0:cdd:c2f7:a077])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:431a:b0:3fa:6e4a:a311
 with SMTP id adf61e73a8af0-4014d456c75mr1696479637.52.1795142666868; Thu, 19
 Nov 2026 18:44:26 -0800 (PST)
Date: Fri, 20 Nov 2026 02:44:16 +0000
In-Reply-To: <20261120024416.338876-1-akorn@google.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120024416.338876-1-akorn@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120024416.338876-2-akorn@google.com>
Subject: [PATCH v3 2/2] hwmon: (pmbus) Clear only CML command and data faults
 during probe
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arthur Korn <akorn@google.com>
Content-Type: text/plain; charset="UTF-8"

During driver initialization, register capability probing, and SMBALERT
mask setup, pmbus_core and the generic pmbus driver send CLEAR_FAULTS
(0x03) to clear any communication or command faults triggered while
probing unsupported commands or out-of-range page/register operands.
However, CLEAR_FAULTS unconditionally clears all latched fault status
bits across the device, including hardware power fault registers such as
STATUS_WORD, STATUS_VOUT, STATUS_IOUT, and STATUS_MFR_SPECIFIC. As a
result, a BMC reboot or driver re-probe erases pre-existing voltage
regulator fault telemetry before monitoring or diagnostic tools can
inspect it.

Simply omitting fault clearing during probe is not viable because
probing unsupported commands asserts PB_CML_FAULT_INVALID_COMMAND in
STATUS_CML (causing pmbus_check_status_cml() to fail subsequent checks
with -EIO), and probing out-of-range PMBUS_PAGE or PMBUS_SMBALERT_MASK
operands asserts PB_CML_FAULT_INVALID_DATA and PB_STATUS_CML.

Starting with PMBus Revision 1.2, individual bits in STATUS_CML can be
cleared via Write-1-to-Clear (W1C), a mechanism pmbus_core already uses
in pmbus_get_boolean(). Introduce pmbus_clear_cml_fault() and export
pmbus_clear_cml_faults() in the "PMBUS" module namespace to clear
PB_CML_FAULT_INVALID_COMMAND | PB_CML_FAULT_INVALID_DATA in
PMBUS_STATUS_CML during device initialization, register probing,
pmbus_write_smbalert_mask(), and pmbus_identify() while preserving all
other latched fault bits:

- Verify during pmbus_init_common() that PMBUS_REVISION is valid (>= 1.2
  and not 0xff), that the driver does not hook write_byte() without
  write_byte_data(), and that PMBUS_STATUS_CML is readable before
  enabling STATUS_CML W1C clearing.
- Fall back to pmbus_clear_fault_page() when STATUS_CML W1C is
  unavailable or if writing PMBUS_STATUS_CML fails.

Tested on BMC hardware across 130 hwmon devices (105 PMBus devices
covering tda38740/xdpe1a2g5b, isl68137/raa228234, adm1266,
ltc4286/ltc4287, and generic pmbus regulators including TI
tps546e25/tps546b25 and factory write-protected converters), verifying
clean probing with no -EIO regressions, preservation of non-CML status
faults across re-binds, and fallback when writing PMBUS_STATUS_CML is
NACKed.

Signed-off-by: Arthur Korn <akorn@google.com>
---
Changes in v3:
- Clear PB_CML_FAULT_INVALID_DATA in addition to
  PB_CML_FAULT_INVALID_COMMAND so out-of-range PMBUS_PAGE and
  PMBUS_SMBALERT_MASK operand probes do not leave CML faults latched.
- Use pmbus_clear_cml_fault() in pmbus_write_smbalert_mask() so IRQ
  setup during probe also preserves pre-existing non-CML faults.
- Gate STATUS_CML W1C clearing via data->has_status_cml in
  pmbus_init_common() (requiring valid PMBUS_REVISION >= 1.2 and != 0xff,
  no write_byte() hook without write_byte_data(), and readable
  PMBUS_STATUS_CML != 0xff) so driver write_byte() / read_byte_data()
  filters are respected.

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
 drivers/hwmon/pmbus/pmbus_core.c | 44 +++++++++++++++++++++++++++-----
 3 files changed, 39 insertions(+), 8 deletions(-)

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
index b3aa7f1a..89a96732 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -122,6 +122,7 @@ struct pmbus_data {
 #endif
 
 	bool has_status_word;		/* device uses STATUS_WORD register */
+	bool has_status_cml;		/* device supports STATUS_CML W1C */
 	int (*read_status)(struct i2c_client *client, int page);
 
 	s16 currpage;	/* current page, -1 for unknown/unset */
@@ -717,6 +718,27 @@ void pmbus_clear_faults(struct i2c_client *client)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
 
+static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	if (!data->has_status_cml ||
+	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
+				   PB_CML_FAULT_INVALID_COMMAND |
+				   PB_CML_FAULT_INVALID_DATA) < 0)
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
@@ -745,7 +767,7 @@ static bool pmbus_check_register(struct i2c_client *client,
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
 	if (reg < PMBUS_VIRT_BASE)
-		pmbus_clear_fault_page(client, -1);
+		pmbus_clear_cml_fault(client, -1);
 	return rv >= 0;
 }
 
@@ -762,7 +784,7 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 			status = -EIO;
 	}
 
-	pmbus_clear_fault_page(client, -1);
+	pmbus_clear_cml_fault(client, -1);
 	return status >= 0;
 }
 
@@ -790,7 +812,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_fault_page(client, -1);
+	pmbus_clear_cml_fault(client, -1);
 	return rv >= 0;
 }
 
@@ -3046,16 +3068,24 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 		data->revision = info->pmbus_revision;
 	} else {
 		ret = i2c_smbus_read_byte_data(client, PMBUS_REVISION);
-		if (ret >= 0) {
+		if (ret >= 0 && ret != 0xff) {
 			data->have_pmbus_revision = true;
 			data->revision = ret;
 		}
 	}
 
+	if (data->revision >= PMBUS_REV_12 &&
+	    (!info->write_byte || info->write_byte_data)) {
+		ret = _pmbus_read_byte_data(client, info->pages ? 0 : -1,
+					    PMBUS_STATUS_CML);
+		if (ret >= 0 && ret != 0xff)
+			data->has_status_cml = true;
+	}
+
 	if (data->info->pages)
-		pmbus_clear_faults(client);
+		pmbus_clear_cml_faults(client);
 	else
-		pmbus_clear_fault_page(client, -1);
+		pmbus_clear_cml_fault(client, -1);
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
@@ -3703,7 +3733,7 @@ static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg,
 	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
 	 * is not supported by the chip.
 	 */
-	pmbus_clear_fault_page(client, page);
+	pmbus_clear_cml_fault(client, page);
 
 	return ret;
 }
-- 
2.56.1.703.gf848ed807c-goog

