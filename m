Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2E61DF25C
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 04:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772599099; cv=none; b=YHNZkrsUUrZ/LGqtdqgESUoSkkwYkxW+ZrNwc9A0AqzPMquJgLtmFxcQH1+5wafkrxHKhSRySSmNi9mK9jZkVYAQJGKMNYBc0d/2Vda+FoC9VVzsolVukxAgKPBWuep9qM+xnnalG09QazO2DSimpWSBdsI0vYCypYAhxWy+RX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772599099; c=relaxed/simple;
	bh=zyQrfEVidkyIVVDKC12XXgv18LC8R5ksHza4aYZTXIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sBsm/m/i9zPVp408uf2jfdzG04xAMqQYEt0UREgujw5uUyXGjYmPgYQ9hPbj6b318e0mGv94//J0bo6pdciUeAFYRBQIH/AqGnB1tsCEKkTvCYlkrdG9TmJfEnRn3xkyJU8RtNMGadVpOP0jfS/8kOWYh0/lhOlu+3g1VXQj+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6KC96rw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6KC96rw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772599096; x=1804135096;
  h=date:from:to:cc:subject:message-id;
  bh=zyQrfEVidkyIVVDKC12XXgv18LC8R5ksHza4aYZTXIQ=;
  b=L6KC96rwQcztFVpN6MjhWtEFVbE23nInmIMniN+ktr/3ERAHVBwHwX14
   Jfmpy6Zh5B0mCLAs1Isko24cYTjBybViSmZ9OjbTEkw8XbbWhaM7x/09y
   YCRl6ghvhCun+15oDFu5gv48v9fYHH7eCywnPGKiwBU2GbI80vAb1BqRf
   0/h9TS+kiS1TadN1CLI4typAgu4xWhutC7ZiOiQ7dW5Qxjqn53dqVf2FX
   oXg222Ql/rOXCvW2NrxuvG00Kqii6DlUvggIIjlB7NFmNJwTDJODoyilG
   fq9eH6y8z2RKDP51jvoCX2vaK27qMrNwDImc3OXTmIlNYLShxflSXzBIX
   A==;
X-CSE-ConnectionGUID: LlmCR218RRChO/bzitKqBg==
X-CSE-MsgGUID: KOEbahMDTb+2kGouT2tlsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73526798"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73526798"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 20:38:15 -0800
X-CSE-ConnectionGUID: msjCZGMoS5WKrgS6WgdHXQ==
X-CSE-MsgGUID: iEczb/OzSnOQugzT6ndaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="256109855"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Mar 2026 20:38:14 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxdzv-000000003G5-1sbH;
	Wed, 04 Mar 2026 04:38:11 +0000
Date: Wed, 04 Mar 2026 12:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 78558965440b27814592ec82d8f3668395953b1b
Message-ID: <202603041253.acNcImcL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 78558965440b27814592ec82d8f3668395953b1b  hwmon: Add LattePanda Sigma EC driver

elapsed time: 1523m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    clang-16
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    clang-16
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon      allmodconfig    gcc-15.2.0
hexagon       allnoconfig    clang-23
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    clang-16
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    clang-19
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390         allmodconfig    clang-19
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    clang-19
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
um           allyesconfig    gcc-15.2.0
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
