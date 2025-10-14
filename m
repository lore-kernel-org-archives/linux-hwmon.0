Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFFF2FFF9D
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455539; cv=none; b=dZ1RxIrogsIEbkCVqPuRQQvsMoPbLxwdSNbFKVxIRlwVd7UnkAopXo5DtwNECVvqZy0PT8Hd+Xtr4rd1Zr9M7K+JiPnYzWUIHpAslJWSRnAH+bITqZsjDJZ/rqDQIxzvw1gK6dSPL56ZzGefJLb1eNYDv39by8sYaqBbXaAUMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455539; c=relaxed/simple;
	bh=SroEJuV+lqD2BdBgsm4mQg1yhanUUK6LwWe4k/e8FLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0Slmw5AYvoa0Tgmwv1jVDqO4ZeFqSRuyrznM0zqyR+XWQ8L6n2bV21qER0ODCcIfAKcRbkKC3BSEeZ6B97ggFSlhDeO4Xj5nivAKYkecVIi2xDapTxY0zI/UgYEccAjn349BwaRwHc24cFxnUvws10BzMJcgfTWUHSHSjs6jfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I98d7GWs; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I98d7GWs"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3381f041d7fso6979202a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455537; x=1761060337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jhUVHUkPVFHNeDrEeenjg0+rsoNV/Un0lVh/Mc2dT8=;
        b=I98d7GWs4B2R0TBpp1kltGDFDTKf75GmISvXYo5S4yKakV0Yoxd691MUWpDjlI3FCs
         Y3x7A6MipuNWEDm0tQGh9inWKkGQsj4ODYa79qPWPckxRoPYPoGggWkmlQprDP5t3b12
         O7McT1HSWCJZ0iqitrPOqNAgbGxRAoYfd2xYAWd7csTeamQYHKvyE+jqpxRst7HkLjR9
         j92JulUXWG1tISG5LQudNBvB218m3+vbSu4ALtBcrT75CK+739JifU6XtNkuy9SNbTuj
         /NltglKHy/KGJMtkk4vno9Avqak1CyoW3h6I4YaDAAnr2vF14HIBWAS1Wi2HcrB3Pwmo
         utdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455537; x=1761060337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jhUVHUkPVFHNeDrEeenjg0+rsoNV/Un0lVh/Mc2dT8=;
        b=fyiLDbektip7OgAlPLWDwWo8UHG2lOn9OTAJd+ELB6vsZQFDQTORfjfFdo9LIvXtyg
         aJwWf7qycl8lYC/t3wrtG5FWrOfdNQ+jKAAzdw5I6AO7aJm2sRayi5kKe1KmMDmLUOZV
         c9LK3Lr3aIn1yRWqmfL9dGDn6lsEPXQs3DB3ycblmmOop0v2uHZ0BJcRI6gD4U20wh3j
         9LgtqrN0Zdz8xqUIN6adV3pt/nxp0scjsOGzjpuRkMEHlgjflvl4ShosMbi425Dvn6Hi
         VS8qgsv0cl3jsqNqnU6ge2Hx08DAAT2bEUUYilFskOzhTvHwNJgPHeSvRc2bkAIl7A6b
         MdYA==
X-Gm-Message-State: AOJu0YyiBrs5qQGRkMzEKM9QitqYw9n6R+XM2/nKS9ixXOO/qN0gOOfn
	my6vB3dmT7vVtQCNLb+h8HkiQj+mjFIapCleLA3CzfuPdq7FGVgxkWQ/q0H+HA==
X-Gm-Gg: ASbGnctyeB9dSyvpzJW0T5hlAj4rh8qUCVSHvJqbpIF52ICYRQlM1MIiZv9jy1bmfPW
	NOE3tlfRRRe0a7zaTPL5JXnxO9b6yXG4Y7z336ap388kqz4Pgi9MiHT4gPebg6Y+sU/vRqMh2Kl
	gdW24cBaLLzSFQIxSZL5j9ODn8oULo4CJNtt9g+Xkz8og48PatvAVtuHBqavcqqZi7B+Gah3T8K
	vTRVBlTG55coVAaK93PmRZMrS51Z7Kswhn1tPZJ/ghRA1gM7M0moB2lszRDwf+eWRQZi2MmZZQJ
	nbfr2shkwe/VsT1ABWMbIanMVtqBUJ9eLhhsji2HWho+B0ZKT4MoGrtVg561yFICS39ylYq7SLY
	VZZsj/kNrm+hM8Gzy5f1yc0ZXOAXLcbmAW7BSzbiVIxgY7IbgHsbK4w==
X-Google-Smtp-Source: AGHT+IGD802XlG4OxXWgnZSvbNq3lA4SyPtoWa02FSyeRwqNy4ckaTozYpt0bVwGAFLbGKS2hndZUA==
X-Received: by 2002:a17:90b:4a86:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-33b51660564mr34661295a91.2.1760455537398;
        Tue, 14 Oct 2025 08:25:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac7cc0sm16046041a91.19.2025.10.14.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/20] hwmon: (tmp103) Drop unnecessary include files
Date: Tue, 14 Oct 2025 08:25:08 -0700
Message-ID: <20251014152515.785203-14-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not perform any locking, does not sleep or check the time,
and does not create sysfs attributes. Drop the unnecessary include files.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp103.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index f271a03e05ae..221bba8a215d 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -14,11 +14,8 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/device.h>
-#include <linux/jiffies.h>
 #include <linux/regmap.h>
 
 #define TMP103_TEMP_REG		0x00
-- 
2.45.2

