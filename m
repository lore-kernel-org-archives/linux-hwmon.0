Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D231D362
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750002; cv=none; b=UIhdCsEbq8+4jJMHUj1+z4PQyIwHjFLes0S699+Ypp4DeifiAnPmQ9mpWOyUMGQ1O/iE2pOQj+sLqVnCJ82CXlTp1/29l0c2nG8dRrnhMc9eFHfaz62J+C0nt+GWk4Wrf/0DmDOv6oNcQDBStuaXK34mT0TFN5g9MWCv6cWRd6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750002; c=relaxed/simple;
	bh=vcBuQYC79OZ2bNOfBHguxsdSVRCJCN5GxTbAtsFkitE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DlX3mnVT7bVfxyvhJ5UfWEkwK4+V+BgcgKF34AKPp5P9Go8VGJkc7oWr7KmLHx7IVJgYpJ+ZxwM285M7xVJKTBWgXjM5SU3dgPsUvE93XeLZ1Tum6APtjpsrTtVGzT+9S1YJ4r5xEJH4tBy+T0nRQ79mXlb5H7qnft68Mfh8OJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1103627a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 23:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783750000; x=1784354800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjSf+Hyul1UNVDbvkbtBR3cbH4pAbaZmRn0hhZdfigs=;
        b=gMCa4HFAHo7u0vR1KlGazeBlk+WlBEwuf/RKl/v1GieGpnWeo02GrMJ+jmr5wi53Kg
         3H90r+efVb3fpnVMizreSlAkpwr8CyMtXBBgKuqCLg4swx+a/cKjRQjMZnE16LtwxNPg
         XLkDmI95SOXaKvcOMj+nbmJvRu0aOvBspunn3CcXwPjr3fUh6kkJoOD22XI3KHjKU3Js
         Wo6FG/yoSNucp7GCnf/LyqP2YedT8FgAJK3XC6fObMUyic9bqSm4RCPazQf3GJWeZo7r
         A2acIooNwfrUGMXJgAq+HMEfzpnvplO6TFOKO5v3mF7AioMbq1ZKxEFmzXDWbUTriDq0
         W80g==
X-Forwarded-Encrypted: i=1; AHgh+RpDAOIEO7dAJSwgTPsZR/TDzg6ZeDw3q3RzsVmV0XIpROy0RjzH7i1e6sVBGC3B8S4+yUMbb1cNK0xvQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoojQN4J6KQo1Qghlv5aCYHi2LFGIuIek3z3/Ap+/xxO0vu1Gc
	QDvN7oq7JAVVTTkwcaPiszdJO9VdH2TxgJ/K/1uLJ2fA8+Yso0JVzG4=
X-Gm-Gg: AfdE7ckXNzLBse8t2E5yNDUJUtZzK3Wlxm9b0sg7efMgjH/O+mXX2dh3lBdlbbfUdZX
	i+CwDTiH6P7Ywe6gYH2CrI2ayeUcrwjD4vjXpqRjrku3Clidy227N3ppvtZpdrRPnf8zXU5tXBH
	zX5VJz66pEKLydwW5h0g7n6PQX0gL+3hy6RfxT1qysQMmXmZwU1zphKi8LdwYOj05HgJ4lpJBPf
	cnMs2XJSMbx/kLz8SZ18+6zmdGjF84FpCFYuKT9/1GDDGdDrqxJP9yUNvtraoaPJeX1dQyxOtXp
	ckDW4fe4gDT/pcXSQPineJf1KGHZlCJz966ErYgSfPsV0wBZ2FJACxYW9Aq11fcsizgpFwNtUS3
	DacuiQ9OMEhf9/aKY+oxRhrtgj1DI4gtKzGE2z6xwSJ5GbclSZ8ha4GLUI5dtub7ApH0znJxVY9
	dLKNsQBh4+XJjuMG6Le81IEqpiftxPslNRRgWBQgfeK+as1v3PyxPe/cg32s1hVw+cmuK7WX5xz
	qXTGb+0o70S7B3JeOSx+RD7BQ==
X-Received: by 2002:a17:90b:1808:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-38dc7a49482mr1855768a91.17.1783750000523;
        Fri, 10 Jul 2026 23:06:40 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm1185307a91.0.2026.07.10.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 23:06:40 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v4 0/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 14:06:33 +0800
Message-Id: <20260711060634.5794-1-fourdollars@debian.org>
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

This is v4 of the patch series converting the applesmc driver from using
the deprecated hwmon_device_register() function to the modern
hwmon_device_register_with_info() API.

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
  locklessly and then calling the underlying raw read_smc/write_smc
  functions directly under the mutex lock.
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

Shih-Yuan Lee (1):
  hwmon: (applesmc) Convert to hwmon_device_register_with_info

 drivers/hwmon/applesmc.c | 467 ++++++++++++++++++++++++++-------------
 1 file changed, 316 insertions(+), 151 deletions(-)

-- 
2.39.5

