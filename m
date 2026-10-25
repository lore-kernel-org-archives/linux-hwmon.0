Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897597;
	b=1UAjshDb3ln+q23kA+AzhOf0oo3Yy0SpbB9N4j1ADw8aScq777lcooMsVuG4IB/ulD9u
	 bDeVwqWe8jqeDcwC8yUbbJCreYvF5cL7sqX0C3uUFo3o5sEEapJPgqIlI/WRjMZlYW7ki
	 OWxlxomN4qTJjhW0b7+q3wDUQl0bZdd9Esow97xVhi62/cbsmKtPkzGj0YNJqQUD/X/Lp
	 e9p5lWElztp8lvLFr3HQA3ZWJuP2TrKMVxCLMGZGAL4OKxXW19vu4+VvS1Y2i0Rg+KNQ1
	 C8UrjBW17IndCL+9p0BUB2QXEVaKCbCxtn3RK3hzDl8tutrgfRKW9q/4eizp+cuHiCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XcEMXouPHmD6X44mFYjo0pSbNgHsqZpgxlkl4Rw78hQ=;
	b=IUFfxFeTxbeM9sMiIoncah+4A0yK7ImYLzkMCM7A0vLSNwx03oYZNd/db/1VAardgR4p
	 XYzvgZFriogPyuSnVHAmVvOsijo9W3xXYYHHvqha5dIVkLzqT8IcDEpxSjqOF7yX6T4TS
	 lYB9UPpYxbomwMx+3rtt/weN2900LIHRrQ5yAQargHGJ+TO2/qC3cIcfO09+QKrRuhonD
	 VpQSMCbqVu2Qtk2OlDW0sxj9duxyovhB3btgfAqxiB7kkaOwi/wOL5A9n3bhj8emIWRQd
	 w/ebVxuA+Af20fNyeXKAo2kzPERRzl+BNphYt9jP9Q48XxPDBc2lG3skNz7lAHHuz+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W9Kr6x2E;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A960A6F77
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6A960A6F77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W9Kr6x2E
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35f036b17easo4796314eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897596; x=1793502396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcEMXouPHmD6X44mFYjo0pSbNgHsqZpgxlkl4Rw78hQ=;
        b=W9Kr6x2EA3FZJOCXb3FnuUllAEerJRmL/k7WjFcKjUM8dwQqbbseG4orE/sg924dDz
         YMavfYTV/SQF/ehrgiysz2oGn9x7ARyj71m4adTEEk1k6tiB95qNrYb+gKnFZANctdMY
         TF7Zr+phehJeF9EkBdixy46aWeydoGEktCnJugx0dN+ooLbVjfu5JgeOLkWB/hMiDExA
         gsh8chyvXvbib1FLlXqcURp0tOhH/LbATyIVc2daglsiixj34s4X+ypE4sStThO/Ob7S
         pYqio12iqYBvNlCcqDKPqg7QUDQHUsmqKDRQNxYT0zi9cRw9ZlSXAfqDbzoemiq1/cXJ
         32cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897596; x=1793502396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcEMXouPHmD6X44mFYjo0pSbNgHsqZpgxlkl4Rw78hQ=;
        b=BeYSrICztus4o537zr+WDrT6XoQS6aIjGUGVk3rOCo6cEiJdVEx4qjQSy0grKfOIhV
         AAjfZVs/EYfBYozeNd+Hzd5ajyhhH7hka1FWk2aH9X0KU7JgPeqSgsUFU9EBs9xVrb8m
         B00XFSMymDQ6tQUDItnszJNLjKlWhkCyux7kSdWT9NuNraA7hy8HQ4C9kekIsRXiRMAA
         C5X6h6oWDPS1QrHBYShlKVbkq2lVop1ic/yYkZ6zlFZLsSvC6lmO7f6FFSy0GrgerQoo
         cz+S6OQJ5kL7T3wjyeU3s5jqGsEBCV73579/3DzxBTJF2JMzLo22d71tIlC4XK5h9d17
         Bu0g==
X-Gm-Message-State: AFq9FYLlbgLpHPoLnJFwn0STNqYjQlQ8wazS5RzciLrzpLGA6vodeBOY
	ZH3QA9pWoA+BjGpzorNGgyolTAHFaGuKsFpuCp2/IaPd5a3f0b5TIVHo
X-Gm-Gg: AYBFou30pHRK6eQYoTG/9voVASL2s5GtSbLAwcqMi9iaG9zPCG4undOQfY5YylWe5ex
	T/vPw9pH8TlIcO5jalx5xp8ZkrUlrdkUB7TNghDMR52bghNabcfxLR0jIxHRAivAklAMCbvD8aq
	rNRuO9H1/8NEiAG1pnArqIks3mSj/8DYfmbbxHCXM4xF5g+/OoG060pvuiHy0Ssmew50a1ia/xC
	yXr1SBpNzSy1zp3SOkdPmjO8ryVUbX9ZzvpEFz2RMR3S9kvTMP9Av+aQRoDglKDDkfLHJFOdjgL
	TSOChjU6xiM4YnD1HZvMUGJ2hanHt9yhb3vUX1/GosYNkJAngqK9MMq1PCmCxL3C8CamhC2OQTM
	McHx2r3pufq+XP55eIt0vPRBnOQsxyW+0gQztr3vkakcz0ZcUT6kQqCjLfqKFOt/oM2LQ9SlR4F
	V4kcX8vuStRr4jcan+zy8M4deKTmwD0uyXTV0EEqa3sPeqp72gBQYRF4AAsFUar45d1bdC3MKnw
	mHGUE8Vk+UBfJ+KT8a8rb06A9SDrvRbhf3wyIe7/WNWh3iEQaaDFbuinhATsPF3tpFm4uM9gWo+
	qJb/jQ3PN9G2IBHHAWTlCmFR6XzVolIRU6FAMZus+do=
X-Received: by 2002:a05:7300:83a5:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-369f97f77dcmr738918eec.36.1792897596419;
        Sat, 24 Oct 2026 20:06:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:35 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:23 -0700
Subject: [PATCH 20/31] hwmon: (pmbus/max16601) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-20-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the buffer size to i2c_smbus_read_block_data() and shrink the
temporary buffer in max16601_read_word() to I2C_SMBUS_BLOCK_MAX since
it holds binary data and is never NUL-terminated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/max16601.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 3dd1f6fd003b..3f4e3c24b985 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -73,7 +73,7 @@ static int max16601_read_word(struct i2c_client *client, int page, int phase,
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct max16601_data *data = to_max16601_data(info);
-	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
 	switch (page) {
@@ -90,7 +90,7 @@ static int max16601_read_word(struct i2c_client *client, int page, int phase,
 				return ret;
 			ret = i2c_smbus_read_block_data(client,
 							REG_PHASE_REPORTING,
-							buf);
+							sizeof(buf), buf);
 			if (ret < 0)
 				return ret;
 			if (ret < 6)
@@ -278,7 +278,8 @@ static int max16601_get_id(struct i2c_client *client)
 	enum chips id;
 	int ret;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0 || ret < 11)
 		return -ENODEV;
 

-- 
2.56.0.257.gf7497c7d27-goog

