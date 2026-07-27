Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05527435528
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177195; cv=none; b=KSOdfhJU4ROWa1MwCgxsqhg9KB+64YZ/VD63WF3teK9XbcwSaWy0UzEGPOWXIiKkREyjIUj+i+ek5uuBiMFnIizMbsGokYeZzy81JE9xQwodxwPwpGqgTE6nYIFwx6IwH5tUQq73n5APXcX+d0CljEVtAT1FJyOQLkB4qPvBhKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177195; c=relaxed/simple;
	bh=AZk10xqVIPgWGojTRop7v+1xiGCRNn332m4hq6LzbU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UhsUayfgNF1ZbDVGpkJs7c8v4L+jC9uxF7aX2S2Q1O08PWCEiSt90+Xf2ieBHU76X1cwjdze95levSHOCcGJ3STRz9DuoF985W89YKaxzeCwOkwkTeDr6yYP9b2DZAppUvYabfKW76jUy1JuNqzhhqCTT4QtcZFXyknTvDw6beI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J90WEjxl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J90WEjxl"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848743155bcso1131294b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 11:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785177192; x=1785781992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umzuaGFvORLhggmmn7PuCGwoHAp/pnWTPyyUmBYQIdI=;
        b=J90WEjxlOqwmu8JcvyNDd/dibDexO7cRJezOEhgts0YIH4/xOZ7O7ljTt2+Z/2am2Y
         vwCFwwG8QCe1eBMRO9dOU983P3n24cYoMJISSxSwMCMLVtx/HzmvNcu5mDM0ziEG17ia
         doLPNknKv34Ix/YpRN5rtAX/1GPFlKZV26FMVZZFQOgrRlNDGvu+q9yupCcCrZY8hcWL
         wGdqV1r4fRsRPKjw5dElT85HduLjlBrdpzqVrsfu+qpCCSukdKZI880VI9rcSph8oxIO
         13XX3W1i25Kil7g3SEHuQy0Gd4mrUyUvQjB0EV5Pr1MKCnwgNHOFc7X+/JrGSa/79RCx
         j90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177192; x=1785781992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umzuaGFvORLhggmmn7PuCGwoHAp/pnWTPyyUmBYQIdI=;
        b=WDYfRLmXkqh21W5DgrBdXeMoM4RF4H319ZqbS0RjlHN+zo+ztv4O4tvSHJUe1M7H7C
         B0kkAdjBtvEoBFMZmY2gPUb/SlKI96Emv8pSLkx4N+zppywPuKgta+t+swFytqDE2ZU+
         Q6880QgKkV6D4itEyuhoGfr0iyCRhJWRuSBSjQxDq9Gvb4H/VDE0U/S9xVigVgGPFYCr
         VoGWHnXIMW1CqPnh2skZUZeNEmZ2Tr42COrVyIrKcEBjcWcleyNLErN2jNqxKgHdhaMF
         ZZZ4NspImC088AFj1Dmw30MwjsxUQuiByCb7j27/T5uWWRThjH0PQYDeYa1J7Us42Bli
         +Pow==
X-Gm-Message-State: AOJu0YzKOsskTDiCQoX1gRYtsFWZJxrJ9/EirgJb3b3da6lIeks++TTP
	JxDRT4EkrzolO8xyML2XsqX/525HTORLq/NTrv4GTbErjGVxsOVYZMMU/HiGvw==
X-Gm-Gg: AR+sD10tfS7gqhuOqCmhBzGeiIn8+ndVRYbYT49f5AHS0nED8npzf1BnS/HjwOayjYq
	Peeh+S+MByqi8jLctZS8/tr7dzqYn5jK83qIg5YVcHNskk/d5U0gzvjOUg7aitvUIBqwy8QvalE
	egWUHmGYclMdiKVZsXJw8IEDnqpCayEKg4p/ku0Jls84jSz8qJ5gEEir1mxHkaLNFx60MirnG5Q
	i/+GakUVFRr8kv6T8053h8+RJkLna0hWfG1nPinDi0/MDD2CoZwIJ+y8dljsouiEP8QaFDhktuV
	fFfUIXOZrPbUIFUXF2OjDnSzHcC1dSKcuuVTpoZMjXBFNv6ZzA92Kp28ae3NweMtk0tK9bflkW8
	gsjQ2zKV+1ICZkBy+w9RsgrVCEKvXYl4WFYQm2LzKhc+w511vZ8fT76TZxnMJrKzXQ/NtfQ2iiG
	lUwrkLfVHbNnErqu0lc3PQaX8x4g==
X-Received: by 2002:a05:6a00:4f95:b0:848:6ef9:f5ca with SMTP id d2e1a72fcca58-84e595d0609mr7379865b3a.63.1785177192338;
        Mon, 27 Jul 2026 11:33:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb660dedfsm3713940a12.4.2026.07.27.11.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:33:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	Aleksandr Mezin <mezin.alexander@gmail.com>
Subject: [PATCH] hwmon: (nzxt-smart2) DMA-align output buffer
Date: Mon, 27 Jul 2026 11:33:09 -0700
Message-ID: <20260727183309.3681243-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

When send_output_report() calls hid_hw_output_report(), the underlying USB
HID core calls usb_interrupt_msg() which maps this buffer directly for DMA.

When the DMA mapping flushes or invalidates the cacheline, it will corrupt
the adjacent variables (mutex, update_interval) that were modified
concurrently by the CPU. This causes memory corruption due to cacheline
sharing on non-coherent CPU architectures (such as ARM or MIPS). The DMA
API debugging tool (CONFIG_DMA_API_DEBUG) will trigger runtime warnings
for this violation.

Any operation that triggers send_output_report() (like setting a fan speed
or updating the interval) causes the USB DMA mapping. On systems with
non-coherent caches, this structural bug causes immediate and deterministic
memory corruption.

Align the output buffer to ARCH_DMA_MINALIGN to fix the problem.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 53e68c20aeb1 ("hwmon: add driver for NZXT RGB&Fan Controller/Smart Device v2.")
Cc: Aleksandr Mezin <mezin.alexander@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nzxt-smart2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index e2316c46629d..ff0c0bee0e83 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -203,7 +203,7 @@ struct drvdata {
 	 */
 	struct mutex mutex;
 	long update_interval;
-	u8 output_buffer[OUTPUT_REPORT_SIZE];
+	u8 output_buffer[OUTPUT_REPORT_SIZE] __aligned(ARCH_DMA_MINALIGN);
 };
 
 static long scale_pwm_value(long val, long orig_max, long new_max)
-- 
2.45.2

