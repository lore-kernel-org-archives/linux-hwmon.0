Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574D2C15BB
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 02:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777687738; cv=none; b=HQR9Ly4/fHbrsUuKRAWaLCUau9h/4wq5iekdn8BIaQBH5HVc7RMaVrzaDVH2dNgHmV25S+jTr0lkX5c9Cpvz0k1GQ5SoJnRbh4SZSHEkUOsLuXqCIQKM9/JaXrMNjkrBRg4d97FNHD/PHA+dOuQ62zgtHYPliqjkbqO79/VhQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777687738; c=relaxed/simple;
	bh=Vj0a9qduxlNCPp1ydSPehmSf382ohEVT4KqXWYvxNPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfEILsFoiYlsujwTT6WOYL9UhHnB5D6ROpimAkKU+W4fwzX9PAC+GyPEfu9i4FkEWn4kuCjGOpaEEQP8hU2MpkAHzBqpP6cTAEQfJMzrYCRn79zOpYiDrdfOufOSZSPh5b3WMouhx34Pwo7BgGPBc9XB8O0XLT3wdIHFXXmINTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvtyKGH2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvtyKGH2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so589352a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 19:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777687736; x=1778292536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvktrsPRQjbid/M7vQVO3VIEYHof7fHHQw2CFy4zVhM=;
        b=jvtyKGH2gKoU0npHz5JbaMwFXIRxb6894Oa1avO0QFl8y7SMZbl6pCsZHLWPzNUEoz
         F6evvb7s+UE4lRWKoDxoQbbQhSGc9143vcEDjCPftT/muwS/EMKXtrPqJDKXQibbSUOU
         IHP/+GGPxRFqQ1gyXZ6FUTO74YBtpmyrWQ4aV+ZbzEc9B3DsoUzGWoWjfe45h/bmT291
         tus/kLfpJAE1LIoWbe+4Q7tjdVcrhbLx1iWg4P7nUld8L5GBnPghL26v60Msq3mGhU6l
         o5q60xQ+L5RfZC6eu1zfw39w545Yhek8v86pW08ho8TEnd8maaFP7IZY1aimYO7zJhHG
         yOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777687736; x=1778292536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lvktrsPRQjbid/M7vQVO3VIEYHof7fHHQw2CFy4zVhM=;
        b=D3zO1f465nKwNnGDQHGgOa1bVSg24I3qp8IrahpURYqqACvJewUD4KmFWd8BoiqZFi
         Psi0L6lLiVb7lTLyJEJiluFyaCrDyVwE4nYRJEn7RbZwvu9od4tvnHzhIiMuZPhvU0uM
         Pa+r11U9ywYR61agqpoZRH1YOG7peB/PKth0M8XJLDm2AgDPczzw4NKJRXdYtZJDz+8Y
         4jH4VywDV+ZJoSDvFe7x7b5pDhpxr1Ab2wPI2dEBB8ley7CVVZ6562vl7q6zlOGSm9r/
         6V13ofc8tCfUb54b2wEyPAI7L5oD92ES6lANFhygt61GfvuTGWOSP75VQgadEPHvSS1y
         WMGA==
X-Gm-Message-State: AOJu0YxbWOxxf+aWHAyuSo+44FFGJEkQ0CHH9iNbxzexsZ7dmBJc5gtR
	BbxtqTx69qe34qJ90N5BvB90qo5OS3pKHX/zZslqoRRqrTvh8a80cLUrs9EwQw==
X-Gm-Gg: AeBDieurL9dH00jIOwx2sUVihpQPMYczixwyU160BEo1CBJId6NJwK7Z/piDhSzqoWP
	IUxA65GDzs1db1Q3mbFVG+ck6BQE8jdgOcCk1GXdV6Nj500VGz/3JU1MmSW/k2YMB2Y10dmP1tB
	hVF6QFObMJRUKBP1R5p8siP5mdhs6iEpKEPBy2DcUtMqP1Ubq0HLIM54eGqGN4gXiJaCSFKmX2F
	ISaLnH1HCrrplmeI3R/jCQU5bck5yFGWPDD9luWBrMFmJHVmR7nMuvz1iw76ngqiWATCCbzzV3r
	mDKbfAvvPPj86/u4IJ5WkLm51gb2dXST5xWrdg54Mb0q+IAp64fUizU4Xo0/QkaxFxKrbfQD03J
	BcJuNTOTle5c5fF6TDUbdZste7gf5wp7gsi+GGvSgfQpzT3q4i6MI9wW4ozHrPkgQ1a0z9r29ZZ
	sD2YrOOg8BBReN5gkZdg/KcYqiYHaQcLbu8WU7xeaycQu1qoTHghBaxfMbwhRkTK1bRoskHCGxF
	j1trA==
X-Received: by 2002:a17:902:9889:b0:2b4:5309:2c14 with SMTP id d9443c01a7336-2b9f260b785mr10116985ad.31.1777687736219;
        Fri, 01 May 2026 19:08:56 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae39e91sm34519135ad.56.2026.05.01.19.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 19:08:55 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux@roeck-us.net,
	david.laight.linux@gmail.com,
	me@brighamcampbell.com,
	shuah@kernel.org,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit register reads
Date: Sat,  2 May 2026 07:38:42 +0530
Message-ID: <20260502020844.110038-2-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502020844.110038-1-tabreztalks@gmail.com>
References: <20260502020844.110038-1-tabreztalks@gmail.com>
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

To fix this, cast the integer result of spi_w8r16() to a restricted
__le16 type and convert it to the host CPU's native byte order using
le16_to_cpu(). Negative error codes returned by the SPI core are caught
and returned prior to the conversion to avoid mangling the error status.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@gmail.com
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 9bfdf9e6bcd77..52584bb77ffb7 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -61,7 +61,6 @@
 #include <linux/delay.h>
 
 #define DEVICE_NAME	"ads7871"
-
 struct ads7871_data {
 	struct spi_device *spi;
 };
@@ -77,9 +76,13 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
 static int ads7871_read_reg16(struct spi_device *spi, int reg)
 {
 	int ret;
+
 	reg = reg | INST_READ_BM | INST_16BIT_BM;
 	ret = spi_w8r16(spi, reg);
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return le16_to_cpu((__force __le16)ret);
 }
 
 static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
-- 
2.43.0

