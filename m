Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F4B37BE93
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756682; cv=none; b=hQ/l5gUc33lRwkDCmICKRKeJu25FJmR892HZrXnIS/N1OkX6DVbNqNMpUKeXjYwXrz9C3y9U60GbGis50VZG9F6H6R5A77nexYy/Yx/AyYQ4HWaj51r8xGgRqk3tUxkL8rvscRjt98Ekkv4m9O8auKE4pDTb6ZAI4QeiWiZxcdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756682; c=relaxed/simple;
	bh=HbsyOvpG92EK5bZ+vbO6oreezg8KTKKLDJofKBiFN7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fr0x87WHn5fI+jlltl+mU5s+A/vkiuItTgNLXfdnJHHIrDrFaQHpDqPt72lGUxH/Rm+7m8OKThTeMewV1nxycZsuUsZK9ePVUYriUgwp3iAVTpmzgYcKwFEsbo5wYZXfKFn7x+FmsPbzJMh2F/hDFy9KYycAA4Rj1Baqq37ipRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cea3004256so4642485ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783756680; x=1784361480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+FyZ60sn7H+J79M0uoDYHt7yjLqL155wVgQonsMAKc=;
        b=FlMsAxXdM8nPPk51nfwCQdJGTfGmaWahoPV2Bq2GVGFZ9UR3wgKTpbucGybdrxqWZw
         ISAk6xJfLaDLwNCn4FBU4yEIZOt3FxQap+/HR1HDSKYwfxMZdQcX7+fd2J32F09F8Uck
         L9HJqjwvsHFHrFX1KLIaCf8VtzcUIqXEZ436aR7jByfQPpyGpRKHaxWY+MCiL9B5kGGv
         l+lnWFFk7RJYa1mz5ymt2WINgAnYkXYQLwYxhXdqgzoaaqfNVxvi1pHJI0ju33vsZd9h
         1Sy04SyrmfByuBkIZVCeVMc5iPBRzAvwmxddUA1S37hw4iumaI32wxI5JUznN4MJ2gpc
         sPxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXQIZA9DJI72UPjIcQop7OCzE/oa7YC7rDevLE2sCTeI0hQRqONxO9yc/cSedY5eooYDzx4HQUeW37rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFjosO5CZHwrmsHEJvwcKM1nGrbkHOV+DRS4iUFXKGyCZPIQJY
	1xPFIQIBdC4Yb4E5gcV9NuSyhpGWpn7wp/czAjIhWpF+LQLfMEJa1V8=
X-Gm-Gg: AfdE7cl1EavWLuWRJlKx2urbYTii65AQNxKSRf22e4S2uYzyFUtu1z/3pgn0izigUig
	cfL9ZAcy2OQ3Bc48/LnlhrEUGm2ZgY5TweMBSMZbmViRDmcY8DQFmZrTvvJxLbYT1xKR65MlfsJ
	M/9+fZeh+TN/1ox66iRRwroiYGJrXynHwHNudXfUi66Ewpf2ZEyDZUkAcCbhR/YmFVq7vi222ri
	uxHCdibIZ68nyO7IpmyFbcXH8u0Bo2ecIyVr4LYOaT74zEQK0kR1PP8xunEUWrioPlBVZX02ZoC
	JIGf2BeL8gu3tL8ZFShqtyohTja61W+hB64ACqqXvppvoFjG+ZQQHFuZfmBdIfJAM0y9jdrsFwP
	3JbPd8riKOuewnzVDzQ69khcUt/Uo3MD9L7uEXVj1nS1Hng3H9/ccNJ6v1yMXDuIhXrVIiMeDrd
	ZgoK2e0vXWWjfnxX/89fT4dqxNVvx2nwzc1hS1TK8oKidyz2A20YNtXNcRBFCj648+BYF6Ro70m
	XWYPSnCkENIFcprNChAuLV7dA==
X-Received: by 2002:a17:903:32c2:b0:2cc:9179:32e with SMTP id d9443c01a7336-2ce9e79fda6mr25363975ad.10.1783756680239;
        Sat, 11 Jul 2026 00:58:00 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm71130285ad.45.2026.07.11.00.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:57:59 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v5 0/3] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 15:57:51 +0800
Message-Id: <20260711075754.11358-1-fourdollars@debian.org>
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

This is v5 of the patch series converting the applesmc driver from using
the deprecated hwmon_device_register() function to the modern
hwmon_device_register_with_info() API.

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

