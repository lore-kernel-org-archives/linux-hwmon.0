Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794972062;
	b=W1V0KpdQWTPrwEu2FN383TqQX5jH0TBhI2RqQaLR25yp+xgD4kCPsmjO/mrLCCJuf4h8
	 rQKy/UJnu+e4k52hKfU/+7uq6ekiz78rlnjAygJ6knxGqvrA/X7VGC0QHllAHXwt+CZWd
	 3cBGgaj9Da1gK8ne521iCC4rc5RIOvUyBS/1yL0JfJ8q25AMyBRSrJ1Ig0efUmsRGSae4
	 y+8N2riiOaKlI8cGz5fiMVBUOi2fCEt1QW6nHYqWlSgN+OOooo4hGGoI8iWl7y8065M9z
	 NTcPq2hGMbyx9EZTRa3DqhtNaras11amVQNLur606tzdCRuvN+L6pEtPnCTM+FdgFNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=xRhE+Esu+lx14GhfSq6dBT2ZErASrt08Fmg1WQlGcak=;
	b=lHjKbuCcRzbGTV+dMVx/YFakqGsdYaFs5sqLfTMoriM+JheqEIfqV9QNG8QyZPkruw/A
	 dC2tiwKOSaa+Kr20ILbM9yDjLE+ESszmoapzvUVmiQ2VomVf2elLuNmKo69Jo9YwJ/p5m
	 Ieg8QOQBEsVd+OUNYvqfGQO0DJruTQuG3u7xV64LRNUMsAUYDyIKA1dLSXoJYGPh5EBe1
	 Pj9zknmnprHWO1FEHIzjAlIubG7kQjZf6xYfKeHIwz2oG+grTfopY7xt99b9QHoupARkw
	 rEAhtb0i+/1g1nzc9y2lMfvRwfzK8SiDZwI6q3ZLq6xTMwCpzDyDIffmD/Vs33oqGEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RLSzoqJO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F4606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 03:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 126F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RLSzoqJO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018493d57so31415e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 19:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972060; cv=none;
        d=google.com; s=arc-20260327;
        b=kRj7VlrjCqfmLLvBPcIBTi4Jws6WazoVB01Hd3FHX9T/2mSqZIrxqsHkYZ2+r0QJNN
         wlHC8dW2pTO3WlinK53CHEi4ofKDh/rwvig4IquNrunixhTnPsKZLKdicxFG+4zv9Vu9
         TTEUEVadopC1hUMOEuTLprWmrFYtT9z5f6Ta68Fhi7ACbsm62D1awtyJ9jroNBmtdLst
         SjtQQdz471EBPd3dZWf//lUgU/qzIveYdqs+1hhjWM7sjUHcN46ppPhILuVJO15mu6dE
         DMb8X0NPP/5TCJ3G37SZ17I79qpfxCtbIJy2rulNwDtOEnmz8ubQVmkfBEClN0Y3cRcz
         A5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=xRhE+Esu+lx14GhfSq6dBT2ZErASrt08Fmg1WQlGcak=;
        fh=Duux8JoPX5cPNOPXAaYTcvKQZx4Bwysnj2m7tn6W0kY=;
        b=p1CPtK4KgjeNXPbnb6SlmDF9QDLbeiHzl1vfz9yfm19I8bhV5GgxDz6VNWph+ZeDmQ
         9nixYR80cGwYodothNOqUXgZ684Ppmw8YQX9BCfMnaAVvN50DxTz3c9/SZrdMVg0dXhj
         aypQs+E+TyKaU6JqAPUCiGEtiX4yRHXMCS1Gr/68jkGwfCccDn+5MfCGTWxIcfvriXNA
         QAnrKGEU0NbJUfNiO31TvFK2zAc9klP8uvknFOQtGn18zsPTzl8yGhuCZ3rf/V3AsT1Q
         OxDUGSUPrebz3qJbFq5Sw+1YLCuRMu1einHP56Ij6TSSHuIHp6ywZuksjDp2a630kH+B
         NXoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794972060; x=1795576860; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRhE+Esu+lx14GhfSq6dBT2ZErASrt08Fmg1WQlGcak=;
        b=RLSzoqJO7npzXKTNBjWL4aTqDczrzEeen9Thz3L+72zmM64p3UE5S/f86qU9KNZpZ3
         W75lWoNItvdL4MgRcOFmlJhd1pnl5QFQtSeXfbfmskOEuAm80nrJwMM3rMfaSJuTCCY4
         s7ZCEtl+LUxXDPvYes8x5amtPU3W3FHmxMogOfi87oeqtxpYorTewTeCOgtmHxpAqiVV
         8i3clJfLjYG+RvRocoDABugZVWiPGrl0Zamm3yktr3d9KPCG+KaxUP3lBzpPsg0wT0Td
         8TIPJpXgDjMm2AdyAGc9wVyHCl5ghoSq3pM4ctQ41mObHFOWBPHR10SsmBxtBNQfh/96
         bvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972060; x=1795576860;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xRhE+Esu+lx14GhfSq6dBT2ZErASrt08Fmg1WQlGcak=;
        b=Onuzvn1/BiBtK1hv4IBXamIIMznbEduHq2nU2lSHP42JK8yehyFdQlXgjDXCeIWt3p
         RKmDMhBhGtb/TqDnIIRWw8+lWYcEYPRl1A8KxOdcCeDOSv14NpUj4C0VnM9rXEvx6lh4
         YNmYjr64rNX3Uao0poMcDTvLRdXsAOHEFsPOvudoEVnu59g9IVEFNinqhxafZIKdgrRC
         ojbsEH7KfkTFVYamwA05NUfiM4ZtVUX+AswbfujBO/rl5e7jqecxN2CgzDJ3aLpTYNOz
         TRltMKL+A5A2bvFNzT/Ov5bgvlRHWeGQZmtzFRptJi37sIJH7uLNpJNLvyA8G4gFW7as
         3HDQ==
X-Gm-Message-State: APuU4Z+LFPtZl30qqszTgFK0fU65dVhGpeEKwSEnf5QZQJJBwUGesk1L
	hdcV6pVkDg7+qLNIyvDJ1rwAegCV2hiOFQOkFdJElUsSOK1smCtiWR5ci5UNoMrr+VD5X2Qx8/y
	SxsWOaArNc4qrOs13dkttionJ1uDI08QCsB+jHStsRsUgl/0JNDjKTQ==
X-Gm-Gg: AYBFou3GxSfLCiRkIa70YaAl2pEsV8TygLpyykUg06kmwfzJShAcOp2wuhvQ6oZz4s7
	YqiZjmj/Q6whf9IhO51xZQTpAWMR2Krc3hp/Wt5fhq7Trn+CRIqB3gi4pdyfRjEwmg8yW+J5NIx
	d/OKAM8QP16vm/qaT8mYWDv7hvEZDkIBQGx9/z02ub9zxcUWasAyCS0EIyXe1RQnUPQfXZqcq6Y
	ODpQnPd8LXL7W/HhJNxF4GCdHCMAB9gHRfKJl22AhRfjAZ3wh2TaXKLMLzXBpWNx2FPkbJxis8S
	dnOxaK8toddehN7kHizk4knl4rUIZrmfBHRcSC5XNDmc4OwUs7HD3+eYgnwjSbIXxR+pWby2HiJ
	6IkgUZ7fBPlUWFDkPDxbpc4/VtZuWZiUnIXkAtTBdDqcB6gJWg/ohGqR9JnWNIUOQng==
X-Received: by 2002:a05:600c:34d2:b0:4a2:1912:6687 with SMTP id
 5b1f17b1804b1-4bb7d5256efmr594965e9.2.1794972059800; Tue, 17 Nov 2026
 19:20:59 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Nov 2026 19:20:59 -0800
From: Arthur Korn <akorn@google.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 19:20:59 -0800
X-Gm-Features: Aa3M54pzYkz4lZEXX0dcQSHg6fA-4NvR-7WeCojtrVsdR7SmX8U9hYpTqW0J5BI
Message-ID: <CAJ5cSJH7_tCDCeN8XkQcMQLgANLVAf9xozKHp=e+2fLX7CSo=g@mail.gmail.com>
Subject: [PATCH] hwmon: (pmbus/core) Clear only CML invalid command fault
 during probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Arthur Korn <akorn@google.com>
Content-Type: text/plain; charset="UTF-8"

During driver initialization and register capability probing, pmbus_core
sends CLEAR_FAULTS (0x03) to clear any communication or command faults
triggered while probing unsupported registers. However, CLEAR_FAULTS
unconditionally clears all latched fault status bits across the device,
including hardware power fault registers such as STATUS_WORD,
STATUS_VOUT, STATUS_IOUT, and STATUS_MFR_SPECIFIC. As a result, a BMC
reboot or driver re-probe erases pre-existing voltage regulator fault
telemetry before monitoring or diagnostic tools can inspect it.

Simply omitting fault clearing during probe is not viable because
probing unsupported commands (such as PMBUS_PAGE on single-page PMBus
devices) asserts PB_CML_FAULT_INVALID_COMMAND in STATUS_CML. Leaving
that bit latched causes pmbus_check_status_cml() to fail subsequent
capability checks (including PMBUS_VOUT_MODE and sensor discovery) with
-EIO.

Starting with PMBus Revision 1.2, individual bits in STATUS_CML can be
cleared via Write-1-to-Clear (W1C), a mechanism pmbus_core already uses
in pmbus_get_boolean(). Introduce pmbus_clear_cml_fault() and
pmbus_clear_cml_faults() to write PB_CML_FAULT_INVALID_COMMAND to
PMBUS_STATUS_CML during device initialization and register probing on
PMBus 1.2+ devices, while preserving all other latched fault bits and
falling back to pmbus_clear_fault_page() on PMBus < 1.2 devices.

Tested on BMC hardware across 130 hwmon devices (isl68137/raa228228,
tda38740/xdpe1a2g5b, adm1266, ltc4286/ltc4287, and generic single-page
pmbus regulators), verifying that all devices probe cleanly with no -EIO
regressions. Also verified via unbind, fault injection, and re-bind on
PMBus 1.3 devices that PB_CML_FAULT_INVALID_COMMAND in PMBUS_STATUS_CML
is cleared on probe while other STATUS_CML and STATUS_WORD fault bits
remain preserved.

Signed-off-by: Arthur Korn <akorn@google.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index b3aa7f1ac479..848b519689ca 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -717,6 +717,27 @@ void pmbus_clear_faults(struct i2c_client *client)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");

+static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	if (data->revision >= PMBUS_REV_12) {
+		_pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
+				       PB_CML_FAULT_INVALID_COMMAND);
+	} else {
+		pmbus_clear_fault_page(client, page);
+	}
+}
+
+static void pmbus_clear_cml_faults(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	int i;
+
+	for (i = 0; i < data->info->pages; i++)
+		pmbus_clear_cml_fault(client, i);
+}
+
 static int pmbus_check_status_cml(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -745,7 +766,7 @@ static bool pmbus_check_register(struct i2c_client *client,
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
 	if (reg < PMBUS_VIRT_BASE)
-		pmbus_clear_fault_page(client, -1);
+		pmbus_clear_cml_fault(client, -1);
 	return rv >= 0;
 }

@@ -762,7 +783,7 @@ static bool pmbus_check_status_register(struct
i2c_client *client, int page)
 			status = -EIO;
 	}

-	pmbus_clear_fault_page(client, -1);
+	pmbus_clear_cml_fault(client, -1);
 	return status >= 0;
 }

@@ -790,7 +811,7 @@ static bool __maybe_unused
pmbus_check_block_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_fault_page(client, -1);
+	pmbus_clear_cml_fault(client, -1);
 	return rv >= 0;
 }

@@ -3053,9 +3074,9 @@ static int pmbus_init_common(struct i2c_client
*client, struct pmbus_data *data,
 	}

 	if (data->info->pages)
-		pmbus_clear_faults(client);
+		pmbus_clear_cml_faults(client);
 	else
-		pmbus_clear_fault_page(client, -1);
+		pmbus_clear_cml_fault(client, -1);

 	if (info->identify) {
 		ret = (*info->identify)(client, info);

base-commit: 28c252b708a9d223192cbf848d320cf6d0f7ed3a
-- 
2.56.0.567.gdb80ae8cd5-goog
