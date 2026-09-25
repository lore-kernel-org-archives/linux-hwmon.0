Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381F36DA13;
	Fri, 25 Sep 2026 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303007; cv=none; b=Fga8Um6vxPHOmnopseiMAFZac3427hZqgKECF7HCVsIVJTXW9T3TZPG111P/YTGzYXCHtEyVuVnm5uUzC+nHBFBuPD9NBfezBhY2LDTwzzFheEElCA0dzKDqFy7yx+pblC+wdpsRHNfJxqsH/Mr+qBaAja1YC39jfakIPXGB7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303007; c=relaxed/simple;
	bh=VtEYqv8StzxI8EHY5d5PRHTjGj7it+653NEGC4zfMH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvEleTW5Y/v+pulYvg1NjGPiH0BTYMW8XheRiYSpCrs/vsvUvOnJ3Fodf0r96DHbHFa1i/PqpqzjSH8Z5L7gDmfwV67hKxEr/DQTkfkeermhjHvaxy2mvp+JXuTWFUsV2KnCXueq/rytHY9YlBESMzTv/IRQqkja0h1Z2tdTNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROx1uy/y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROx1uy/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790303005; x=1821839005;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=VtEYqv8StzxI8EHY5d5PRHTjGj7it+653NEGC4zfMH4=;
  b=ROx1uy/yz8IV2p0Mm2Huuaq7x5bdO0e8jdX4EegfqIOVXM61xhltjmSn
   22Z5tgv70eJIDaSK6uHTLJtMcV1+Fj39oK6RoPaAgpBk72qJl4UNdMBsl
   z9Ig+tvDXCDTVVpT5ozmkOS8naIAn16nhWfcm6n4X6doAWyFcM7CTitiH
   OvN4BEoHA8semnIzfTrln5/Z+NTOYOxkpwAf1ejk6ESRBWZmJMtoeTKCZ
   yRNOgTJixvoxpl53vNQELVm4bk6AVAhoap5DKEJtThNhQc8jNvZCdAQC+
   chbcXEK34Dem5ZpFfTtc7cs1DENxXSCzN8eMjNzLtdgzRT+Y8DUO2TdKt
   w==;
X-CSE-ConnectionGUID: xcyw8v2KSnOUNEMcSMjBAA==
X-CSE-MsgGUID: j+u7hhCjR5CcRueNoOpzOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90129826"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90129826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:23:00 -0700
X-CSE-ConnectionGUID: /tUD/QVsRMeK4nZ8VWhknQ==
X-CSE-MsgGUID: hiD6AeJxQK2Vs2N+aw3h9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278920525"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:22:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Thu, 24 Sep 2026 19:33:21 -0700
Subject: [PATCH 2/3] hwmon: (coretemp) Read TjMax only when refreshing the
 temperature
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-coretemp-temp-fault-v1-2-1884f0ff97d5@linux.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
In-Reply-To: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 ricardo.neri@intel.com, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790303618; l=1563;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=VtEYqv8StzxI8EHY5d5PRHTjGj7it+653NEGC4zfMH4=;
 b=MvGTPoRTpNL0d11Z0cW/n/Sukqcd6OfzG0XreOdxo6bBOMbF+sL8Fo76tRcvJs7FzuqNe8ezu
 kv74knSSjJ+Cd9rUz00vmWa07BoR5f8KHK/kg8tp5pewOvmGpzu/l6b
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

show_temp() reads TjMax before checking whether the cached temperature is
still fresh, but consumes it only when recomputing that temperature. On a
cache hit the value is discarded.

Discarding it is not free. On CPUs that report TjMax in
MSR_IA32_TEMPERATURE_TARGET, get_tjmax() returns the value it just read
without storing it in tdata->tjmax, so every call reads the MSR again.
That is a cross-CPU call whenever the CPU owning the sensor is not the
current one, and it is made while holding tdata->update_lock.

Read TjMax where it is used. The value cannot go stale in the meantime:
bits 23:16 of MSR_IA32_TEMPERATURE_TARGET are read-only, and the register
is package-scoped, so every CPU of the package reads the same value.

The temperature reported to userspace does not change.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 drivers/hwmon/coretemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index ace51e08e72d..0ab6bbff5637 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -402,9 +402,9 @@ static ssize_t show_temp(struct device *dev,
 
 	mutex_lock(&tdata->update_lock);
 
-	tjmax = get_tjmax(tdata, dev);
 	/* Check whether the time interval has elapsed */
 	if (time_after(jiffies, tdata->last_updated + HZ)) {
+		tjmax = get_tjmax(tdata, dev);
 		rdmsrq_on_cpu(tdata->cpu, tdata->status_reg, &val.q);
 		/*
 		 * Ignore the valid bit. In all observed cases the register

-- 
2.43.0

