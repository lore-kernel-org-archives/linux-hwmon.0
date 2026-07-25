Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E24545039
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785011734; cv=none; b=k9aU4xzyoWW3aPI15u33KuVHEYI8Vj04PhjLzRxYFLRiCgrXZNnNYJ+rlAsdYWMugiW8JjfJy8fmQwmkn/ArzcT799GRIAngIxgQQzn/jCwufhbTfabfePL2zd+ViW0ZjJdNJk0trvca3ywfR7s/K66DgWVLG4mpNv6yzS6ZDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785011734; c=relaxed/simple;
	bh=V0SiTIJMKRU9AkW8ZgDG8DAn4NagH653mLmXEt0NpVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plMfblaboE3Ozkox/zPXYkptoZgUM3qrkTLZte1bNUg45RI+HNynQI4KgjgxMU1241yYwuDUyW3cBkKWRaiDOZuLyBGeRasFEn3EC6dJ9TOQ0uGdHA4qEuRNr71Wmp3NacdS1wRX7CeWFnpZd90xX/IFta6jig5TKT8BvfDA5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqmXshTe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqmXshTe"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1997287b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 13:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785011733; x=1785616533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBQoAhMM1CCYKCWZ9yCV4iaNrX3Z0iw7Kh5/MTokMUg=;
        b=sqmXshTeMdhVhU4Tm8Ek5nC7JiqHIAdH/yEQk9CVoaycIN3sd1GgeeHVd73jTrrHl8
         GJZnXYrR9SWPnHdigwOPJDBC7w3D86XMcg9sqtMFxIKeTimLGE16bsPsTU3EqLbwcx8n
         zD2vJgR13Atl3t09i0S0lOm5Qf1CLmEL/jX12ZOZO1id5UeahbLdfK0O0Hbnvlf3xQ3a
         EnaQ7R0g8hZrQbxJdBaAweIzGpGY9SVCRQkbBqWhyZtSBgOHPz9IXmKwDFe9MHSpUk8F
         FD6L9H6cJ+kj5ALptsIrXQCrLjVm2l6ciangW3k0Dxwxe+DHOqHC6J9VQvaupbS6a4tl
         ZWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785011733; x=1785616533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBQoAhMM1CCYKCWZ9yCV4iaNrX3Z0iw7Kh5/MTokMUg=;
        b=WdxFEgpNqIHUa+dBYqmBZqQTPDsiZeyE51rQpDFS7eO5hpMD9EZ67ZqreN6+ACKa6H
         z6BWxwKPbTqxrUfSnK1nvYXcCdgopBDAmF++j/YP9gVOYZSReAHyetf2bZCGuqcOErou
         vmzmb32YNPzwiLlfm6NlivRsZ51zFfGKkuKCrRNpY/OhvMl921fiDmyE0k0z2W8iL24m
         29xm6FfsV9XeHDdxOrkJvF7w89PTdL+oxVu7zAo1SZx1Tp+j+PjB47R+apFS376Xroxk
         Ho3qfjsyzePjkGZYWWjQBAXIc0zYxh8e6qMAqdJB5ZQhfWm/SGG2DYqfk5LYfd6+Llgf
         Ixgg==
X-Gm-Message-State: AOJu0YxdZlaRxAXTmgtLJj6cv3nkLecfuUXPExFosKWYjKmVDnCE1RyX
	bzfr7C3YrcpYn5FfWANmLxvxVtCCbsFbXrocY4ay5oJ9wPlu6m6XCCovsn+iog==
X-Gm-Gg: AR+sD12zCgmeR42DYRBeAUyJfMWp8aijHHX7iU2FVEbrLsMcSgCT5Hzlk1wSEl+9yN3
	SFLF7ZjpuSe6TFDgj3qa14HCn2kgxc8+RGayfNh3nk5r9WlcpKsekGppBEY8D8RERV20QDQJY6b
	AR6WnHeJGIyh4fIxhIL5uJKNtNSf2qa5DnY2+l2QK5pE9CdO1NxPnKPpUP1yWM+ShNekOAujLwg
	lSF0LL/K2kBTqxgVo6lbU+SccD83RhUan2Cz0DFZTey9IYLn8pmTw062tZZ15cyOgoajMiG6Dm6
	7lRfEkuGxKyLUXcyXPnKW88OOrA6dxFHF7+IaCGKfgU3cUVhfVaqR3o/0YFhLqCG50K9RQ028rX
	XSc2wNdppkM+4WP+TtL5+5hCVvhuov/n18wOrpDkIB4eXkd299o81f155kVDsuMnprdkVjwijfy
	i4UqJIuT5rybiVu+I=
X-Received: by 2002:a05:6a00:9288:b0:848:2f77:e2da with SMTP id d2e1a72fcca58-84e595d33e9mr2450056b3a.67.1785011732504;
        Sat, 25 Jul 2026 13:35:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f23csm1312427b3a.17.2026.07.25.13.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 13:35:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus/mp2975) Eliminate dead code
Date: Sat, 25 Jul 2026 13:35:27 -0700
Message-ID: <20260725203527.1913970-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverity reports dead code in mp2975_data2reg_linear11(). Code analysis
shows that the parameter passed to the function is always non-negative.
This means that negative values do not need to be handled, and the
associated variable and conditional code can be removed.

No functional impact or change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/mp2975.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 5393f7aeea0f..8e5193933ceb 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -176,7 +176,6 @@ mp2975_vid2direct(int vrf, int val)
 static u16 mp2975_data2reg_linear11(s64 val)
 {
 	s16 exponent = 0, mantissa;
-	bool negative = false;
 
 	/* simple case */
 	if (val == 0)
@@ -196,10 +195,6 @@ static u16 mp2975_data2reg_linear11(s64 val)
 	/* Convert mantissa from milli-units to units */
 	mantissa = clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3ff);
 
-	/* restore sign */
-	if (negative)
-		mantissa = -mantissa;
-
 	/* Convert to 5 bit exponent, 11 bit mantissa */
 	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
 }
-- 
2.45.2

