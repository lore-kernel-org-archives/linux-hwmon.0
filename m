Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53C29B79B;
	Fri, 25 Sep 2026 02:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303009; cv=none; b=hc7Jrw++Cso0QfZrE6hSQz//DuO4MY6WMIHo/GLELcvkuZ4GfF4ChDQ4kdKTzYsghL+JuQpkUiBrfcFLvynu0dB0L7I2shJCabZEv+pNqxz+sXSd4oN1THgVnzNQOC52xLF2ofC5MGJGHbL4Wf22HpjBxUvfO241z3tKozM2PKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303009; c=relaxed/simple;
	bh=ad0hOBWsAYhOfV9sxRvE2/stI1Ceb6dt6S8BhRvls80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lyqOZnn7JVvZn9Wd8RmARlNuy0qXO4tWDLtMrSkKlMpuQL69lUWt+ocvjwuP37ve6G9aBkZ5MbAib5XXz3Tk4tDlZjA0GFY22ByIgHaR6913+/nSsrct1UwmCloB3NCBGL622LdXl0n/F7rbjMXRd/+9r054eByIGEMriHiuP5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxMKZs83; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxMKZs83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790303007; x=1821839007;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ad0hOBWsAYhOfV9sxRvE2/stI1Ceb6dt6S8BhRvls80=;
  b=LxMKZs83yyhJnKoAgWtwS5fxv7O2b3+A8MTq9ojJSL/zwJfG4ih56Gjy
   V6r4bMPuMAN8m2qyM1ZkaQ1PIR0cyg98g7HeBsoMoTkoMggp6RoNvhy/L
   xiuahEzl7HAPzj5fFSBoJ7dkCzIbnsi+5U2hNQA42Vwk0086QMm32lICj
   Gn0BE+EWkDdXmtHsuTXBSak7Z4ygCwdADGnQXP0l0yGrRWfD8RGDtzDlP
   zvJ5J1N5a+/8K0fyEwYp96EJ5O3vLU6ChVrdPOkzUKqH8AyWRPL/cGcAa
   LoFD8jXsik3V3aeO6yr7RpNGj+CILb08YDcTV3K93SpUYMlUYbSymwFnw
   A==;
X-CSE-ConnectionGUID: YioCec2PQY6+mqX/Fl1BYQ==
X-CSE-MsgGUID: KkJWiPs3TKqFklOEEUNDKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90129824"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90129824"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:22:59 -0700
X-CSE-ConnectionGUID: 7WY3Gf1yT/mnTjhi5/rD0g==
X-CSE-MsgGUID: GSruS8P5TRu6LpqUR41cfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278920521"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:22:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Thu, 24 Sep 2026 19:33:20 -0700
Subject: [PATCH 1/3] hwmon: (coretemp) Refresh the temperature on the first
 read
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-coretemp-temp-fault-v1-1-1884f0ff97d5@linux.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
In-Reply-To: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 ricardo.neri@intel.com, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790303618; l=1749;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=ad0hOBWsAYhOfV9sxRvE2/stI1Ceb6dt6S8BhRvls80=;
 b=v9zMmEFY2/29MWLc1z0EzTWmyJ71gMWxGziV4JUZaUAzohK9TFcy0Ut08KIgPnEoORNZmCdqp
 +rDMlGc3ru/BwhIpD04BnRk9qtvngMVHunXiU6v6PaUYkF9NuEDjoZz
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

show_temp() reads the status MSR only when the cached temperature is
older than one second. Commit 5c0e64dde80f ("hwmon: (coretemp) Remove
obsolete temp_data->valid") dropped the tdata->valid check that used to
force the very first read, leaving that comparison as the only trigger.

A never-updated temp_data carries a zero timestamp, which does not look
stale on 32-bit kernels: jiffies starts 300 seconds short of wrapping,
so the comparison stays false until jiffies wraps and passes HZ. For the
first 301 seconds of uptime temp%d_input reports the zero left by the
allocator rather than the CPU temperature. 64-bit kernels are
unaffected: jiffies starts at a positive value there and does not wrap.

Backdate the timestamp when the temperature data is allocated. One jiffy
older than the caching interval is stale under either word size, and the
first refresh overwrites it.

Fixes: 5c0e64dde80f ("hwmon: (coretemp) Remove obsolete temp_data->valid")
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 drivers/hwmon/coretemp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 5095eb057680..ace51e08e72d 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -511,6 +511,11 @@ init_temp_data(struct platform_data *pdata, unsigned int cpu, int pkg_flag)
 	tdata->cpu = cpu;
 	tdata->cpu_core_id = topology_core_id(cpu);
 	tdata->attr_size = MAX_CORE_ATTRS;
+	/*
+	 * A zero timestamp does not look stale on 32-bit, where jiffies
+	 * starts just short of wrapping. Backdate it instead.
+	 */
+	tdata->last_updated = jiffies - HZ - 1;
 	mutex_init(&tdata->update_lock);
 	return tdata;
 }

-- 
2.43.0

