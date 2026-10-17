Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BBC30EF91
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Oct 2026 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792270361; cv=none; b=rvs5PdMzdgwidp3DBSQxsaGCkHNhVE//fUSo8yGQiJoyKRPRmbk258oj0oKuDQ3UXDk/0ENHfeqpccqC13xeV4hoINouwukm2+NihRvUfqwAK1fvXgeoRNS17rHC3bKAZxMNvbmjh3A5Igs5PSdYsSxXsuDz+ioT3WqJlRpOz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792270361; c=relaxed/simple;
	bh=7bdSjD4gwsCJoWA6QPSigC009vO7jVqQkp3Tp2a7H1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJBZ7tEnm108LpQKCTIfS26CjA/PhaJMB+AwySr/j/xEKRI2ND8wuK9xsbWh6X+E4RbjTYlPGBchWSPikzvL1nYfuv3/SzZdQyCc7Tq/VWbKCjQN0p4SOSGsUxt+8jwJoAs+LeJ0SucSYaHXdNwKb3PyrAEEL4jFo0J+moZ9164=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFMkRKPK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFMkRKPK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so520972a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Oct 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792270359; x=1792875159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CcMWlmXFcivfr2U5My+Uh1aVT0DIK+Y+H5HexutNao=;
        b=KFMkRKPKDXJ9syjceIjBf16YcFraILfhVtyYTjrFSo9aBRUDaU82znIrmK4+kT3Msl
         D4YNeogjBEvowUHOBljnEwCMVMzPuHwBgIBg18g+WWFI7fvsTAn+a5AI7ebvka0lH9DF
         DQ1TjW9Pnu24PoIqbZWGLw2lMUJTHmaCvtu0k783I/axrrHpehMWDr1wyNxEnzVSPZaI
         cx2W9JA1mop1eY9x6IDl1YuDcRvbjGsDdN0XC5MwTS97T50jxvmUyHQIUm3mgJKXWJt+
         Cs4T6SECsaKp2D6u9xMIJlddtA1IJwcMb8EIGGvXgaDFHtq/Ll9Kwu9F9Ej8ZTerrwJu
         /G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792270359; x=1792875159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CcMWlmXFcivfr2U5My+Uh1aVT0DIK+Y+H5HexutNao=;
        b=r6IPwMIlVSvfkDvK1lTPgJG5RLRVSywExRhl+fvc9IQOl8Y0IC6z7OamiT7laNVMnx
         WKvJLPPqyYQdKSCXhb2JXkoM9Fl3Urhni/Mz6YvZxYPhglp4y2dHUmp1BFWsVrPaXIPx
         Ofg5w0fh52X/jJ7sUstdWvSeG/MQPx9+k+z3Qf3hvlZOYvbjP3HvFDGLcvm3/R+MUflw
         gaAz6GHUzq9LRWa48XXJdAAF9PgnJvZXAqfWoSWb/5Rrn2SIdYNEBYe4R2BRTzn9TYOp
         +Ik2+kCeLkP/9SqtOKqyn4zidV2f7sXI9iH8hCcSYFFmZ8hb/cIfhALUFG/Dsli3smup
         Qk7g==
X-Gm-Message-State: AFq9FYJibE4Kz2+s0dhjiU8PdNxGMSmJw1VNZedk8t5wHmrubtRz//hd
	25FegyKdkJbseobA+e2IhpNoqJiHkuewTSkspFAidSFjzqjQBMS/3OO1
X-Gm-Gg: AYBFou38xd8eykialLExmApIRxB8s27gYEn4fndmMz8LsndU7Z9fdwTnTahqjHY8ix0
	vQzCasXPVlaITyQ/xMskOgZGGpEEaK+b8vI/w8Ne/6m+q7U7XSjHyka3jM/j0UyFZEUuydeyZ+B
	qKKpIxg58asUb/8DCYsAhUaucVE2Wp/xDXGShPMkTEWnEaz0Ay6o3uY2o0ZB5y1KcPJmWCpEN35
	ZPBCdQ/pszJJ3tifrrd6kCHREcqoWtmcNtImP3Jacl2dxSbIAuitbRwVVdAxVo+6YnvO/Y/x+Ke
	spdDKmfMGTs6G7LLySO3Bnpnz9NaIsAt3d0aX/WQaaCJCtz4cBtyKb/3h6ZoQ0nZFm1EV2XaJym
	XpSnOOZEQog1suI/yszNeeQG9MH1ixINY+40V4XgN4YQPn+/WbKCEIDxk/iCNJ8hhyr03EWdoEJ
	arCui3g4TW1UMU4UjfwTZjksCNPtfKsEZTmdjPXpLrbyw2sai/IdZdy4Do3fBgDoSznd0dMnbZY
	mV6f5Ahuc4kQQKhWULMxaE9dg==
X-Received: by 2002:a17:90b:2c90:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3acef0fe32cmr2898931a91.45.1792270359012;
        Sat, 17 Oct 2026 13:52:39 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm14288430a91.15.2026.10.17.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 13:52:38 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] hwmon: (sht4x) Reject incomplete heater command transfers
Date: Sun, 18 Oct 2026 05:52:34 +0900
Message-ID: <20261017205234.1084949-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

heater_enable_store() treats a zero return from i2c_master_send() as
success. It updates the heater state and returns count, so another
attempt to enable the heater fails with -EBUSY.

i2c-virtio can return zero when the first message fails. Require
SHT4X_CMD_LEN before updating the heater state, as sht4x_probe()
already does for the reset command.

Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with an emulated I2C adapter under ARM64 QEMU. A zero return
reproduces the false success and -EBUSY on retry; both are fixed by
this change. No physical sensor was tested.

 drivers/hwmon/sht4x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index a97dda9e92dc..c4b3db55de8b 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -287,2 +287,4 @@ static ssize_t heater_enable_store(struct device *dev,
 		return ret;
+	if (ret != SHT4X_CMD_LEN)
+		return -EIO;
 

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

