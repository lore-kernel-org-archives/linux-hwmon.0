Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5BB3C65FA
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926977; cv=none; b=TAfEOkykWSuENzPi9iKok+jd314DuD49X8GPcfnqDEVwPgXhDpxNKpu4AHjrxcdkP9aHar45sx3VQrT7RTP5k5iCo6BcO49YKOzXar6+p1V6VFN4wq4zMSs/Vybu32kIIdsOqFA6m6Oab0sh2X0KAUOM9Wlvx48/KULQESoEWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926977; c=relaxed/simple;
	bh=nBH75tqJdlH5fJaQm1Ul+W/17BYxocOQI7tjCZ0eKag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=esZ7+t6fFllhagxuUBQS0oRUymK2z2T/p8jdMk9UTb3UjwrTtWHS5zYumuBeXHCr+fE56aMnlcuda9ho3nBvGEcX9Cl/wniuukfpQoE9oU/4dHHCje15v+aGqEZ4LGuXGsIf1FRXvH80srcIpIqaM/8Oez/a39H97OZtXAo3yrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrIUPdg6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrIUPdg6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso3523355e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773926974; x=1774531774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JnzJWTdi1JRgK6Aqor8y63ze3q1ftzolVwcsUTBbIR4=;
        b=KrIUPdg6ExKewLeEmM6IrfqUJe6F2RUdd3Xjnc+4mpSW5rQ8drjQIwz1r2GqvG/xi7
         M7UQq+miaDL1lO2Goli5JciJq+KiXtLosUOTaC4sTrZQab0oTX6MCB126Yw18qffjqRv
         i1432MZr8pGjVaiyyci7l3qVD1HDGihrZHNVSlaNJAzQSod0j3WiiOZEOESIXRmE0pB7
         UH8InmdMgGxiHGun+d7BCd8aSWKqKcgbrh9ITKiIWji0EkFeeKtXTCw+48Hg6t6olM9i
         KNv/6kHJfuVasNV9O2WTHzHP68LWueIPcyfH1u/ng9N9MYi7wWgc/YQLDg9T7JgdUA+G
         JFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773926974; x=1774531774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnzJWTdi1JRgK6Aqor8y63ze3q1ftzolVwcsUTBbIR4=;
        b=PgJvd+Uch7/TRX4vSIlZfx0+aT4b4z/JLFloEAfOM2uGdrD56QPs0xvNEafh+FVcOj
         9N1dZ6R/yvJ5WRlQSXelbSNcK/u+CYnFmhm0NPwYJcy2KeF/pA4wPwcA9sLP79QsOr/F
         e5MX31hg8cWEdK+QcdmvkV9RaayyHMCKQ4jVTEoRYdtpC8zbIsiAsc9nHu4G5j9I/Jes
         zdpxdBSTIlsTtE5M5gLqAKAO9GynHAe58ZABNIZc8ugzHETtR+TONsZ9Fk4BHLGWXUhH
         ngigpBO9qELc7Y5MuzseGZDRj/dYF3C9V4Vb00FA4OLzxUy6yY39jxz56TxNb5StSj0b
         Xxbw==
X-Gm-Message-State: AOJu0YwDfboUcq4oD053yGTSTvRcKDVnkfxTnBt67SR7UgUWltRtqZ2E
	cZY5SJWKHUIkFgl1guIfjBJXusoPgiLBVMxCZXx1wykcMnzvjaUi0YXf8oKjQo1FeeXGuT7s
X-Gm-Gg: ATEYQzxC1cwnnRf8gSMRjSrvD/SPY4wftRftBHRYY3/aNf5tkM3BvlmmtbIFDeKiPIT
	l8gpV+Cp2hnbUIhn3LKzBlvvrcf6YQTfgD5rdm5TJu8JWcoaCWk2reqzSpDIOAjM+FLfN2DdZOD
	lluNIhp/Tzf+RWHXD+laTf7gLkBcG9rxpuhE+A5uWcVqZ/TVc9rD/tcx4mHOtKGuFd+HH3FI03O
	bxLc1FJCskZA+MlVZ7OObEl8AdZ+aG/lmFmjEdlVMKBlJH2/bcCJeKqGbW8ptEMIuoV9HFEzg7T
	WvzPeF2w7qqklCgqxSLx6s9d1ddMQCh5RUZ0c/ztHBzbIU/1uiGixMbm/sPBKWofZz8SPQy7nZX
	4jF+xP+P591+hpQbiMDIu9JrouBIARQDiCsrImE2OCpeknUeEdQosv1tG9uMv8AkGQ+hwy8W9iR
	tOqUT8W5bFjsUW5krKiTUCQjb5pviPEIlVhGUgHCoHGCEeLHofvQ==
X-Received: by 2002:a05:600c:1f11:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-486f442fa32mr121203915e9.15.1773926974217;
        Thu, 19 Mar 2026 06:29:34 -0700 (PDT)
Received: from sergio-82n7.fritz.box ([2a01:b600:83d8:1:eddb:b262:41cc:374a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b74abdsm70405415e9.5.2026.03.19.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 06:29:33 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: linux-hwmon@vger.kernel.org,
	groeck@gmail.com,
	sergiomelas@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	jdelvare@suse.com
Subject: [PATCH 0/1] 
Date: Thu, 19 Mar 2026 14:29:19 +0100
Message-ID: <20260319132920.275755-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new driver for Lenovo Yoga, Legion, and IdeaPad
laptops that report fan speeds via ACPI.

The driver addresses the "jumpy" and low-resolution RPM data common in
Lenovo Embedded Controllers by implementing a passive First-Order Lag
filter with slew-rate limiting (RLLag).

Technical Validation:
- Verified via physical tachometer and FOPTD (First-Order Plus Time Delay)
  identification to ensure the filter constant (TAU_MS) matches hardware inertia.
- Stress-tested through multiple S3 (Suspend) and S4 (Hibernate) cycles.
- Verified 0.0% memory drift over 4+ hours of active monitoring.
- Compatible with KDE Plasma 6 System Monitor and standard hwmon tools.

The implementation is "passive," calculating filter state transitions 
only upon userspace read requests. This ensures physical model consistency 
without the power overhead of background kernel threads.

Changes since v1:
- Updated MODULE_LICENSE to "GPL".
- Removed background worker/kthread; implemented a passive update strategy.
- Added Documentation/hwmon/yoga_fan.rst.
- Added universal ACPI path probing for up to 8 fans (FANS, FA2S, FAN0).

Sergio Melas (1):
  hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan driver

 Documentation/hwmon/yoga_fan.rst    |  36 +++++
 auto_compile_rust_lenovo_drivers.sh | 196 -----------------------
 drivers/hwmon/Kconfig               |  14 ++
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/yoga_fan.c            | 237 ++++++++++++++++++++++++++++
 5 files changed, 288 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/hwmon/yoga_fan.rst
 delete mode 100755 auto_compile_rust_lenovo_drivers.sh
 create mode 100644 drivers/hwmon/yoga_fan.c

-- 
2.53.0

