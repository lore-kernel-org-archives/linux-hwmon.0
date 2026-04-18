Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756802236EE
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 03:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776484108; cv=none; b=PnhS8sDQAmBZDhIQhOma4+HWdKdZhBTjC/w2t+A03hWQaOlkaVuAimkYUzlD38sB2Ap4P0HA8xcH48Vz7U6i5b72BzBkxxJUPtxu5hFlhU/ipkwmlNRJm+BMb5VrDYQGxvHGTB2DOGtUqBifGZ/+cNC2KjKefgL4pJccoe/WYW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776484108; c=relaxed/simple;
	bh=l62WI7Ygy+J0W2/WvRq2MtdPbp3iVD3gSZDmZzAIvbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMXTA66nXrNTILlheBRfQMcAp3gA3WF/oFQ+YaCB/PsTZwoPjlq66trVecJ15fKXCc1INnwafDXPL671sGJykKj/fKWxfrKgrCkmTxe4xUPw4WfJ9OvPvbJ8RTOLDYscu6ZfgRqmKqFHF1IGUoIKdIE4fskesofOj3wFCcWNRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPKYfilZ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPKYfilZ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so492308a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 20:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776484106; x=1777088906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joLiL8rHMacEzcwk5prGowFLUmrQwzWzBoDZlkxhLUA=;
        b=fPKYfilZ4PP/4YeVz93Xm8GYM95I4FJ+Sg/S8srQ0Qm9VTT2Lb5jKQQPYSuJV0KZuy
         WixARircgVOZO73O5rQodEClZ+bb/SHd33pgE+D1TFYbnpMKnwdigoxG8ebHJzrfDRXn
         eaETm/i1lwfoe/zK/41fFpvAYaLwkXdanq/7RBNvoLHWXrRk+dTII0hwfPw8Vce4nH8H
         Nb4MDrduehPROKE0MkIzHL6JY11abvfmS7q7RP9xloAb/lCu0rxHlSCgfa0a+d5UlvkR
         zR6iCX0maY24MgkqQW9N7FnYXe6k1GJmfbMbgx8ifmLPJjQP6ZNR0r8sSzJBP0HEpNHL
         sbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776484106; x=1777088906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joLiL8rHMacEzcwk5prGowFLUmrQwzWzBoDZlkxhLUA=;
        b=DaWadv+TpPZ6fglC7xCLkGjiGpRuDJ+xrwxAn8+TLowpJ5leH8SnEP3EjIDV/HgJxi
         LS/Yd0KEE3VWs+MHal38VgDn7rSPWHdpm/Nv9l9X+BWBy/KLp28SJmHunGD3T7FG/06Q
         9COt1/tIOs9lhn0uQ4wLY6bygtcNIFxlok+Y3HBWdgWzwmqmluMU2g3VKbSIiur0UWER
         h0SP4uFxRoao2+mwsIyEh+z+jjlyeVC/OSVkXx22qUn7pI7f90v3Jo156qU/sEOBLfkF
         6zrFyaIOTjMLsap6VJNGVJwg6CCI1Cnn6whKI2sBjwcCDdKimTAo0nEQaxXeyRoF/yVN
         vUNw==
X-Gm-Message-State: AOJu0YwpOgCjN/+0Gl0Clwcj3+zNol7nEEqNzZOPxpfy9jUbuF4SuHaI
	woI50z+nMS9L9yKA/2uV4SeZxtopVlMv5n6Wiq77GybJP13dBNi1xCY3
X-Gm-Gg: AeBDieta1wzF8ACJQfHKJql8uNMQygphSgEK0+frYTDN4uOCr58k3oTceoOWvAgf4J4
	Ip8kAV4BWgrp21Xneb1cxBDZa72A7uieqVh3LECbi9TqvFTJSWSfl0B0nwZpbL6Q7ceLyu1hMvu
	OJy0F6vl1aayP76MyZyUgibq3eIe+sbC7jYqHRj3HHXLgi5mEL+hINhrDYwmPrYRY8qBbXPdBp+
	XrNV2VK4RyAJuUGVkT4TKVLEynoDHgNigioOSVJpYXINeDXBa8D6X87EW1/S0wUGksLgnjut+3d
	cDI9+yb57UcsW6QuS0qbMNwKBqQCta0syXTj4esGQu72HgY8Hgf8ZuhnBg+BSNLC6vsvnzoDiv/
	aAQGsot6A1/hMAoG9LaOrOHF6RRcuP2+K7dDA0925iu0mN3eofpaLYVKStPE4HZLQoxNjC/KeuO
	G7/PL/jKTAmZz8Fr+FEEC+lJhm4tDUoVJaKnjA61HKrJMyKJitO1S/6xOcu7pqFKa+ZKNpifuNx
	g==
X-Received: by 2002:a05:6300:2109:b0:398:b346:b13 with SMTP id adf61e73a8af0-3a08d6f1991mr5383337637.16.1776484105826;
        Fri, 17 Apr 2026 20:48:25 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([27.4.62.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm3549074b3a.56.2026.04.17.20.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 20:48:25 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	Sashiko <sashiko@kernel.org>
Subject: [PATCH v3 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit register reads
Date: Sat, 18 Apr 2026 09:15:59 +0530
Message-ID: <20260418034601.90226-2-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418034601.90226-1-tabreztalks@gmail.com>
References: <20260418034601.90226-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ads7871_read_reg16() function relies on spi_w8r16() to read the
16-bit sensor output. The ADS7871 device transmits the Least Significant
Byte (LSB) first.

On Little-Endian architectures, spi_w8r16() correctly reconstructs the
16-bit value. However, on Big-Endian architectures, the byte swapping
causes the first received byte (LSB) to be placed in the most significant
byte of the u16, resulting in corrupted voltage readings.

Replace spi_w8r16() with a manual spi_write_then_read() into a byte array,
and safely reconstruct the integer using get_unaligned_le16() to ensure
correct behavior across all architectures.

Reported-by: Sashiko <sashiko@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260329073352.270451-1-tabreztalks%40gmail.com
Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 9bfdf9e6bcd77..9b52aa496d522 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -59,6 +59,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <asm/unaligned.h>
 
 #define DEVICE_NAME	"ads7871"
 
@@ -77,9 +78,14 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
 static int ads7871_read_reg16(struct spi_device *spi, int reg)
 {
 	int ret;
+	u8 buf[2];
+
 	reg = reg | INST_READ_BM | INST_16BIT_BM;
-	ret = spi_w8r16(spi, reg);
-	return ret;
+	ret = spi_write_then_read(spi, &reg, 1, buf, 2);
+	if (ret < 0)
+		return ret;
+
+	return get_unaligned_le16(buf);
 }
 
 static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
-- 
2.43.0

