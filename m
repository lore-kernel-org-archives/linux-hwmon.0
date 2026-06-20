Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF3422D7B9
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781941842; cv=none; b=rBRp0f8cOdFTCWyNCIRrlitAcHK8y2XrrbGOPl56Dd81u87T+snvMqjDz11CQrTp4JybaNAm9fEn0HF58NBZ0dqVmzwe9YYhjkbppIUvwv9Ul67UtasHw9H+cc9OA0wAKhWcfJnDkiLHosZow/O56bgltTN+jc0JIopiSnOzZDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781941842; c=relaxed/simple;
	bh=G+HgPkwTPuN6z8/24P5wZhqP/FFbGnoGMai+xuIQ9sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PA8Lse/fL18V921u4qvQ0GekE8looq7CCJlAuMdJZfKUCRqynUx+OiOxnSMjyX6DEY47wgWFtZ/thVy+QzJqmNQ3bMohDhELkYu0u6hz+Sr0evoamJrNTN2x9n8SeVzCvXGBLk3S4O3sWZ/Dk8K2zRxRNo8JqOxpi32hJVUMi48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=OIzApBZB; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="OIzApBZB"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30bcdf8232fso6240609eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 00:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1781941840; x=1782546640; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Du7KUR7riYwc+LviFyNbe07XiNakCWb7V8SiKSFQ7CQ=;
        b=OIzApBZBZJ/NUUO4FLSxrmFHV196/oH+NoO79bJEJjNYoCmH3uJFsShCEStupnUeYT
         NpFbEGAOCFCMFY4k907TBgwkczfiJLJXcVa690wv66U2FwnlGyOxXpbWVAxQli0CdXIj
         rA1JGKZtMVjIprkoteZTokxcX8xvKgSoPLQjxrc9Z8LYOKF+RbFOcKJH+5z4/xTp3XAY
         J8MpAGT3lvUiYwZhkLZ+av+aKTh94oXaYa3ZwnIQ/mx/Fif1+LhCbX94qAHnrtFRHI1x
         8jAsOaSCVSaFaipW6zO25VAL2pCWNwq2X5mFB71ly6uvYe/UXAKQmiDOAHhI9FRg5vVJ
         Uxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781941840; x=1782546640;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Du7KUR7riYwc+LviFyNbe07XiNakCWb7V8SiKSFQ7CQ=;
        b=sHe6DPw2EKWX7N7cz2zwpWiz4BxH0sKMrQB5o+XDJ4ViwEFX4FbSFZLkuyiFpOyi8E
         v9Bl+QEaWSlYctIRj4qAptNX3kWE5EU+jnW5umbbr8VUnsweHbn3nKaXawCRCEB0uQsi
         7YUDQp9FHrd93oTH+Wk1U6od6o12+yypZRAvPH2qsVjiACKn9PoilDO4B1cDQRYys0EI
         w8WUMyLBkkrb6dd2qZEM2zv0fTg2aI1htxkLrKun+mDaFCYyiy7dSFPYYDTdBi0/4UZq
         nzC+atA4yrdGXG7+zGPMtsZkEGdnFc/hejlUoIZF7CS33DGUFVuofceSAyb3FfSjFxbm
         YIvg==
X-Gm-Message-State: AOJu0YzMnm+LxhlIUgsRB8+XGFDH7xgRAy60snofwzynN3qgSqya5H+O
	8DJAAl2t3n1z+50hOj+O1VqqI9MSWH0k9CTicJ2/UbvYK+sBNEZXMUYWjIAueFG/qzw=
X-Gm-Gg: AfdE7cmhfbFvKB2NvMy9dYjy1euLmD9Tt1E7l/0hTsPqbmwb59na+2pMi3Lzno3b53Q
	3jWnIcVrOcEFOcI8meFa/zh7RwX2ijRKcnXH5VZNFnLCp56HuyR/Q+mpCvNBCXK5eX+3HVrADXe
	R/LnKEJLSWnfJbOc1oJ6hsaqoHV4DS6jXgidP2Mc5edjWd44EzEf/jzFu34VtxUWEZbvZDxnxvm
	4qJn1lX5TMDxz3I+hbwo4D0A4RX+zQdqOx6FcG8d6OKR8Bf0yfrCsoaoBAILsbwjVgN/QcyotYF
	m/VLBaIPRjG/tDxMOttk7AYciILpuq5zmZQfflHzYARaWZsCIpXJ1Du8+7/jYfNRAN77t0BoBed
	YVWcQWewcpIQFhF8diAxjDUlHaUoK/gjjXbN4al/A3Qm9Ru5pffB6Ru2v9jdtOKutlFpbBDTULh
	AgzN4aSbmJEuAUSRzc3gIDqoI9UA==
X-Received: by 2002:a05:7300:fd0f:b0:30b:dd58:e167 with SMTP id 5a478bee46e88-30c07038f73mr3981624eec.29.1781941839853;
        Sat, 20 Jun 2026 00:50:39 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm2763250eec.17.2026.06.20.00.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 00:50:39 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 20 Jun 2026 00:50:37 -0700
Subject: [PATCH] hwmon: (pmbus/core) honor vrm_version in
 pmbus_data2reg_vid()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-pmbus-data2reg-vid-v1-1-5518030432c4@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAExGNmoC/yXMMQ6DMAxA0asgz7UUPFDoVVCHhJjgSqUohggJ5
 e6kML7h/wOUo7DCqzogchKV31xQPyoYJjsHRvHFQIYa05DB5es2RW9XS5EDJvE4OvKuJeqe3EI
 Jl8ij7Ne0f9/WzX14WP8nyPkEtY0jZHYAAAA=
X-Change-ID: 20260620-pmbus-data2reg-vid-fb2db82297e8
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781941839; l=2206;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=G+HgPkwTPuN6z8/24P5wZhqP/FFbGnoGMai+xuIQ9sg=;
 b=1/kqvkHvV9IA8Vw6Yk+ilxQVdAqL2PVr2vECncr9LCs+t6rfk7T9R7ItCSU4/LDXnuxAApHzu
 qkUl8aEhQeVCoftSWzVRWZAqbYb29uUEDAwWv5vJ7WUc5IYVQ7oT1W9
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

pmbus_data2reg_vid() hardcoded the VR11 encoding regardless of the
vrm_version configured by the driver, while pmbus_reg2data_vid()
already switched on it. Any driver that selects a non-VR11 VID mode
and exposes a regulator (or hwmon vout setter) sent dangerously
wrong codes to PMBUS_VOUT_COMMAND -- e.g. an nvidia195mv part asked
for 200 mV got the VR11 clamp to 500 mV encoded as 0xB2, which the
chip interprets as 1080 mV.

Mirror pmbus_reg2data_vid() so writes round-trip with reads.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Assisted-by: Claude:claude-opus-4-7 [Claude Code]
---
 drivers/hwmon/pmbus/pmbus_core.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e8fdd799c71c..8123a568af40 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1095,9 +1095,27 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
 static u16 pmbus_data2reg_vid(struct pmbus_data *data,
 			      struct pmbus_sensor *sensor, s64 val)
 {
-	val = clamp_val(val, 500, 1600);
-
-	return 2 + DIV_ROUND_CLOSEST_ULL((1600LL - val) * 100LL, 625);
+	switch (data->info->vrm_version[sensor->page]) {
+	case vr12:
+		val = clamp_val(val, 250, 1520);
+		return 1 + DIV_ROUND_CLOSEST_ULL(val - 250, 5);
+	case vr13:
+		val = clamp_val(val, 500, 3040);
+		return 1 + DIV_ROUND_CLOSEST_ULL(val - 500, 10);
+	case imvp9:
+		val = clamp_val(val, 200, 2740);
+		return 1 + DIV_ROUND_CLOSEST_ULL(val - 200, 10);
+	case amd625mv:
+		val = clamp_val(val, 200, 1550);
+		return DIV_ROUND_CLOSEST_ULL((1550LL - val) * 100LL, 625);
+	case nvidia195mv:
+		val = clamp_val(val, 195, 1465);
+		return 1 + DIV_ROUND_CLOSEST_ULL(val - 195, 5);
+	case vr11:
+	default:
+		val = clamp_val(val, 500, 1600);
+		return 2 + DIV_ROUND_CLOSEST_ULL((1600LL - val) * 100LL, 625);
+	}
 }
 
 static u16 pmbus_data2reg(struct pmbus_data *data,

---
base-commit: 9ecfb2f7287a967b418ba69f10d45ead0d360593
change-id: 20260620-pmbus-data2reg-vid-fb2db82297e8

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

