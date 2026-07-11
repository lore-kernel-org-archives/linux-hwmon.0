Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F439060A
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762412; cv=none; b=PiJnJEOj7MPHiTlu6PkkIgm6pP3KIc1rcT7v0Q1GS/KGTR4xe4HoGw/EfRqa4LosvRcZroSd0zJIkHb7QHqxCyg3TdOl7AmqwLmGt4JXJR0HO2y5Z2hFu+Ueff4mH1VxqYkIF27yCw/U1yFtfBsLMBeOmVnjaaNMReoxhRptweE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762412; c=relaxed/simple;
	bh=/slVsF3COjGltdPeIj5o6DGpjlLWFU4qAGhkX0U+oMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GsvU2kR0kyBSBLUj0uAPW6kIwsR0l9ClUFUmclN+WCoYybBW/NwASyEuy73mhsfDYyv6QPDwOacsHYwpuxBMRJQYoyue7OyKxbvDXSy1smlgts4CGwGr1LRXdqoXr0TTPxNd2EFZJQOO4TRKeTZTOnWvGbxSJV+X6rsIpk6v258=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so16201325ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 02:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783762410; x=1784367210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwWhKrHO548A3jBr2qhokXm7Ae5vd+VYqqVsY5WxyRU=;
        b=eFLH/MDKywA648wy9jVs3RL7v34T6b3FcYXRsnkDhe/3VcKp06wuGw/fU4CYmuCz8K
         SuB23aDqEBvxhozGkuwbQjq6ArW0sEaa5SejjbYNSyZnoMK4Rg+8tvFChhioFBcP3rJB
         95BS2ccCGu3llpTaL2D/exBauhP8zpXfwZ9OgBFu6aKBfFiM++qn2lM0QHd7mz5NaFxq
         rgu+BnT4FsTIYlddMPxAzRQN22q0i20JWCUEA0sEY/L1Dw6P821IXbgW/DxivN6s4iH0
         EFsa1+GIDbyEoJ+xkZAUxqxYL6LekqdUx4Cl9bDVmSDGXHb3SzR8SA8gQw8A+BzlLXf4
         bPyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmT+30yqTpSxRsU2u189c7PDpxc9C7LaOxpj0lfYEroQy1jvDPVQsMb3g8ttaNPJ7YaHTddsQGYs69jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9e7p5+y4hXRxv2i9CXudF7cOLNlVJhgzl0Ie9UEzIptH5saQB
	9OhI26XBfGJ3Zp3F/BNS2bqwZkOY1EvC+G4c2NtgqIuxm5zTrJzipc8=
X-Gm-Gg: AfdE7cn57qM9r4l7cRZNTxNZ3dpXfaZ2D+0MqvKzFFAPqB6S6Jx42GIKSVVvv7wY6aL
	Uv17e60Jk/7X/rcWofJBdoOaELnqFYvuPHSEkdhzeIdlDVDg5oHqKe1ekzMHYCluFZDmolaLvfH
	Cb4WL5EQIXiYcdOU+EC5moN5HuSucdUH7RgzYXKMtwJ2/7cr9OIxm+jPnp+khZYkJ/8wNaf4peN
	GzF1ucaXJFBx3oqJlMKBcQoIFnKPQjxkHuQaK6W/SVTky9KCR2Aa4favF4x9KoLpsvQwTUsbj6r
	bB1LMWqonEhV1/soPlOm68NPWJCFFS8+PkdF8Dgs62jUigsVY9GLc7ZHHMVYkDFVa+aj6aPfRyf
	kYewtnI83py5hHrlwD4MRvzg3T4KwNMJAsIHH4LNLY9OD3CVZtkaQda6J5SX6HmwmNG9z8y9ULH
	o7H5f2Q6L0r7iY7/9KSVG4H/RIjprX0IysUH1vUYUUQ/mVVeYExhEGlCpU7pwDXt/cuVyYXhGWh
	W1fa1C2WojmBiO6Q+XYsqQLOg==
X-Received: by 2002:a17:903:19ec:b0:2ca:cbfd:7311 with SMTP id d9443c01a7336-2ce9f281721mr25439035ad.46.1783762410006;
        Sat, 11 Jul 2026 02:33:30 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm71389135ad.65.2026.07.11.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:33:29 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v6 0/3] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 17:33:20 +0800
Message-Id: <20260711093323.14529-1-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710123236.10508-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter, Armin, and Henrik,

This is v6 of the patch series converting the applesmc driver from using
the deprecated hwmon_device_register() function to the modern
hwmon_device_register_with_info() API.

Changes in v6:
- Fix HWMON ABI violation for pwmX_enable by mapping manual mode to 1 and
  automatic mode to 2 (instead of 1 and 0), and rejecting invalid values.

Changes in v5:
- Split the refactoring into a 3-patch logical series:
  - Patch 1: Cache fan positions during register initialization (preparatory).
  - Patch 2: Fix a pre-existing concurrency bug in lockless cache validation
             by introducing proper memory barriers (smp_load_acquire and
             smp_store_release) with checkpatch-compliant comments.
  - Patch 3: Convert the driver to the modern HWMON API.
- Address Sashiko AI's findings regarding the lifetime mismatch and teardown
  race condition:
  - Revert the driver from using devm allocations and managed hwmon
    registration.
  - Manually register with unmanaged hwmon_device_register_with_info()
    and manually free structures via applesmc_free_hwmon().
  - Ensure unregistration order is safe: call hwmon_device_unregister()
    at the very beginning of applesmc_exit() to close the sysfs nodes
    prior to freeing the register structures and dynamic memory.

Changes in v4:
- Convert to devres-managed devm_hwmon_device_register_with_info() to fix
  a lifetime Use-After-Free mismatch when the driver is unbound via sysfs
  (releasing devres-managed attributes memory while keeping the hwmon
  sysfs files active).
- Declare hwmon_dev locally in applesmc_init() and remove it from the
  global static variables, and clean up the redundant manual
  hwmon_device_unregister() call in applesmc_exit().

Changes in v3:
- Fix a recursive mutex deadlock in applesmc_hwmon_write() when writing
  to pwmX_enable by using applesmc_get_entry_by_key() to resolve the entry
  locklessly and then calling the underlying raw SMC read/write calls.
- Fix a fallback fan label truncation bug by pre-padding the generated fallback
  string with four spaces so that the "+ 4" pointer arithmetic offset yields the
  correct label "Fan %d".

Changes in v2:
- Abandon the minimal dummy registration approach in v1.
- Fully convert the driver to modern HWMON ABI standards by dynamically
  allocating temp and fan channels at initialization.
- Rename legacy non-standard attributes to comply with the standard HWMON ABI:
  - fanX_output -> fanX_target (HWMON_F_TARGET)
  - fanX_manual -> pwmX_enable (HWMON_PWM_ENABLE)
- Dynamically register the remaining non-standard fanX_safe attributes
  under HWMON class directory via extra_groups.
- Load and cache fan positions in smcreg.fan_positions to support returning
  labels by reference in .read_string.
- Clean up unused static attribute groups and show/store callback functions
  to avoid unused symbol compiler warnings.
- Verified compilation and successfully tested on real MacBook hardware.

We appreciate your review and comments on this refactoring.


Shih-Yuan Lee (3):
  hwmon: (applesmc) Cache fan positions during register initialization
  hwmon: (applesmc) Fix lockless cache validation data race
  hwmon: (applesmc) Convert to hwmon_device_register_with_info

 drivers/hwmon/applesmc.c | 490 +++++++++++++++++++++++++++------------
 1 file changed, 338 insertions(+), 152 deletions(-)

-- 
2.39.5

