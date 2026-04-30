Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28773783A1
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532323; cv=none; b=P6RRD0jkI+PWQZ/UBsFMpG86tnkPQmygdL8lKGCKtHNlKjbUwcUzL88Qr6C4X1v8BaKqJGjXMkYnXStkUuyjzQRV1bajmhuOfVnbllwMvR55L3V9jBNdeIzGSa0pcYHYesoq8mLqWTAiqiFCYwAT9Wyu5Q8c9MM8CJiHFFgstVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532323; c=relaxed/simple;
	bh=dGVxos3tYJBK/wmCdU1AAH/rB8aZs/X58kAs5fVnCy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKWEhs8RJEnSryg8wdYvHQKkNAzuB5NEwcmj8EUkTNfTOAmfyQP29lRDjkQiTaf7SlI83oUVJdZFYOjfGhyXvJW2o1iRzzBklHkqYMXzgvQja6fTe78/IXmT7/mqgFtcwqFoTidx5zd6wpF3Ze//WuRMUQLCfIu/WUfnSWvuUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=EaZIEg/5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="EaZIEg/5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35fc258aaa4so342358a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777532319; x=1778137119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hq1yA9knnG1UYdsGQDnpQCdbpBLyx36LMeq1zfmtBM=;
        b=EaZIEg/5Qb8mQ/xiuIKLAADiUN/XGHnS7T+RE7uU/fi2lYYYykIzw+jtlLe0UrvV8o
         V+obXSDxNQqotGjlvAnx/TU4Xmt/0Kc7+BViXmUm0poGNgHghT9CRW9O3n9Pkf2HG436
         PtI7+LCJoIVIkNLWOuofKO3jEaDSwr6GPI25kTtZpU70TJd1PUspxQGtr5xeM/k4x6Sh
         OKSfthmNBtVyUm/ZGNaJ6aEYPO2KmmTocv2WcxTshm/nOcb5uRuQgXDfpEQmTtCfZsYs
         pQ9tnuFz5vE5gbOqayvR2yut+9BMLiZ/QlNusX1PktcnCYSJ4Y2L10aJb6suJMbZuTTb
         W7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777532319; x=1778137119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hq1yA9knnG1UYdsGQDnpQCdbpBLyx36LMeq1zfmtBM=;
        b=JXGDBaDW4agN1ZCdoBLFbJhOo4rX1qPmN4suRYfKIahvPERPjAwz7J67hx5mWSYAmz
         3i81N2YvBlDx8fqN/G2s5oM5NIxZwkLNgWC/LmPeclMNrkOI2qrxYMBxTApUbi5BzQCE
         GRCONk/0W2h7Zu/9lL2DKzTUzrb8XyfCR92M1tq/6/vsbl8MX+cc4ueLePp2O9+GYlDA
         1khfVy8A9psFmn4FezKPLWa2j+R3/RGZTIupIZ0hRNJZ4nSHwvy0Ft89Saa2rS30qSOk
         yAMbStzy/UbAJ4JINVJHx/el+4Opiqxgh9vRGAjdlIjhvwkdcml81hkiYCsr3/HuiXYE
         Yhsg==
X-Forwarded-Encrypted: i=1; AFNElJ+tG4m4rxmlUFilEM1SJwNZI+Rv5p4tQUTgFvQLYPT8GiaBDcfuiX0FEdmhCN8gqm5AzIVXT5oQ+Qh07g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD2kxBn0l0xHI8Ef+5WIREIi8jQMZYmquLMeg0WKzSjfCuGUgn
	y2GgauARZywDtzLo2CyW1xUasZmce7dcnnPTewNSvWG8ZCnifkKDyy2UMyQy7PEuy6Q=
X-Gm-Gg: AeBDieuGWyUXIyM7FsUz52/bQulXNsAogJXtQriBbOLsfPqeBU5dqgwVUUPPTy1HmWa
	F6K2moaAyuw3SxdDpjkANLhyOwaw5zk/ClY/SSrGsgsXyym6RmtOkPV8G4jtNoZ+mHT4A1VZP1C
	obsysX3f/DMJVy8L4piRn5QIoZXEXzxOCTpktDP/R7z81EnX2w3Fi/fZlKM2wst+iwVs+oevdlQ
	5CsBenQacYfVrEUhar+kOvFFGVqKJq+KKCA2C+laHvMcrVpZJ+gR1g7UAQLxwCy+rRo7FUe51mB
	372PpOyhFesfRyx+H2zLWrZJ8ApHArmXTF/YRNjVaRk3PFm5GmKBs6QyxmIEWL0JHp5MVZAq2Ie
	z+HuyJcqarrTwPzhfaekouamqLpNURAnh8Co++97dlEuyEm6IsXFo8K2Dfm1Iy97vYwthlQ0/XD
	0Mk5NoY6NkAL4NeZRiLoKdINBiFGTGf3pZIlWIO/wVLPb/lshjEGu2/XvQd8NQiwZw5ZmV3Mnbv
	AnEtEc=
X-Received: by 2002:a17:90b:3a4b:b0:35f:9ab2:a5a6 with SMTP id 98e67ed59e1d1-364c2f97873mr1633679a91.2.1777532319022;
        Wed, 29 Apr 2026 23:58:39 -0700 (PDT)
Received: from TAO-BU2-SWA-3 (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf81f28sm1670998a91.15.2026.04.29.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 23:58:38 -0700 (PDT)
Date: Thu, 30 Apr 2026 06:58:34 +0000
From: Brian Chiang <chiang.brian@inventec.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Message-ID: <mhguhlt5gi7sg7qsgetsizdslm2z4vdhlgag55bqjnq3a2kz24@iafh7hhezp4l>
References: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
 <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-2-f1f83d2039f7@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-2-f1f83d2039f7@inventec.com>

On Wed, Apr 29, 2026 at 11:29:37AM +0000, Brian Chiang wrote:
>From: Jack Cheng <cheng.jackhy@inventec.com>
>
>The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
>module from Delta Power Modules.
>
>The Q50SN12072, quarter brick, single output 12V. This product provides up
>to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
>efficiency up to 98.3%@54Vin.
>
>The Q54SN120A1, quarter brick, single output 12V. This product provides up
>to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
>efficiency up to 98.1%@54Vin.
>
>Add support for them to q54sj108a2 driver.

Greetings, I received the feedback from Sashiko for this patch:

```
This isn't a bug, but the commit message only mentions adding support for
the new modules. However, the patch also includes several other changes:
adding PMBus locking in the debugfs read/write paths, fixing the
WRITE_PROTECT restore logic, modifying the configuration for the existing
q54sj108a2 module, and refactoring the device identification logic.
Could the commit message be updated to describe these additional changes,
or should they be split into separate patches?
```

I'm wondering if it is more appropriate to split only `fixing the 
WRITE_PROTECT restore logic` into separate patch? Since disabling 
WRITE_PROTECT was introduced in previous commit. And maybe keeping
other changes Sashiko mentioned in this patch and record them in 
the commit message?

Please let me know if you have any suggestion, thanks.

>
>Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
>Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
>Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
>---
> drivers/hwmon/pmbus/q54sj108a2.c | 238 ++++++++++++++++++++++++---------------
> 1 file changed, 147 insertions(+), 91 deletions(-)
>
>diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
>index d5d60a9af8c5..50539555a74e 100644
>--- a/drivers/hwmon/pmbus/q54sj108a2.c
>+++ b/drivers/hwmon/pmbus/q54sj108a2.c
>@@ -22,7 +22,9 @@
> #define PMBUS_FLASH_KEY_WRITE		0xEC
>
> enum chips {
>-	q54sj108a2
>+	q50sn12072,
>+	q54sj108a2,
>+	q54sn120a1
> };
>
> enum {
>@@ -55,10 +57,24 @@ struct q54sj108a2_data {
> #define to_psu(x, y) container_of((x), struct q54sj108a2_data, debugfs_entries[(y)])
>
> static struct pmbus_driver_info q54sj108a2_info[] = {
>-	[q54sj108a2] = {
>+	[q50sn12072] = {
> 		.pages = 1,
>+		/* Source : Delta Q50SN12072 */
>+		.format[PSC_VOLTAGE_OUT] = linear,
>+		.format[PSC_TEMPERATURE] = linear,
>+		.format[PSC_VOLTAGE_IN] = linear,
>+		.format[PSC_CURRENT_OUT] = linear,
>
>+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
>+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
>+	},
>+	[q54sj108a2] = {
>+		.pages = 1,
> 		/* Source : Delta Q54SJ108A2 */
>+		.format[PSC_VOLTAGE_OUT] = linear,
> 		.format[PSC_TEMPERATURE] = linear,
> 		.format[PSC_VOLTAGE_IN] = linear,
> 		.format[PSC_CURRENT_OUT] = linear,
>@@ -69,6 +85,20 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
> 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> 		PMBUS_HAVE_STATUS_INPUT,
> 	},
>+	[q54sn120a1] = {
>+		.pages = 1,
>+		/* Source : Delta Q54SN120A1 */
>+		.format[PSC_VOLTAGE_OUT] = linear,
>+		.format[PSC_TEMPERATURE] = linear,
>+		.format[PSC_VOLTAGE_IN] = linear,
>+		.format[PSC_CURRENT_OUT] = linear,
>+
>+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
>+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
>+	},
> };
>
> static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
>@@ -83,73 +113,77 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
> 	char *out = data;
> 	char *res;
>
>+	rc = pmbus_lock_interruptible(psu->client);
>+	if (rc)
>+		return rc;
>+
> 	switch (idx) {
> 	case Q54SJ108A2_DEBUGFS_OPERATION:
> 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_OPERATION);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		rc = snprintf(data, 3, "%02x", rc);
> 		break;
> 	case Q54SJ108A2_DEBUGFS_WRITEPROTECT:
> 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_WRITE_PROTECT);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		rc = snprintf(data, 3, "%02x", rc);
> 		break;
> 	case Q54SJ108A2_DEBUGFS_VOOV_RESPONSE:
> 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_VOUT_OV_FAULT_RESPONSE);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		rc = snprintf(data, 3, "%02x", rc);
> 		break;
> 	case Q54SJ108A2_DEBUGFS_IOOC_RESPONSE:
> 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_IOUT_OC_FAULT_RESPONSE);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		rc = snprintf(data, 3, "%02x", rc);
> 		break;
> 	case Q54SJ108A2_DEBUGFS_PMBUS_VERSION:
> 		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_REVISION);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		rc = snprintf(data, 3, "%02x", rc);
> 		break;
> 	case Q54SJ108A2_DEBUGFS_MFR_ID:
> 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_ID, data);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
> 		break;
> 	case Q54SJ108A2_DEBUGFS_MFR_MODEL:
> 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_MODEL, data);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
> 		break;
> 	case Q54SJ108A2_DEBUGFS_MFR_REVISION:
> 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_REVISION, data);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
> 		break;
> 	case Q54SJ108A2_DEBUGFS_MFR_LOCATION:
> 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_MFR_LOCATION, data);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
> 		break;
> 	case Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET:
> 		rc = i2c_smbus_read_byte_data(psu->client, READ_HISTORY_EVENT_NUMBER);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		rc = snprintf(data, 3, "%02x", rc);
> 		break;
> 	case Q54SJ108A2_DEBUGFS_BLACKBOX_READ:
> 		rc = i2c_smbus_read_block_data(psu->client, READ_HISTORY_EVENTS, data);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		res = bin2hex(data_char, data, rc);
> 		rc = res - data_char;
>@@ -158,16 +192,22 @@ static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
> 	case Q54SJ108A2_DEBUGFS_FLASH_KEY:
> 		rc = i2c_smbus_read_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, data);
> 		if (rc < 0)
>-			return rc;
>+			goto unlock;
>
> 		res = bin2hex(data_char, data, rc);
> 		rc = res - data_char;
> 		out = data_char;
> 		break;
> 	default:
>-		return -EINVAL;
>+		rc = -EINVAL;
>+		goto unlock;
> 	}
>
>+unlock:
>+	pmbus_unlock(psu->client);
>+	if (rc < 0)
>+		return rc;
>+
> 	out[rc] = '\n';
> 	rc += 2;
>
>@@ -183,27 +223,51 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
> 	int *idxp = file->private_data;
> 	int idx = *idxp;
> 	struct q54sj108a2_data *psu = to_psu(idxp, idx);
>+	int original_wp;
>+	int rc_restore;
>
>-	rc = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
>-	if (rc)
>-		return rc;
>-
>+	/*
>+	 * Parse user input before acquiring the PMBus lock. Since calling
>+	 * kstrtou8_from_user() while holding pmbus_lock_interruptible()
>+	 * may introduce a denial of service risk.
>+	 */
> 	switch (idx) {
> 	case Q54SJ108A2_DEBUGFS_OPERATION:
>+	case Q54SJ108A2_DEBUGFS_VOOV_RESPONSE:
>+	case Q54SJ108A2_DEBUGFS_IOOC_RESPONSE:
>+	case Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET:
> 		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
> 		if (rc < 0)
> 			return rc;
>+		break;
>+	case Q54SJ108A2_DEBUGFS_CLEARFAULT:
>+	case Q54SJ108A2_DEBUGFS_STOREDEFAULT:
>+	case Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE:
>+		break;
>+	default:
>+		return -EINVAL;
>+	}
>
>-		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_OPERATION, dst_data);
>-		if (rc < 0)
>-			return rc;
>+	rc = pmbus_lock_interruptible(psu->client);
>+	if (rc)
>+		return rc;
>+
>+	original_wp = i2c_smbus_read_byte_data(psu->client, PMBUS_WRITE_PROTECT);
>+	if (original_wp < 0) {
>+		rc = original_wp;
>+		goto unlock;
>+	}
>+
>+	rc = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
>+	if (rc < 0)
>+		goto unlock;
>
>+	switch (idx) {
>+	case Q54SJ108A2_DEBUGFS_OPERATION:
>+		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_OPERATION, dst_data);
> 		break;
> 	case Q54SJ108A2_DEBUGFS_CLEARFAULT:
> 		rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
>-		if (rc < 0)
>-			return rc;
>-
> 		break;
> 	case Q54SJ108A2_DEBUGFS_STOREDEFAULT:
> 		flash_key[0] = 0x7E;
>@@ -212,52 +276,35 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
> 		flash_key[3] = 0x42;
> 		rc = i2c_smbus_write_block_data(psu->client, PMBUS_FLASH_KEY_WRITE, 4, flash_key);
> 		if (rc < 0)
>-			return rc;
>-
>+			break;
> 		rc = i2c_smbus_write_byte(psu->client, STORE_DEFAULT_ALL);
>-		if (rc < 0)
>-			return rc;
>-
> 		break;
> 	case Q54SJ108A2_DEBUGFS_VOOV_RESPONSE:
>-		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
>-		if (rc < 0)
>-			return rc;
>-
> 		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_VOUT_OV_FAULT_RESPONSE, dst_data);
>-		if (rc < 0)
>-			return rc;
>-
> 		break;
> 	case Q54SJ108A2_DEBUGFS_IOOC_RESPONSE:
>-		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
>-		if (rc < 0)
>-			return rc;
>-
> 		rc = i2c_smbus_write_byte_data(psu->client, PMBUS_IOUT_OC_FAULT_RESPONSE, dst_data);
>-		if (rc < 0)
>-			return rc;
>-
> 		break;
> 	case Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE:
> 		rc = i2c_smbus_write_byte(psu->client, ERASE_BLACKBOX_DATA);
>-		if (rc < 0)
>-			return rc;
>-
> 		break;
> 	case Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET:
>-		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
>-		if (rc < 0)
>-			return rc;
>-
> 		rc = i2c_smbus_write_byte_data(psu->client, SET_HISTORY_EVENT_OFFSET, dst_data);
>-		if (rc < 0)
>-			return rc;
>-
> 		break;
>-	default:
>-		return -EINVAL;
> 	}
>+	/*
>+	 * Always restore WRITE_PROTECT and preserve the original error in
>+	 * rc; only surface the restore failure if the operation itself was
>+	 * successful.
>+	 */
>+	rc_restore = i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, original_wp);
>+	if (rc_restore < 0 && rc >= 0)
>+		rc = rc_restore;
>+
>+unlock:
>+	pmbus_unlock(psu->client);
>+	if (rc < 0)
>+		return rc;
>
> 	return count;
> }
>@@ -270,7 +317,9 @@ static const struct file_operations q54sj108a2_fops = {
> };
>
> static const struct i2c_device_id q54sj108a2_id[] = {
>+	{ "q50sn12072", q50sn12072 },
> 	{ "q54sj108a2", q54sj108a2 },
>+	{ "q54sn120a1", q54sn120a1 },
> 	{ },
> };
>
>@@ -280,6 +329,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
> {
> 	struct device *dev = &client->dev;
> 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
>+	const struct i2c_device_id *mid;
> 	enum chips chip_id;
> 	int ret, i;
> 	struct dentry *debugfs;
>@@ -292,14 +342,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
> 				     I2C_FUNC_SMBUS_BLOCK_DATA))
> 		return -ENODEV;
>
>-	if (client->dev.of_node)
>-		chip_id = (enum chips)(unsigned long)of_device_get_match_data(dev);
>-	else
>-		chip_id = i2c_match_id(q54sj108a2_id, client)->driver_data;
>-
> 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> 	if (ret < 0) {
>-		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
>+		dev_err(dev, "Failed to read Manufacturer ID\n");
> 		return ret;
> 	}
> 	if (ret != 6 || strncmp(buf, "DELTA", 5)) {
>@@ -308,19 +353,25 @@ static int q54sj108a2_probe(struct i2c_client *client)
> 		return -ENODEV;
> 	}
>
>-	/*
>-	 * The chips support reading PMBUS_MFR_MODEL.
>-	 */
> 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> 	if (ret < 0) {
> 		dev_err(dev, "Failed to read Manufacturer Model\n");
> 		return ret;
> 	}
>-	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
>-		buf[ret] = '\0';
>+	buf[ret] = '\0';
>+	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
>+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
>+			break;
>+	}
>+	if (!mid->name[0]) {
> 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
> 		return -ENODEV;
> 	}
>+	chip_id = mid->driver_data;
>+
>+	if (strcmp(client->name, mid->name) != 0)
>+		dev_notice(dev, "Device mismatch: Configured %s, detected %s\n",
>+			   client->name, mid->name);
>
> 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
> 	if (ret < 0) {
>@@ -333,16 +384,17 @@ static int q54sj108a2_probe(struct i2c_client *client)
> 		return -ENODEV;
> 	}
>
>-	ret = pmbus_do_probe(client, &q54sj108a2_info[chip_id]);
>-	if (ret)
>-		return ret;
>-
> 	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
> 	if (!psu)
> 		return 0;
>
>+	psu->chip = chip_id;
> 	psu->client = client;
>
>+	ret = pmbus_do_probe(client, &q54sj108a2_info[chip_id]);
>+	if (ret)
>+		return ret;
>+
> 	debugfs = pmbus_get_debugfs_dir(client);
>
> 	q54sj108a2_dir = debugfs_create_dir(client->name, debugfs);
>@@ -359,9 +411,6 @@ static int q54sj108a2_probe(struct i2c_client *client)
> 	debugfs_create_file("write_protect", 0444, q54sj108a2_dir,
> 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_WRITEPROTECT],
> 			    &q54sj108a2_fops);
>-	debugfs_create_file("store_default", 0200, q54sj108a2_dir,
>-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
>-			    &q54sj108a2_fops);
> 	debugfs_create_file("vo_ov_response", 0644, q54sj108a2_dir,
> 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_VOOV_RESPONSE],
> 			    &q54sj108a2_fops);
>@@ -383,27 +432,34 @@ static int q54sj108a2_probe(struct i2c_client *client)
> 	debugfs_create_file("mfr_location", 0444, q54sj108a2_dir,
> 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_MFR_LOCATION],
> 			    &q54sj108a2_fops);
>-	debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
>-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
>-			    &q54sj108a2_fops);
>-	debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
>-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
>-			    &q54sj108a2_fops);
>-	debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
>-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
>-			    &q54sj108a2_fops);
>-	debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
>-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
>-			    &q54sj108a2_fops);
>-	debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
>-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
>-			    &q54sj108a2_fops);
>+	if (psu->chip == q54sj108a2) {
>+		debugfs_create_file("store_default", 0200, q54sj108a2_dir,
>+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
>+				    &q54sj108a2_fops);
>+		debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
>+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
>+				    &q54sj108a2_fops);
>+		debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
>+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
>+				    &q54sj108a2_fops);
>+		debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
>+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
>+				    &q54sj108a2_fops);
>+		debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
>+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
>+				    &q54sj108a2_fops);
>+		debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
>+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
>+				    &q54sj108a2_fops);
>+	}
>
> 	return 0;
> }
>
> static const struct of_device_id q54sj108a2_of_match[] = {
>-	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
>+	{ .compatible = "delta,q50sn12072" },
>+	{ .compatible = "delta,q54sj108a2" },
>+	{ .compatible = "delta,q54sn120a1" },
> 	{ },
> };
>
>@@ -421,6 +477,6 @@ static struct i2c_driver q54sj108a2_driver = {
> module_i2c_driver(q54sj108a2_driver);
>
> MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
>-MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
>+MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
> MODULE_LICENSE("GPL");
> MODULE_IMPORT_NS("PMBUS");
>
>-- 
>2.43.0
>

Best regards,
Brian
