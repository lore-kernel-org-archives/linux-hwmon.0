Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530034;
	b=YG1fBXhF5sT2yKgqJ4rW4XFDKF18pi7DdPLrXb25jmjxQDcjtD7QHoCl6TZ/LSOD2JaP
	 IYfFhgUdTspkcFPlD9h6htkTpsxoD9rT/WxDDnMs+0q7MyjH2zRyy9U7ic2QUn6aPNrjZ
	 e3bLQZzZLBgFdnk6cFUUg5/eT0emB7ntVF3Wl7qyIWbRIUkPU8aCLYTNsPRW83P1oQgwo
	 QKuRCPX5V9SwNmpZ0lsS6OMxsFG4sFFyRBLYUbSUvxfU/UVaMcukrHZ5jF1suH1DRKYHX
	 3L/Tdqu/KcMwet3va9jP4jeDbnF5BYL6+lfZUP7cBFTPdGC8/PpasPT87d/qW1U36Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
	b=PJVSVXK9oCHd2dddX3jeeiC0pogpYV/H8Etu4MAPzUEj5aVPjUiYSs0LFF85TUYYy1od
	 r/R944w2mSo6wudP9QSyPMaeiAVAJgqRDU22cP5JwrtnbefsXiAedy8Zzw0z0HnIfLvki
	 /C5MySwULeig1NczWeqGXVLF618C0YRvj5yiLo7tPOxm2Axj3hZyCIWe8363kKMeFUoF+
	 sUZdmz7VedxakFkQ1ayNAuA3oTfZjSNVpFlYcB+aNOfpWYz8GirMfew1mPEQVJKEASw4O
	 Qxnc3WiCX9V2A9u2Q4DA0ek9NSXOuKP8Bw6CNfSHMjn3+toOlvF0y8OZ16OWsu9DaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXmtwACC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC8606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AC8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXmtwACC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18123965e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530033; x=1794134833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
        b=xXmtwACC42P9UiDFQGQH/f5u5ShBdLxb45g3Kut3u3uyd2Wp/E5GKjV/6nmKGOFcGE
         WwP2eFp1eLc7wwdwH0IzSHaNa3nhEite/NxAMWrpgskgiS4UEf8xe/vSI2aA+772Jt+q
         5kWg2NSHTtOZbCxE1Rr2Jz1z2O2n8EKP4MkV9ktnN5cNmlfxxrhYn18CKzjTJSsgaQbj
         gRDQnz0L5I+y4l4F7RE+c9SWMiGs5uV78TLxObgU8qy1FSisOVikcmrSqXrzlHmztd+9
         kyOGmOrkD7X0sg0LBfIabJ7ueX8vqzBdMUY2okQI3fAnNfXLh4S1tu+iyt9KnLx4Lw/0
         8J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530033; x=1794134833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
        b=kPHSiR7ubJ3/6PWNyA87toAZ/xM0UnIDllWbyso2rg4fGinmbT6ZzUhQQpioowZtUP
         YzEq4qRLbTDHn1JrciN+JEIdvCJ+v/t1SFuZ0XbI6pZJeYuAHwor/6A2O2QtI4bD1rPs
         tIbjRuMIa1bp0l+w5gWsADtl0eZFrqnuSPe8pvdnnqxDVDv1GvSKlYxUY6zS7CY53tU7
         oWXPpW59UgH4GPelmEx4eEOjwq1QfX1CapUlVwgOvR7MIRRLLUURWSuNoaQ1PIG8KwSX
         ZnlW18FBhZs21pqvNisx+y/5duyMdOeYORdhyhlr1Otv5eXNHh6mYROOzAdfVcPK/B0Y
         q6DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF9o/UCloO5sbuKyNHFPF6mc43rvtk43N/nysf9OOebULB0KMKBHZgDm5EFURSm4DdwRGmAYunK4V+YA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJndsGP3+dMRK//h1JhVMEOLiGPQz8JzySJv4F3SLeagtP0Luo9
	5AthJS4WO11qsFXTrhT1bZtQ9x2sym81nhm3H98TdED1SJrog44PLCbS
X-Gm-Gg: AYBFou1EvSLJPgwHsOjbCDMzXe5XKx79mnL7b10Oe2OuBCHZjHwTS7ykX232VYVhBIz
	1BKa1xZbDRFEoVdS7gVWxOYJnniishiUTbu3w8ECP58shQK+/hHjUcxp3oO2mIGph++DzZy/eyz
	WPpG9SswPTvfRW3LfiFj7oNpWr4JDNROMVkr69kheUKn0Z5I0/SvAk0YQmeJaJu34ksVi21aVy0
	Zpy1aGUdhlKa+0oGEqHaQfWKKjMtDOm4ESAMQxGgasdh9E07zuhXjzMoCX/d2OBet4MZxHM4BuY
	dP9cV2VU7rtQQ/2eHwigSgxGRYTz+lILW3wkPgqnw5CaEfq/5FUlRzlTpDavyyumTIGcDIurug6
	EBAMp+el/44sa6vUWMx5SGmcaWHIuSno0ZfuOPCd1xR5OyD+ZanYSXBhd3aexDuv6J3X6IJNHpY
	yyQG3seZAnoTdWuQwNebxp4d5j0n8g06Z+Y97AJIU/kI2OoDbOmlEyvFbngm3NfQP+J5gR9WDsu
	VkDsXkjR+ySYW98acrcndOn+kTuOPOSM5lBEG9dgem579JIj0hBEoBqS95lGPxHpjbwITdS8spm
	M59unNIe1NTGWNE0EfResqIxU8s=
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4ac17d19777mr157538465e9.28.1793530032871;
        Sun, 01 Nov 2026 02:47:12 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:11 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:45 +0300
Subject: [PATCH 5/7] platform/x86: asus-wmi: reject short fan curve replies
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
Message-Id: <20261101-asus-fan-floors-v4-v1-5-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

fan_curve_get_factory_default() passes a 32-byte stack buffer to
asus_wmi_evaluate_method_buf() and copies the first 16 bytes into the
curve without checking the returned length.  Because the helper only
copies obj->buffer.length bytes, a shorter firmware reply leaves the
tail of the buffer uninitialized, populating the curve with stack
garbage.

Zero-initialize the buffer and reject replies shorter than the 16
bytes required for the curve.  Known curve getters return 32 bytes,
well above this threshold.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b6541183d4568..dc1e69b964c99 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3631,7 +3631,8 @@ static void fan_curve_copy_from_buf(struct fan_curve_data *data, u8 *buf)
 static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 {
 	struct fan_curve_data *curves;
-	u8 buf[FAN_CURVE_BUF_LEN];
+	u8 buf[FAN_CURVE_BUF_LEN] = {};
+	size_t len;
 	int err, fan_idx;
 	u8 mode = 0;
 
@@ -3644,12 +3645,18 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 		mode = 2;
 
 	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
-					   FAN_CURVE_BUF_LEN, NULL);
+					   FAN_CURVE_BUF_LEN, &len);
 	if (err) {
 		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
 		return err;
 	}
 
+	if (len < 2 * FAN_CURVE_POINTS) {
+		pr_debug("%s (0x%08x): short reply of %zu bytes\n",
+			 __func__, fan_dev, len);
+		return -ENODATA;
+	}
+
 	fan_idx = FAN_CURVE_DEV_CPU;
 	if (fan_dev == ASUS_WMI_DEVID_GPU_FAN_CURVE)
 		fan_idx = FAN_CURVE_DEV_GPU;

-- 
2.56.0

