Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE313CC7D3
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787162851; cv=none; b=k9U1RhfvUpnv9YUZTm8/loYVTmr6a5decTZZ/enC+Xwasre9Qw/AAGo0viyeU1LBO+g+EUH2KJ9MjBnuK3VrTEp/Cp1yYJIzjrU4n1pBZefITgVCKtvlayL+2duQhvviyWdWZzEAPPQ+tikmef8RElSGhfCz8vTaxUojAhV8+rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787162851; c=relaxed/simple;
	bh=OTlTbVcXqkdSKD7jJhD3kf/5qzS9YQcMZYTQneBnoEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAGydKCJnQrD3CTlN79Phpwv1LvU7itbBQa/XSy4Er4K6rALfB22zibN4Knaptw3YxaFJfa/M5nUicDVClbzdx1S0O3cafreBTEpH8mGozl0poU1O2XuoglZAWF2wO+lqdIoNHgmyLrC3gw0o5d9lnwJm9P9hA/BmKFlouwaVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlaT16HU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlaT16HU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so129309a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787162849; x=1787767649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhlIrfv+eM161qMXgEXnWCveaVPbeG8J2zyXlz3k8mo=;
        b=rlaT16HUaFv/G9r6Dqbfv0l/oSLsGfl5W12zM4D4UfWsLfqZ7j3S2yC1s6sd6XOkiU
         ++GCFx3btGq7Qon3SSeufqrBnUG623b9qoFwZUF4/Hpp0l/XhFyIqCCb2hK+VtDmiihK
         30lhaUuk5JtX7t1IQw+6aYz6G/PDIgf27t3v4HP0+Ch5FUvENZox0aCoEidzAL2vds5K
         z4rsKmsEq9TV4Q9GJM8gLEsa8xnq6Ctx6gYrGa4jsAB+/7TJBj0v5cNyZwoVNT/GTrnz
         vVsJ3nP/pWepo5SIMu1hV3kkgRW0PbQxVX2HH6ibhNMK5zeCy0/SYVQAWbql9MYl+EHq
         QyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787162849; x=1787767649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhlIrfv+eM161qMXgEXnWCveaVPbeG8J2zyXlz3k8mo=;
        b=aDp60sRGKgYheLvCMR8HRHhWXWfw8a8q+vm+FJSSyJvG/hsWa+yaV7ToKAIXACYxlV
         C+iyQksTRu9q30hY1cMCF+wlensfLfm83Jf0NQYj3M248wDfas0gQFmDIbBG4dPs8z0h
         vtxDoS9BEYRSQApjh25Wl24X57iQp1f3dKzXXhNKyQvctbriEUeU+2DKJoftVBJRb5L4
         ik6rFlWMfjoZ9+x+wDQRO9Q2nl27hOi8+D/lhdDoT76pqwftP77S4n9yWDGC9F7i5bKM
         Fy9CkFEk2iYE2frr2tWf/mtAPbfpn/h3HYlmVs2JpGea7ae/caSZD7Zt/2XClHrt+NH6
         tNTQ==
X-Gm-Message-State: AFuF++nCg+I9KIsmRWdS7PXGtHItM/iAkiTQ341eSwROBhXiOSA3oiA7
	dyIbDqsT9TBOK9xYp/zEqqwtdrCvd/Chl2ZtbzoDYHVKMc4h+wCTEuotnKO2Gw==
X-Gm-Gg: AR+sD13mKD0G3eal66r4FvFvFhGrmW7QtJJ70hYpY11btMYyQhrR2q55Gbw2m7lkDeK
	mTp2UeIXmMzkwRS3go2VIPVknakV/vAneIuiHwkb9vyfJuzEg84phaNS3zuft4vu0hNAQaK9swR
	xuG0wcxGXcyOpfldaAB/61Yg/D3iBpbgPI8x+zBomMJ6qey0zNzPa9yevT8gvY3NMbHhSBf7Ayc
	tdp9OjyRnux9viN+AeJVmZ8AC2zzXOpW4mRap6KJap0ioRXH9uO5gHHK18fUQ+d75xyXlQxtkHC
	U1i83XbD0gxfCcTolkjK4hAdWgWpl7i6yfwnlC7O0ZmR7nqTtiMdBz/9jliPlpqw2eHeK6HyIl2
	Sz8mm2ZKyJ1dXUIpeCyVU0Fa7zdUuR6wFXLDSNLDE5u7274342MwPlHLy/L/kZAKbN7HrkNoGpT
	mMKKD0e++qiHIDAsNq3KPUyMph1Rq8DsyxkCH/cjLGCE+NFDjbZm2AEZBd5wdWn3FrrlYnZ7xry
	4WZrVCXwh3d2JuKxA==
X-Received: by 2002:a17:90b:54ce:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-395a06c097bmr1113339a91.17.1787162849188;
        Wed, 19 Aug 2026 11:07:29 -0700 (PDT)
Received: from White.tail445f11.ts.net ([103.195.202.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm15598329c88.6.2026.08.19.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:07:28 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: Victor Duicu <victor.duicu@microchip.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (mcp9982) Propagate one-shot polling errors
Date: Wed, 19 Aug 2026 23:37:01 +0530
Message-ID: <20260819180701.34797-1-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a device is in standby, the driver starts a one-shot conversion and
polls the BUSY flag before reading temperature, alarm, or fault data.
The poll result is currently ignored. Therefore, a timeout or a
status-register read failure can be hidden by a later successful read,
causing stale data to be returned as valid.

Return the polling error before reading the requested attribute.

Fixes: e2fe950f34e5 ("hwmon: add support for MCP998X")
Cc: stable@vger.kernel.org
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 drivers/hwmon/mcp9982.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
index 9e19e2697e25..3918dc36c946 100644
--- a/drivers/hwmon/mcp9982.c
+++ b/drivers/hwmon/mcp9982.c
@@ -395,6 +395,8 @@ static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 at
 					       reg_status, !(reg_status & MCP9982_STATUS_BUSY),
 					       MCP9982_WAKE_UP_TIME_US,
 					       MCP9982_WAKE_UP_TIME_US * 10);
+				if (ret)
+					return ret;
 				break;
 			}
 			break;

base-commit: f7c9176d2326eacae3a87fa3f5214a78c818cc07
-- 
2.43.0

