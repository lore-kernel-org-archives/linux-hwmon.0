Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9DD2DA768
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 01:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777599057; cv=none; b=eIL7z01s+6mmyVvypC0xxhPM8oNWSUnXcWw3ehxEtQwuKzPHxJwdc41XWJWPorZmC15a1W5fAzkdp+HLL2eykmwty91rb+kOY4pStN5FmGOTQ3uCTEJdBxwjH7bsKITlzgC7TCHJjzdpqe2TnKRVDIQzDYJvCkieU1Y8Fsroes4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777599057; c=relaxed/simple;
	bh=sevQqxU2n4n15ZHjc3jzPNUQGXH5cD2YJXRZVneCUlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AovDsh1x8q/FCfgCXMbe1D4px6/Hk09ZRAaXRXaoH2scyHIwraYGACiFdpZay7934A0Coaj9Vw4pFVNLqVadFdZJUdIAowog6GuZajUZFAKPbwomwIvo0B0/MVXu6tx/KVnBMifRWZPvEyAbTl3ksv5ZLsnMyO0U5YNSWCFJ1UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKzYttk5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKzYttk5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-827270d50d4so1473381b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777599056; x=1778203856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uP5sYcJaVx3x10k3T5DaI4tDidJtDGqs6YntpuelKo=;
        b=IKzYttk5WcpfkJyFBPcABNQf1gkjtkie/fmpmIAMjGpkCLZ/M2BprM1pag38uVLJh2
         PuNaW3OugkAJIReJoRvQwnIp5C2JxSRtZCvCqOrfAyVwleY8ypd2YY7xylAVTcKsENcG
         nHhBvwK2Y2vVHALOYCXJ6dnK7MU+5Lj6r2AbhChIUO4jfd3NCKxc1IveFiJwv1AWWVFu
         pRSVQ08oZRskh5scStmENMS9N9LzCsgxRxxF+EqfuLP3nahf5EMD8watTlPeKqabvHye
         pL5qNr84jpawOtQkh+Rr/rkpkr18sR5vkyfZ+ZKmRn1YPGWBYIpoONwobWnwS3MDi2Dp
         Qzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777599056; x=1778203856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5uP5sYcJaVx3x10k3T5DaI4tDidJtDGqs6YntpuelKo=;
        b=VXPHh60KyEjOJytPv/YRQOgw+VFgUBjeepFo6H35CppeFy0ypnaiTDhX4JPDqXYuuL
         X4jn0hF4hnlN5yzt7N+ujgYk2QiWfHi8ybnIJIGEZ/g/WOG8mF+berJtA8Dqqpen4Bbo
         TKUHlADNTxLZ/5GU9lYTsxdBlvfxrCFYi6jvhv+PzAJFLd6ChGy0ZVmWOCsfDzjcuzfs
         x+lZY1UsDO4wWFOB7SL2HxduqXUaVZLJR6sqIV2V9IBN1iCKJTsRQojg+y7wCrTQHbiZ
         vm3Pt/iZr8z/1c06kzpY5P+xDRepPDiC4TAUf4RDUHj1Ktk6PJ03ngYQzgH64ylojb3j
         0QLw==
X-Gm-Message-State: AOJu0YxZIusZiChwU8KYngRvO8kmhKUGm+Cfn5gT2GuZvt7wS8lKIdzt
	nvqYzMJv8cnfo+gSKGc6XsD8NuG9kB+Yv4x3wEoeL3PnvwD4p4Yf3pqD
X-Gm-Gg: AeBDievF+i+sHsC/NjOtCQMH1RZ/GaOf1396uccPuPpSbCcHs1HE6nuGM96gGn/Fo7p
	JYN1W4HnEJaABcPztmlCJzoT+WKgamxHoV4e3HMlMpiMqGpdaFbZSBhYtXKo77plTMbkxwfEaWi
	/PWNHKB3pGUTPPjSql1lUEwuSRzddszLWEVNBVfKKM4EDtEPXxfnUtmx3N3C099FSsNSV7jcFBM
	VwE1d5kdONOOEB5WbXJkLEfc7pSHUX50ZWOLA1nWae1wUzuDLubRkCapf7Ldc5DUd92LNp7igSp
	4amKaeYHktizVOoWjjI6Lu+trUJrBGkuMVYTfAE9jxnO4EJMf16t7n5D2w60B+6QW4xxVcaCIjL
	8PxPTcVK63g5NPKA5/whTlSWLPrU1e8EtNfADX71tUrlAuMfyb+w5tYMpOyp48QDIOmhHOCQCjL
	LAzfHXTZzgIu1NOye77Y8ju1kqLunRXoepi5QS+FpknsS9w6xVv002qx6bYOFC29TKXrOoYTm3q
	ZDSOtRWTot3nKR+
X-Received: by 2002:a05:6a00:2d9a:b0:82f:aae5:c795 with SMTP id d2e1a72fcca58-834fdc9aa92mr6327929b3a.48.1777599055665;
        Thu, 30 Apr 2026 18:30:55 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158a8432sm1014523b3a.20.2026.04.30.18.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 18:30:55 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit register reads
Date: Fri,  1 May 2026 07:00:41 +0530
Message-ID: <20260501013044.22756-2-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501013044.22756-1-tabreztalks@gmail.com>
References: <20260501013044.22756-1-tabreztalks@gmail.com>
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
correct behavior across all architectures. Additionally, use a u8
variable for the command byte to ensure the correct instruction is
transmitted on Big-Endian systems.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@gmail.com
Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 9bfdf9e6bcd77..15104d9b2b733 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -59,6 +59,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <asm/unaligned.h>
 
 #define DEVICE_NAME	"ads7871"
 
@@ -77,9 +78,17 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
 static int ads7871_read_reg16(struct spi_device *spi, int reg)
 {
 	int ret;
+	u8 tx_cmd;
+	u8 rx_buf[2];
+
 	reg = reg | INST_READ_BM | INST_16BIT_BM;
-	ret = spi_w8r16(spi, reg);
-	return ret;
+	tx_cmd = reg;
+
+	ret = spi_write_then_read(spi, &tx_cmd, 1, rx_buf, 2);
+	if (ret < 0)
+		return ret;
+
+	return get_unaligned_le16(rx_buf);
 }
 
 static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
-- 
2.43.0

