Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970163C
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Oct 2024 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727745396; cv=none; b=cjz5IkAdvR/9FVUQEH7DTUMh0Qs8nropiOp/12TvD3j9lW0cNOaXFL/irjZdts/2tRoAhLF+s1HN8Ywz1mfSZGG4z6Xr4iOAhHdBU5C52Xa6sE/MJ0Tx3LZDBz1/nCRruoOA+/gpjvCNTk4JJmWsBiqlgq353fin6O4uZZq9T+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727745396; c=relaxed/simple;
	bh=Zu6cgo/Xo6ZKx870GI3TUoBzinzwawYyCgh0RUs8DL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g5fPjOuj/Z5lKX3Jv4mabZhoixCIteRbad4DWDlST5WugLTBKOv0fHVeVo8hgmXJWRoYbuYknYc2FAoWNl1nB9L5oLvyRS7nHShWtifwKtuAbuYFVBru7+8oh+ys+2s4ipLiy40myBkR/UmLv+laASiqyWTZ95l3Yjmil/8rirs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=xAM1UiF3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="xAM1UiF3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b4a0940e3so33298205ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Sep 2024 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1727745393; x=1728350193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nbwMiFAr+Z16mU53YheZTsxf4FRwmHNw4rDavq7J5XU=;
        b=xAM1UiF3bdrCAFeaoWv1mQgHcwvCymGU58lgSi1Zg+TJWloc6Ia3Md4W8iEnvfvOiL
         3V9bxc4lq3ioBfJvTF/TKAtXXa0HGnkCMZrB/JUld8K1M+X4x37VnaXbsvEsyQSFbNz5
         y5t2lfIrX9AcHa/ETqxTuH3SdrG3sm3KSIMif4Z1VkHd/A4ZI7Wyl5/0irgPuDEUx2lk
         Ac0gNGlRjVJ/946GB32qh6kB89D6jA+zpZRjdcFriVcqj1l5LDI4X6iHYRefqWYuOYC1
         7h2uSWrIB2i2BJzIrPsHpxmcmZoBtufRHYqbcdVICnsgCIjrVz7bOTnASEY/iVELVJrg
         Vc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727745393; x=1728350193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbwMiFAr+Z16mU53YheZTsxf4FRwmHNw4rDavq7J5XU=;
        b=AfFLDRWe/ggFqPwXbMSPpq77zUntkJIvEAE7Ywr+4x10IL134EZQmgDEfqzf8G2PFU
         nEf8+Rs8HqHyG2TPPkgNC9QYZSP0C3afaJvV08E2QzZ0C9mHwEdsxLz6PuXHvfGCpuhV
         A6yTGo/ua17bOdXgdYugHFEOq5oZ9FgiQ0eevFlkUGvBAoXavjG5IFgGNzRZRLUfNv/f
         UO9p5j2asIsKYemTxZ6VMR4jqg+DSC9qpcjp2BDFiOlPTI4fvkgKUzVeFuZtsiN+rCES
         fW2Me9igt5b9Bwjo+m8cYL/mRbGeXrSRL7ohP/fvXWWSJrezrAqndDmRqsVPE1X7/Ylw
         iuWA==
X-Forwarded-Encrypted: i=1; AJvYcCVnDnGzfzhhuwjehu2i75dLNKDPxzqBLc7rTrO9z4hE4wFWmm3V6hL+jFDGXG9YMI3dApFIZI645orFag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzmSmfRulljklffMyKSgV+AwzRAac6+Kr9V5lbkrX4NMopO/Fi
	mJ77pO8m34iJrrspP7f+Nut3fi1HeMcZSqaW9YsF+inii/oZQD1d+zkSXa3gcmI=
X-Google-Smtp-Source: AGHT+IHAHjzt4edcj+TAa1QxJwtc9AoYzlGYgtCj4uZZGhnsYdVKDndWfUc1uSZJwqwm96AY9Xla4g==
X-Received: by 2002:a17:902:e74b:b0:202:508c:b598 with SMTP id d9443c01a7336-20b37bcfa36mr234462425ad.59.1727745393080;
        Mon, 30 Sep 2024 18:16:33 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20b37d5edc6sm59922495ad.28.2024.09.30.18.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 18:16:32 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (max31827) Fix spelling errors reported by codespell
Date: Mon, 30 Sep 2024 19:15:17 -0600
Message-ID: <20241001011521.80982-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Below mentioned spelling errors reported by codesepll
were fixed:
	respresents ==> represents
	signifcant ==> significant
	bandwitdh ==> bandwidth

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 Documentation/hwmon/max31827.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31827.rst
index 9c11a9518c67..6cc5088b26b7 100644
--- a/Documentation/hwmon/max31827.rst
+++ b/Documentation/hwmon/max31827.rst
@@ -136,7 +136,7 @@ PEC Support
 
 When reading a register value, the PEC byte is computed and sent by the chip.
 
-PEC on word data transaction respresents a signifcant increase in bandwitdh
+PEC on word data transaction represents a significant increase in bandwidth
 usage (+33% for both write and reads) in normal conditions.
 
 Since this operation implies there will be an extra delay to each
-- 
2.43.0

