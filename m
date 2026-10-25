Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940884;
	b=KYfW5R/6/KYIIdXVvtznrbv5aZ2l1jdXiWD3/YL095KPzfwPMg7T9tc4MyXetul3RhCB
	 g3+HJM6Md21GiYrYRlTKlW9Uy/pofvJvGqHnBSU2FJud1HZHbfIovXQUwR4PjVrOo2qE9
	 VJuzFwrqcCVy9lkkDLWKx2AU1VsUm0OX52eWVCsSnSUj3fBJqzLjRdu81T6ZGk6q7uJWh
	 5KPs5AYc3y4phS2UV1CoMLPW0ddL17NbH5GOF7Y4Vn3iRUQecAxMQXVzps0NR+g017x0E
	 ku6jq5dRjjTICvipIPO+vM4m5f8l/TAeVFMzFByWLl5NGihPqTJZJYzCHB2Ir93OPVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ye2GSFYgQJI6uzYdumiexWml4ugTi70eS2dKM6j8ho=;
	b=IxWYxcE/+ADIohB5U8PrGTPdBY3eh0Lcl0UGZ/44lQjfrpQ1IGtamN6Q5vsSwfv9zRZT
	 9qt3KOti2bGwFYOyAGEwvojbIdm4wKR8rgwB/FQVf+KbCqdDAZr17O9fHXyHm3g4EJ7uS
	 EfoUNKSpBLcn4NFv6mn2jyK5aDiQDTgoq/ZB4nDO8TkREyANz6lEFh0GQnY2C3Btk0rsW
	 3ETueGxNIRFnTJhzQZuZTCJXibWXrZLhCUDenSGfs5m7drjEH/Qvix7d6+jQFAVgXCoYD
	 D/UBrNYBRvSfVb9fITiARKNXktAoky9oukLganR2oWvgwbo7IDXdbtCHOrzasG+a+tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JMcqAKq5;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2B7606A31B
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 15:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2B7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JMcqAKq5
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-181516de561so1447545c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940884; x=1793545684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ye2GSFYgQJI6uzYdumiexWml4ugTi70eS2dKM6j8ho=;
        b=JMcqAKq5tdN1skeMEUXr6VDUqt9E4RCyh59/xCx5JIJ9WEjXRKylf6Mz/pfLPzul5c
         iY+QjMYPLgHdYnqEfUcxh7CM983rPSYy0jFZnKL5+0Q/qUS/ewaKbXL9hFk2aKFBNTDL
         9kLN6q8JAjm/23g6ODgM73XqpwuCtYe+S870Hg++b3nlv7nXsx/C1s6QBttEAj4uGICQ
         e+Niujd2qrKw98y61+V8fcW1j9CSxGDNg0UeAn3tEVHpcDY2fHb6ukKJ1CUirdg/V6LI
         TYmFMcac54aVyWOZ5TZVDFMXUnysSllgpkpm0bEX9xU2WiyiArw4EdBrCWH0BFHztcWq
         ibJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940884; x=1793545684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ye2GSFYgQJI6uzYdumiexWml4ugTi70eS2dKM6j8ho=;
        b=b4OD9ok2jF4h+gLP8roN8XD2n4hwQZfC04rkE3pZZTIrDknGHh+2kgVlWmDVJUEcAj
         /K3oMgPLPg6M/9vIdJ/pwYCPUwdMF7AaoNxshB/SucXajWtQ4OoE2dNvddca/V7kLhd6
         pRAhNO/YNHxFz22bV3XxyZu34wDelOGT4pHRF5szWeOLyZ3tQLPjmjuxxfpGqTZL/w4j
         LIaGNvbMnGHi7qa190wWI6Pfmw4qp6ImOkHUjgeo+PjfV7xWuRQOvcxy4WYf2+c7R0Y0
         pViObPwEfdkOkXMZfdGh4Egn4iAtUSuKYsScX6mqXGPm2GoEZs9E+Zf2PMUH/eka3Mwe
         l9bg==
X-Forwarded-Encrypted: i=1; AKwUvBw2K5c4mSBi3d7WJqJrhHXLWAfPrVPPvhI/AHroyjTXvnPqyt81l+l0oj9OtjUSLepySJGd19GH5F9Rew==@vger.kernel.org
X-Gm-Message-State: AFq9FYLgSSEXGjj94L2Xhc6E4ZmahBdoeCZJvKB09uizNWQ1UNLrUamL
	BR7SpZSqhnXrzPpZeSnvBUErMpdDPjNMcDO1xMtVXwqO70f6+bXmglmPoXp5wd0D6I4=
X-Gm-Gg: AYBFou0c9/EmvXChyr8JFEWUktR7HsjQgeNXyvwzFNQXM1Zk1rGFmNFNai5Sn0XCyOp
	dCB9WKK4zRkAet+SUdn8mQV+P0JJbaWYiPzvFrDuXhu6FbeNuHMtaoo17SlSOTc6ScG3uex2iag
	yo9xv9v8W2T279yKaLTC/iIhfLjXUKOMBB8VSw8NazVTHW/+WEmqQVTujeJbFL4p7ZvVoW5hnC+
	5vhbSZn6ybCcMZcEvqL7+qu2MmJdenNy3QXn/ByjvX98cb2uX6IottdfiUD+k9Pn1PS8Iu3d6tX
	pdhTztb/24yuSNgZTjK8uHyIPlu/hCjFMUgUd7Y59e9CSf3fV6y30d27P7ephU//vcwiga49zvM
	LkovoEDJfhmZ4rSjHIfT9bN26musnSy753MjAH2GtuPf9YRQqF7CYryDy38xYcHMtmsK7v8FOZs
	agJxzND0PVyQT7mL+K9ZGBdx8Af6HO4SUXrEIoocK1qLHqKOLXmRD6IErjIKdHE5coY+02TqXoU
	yj23mn5ZGi3NWeTEZaBNDgy2sLzHgvBTQsCL3VazDd7VjpkhiETwE64cVVIoFOj4FzhmVLn
X-Received: by 2002:a05:7022:5f14:b0:146:5f73:d45b with SMTP id a92af1059eb24-1994cb430a1mr5812181c88.3.1792940883317;
        Sun, 25 Oct 2026 08:08:03 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm16876956c88.20.2026.10.25.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:08:02 -0700 (PDT)
From: pocj8ur4in <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm87) Propagate analog output write errors
Date: Mon, 26 Oct 2026 00:08:00 +0900
Message-ID: <20261025150800.49041-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>

The aout_output store path updates its cached value before writing the
register and ignores the SMBus result. A rejected write therefore returns
a successful byte count and reports the requested value until the cache
expires. With a cached 980 mV, a rejected write of 1960 mV returned 5 and
read back as 1960 mV although the register still held 980 mV.

Check the write result and update the cache only after success. Return the
bus error to the sysfs caller.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested on ARM64 QEMU/KVM through the lm87 and adm1024 sysfs paths,
using an emulated SMBus adapter. With 980 mV cached, a pre-apply
-EIO rejection of a 1960 mV write returned 5 and read back 1960 mV
before the change; after the change, it returned -EIO and read back
980 mV. The same behavior was checked with -EREMOTEIO. No physical
chip or analog voltage was measured.

 drivers/hwmon/lm87.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index c09074f44708..ea23206b3c81 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -640,6 +640,7 @@ static ssize_t aout_output_store(struct device *dev,
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
+	u8 reg;
 	long val;
 	int err;
 
@@ -647,11 +648,14 @@ static ssize_t aout_output_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = AOUT_TO_REG(val);
+
 	mutex_lock(&data->update_lock);
-	data->aout = AOUT_TO_REG(val);
-	lm87_write_value(client, LM87_REG_AOUT, data->aout);
+	err = lm87_write_value(client, LM87_REG_AOUT, reg);
+	if (!err)
+		data->aout = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 static DEVICE_ATTR_RW(aout_output);
 
