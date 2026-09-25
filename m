Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54706361954;
	Fri, 25 Sep 2026 02:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303003; cv=none; b=OZG/p3T5tICN1Vevl6Asusb3ddAUrr/kT1ssg3OuiGT53JrTaQMu2dPUHhaFuT+fEFIY6S+zfOSHor3vb5vc2YjMAx0jZkXAAX5q6wgiemacueiHUhSweqIwD51GjKv2CwJZGyPeohL0p9qnL8pLfgCcFYLqK0xyTZjKGK8hhj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303003; c=relaxed/simple;
	bh=ytZxc5/1I9SbRYY+0SqEmamI9cfSWziOLmC6E0EcVDw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ancWXkoSKWzzr4jPVKMr8kLZGN+RJ0DI7vqEHq4+io8BY1zicyed/1i3LvL16XWCnO4ZsQ7OwKXKjREiOzCUnrtN8XENCB69sZLIFo2KiBLWFt2afHDDb9VEDZRxIfsGqMpIalAet6Pu/E7GW2agNVOHthn09CiAnQ5cJhzbIC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kk1jw3MF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kk1jw3MF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790303000; x=1821839000;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ytZxc5/1I9SbRYY+0SqEmamI9cfSWziOLmC6E0EcVDw=;
  b=Kk1jw3MFv5rMCwe38kuWG1kXsqveP7XLxbWVr1sHUctC6Xe6s6eP2Tyg
   n/4VZ5DcSW0EdtDmH7WqqNIUdUAiN8ueiBMEqkQfVP++ua96OkJMxESre
   oZJ1g5oxKU/JaAelN2cqhEMdYmnBZAwsYLCIhqL8scNBZ35ZbWcn7Dwq+
   NcWrUx6uYdUhpOzvVWr2Q4Lpf1m0WmP41UKvuVE5/sIlYK69UaC1gVvgx
   cJtAxgxWBJDoPzCqlPAr2Jpqi48bI6f4AzNQCKfl5nPeAaEMEj/Zgn4Mn
   g0avr4b3/j1TuZzVoiTutmiwgD4tujNKOcAkcQjszrK1gBMgDTz+DPIqV
   Q==;
X-CSE-ConnectionGUID: C8GVmxIiT+2Q7u5MRNH5CQ==
X-CSE-MsgGUID: tMsesHbcSXCHadF0tMzOMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90129821"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90129821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:22:59 -0700
X-CSE-ConnectionGUID: Rgv3Co74QEmdjNno+rY31A==
X-CSE-MsgGUID: w2xcZuzhTo2O9htoVf4Fig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278920518"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:22:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH 0/3] hwmon: (coretemp) Report unreliable temperature
 readings
Date: Thu, 24 Sep 2026 19:33:19 -0700
Message-Id: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDdtWoC/x2MSwqAIBQAryJvnZAm/a4SLcRe9aBUtCIQ7560G
 ZjFTIKIgTDCyBIEfCiSs0VExcDs2m7IaSkOspZt3TeCGxfwwtPzH6u+j4trpYxS3dC0aKCUPuB
 K73+d5pw/pVxAQWUAAAA=
To: Guenter Roeck <linux@roeck-us.net>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 ricardo.neri@intel.com, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790303618; l=2459;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=ytZxc5/1I9SbRYY+0SqEmamI9cfSWziOLmC6E0EcVDw=;
 b=sy752GRzR8UA5w+2iGb3UPypsHbD1VkaQpzABY7Ix+RgEKfX01zDfRp4zkw9F7gauQ4A3MccV
 i+lFwNnmAE6AawFHlwOyMBJPSh676ehGhQZ8F9thL/XDY12x3/sZgA/
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

Hi,

Intel CPUs indicate in IA32_[PACKAGE]_THERM_STATUS whether the digital
thermal readout they expose is valid. coretemp deliberately ignores that
indication, for the reason given in commit bf6ea084ebb5 ("hwmon:
(coretemp) Do not return -EAGAIN for low temperatures"): some CPUs clear
it while the temperature is too low to be measured, and the value reported
in that state is more useful to userspace than an error would be.

The consequence is that userspace cannot distinguish a genuinely low
temperature from one the CPU could not measure. This series exposes the
indication through the standard hwmon temp%d_fault attribute, leaving
temp%d_input exactly as it is.

One user-visible effect is worth mentioning: sensors(1) prints FAULT in
place of the temperature when temp%d_fault reads 1. On a CPU that clears
the valid bit at low temperature, that core stops showing a number in the
default output, although sensors -u and -j still report it, as does
anything that reads temp%d_input from sysfs directly. A driver-custom
attribute name would avoid this, but would be invisible to generic tools.
Reporting the condition through the documented attribute looks like a
better option, but please say if you prefer otherwise.

Patch 1 is pre-work: it fixes an existing bug where, on 32-bit kernels,
the first temperature read is skipped and temp%d_input reports zero for
the first 301 seconds of uptime. Both the bug and the fix were verified
with a 32-bit kernel. It carries a Fixes: tag and does not depend on the
rest of the series.

Patch 2 stops reading TjMax on a cache hit, where the value is discarded.
It is separate so that the behavioral change is not buried in the
restructuring patch 3 does.

Patch 3 adds temp%d_fault.

Thanks and BR,
Ricardo

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Ricardo Neri (3):
      hwmon: (coretemp) Refresh the temperature on the first read
      hwmon: (coretemp) Read TjMax only when refreshing the temperature
      hwmon: (coretemp) Add temp%d_fault sysfs attribute

 Documentation/hwmon/coretemp.rst |  4 +++
 drivers/hwmon/coretemp.c         | 71 +++++++++++++++++++++++++++++-----------
 2 files changed, 55 insertions(+), 20 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260831-coretemp-temp-fault-a44c447936ec

Best regards,
-- 
Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

