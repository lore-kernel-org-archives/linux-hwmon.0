Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF6319601
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772878604; cv=none; b=D0p0ia3Pkq+r5On78zsgnT+Vbb9sBmvfXq+Xcd7tc3jcITgMTz5bj+anQkYTS9diM3QBngzdWJaesU+q4mRBBM9fp8g5ydgoKRi/fUJ6rs9vQw8WFs/XtMZ1WxLbpB+tR65ypXb8LomyoXRe3AIeSeNJ8HgVs2xHi8hYTC2LGaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772878604; c=relaxed/simple;
	bh=PaHTPdRH54d0vGQ+Vvcf0p1cN8B431oq92z4SoxaZIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgkr/XyALiKTRTSk9oX2rpRk3FS1trq6ovsaZ35hjwpGi07PMszcGBHxV4P1lXWfkowq8qIZjKkhQH1RLkjJD9AbjIS1Jij+hwDqBmz9BkU2e2kGD84PRR5mn6nn1ouUdr6NWAEyuBCOQ7vGGNEs6XFMNbNiM2iUGoFs3oKx3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCODwJCh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCODwJCh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae8979dbb2so5427295ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772878602; x=1773483402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7udhdDJJg/BcoC2pydP3/grXYBwgwq8zw84xlaUjuF0=;
        b=lCODwJChPbs4/0zKUkzlbviAOalXbiGHpjXtIbX3Mi2VbX6YQ3mBKLV1EGpdaZNWtg
         tbh1/Z/NiNw0xqK9XVb2CePFTi9vNllXM0SYdi2/OuxA+nBhNUBLoNvFS+CheH6IkgM+
         lT29hle31wurfYZj6b0V7zsy1w0kV8sgfiGzk1W9zQngNc7cYms5R/fBmUBv26+bBP6O
         uWuY2qO0mterd/TA13WzbPoWtk9QxtHCyNFbsFS68MIZL+fSlMnhxCHT8Qlo2YJ7vzJG
         MdOvMmYruevWn/EFUN2FFgLPMNHJ8B73uJUYGVHrZnSxpwScjsHsKiVCkK6IYvTeiGM4
         m/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772878602; x=1773483402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7udhdDJJg/BcoC2pydP3/grXYBwgwq8zw84xlaUjuF0=;
        b=sReW9P+2ZX9M7MxqAdnIEXk0zDoxVCITvmv4plqVWrxaVhJ4FEMF9fmmRVFVq3V3wY
         q4961o3T8drBGUF0I/CYGAfRJTlesd2Wrv1ixMGN1V05+XxTe5p76V2MiEqhG4WNjIEN
         FvIUIy+V8fNrHlE4SHbuYWRxxs1JpsCAy5zlJ/OQUZhkUJXkZnfLwH/6qjwCzbpuxCby
         tS01U6J3lbB7E9arlEeGhBXShneRq7Sg1zf+E/+jMuAuC9xUuCmJEqLCBSSPJ19EiHp5
         WuT/FHbJqzubKErOYRPjKGIfmO58ghsyYK62OJeKxdz0TL4zxYt3bX6kvmwN1SYBT5PD
         q+nA==
X-Gm-Message-State: AOJu0Yx+HiAX/ncUZHVE1ID+iidGw4KQfHqETeyXKR0nYLD32ucER9d1
	dIWA2nxc8HQ2HjAAHiEc/CWds0S14dY2zNAKPBwj8bXnHY8dHryOPV4a
X-Gm-Gg: ATEYQzxtOZyym757QrhWyotp8iS60qzUcEVu8diZhtXjsBBM/Ei80PnpcF7oGjc3IGC
	Ir80DZu3Z+NL2RMP3uliNrLntxsnJmkPGD/SWSFfsr1w6pZXv5I7vc3phWVITsF6FimyiemQu1Z
	7ylTWlzv7yC9RNQ4fCVmyDFN5dWvXjUUW/uFl2SRvCqv2AxFzgQffIsniQDXfSvOGPwt5j0lFLy
	nmEn0HdnMMIhusng/SnKqNa4lAQShEThqm9BuhkskSk5xR4eYQC9S7+yZA+X2/aNIq95yVFsAbQ
	sWP8OuSbUmcHb46S1DZw8UilkoCez0R+y3xwQMxojQSsknXOOyFPkjHLjOC4feB2ota+83sz0E6
	5YwBrr6PrZZJfAOnCUCK7mKfZLzPU30oiUGIWspKqm3m9J+eRJpsOoDCnb9OSheBPAw51uEG4dY
	e38jrubKMG7xgD7TLCqyICrLg+OwDdeWtohQb5Lewr4zjuZY8ApPEMaASg6tpHpCXXzHrupb14
X-Received: by 2002:a17:902:f70a:b0:2ae:7f4a:8e2e with SMTP id d9443c01a7336-2ae82530c7amr49135405ad.52.1772878602486;
        Sat, 07 Mar 2026 02:16:42 -0800 (PST)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([2401:4900:4e5f:8ac8:a739:6c36:ff08:6f05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b09sm59309005ad.4.2026.03.07.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:16:42 -0800 (PST)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH] hwmon: (ads7871) Fix incorrect error code in voltage_show
Date: Sat,  7 Mar 2026 15:46:32 +0530
Message-ID: <20260307101633.21414-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The voltage_show() function returns -1 when the A/D conversion
fails to complete within the polling loop. -1 maps to -EPERM
(operation not permitted), which does not describe the actual
failure.

Replace this -1 error code with -ETIMEDOUT to better indicate
the timeout condition to userspace.

Note: not runtime tested due to lack of hardware.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
Note: This patch applies on top of my previously submitted patch:
"hwmon: (ads7871) Replace sprintf() with sysfs_emit()"
 
 drivers/hwmon/ads7871.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index b84426c940c5e..4df54c86f786c 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -126,7 +126,7 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 		val = ((val >> 2) * 25000) / 8192;
 		return sysfs_emit(buf, "%d\n", val);
 	} else {
-		return -1;
+		return -ETIMEDOUT;
 	}
 }
 
-- 
2.43.0

