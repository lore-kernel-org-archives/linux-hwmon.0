Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5E422A7F6
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 00:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891450; cv=none; b=gM2zap/2V57p1orZoJAo6a/U4jMa/7Y4ScZP3zJMSkA+IVVVCJBAYNAIMKUGeotIbcek19AMTR3JfpWaOl2Sn3czviWith9ti9VmTMin/MqkDd7b73I5QrVv4xC0cyip3WXzyDDV6btk6EPKCsN89vXK5wrvmrKkcEzJ2ktzv0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891450; c=relaxed/simple;
	bh=bFVGDweZUNmyxeeDKHjcTj5ZmdhHG7bgBeguhkgp+ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuI1YUuq564KXYMprEYE178wkPLycS0QuVyJqsneA4/oIx3WqmPfJCXQ75MxO/F5DBOL+6A6GJtyw9EX3K/Ot10VSTtj5UslBuXHfrPpnV7rYlpXX303LQrG0QxCFeboLscczNGYh9rN2akXm3IBjK17zvdYFf6ViTAPqSRHWHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sws4xf7M; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sws4xf7M"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so377166a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 17:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785891448; x=1786496248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4Qv2VipMlZcYtQS7PTvLD7WNtqxtO1c3wiCwXDw1Ec=;
        b=Sws4xf7MrdPSC64syvT6MEMHekzMuIUupBx1MS0BigSH7/GIVVGTeFZektlYWMZZog
         /prWibPPrXLS2bSrOe3JP5ffsLMuyyB5ic9MzYezy1bspFyH30i2G0AhP8SoKsQsnJ6W
         FYtlaYuERwJc9KUAthzbb/MTYLEg4lJeCQ/T9Gw+ry42z58O7LnGBVqXmhV1vcqo9Ibq
         ZZ6m3RXbVbPxE/h3mbK1o8Ts3jQNvVv7pueOv6kZ8kXR7ZRVsuJ6zaxj5CPxP02St87v
         iaxD9qAONfLwrT4tImoJ8OAZKlr8oXNGyWzutzwGCagu5TWvJro/905dljX+ulCzvT/e
         HUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785891448; x=1786496248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4Qv2VipMlZcYtQS7PTvLD7WNtqxtO1c3wiCwXDw1Ec=;
        b=a8fvjWpu/OypVpHrYyVCRtGaQjbKkiyn3rJxV2ImnFIWj04rDa32NyzFFGKcySzJXY
         EW8x1Pd0P42FSyfJQOFLcZSF/1ivrekVVFQB8q5LbjDxPBpCt3TgoDNfLdcuQelN7Z/2
         qapnHHeKbI6gmnaNmbK0DTDAPpGZ7mL4G8qtpDq9BQdHh43FSDk+zETvm9/vhMaCgbqF
         dN2tMwCrtM+uq1iQpv3x0xKlmlduBIchq25t0mtEhNMg9zjuCF9jHw7ftS994rakfD1P
         U374f8HbhDk4jhmMSZ2dbxQnVji2FIL4P1eeR3V1QPk3OxZqP4ks++tcuey2HhRS6zNh
         p7Aw==
X-Gm-Message-State: AOJu0Yx6tFQYyLlV28gqDmIQOPmG80GsmP97dAa+D0U4uk0oSMWGq3Tr
	gBpIbu2GXJQMcDcSKoP5Z5vZISwwfLOO4xc6T4Ld2sIR0ikhfkkWXAEuNzRgEg==
X-Gm-Gg: AR+sD13Tu/Lm6f7RS+hokydZFYUl25uCea6V8/Ol1tnZLFaqKd1QR9bDH2IzHcU9m6k
	fi9/PGJIz3zpogxZBWcGjkKj24guibcZgdiPEBNQFkky4FP+CgdwHdoiIEs4Zke0u/nrPBcHort
	mTUeLkny17HQlMooYsfAjQ+1MxQ79rSazAeofpgpB1uuenlil1tA/11e2vq5ldsB6VmUgUtMnms
	QnALGm5BjIbrBeALRvbO/Bepl8tzHeFcLTGpF4XXuHSIqFFu++aMngFWyK6c3DX6PuQ01xRo0e/
	zvjJUUFmmY6MJVZHPnRtXtpjhAXMo4wjmwW34IBzawk1TnxoD41H/fiF9WYef/+y05k3f2q78Rh
	rtuz0/Zhb+py3tk8S+bpuNwPg8tA3XKBLKz6dRwYfJe6UAlEMBqrXon6VkwZoWbPfrzj6ulq757
	/LoVtb0ZwY58voN+FByQJajZUMap0vw7ttLzeyouea8EynlK3via8oq8Do9k6lbwXDulQcxaH5/
	Q==
X-Received: by 2002:a05:6a21:46c9:b0:3c3:6528:c87 with SMTP id adf61e73a8af0-3cb85dcc76emr3146218637.1.1785891447736;
        Tue, 04 Aug 2026 17:57:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm14291046eec.21.2026.08.04.17.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 17:57:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/3] hwmon: (ltc4282) Clamp negative current limits
Date: Tue,  4 Aug 2026 17:57:20 -0700
Message-ID: <20260805005721.1566034-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260805005721.1566034-1-linux@roeck-us.net>
References: <20260805005721.1566034-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a negative value is passed to ltc4282_write_curr(), the signed long
val is cast directly to u64:

drivers/hwmon/ltc4282.c:ltc4282_write_curr() {
        /* need to pass it in millivolt */
        u32 in = DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MICRO);
        ...
}

This cast converts negative inputs into large positive values. The
subsequent division result overflows the u32 in variable, truncating
to a pseudo-random positive value. When this is passed to
ltc4282_write_voltage_byte(), it is clamped to the maximum limit instead
of zero.

Clamp val to 0 and to the maximum supported upper limit before the cast
and assign the result to a 64-bit temporary variable before the division
to avoid the underflow and an also possible overflow.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
Cc: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4282.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index bb7f6727c44d..bb1bcb369016 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -14,6 +14,7 @@
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/math.h>
+#include <linux/math64.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -929,8 +930,11 @@ static int ltc4282_curr_reset_hist(struct ltc4282_state *st)
 static int ltc4282_write_curr(struct ltc4282_state *st, u32 attr,
 			      long val)
 {
+	s32 ulimit = min_t(u64, INT_MAX,
+			   div_u64((u64)INT_MAX * DECA * MICRO, st->rsense));
+	u64 val64 = clamp(val, 0, ulimit);
 	/* need to pass it in millivolt */
-	u32 in = DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MICRO);
+	u32 in = DIV_ROUND_CLOSEST_ULL(val64 * st->rsense, DECA * MICRO);
 
 	switch (attr) {
 	case hwmon_curr_max:
-- 
2.45.2

