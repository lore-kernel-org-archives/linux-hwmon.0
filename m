Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451543C3C06
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037244; cv=none; b=L4lTIQs2sgxIbPyx6vpx5wTEuGz/aTCB506C2LqZFRDjFu+3X2C/XsrzNZ9zu+apv4/l8PuqaqP0aax+LwX9fVvT0qa9Y+s5RxKrGOhhCW5lc+8J94m5dv5G10CZsJAC6dnXDuIsHkzUSzrpwyckRA4qbkfFiNohmDlGyJ4WMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037244; c=relaxed/simple;
	bh=VTI8z/cMQEmKslo6nOMXCt0POymUAvI8kLKanHr/sxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9AMIFaTY5nmFRCIq1NhX8YpfFHt07QHpHLaik0zTPvLptLpra2HwDPHUB5D77vkd5WYltBS3UleNa/H/QycKzocIIASfbprdZmt1Tff6MZ9/0JjlwAQiULORwwdxZOlotN0RSSd87SgVAhZ8x8oHJFkAIXaPLbtVK1ymmcxy+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCj4g9S5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCj4g9S5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c20ce3c118aso421716866b.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 14:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788037241; x=1788642041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTtEAN1g/uFwJWiLGZyekTtzG0cryeadf7Yv8zUZKqc=;
        b=MCj4g9S5thBZiUTlxKdeuXgZOQfJgG+L2UM++yjVBp5Vtxf5h+fbw7MOLkGX3Qqd0/
         wbMx0g1RiVvkOO+O7ySSLYcr4mvsRXXQYJt4zo6smz4T+KoRbB01779foeWv1pPJoyta
         gb5AHLBuX9pcrt3YygJvHK1f2GokiH5OW6sW8/VlYsYjM3+Bi3xrH1hfh2EsFRJDmJzu
         +oK9W/rkPhdyMlbZ8i3xnrwVC0liHMJmNPTH32uwRFJBr9k/7I0K38iH1oteDGLx9KVw
         m4P0VjZm7oso9dgzCWBZJeH1Ztrw8K8liE6X5CTljOS2TrKv2SzxeKPkGgC/bl1FRifa
         qQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788037241; x=1788642041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTtEAN1g/uFwJWiLGZyekTtzG0cryeadf7Yv8zUZKqc=;
        b=eR26lul7wSQI/8YA9UpJxg1xNDaSr3/l4RPQmrdnmxoZT2H2xt+K8R6C2bdJ6C8gh0
         xW4z99vnsA7Pw+kPw6GXQpu5ZzdvcuEeAJqE6DAXioI8vL4/kBg+1cfQd3zLszmMpUGG
         SiMRWE78vBJjPpG8OelHFaE2+SfyXNrMzN21kNCSecsnpXSHKtXSicCgkidlpheQez1S
         ZiNqIMJD2OZJijxrCTu5IEO2kqZXBT6V1LFQ24rzeyOTJMq06+N75PMhO/BOxKpTINO5
         WSa/j6554I4E1YiiRb859hLwu4Ui6ueDWxJvmT3nG8x26Cg2FLpyJN7q8YA3z3xj58oj
         dneA==
X-Gm-Message-State: AFuF++kBrweaZNl4owaXyLVh9RPy52rRdOd9h/1qm5Lh/YQOLJRrWz/e
	+bjA5/ZU0WX+HZbJ13osCyy720t0sgyFkRFz8TpVaM7lj8ZHOigNm+t2
X-Gm-Gg: AR+sD113k0LQG/rNDLR34+rm3PaKS8X4l+cdbM9fv6WJsCkUQuPM/ZoE5SR6rYa14Sx
	zszkFAQN/7PgRYrMyNVMQUOaUOCAbrMo6tTbR7pGnFKX1f+hu22N91bAl/rBiKTq+uQ4LHlC9Nk
	MYR745mB3xksOlMtfMG8DNLcHdIcvqYcdgMKhvvmVvc4v6AQJbuJJzcRtM6xmYxcdDMjk6Sc9A/
	agaa6TQgsezDhkW+Bjjznr6GBfhiNOTBSBZ+UYDfXo0z31rQEH5pGpL9im4chOq00eIpfLxuJPk
	ucS3SBivlwsW03ROm1xjertuIkLE8YwnBrL90wNR1/6k6z/3CUgkPAvn6Hepfl5Zx/qU1CAnZn2
	Mt8yQNHQHb1J7MnjL5MUunNSB/86opKmfgqrRHDa8HtjNDzgzod5frwTWHmeOPMmGAbGNhKmR2K
	bFHG6xYwnWm7usD5i9whhIornpGv6vO/f/iwA9K6c+62T23Hs/YqabvYmoqWx4pcwuWFiK55h0q
	74sDpUQjGPNi76i
X-Received: by 2002:a17:907:1b0a:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c256dbefa05mr548729666b.5.1788037241115;
        Sat, 29 Aug 2026 14:00:41 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2822esm230003666b.17.2026.08.29.14.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 14:00:39 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v6 0/3] hwmon: it87: add IT8613E support
Date: Sat, 29 Aug 2026 23:00:33 +0200
Message-ID: <20260829210036.61136-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829170545.33401-1-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a respin of Benoit Masson's v4 series, with his permission.
It replaces my fan-input-only RFC with the broader hardware monitoring
support requested in review.

The v4 series was dropped after a NULL pointer dereference was reported.
The IT8613E device entry did not initialize reg_pwm, while the probe path
unconditionally dereferences it. It also advertised six temperature
offsets but the register table contained only three entries.

Changes in v6:
- Drop the patch exposing additional temperature attributes. The existing
  type register handling only describes temperature inputs 1 to 3, so
  exposing temp4_type through temp6_type would not be safe.
- Remove the unused NUM_TEMP_OFFSET macro.
- Retain the legacy two groups of three temperature sources where
  appropriate, and honor the four global sources on IT8603E and IT8622E.
- Fix the legacy automatic/manual PWM control flow so the manual duty
  cache is not overwritten in automatic mode.
- Do not refresh PWM control state while changing modes. On newer
  controllers, write temperature mappings in both manual and automatic
  modes because the duty cycle uses a separate register. This keeps a
  mapping across cache refreshes and mode changes.
- Clarify that only three IT8613E temperature inputs are currently known.
  The six limit, offset, and PWM map resources do not imply six inputs,
  so FEAT_SIX_TEMP is intentionally not set.

Tested on an IT8613E at 0xa30, revision 12. The complete series builds as
an external module with W=1 and passes checkpatch --strict with no
warnings or errors.

The module exposes fan2_input and PWM2, PWM4, and PWM5 on this system.
The deferred temperature mapping path was tested by switching PWM2 to
manual mode, changing pwm2_auto_channels_temp from 4 to 1, waiting for a
cache refresh, and switching back to automatic mode. The value remained
1 after both the refresh and mode change. The original mapping, duty, and
automatic mode were then restored.

The PWM2 write path was tested by switching from automatic control to
manual full duty (255). Fan2 increased from 2789 RPM to 4821 RPM. The
original duty (65), automatic mode, and temperature mapping were then
restored.

An S3 suspend/resume cycle with an RTC wakeup completed successfully.
The PWM configuration and sensor readings were preserved, with no it87 or
hwmon warnings in the kernel log.

Link: https://lore.kernel.org/linux-hwmon/20260114221210.98071-1-yahoo@perenite.com/
Link: https://lore.kernel.org/linux-hwmon/20260829170545.33401-1-jerome.tollet@gmail.com/

benoit.masson (3):
  hwmon: it87: describe per-chip temperature resources
  hwmon: it87: prepare for extended PWM temp maps
  hwmon: it87: add IT8613E support

 Documentation/hwmon/it87.rst |   8 +
 drivers/hwmon/it87.c         | 418 ++++++++++++++++++++++++++++-------
 2 files changed, 342 insertions(+), 84 deletions(-)


base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.55.0
