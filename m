Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647F566C5C
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999266; cv=none; b=CQVMkLxYFoHVWhGfIJPMlnAbe6LYQpNBNdCgNvL+SKsstU/i6B8dJiI5un4uO9ElIDO0Z/2ghZMkHZllZDbLdGoXQA2lPMxZQZ3ZWWZtZ3XA965wgM5qvRyzC1TegByiid14Q0Wf5h8yUnkYr56qMdPrqgO20OQYcIeMdFvSyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999266; c=relaxed/simple;
	bh=gi41Zz3zDE0TLM6PlJVKgZhPae/Sjlrnf+I/moH9ljs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scy7AIWtHCSDDzJUG1B82VhU3uIIG3zw6jo0z/yhyN3fW/s+5BWF/1IUETk1+3RKU1SeO7wTrCfpKc6kAuL8YttbXBWeKNnJjsPjNwA8R6mXEP+iZXUMPrbMAa41Ib6i3M9Fbn3fdBj7A3kBHhrfkFLT3rWMtoAAvf8FXqmVNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj6HBSW2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj6HBSW2"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso776807166b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999259; x=1792604059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6DNgDZcPLM+u9NKiSG5ngG40YZRJno2c69YEg3krWw=;
        b=Uj6HBSW2Yyftmh4qdpBHFjmAyJ+WGEvZ9t0oN6iG0t119cyKaxhkRORyCe88Kc3WFS
         X36oNNJpqEN/jPjdinn6E1MoUvdLX1l2Mxmd4Pil4F7kR3JaDOhhjz9r3qMe8t3Cpu31
         dRfGkkCwARuzmqwRxCrWSIKWBz42OkgSc+tgVl6LnpSvGsO6JQuCpi1G6EY4zffIoT6V
         gcVlHk8KcmlY8sBjblmMo/2RHk5d36x9W3ghrgn606sztXpnWMTqYKoJRv6uRX3YAcJ5
         61QdmShA9x7NxksyRurbmcffYjaz2S9ZWmtkanJgDMt1tSEmxIwcWgUbEsrW+9ziNyTY
         0ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999259; x=1792604059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6DNgDZcPLM+u9NKiSG5ngG40YZRJno2c69YEg3krWw=;
        b=0Yd2tYbG0aXX2cZLOSylt1NAS+0hakWuUi45aQz8mNMzye6JUWMeYaFYHBmPc2/79m
         Tzrp3Kf+v5WHR20UHi0wbhLnYWglJILmZNrF/Mo/dcrEsgqRK3OcDOEvIKlQ0DUARZsI
         5tp/aCcCUwpAHJ0KL/0ROATx1v/TIGHjmYSyCzmuRLE7d2Qb7vvYVAaBKXgRGwpPoLkW
         AM1HgKAnnn4HWqZNi0XlKq0n1X1gx47ixCTpGivfxNBpjMDgiAwDly0D6AhBga/Lf1L3
         3JAXy9SJDp1wNRWKhJ7uDbdm0mA5w3Zj3a1bSNW1ilkW1UwA1KYs1OpPsiiB33hflJ4h
         XYmA==
X-Gm-Message-State: AFq9FYLKV0U/p/IS6FPZopQtw5BBpzN6mDj90uJ/LpqJP/HYXSu6IuPD
	SxuB9kCS+J/iPe1TaHLENLgmrG739QMMzSvG51F28EocV71zTpY0QNlmeQ94IZOG
X-Gm-Gg: AYBFou0nOY9CJmDdKhlGPfJbWGorKgbC9Wu+KYeRMkMrRXWntjJobMNbX16m9jVBUuF
	3JGvtNMnxPQv05zBMhvxrNKe9glmx+wrlTeJLH3VVW6FZHn2cyJy0cdKCpPKUlGNozeSNfwb38s
	FKWikhOh+hDYX+XygnnqRNDqSw1KXRBuAsDLzUSDNkOOOEKP7FlkDx0+OYI5MDIst+slH2kBciy
	sjaw18SLYGtKBKVxVxbbqKhEjxvOAotL6PIS5jdHNFQJY4ZXTW3wqOk2jMavi5BizG1P9y7siXX
	P/YPku/sKbLzPH1Y3damOYkKvVkBeVtg6KGUxW6WXWrWcRs1GqVCwl1g0L2wqzRzznEgTCibgO1
	1drL4VuVOkawOA+Ke+Z1soWUo4TM7Z+DH2ut4PP6BNm5cdef8X45DP8fRdIX/j4qiUuG092aqHG
	17IFZEMPg6Fuumx+5q/jTjkQaql5kKeAFBTfumXr3zODk/KEdCyzC5itW/7VJea9qp+FJR9E+P1
	84VXp796Rcs4hoqh0nmSr+ivuc=
X-Received: by 2002:a17:906:1011:10b0:c34:c5e8:1dd2 with SMTP id a640c23a62f3a-c34c5e82199mr623673566b.24.1791999258387;
        Wed, 14 Oct 2026 10:34:18 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:17 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:02 +0200
Subject: [PATCH v3 03/11] hwmon: chipcap2: fix be16 handling
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-3-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=2005;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=gi41Zz3zDE0TLM6PlJVKgZhPae/Sjlrnf+I/moH9ljs=;
 b=Pa7vuoPzoVXhpbxszG5LXuyA4iAWV9CbQAGUcd5kxNa6Zkabhl59h+H8nVlhIEIGBEQiZ4LrG
 8fQNjMe0G92AZc/aCIeKhp9IkOd0+YwgztKUeg24ZmRN8OqURjLP28a
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

The driver currently only works correctly on little-endian
architectures when writing 16-bit register values.

Use i2c_smbus_write_word_swapped() for writes and get_unaligned_be16()
for reads to correctly handle the ChipCap 2's big-endian data format
on all architectures.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 8102b6851d3d..aec4adf98658 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -21,6 +21,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/property.h>
@@ -260,8 +261,7 @@ static int cc2_write_reg(struct cc2_data *data, u8 reg, u16 val)
 	if (ret < 0)
 		goto disable;
 
-	cpu_to_be16s(&val);
-	ret = i2c_smbus_write_word_data(data->client, reg, val);
+	ret = i2c_smbus_write_word_swapped(data->client, reg, val);
 	if (ret < 0)
 		goto disable;
 
@@ -311,7 +311,7 @@ static int cc2_read_reg(struct cc2_data *data, u8 reg, u16 *val)
 	if (ret != CC2_EEPROM_DATA_LEN)
 		return ret < 0 ? ret : -EIO;
 
-	*val = be16_to_cpup((__be16 *)&buf[1]);
+	*val = get_unaligned_be16(&buf[1]);
 
 	return cc2_read_command_status(data->client);
 }
@@ -351,10 +351,10 @@ static int cc2_data_fetch(struct i2c_client *client,
 
 	switch (type) {
 	case hwmon_humidity:
-		*val = cc2_rh_convert(be16_to_cpup((__be16 *)&data[0]));
+		*val = cc2_rh_convert(get_unaligned_be16(&data[0]));
 		break;
 	case hwmon_temp:
-		*val = cc2_temp_convert(be16_to_cpup((__be16 *)&data[2]));
+		*val = cc2_temp_convert(get_unaligned_be16(&data[2]));
 		break;
 	default:
 		return -EINVAL;

-- 
2.43.0

