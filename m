Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B637431E51
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785439; cv=none; b=OekxnYrtaDXQHnhAQmU1MpzVH7xFqPcRiXSrUjsvhV8FDv2pDVy/KKWQ6u3AuPOb7Igg82oQxV4+L/IuSUk9uGwzuwLw+o2MOIHS0Gu+sVd6LCzeR1/w9MfjgYB44Gd80vgmY5ORdjgm5son+9PSTQ4tw1TtIeyWjqrm7Pi8F+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785439; c=relaxed/simple;
	bh=rE4NtSb8RefNwPqZ9ZPlNF51YGx+BAl9SMDLmbTX4n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f1GaiH5DHxeUncMT7wLwspNBLPlsZFtglLr5+SywS2Qp2giVFNTMMyVTzfxRxcH8g67tcRoypXP7+otkTCN2X8FLjHQ2sUmNA0v6kFrW44qmxYhopSOJFWX5gFD/QzZRyT1gL5c0fFkDFFU8uEvgaxtztdLvEGEgjXHmwiOCp9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFo08uZF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFo08uZF"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb662575d3so2087527a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 12:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785437; x=1786390237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpRT+EhzQzaNzI6fC2iuMmtXR09+7xFpS5XvlJHjRa4=;
        b=NFo08uZFyWC/GhVrf1WJsh9UYjIsBggUCRJdfsQTdN3RMaGnn+AuO+0LF3+wx6nf37
         bzHdxW35y0L19e3+H1UMCP6eFEQMm5VcA2ZdZL1nPCJke/HE8Pd+c7Zh8g6JdJThQJan
         f0W2Jr2Qgt3RhIodhdAqsLOQcWQuE/l1xSfmRixCKfR9EBaDGBZEZzb/fyaMn26zDw24
         vqVmHuS6tZFucBCBRd+8WfhQELk2v3nxK1de1GIUiJ1iK1/lrboHkzfGhSayUb6QHfVL
         +FTJ9OcG2Ita+2TFPldBnoRRu6On5iTsuYXTeYjRrMLOt87Crj6Jb0k6U1aZ2w+raFXp
         VSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785437; x=1786390237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpRT+EhzQzaNzI6fC2iuMmtXR09+7xFpS5XvlJHjRa4=;
        b=aBI5qex3NSPEGweVNT0vWA/KycCeOp7P5HWTT79IhrIOeSP4N7sw++4202yxSGeAWg
         I19M9LJjfBat1D4ECkgvMloWFI0O7Lp/lbzhN7siPHRwDdBZrhq/gEByt3Jte2LAQk4i
         aWmrjayIkh57OORLeT4Yc/QT87U5modMHHEM0Dc57XevwUfnggfuLgMxPYAWgC6L1ayQ
         0rTVLpelx8Nw8v9T96uA1I2wB3fecX2AqLMpdT8Q+rM9+pVZ8YEgQa127NEZEfCg/s24
         DF3IUPv795rUwuZedt0WIvRq71OJOmeQ6pb3U8cVn0mij8LZkCZNNQep8ItSePncnnCU
         aiOA==
X-Gm-Message-State: AOJu0YweChzDd58Nofy/HfYGf9iL2ecEW+WgmVaqa/fWDoyMnvHyZSoM
	B7Uqugi1DleV/4cKiEJ5qP1ZE2d7gJs+HAe4oTsWJ4F6HhOwdj5GUPNoFfelSg==
X-Gm-Gg: AR+sD11kkLnOQylVMx7jncmOsmA8vjQ2W/Bh62jHG4VamQTRjVJlNascjQNqLBR6yAm
	NirMWMPdnS92VcCTBDuMhBG5emoHM9ig75qRTqZVrfg8VAJODL5bWNGz0WdTqpek/VxG1Rs4OGg
	wHD3MM5QOERPiWlgaXOJMo4jc5gdP+Zs6w5bGl9Q8BWtqCY6f6W+ZgRWwYDU6P1yhlaXIgTYzjh
	bFRNnYs8+JUK+iZkrVuND2JUPEHZClitB/Lgkv4jlm6Q+zmF1+OOeFGgyrBE//5yXGlACqwB9KH
	Y/uZ2FzM9lsOAoIw2JTdR0wAeYxufmchLW8Ni9V6o98rOuRdAaSzRoJBiJZqxodv9VRMmAcNUim
	EKL2NROFnX5wdGvlujnkB3UTT4r4v+cOjmx+Udpng6FQtKVG68+i+1+9974WOZcccK5G89Xc6Ev
	VLOFuOfbi+7a6WEoaqJtxCBI6v6xZSScZmgs5LwNsU1mL0MZxM4DXvu2S4COHBy950N9JGK86Sn
	A==
X-Received: by 2002:a17:90b:2dc4:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38fbc3f807cmr10882365a91.4.1785785436347;
        Mon, 03 Aug 2026 12:30:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb349sm226750a91.6.2026.08.03.12.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:30:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus/core) Avoid race condition during probe
Date: Mon,  3 Aug 2026 12:30:33 -0700
Message-ID: <20260803193033.2285332-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmbus_write_smbalert_mask() is not guarded, which can cause race conditions
with concurrent sysfs attribute accesses.

Similar, PMBus accesses in pmbus_init_debugfs() are not guarded, also
resulting in potential race conditions.

Add guards to both functions to prevent the races.

Fixes: 221819ca4c36e ("hwmon: (pmbus/core) Add interrupt support")
Fixes: 1e069dfd96dfe ("hwmon: (pmbus) Add debugfs for status registers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ba3e9e9fc8bc..6991c7f8d125 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3448,6 +3448,8 @@ static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg,
 {
 	int ret;
 
+	guard(pmbus_lock)(client);
+
 	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
 
 	/*
@@ -3700,6 +3702,8 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	if (!entries)
 		return;
 
+	guard(pmbus_lock)(client);
+
 	/*
 	 * Add device-specific entries.
 	 * Please note that the PMBUS standard allows all registers to be
-- 
2.45.2

