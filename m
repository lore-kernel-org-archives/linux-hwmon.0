Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061D7370D62
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772974046; cv=none; b=XbtmwI+8xhstp/vFmXFFOR4TGs3mAOxNgaQcoaw54GzVjwJRbaT9+GQKXMHji2BQ9k0iQE9deBosYkM+fk8j/sdExE99zYf55X3LwEfDw8mcBPiSqNtcWGMfrnJWwgZ6yED0draQ0dGCHDc0vpFsy7vdtgcTAaByRwAqyRwGrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772974046; c=relaxed/simple;
	bh=cPZAceRc84kr/hAwiZuHGsmsHjxeptOnufs4w6M6xzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLxuH1GuE6ZlLa8RA/KO6+6mLTOg+Ip2i7RLZ7c2v0I/Y8lhWomoQW+8I06WGqHNidO/BXSNzsvK3VO17Mk88kSbonUTUrOrJNECXnPyPKIhKWh909PF5xnFgj0BFtxV7eCsrWN9AAFZRTzllIZ5dNL8F2tEqvHdrDatj2DBOx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNQ2jK5T; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNQ2jK5T"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-359863611faso2991911a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772974043; x=1773578843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zexynXT5oxWLt26DK4T6fBZwCn9ajmiaWVq9cH14koI=;
        b=UNQ2jK5Tvp3IgD4dbAHKMGKJw32k/9lx5WD4a52pP5h/SXT4XqxzVTTFFB64x6B9pt
         8NZ4gp1ypW4qcKQqR9D/zIoWYNeDeob8JF+gZ9WumwAU0SZfcrUKtyywXoEaZ+EdgFNk
         WDzlygP3eTeNsw8T+4b4M0TJAqg4aehG4ZOPeEsQrflCJz8TveC3Hpk/AiclzqmAEYli
         mtw0DiQWu6f716IR+2N1f1PXvUVVGoCLwaEKb4dij1qzt/rYenivYpdhezjvLSRHO5pP
         psdQubAuZJ5kbdAkMYUaCAVWIXDc5CqIug04hEVwC+DJH3if7csL2CJcBDoeGCMeSmm7
         bdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772974043; x=1773578843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zexynXT5oxWLt26DK4T6fBZwCn9ajmiaWVq9cH14koI=;
        b=sfqykDkfwlWtslEnczNaWH25NkwoIx0jkfMdEuyduGHoYK92aO+R4x9YiyAA8hDPo7
         72eDd6+m9Wt6/reQJdY4kN3yUR9Np2gLwI2qzqURTcyJ7YWg0yJLFdLsfIL+G3ci0XbK
         suf1azaj+ijiXbYaxzLFDOFgLhPP16iN9SWQ9ZbO+f1lrA6P1JLtjgnLDf9vjm/VqZbl
         qdkdIE7IkB7nrcVZgiQSVP+v4JLxny0tJ2V0tGb2wy9Sy4AZ0VHO2+dDl5Si+170PaQU
         h0y5zDm81yEjX3OixZSOeR4q9iXBq2v1vHMQzP25mLMQNGCOi2pbPLtXAA4M5AqcDqIX
         o0ew==
X-Gm-Message-State: AOJu0YxNvmUfsR3N/btIZ91o0JumrYp97V78BvQaY6oeNzAARyNXDtBW
	ErpYpe6WKYiOYgQ0hp4wZGLJe8ddkOcAu/M9mr5+B5iPQsNI1ZWsBenu
X-Gm-Gg: ATEYQzxMgwYtNo+De8LFSPS7czeTGcetyBElsV7mtSE2PxixdCQ3bcTLK0AWgFKsPwn
	bI4I6bbWHgvHZpLPzDi7goQb3Z6tI0/tS2R8K6aYZPsTnnlqCxj2Lvjfe44Gijdcm1rgMzMyRMq
	iLi05BFah8r3N7VdIWpA3TOL/wfWW0TWSL8l3aPXLe7/1f0GIxrBwUf9glmRys2c2oigJgZxxCD
	snYuaqSusj59sHGwebgQ2dOHiTG1oXMiUdZ0P9+MSOJu+VsyhguUPwFnARMAEpd7FS6gzDUdh24
	lktLkyExcQR8eZ89KVE2bRAKjd8uMcPtJCzEpDJ1XMYATO0ffh2S6x9c/s1khfWBsG88RbU3YIX
	nknV4iBLS74+NgHc3sIOipYfYmAm/6IbGNdDRF1zEESal61BAcSUy7SQrR+2qkD5yXPsWAb0h1+
	vfW9HgptPSnWMCAkoG1l5/SIfJTL+olGXdyxBrMniwO/llEm3wdkrnHCqUNjwaKfxMOLGjBdkRH
	dKMDmcLRAA=
X-Received: by 2002:a17:903:3845:b0:2ae:4445:f397 with SMTP id d9443c01a7336-2ae82435427mr77322395ad.16.1772974043302;
        Sun, 08 Mar 2026 05:47:23 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([2401:4900:93a0:18ce:f596:eb56:eb0e:e913])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57740sm76390325ad.15.2026.03.08.05.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 05:47:22 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH] hwmon: (ads7871) Propagate SPI errors in voltage_show
Date: Sun,  8 Mar 2026 18:17:14 +0530
Message-ID: <20260308124714.84715-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The voltage_show() function previously ignored negative error codes
returned by the underlying SPI read/write functions. Because negative
numbers have their most significant bits set in two's complement, a
failed SPI read returning -EIO (-5) would incorrectly evaluate to true
when masked with MUX_CNV_BM (0x80).

This would cause the driver to enter the polling loop even when the SPI bus
failed, eventually returning a misleading -ETIMEDOUT error to userspace
instead of the actual hardware error. Furthermore, the return values of
the initial SPI write and the final 16-bit SPI read were completely
ignored.

Add proper error checking after every SPI operation to ensure hardware
failures are immediately propagated back to userspace.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 753bf77ce19b4..9bfdf9e6bcd77 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -104,10 +104,14 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	 */
 	/*MUX_M3_BM forces single ended*/
 	/*This is also where the gain of the PGA would be set*/
-	ads7871_write_reg8(spi, REG_GAIN_MUX,
-		(MUX_CNV_BM | MUX_M3_BM | channel));
+	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
+				 (MUX_CNV_BM | MUX_M3_BM | channel));
+	if (ret < 0)
+		return ret;
 
 	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
+	if (ret < 0)
+		return ret;
 	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 	/*
 	 * on 400MHz arm9 platform the conversion
@@ -116,12 +120,16 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	while ((i < 2) && mux_cnv) {
 		i++;
 		ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
+		if (ret < 0)
+			return ret;
 		mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 		msleep_interruptible(1);
 	}
 
 	if (mux_cnv == 0) {
 		val = ads7871_read_reg16(spi, REG_LS_BYTE);
+		if (val < 0)
+			return val;
 		/*result in volts*10000 = (val/8192)*2.5*10000*/
 		val = ((val >> 2) * 25000) / 8192;
 		return sysfs_emit(buf, "%d\n", val);
-- 
2.43.0

