Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C25C13957E
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Nov 2025 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764446433; cv=none; b=SsrRrV6RluAWBr11Xq9U2rIuhac1P/v+32zH6qLhb/8T/83pxeS89gMMrzZNiPgBigYmjgktaeplte72Tue8PIKlTHTggZmHbPlitCqjbryJEZgAq78GBz7TyvsbPaNbMN9wZCtnPY0lqR6NCMRSiYTVPjpf38c8dnwkq9J5Hsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764446433; c=relaxed/simple;
	bh=Q1A0RyA+vMqEioHbWIrmLjm/2+XnrfSEAaTbMkOgtQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lLznK7uebuRohNNsW5bSxBVL6rCXiUxIxYy5z1ULvwtA0CBLpBqOuXxWQeQm6d0SeqttjtSjqraAR1MD18q+Uhwa7gVuuZmnDAddgkGreARKtZ/w8sm8cI/i1b6bzdHuEgtjnWQEyCBCsV9HmOqAh6BqbGoEvF1svC7P30BrjvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlBtbWVT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlBtbWVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764446431; x=1795982431;
  h=date:from:to:cc:subject:message-id;
  bh=Q1A0RyA+vMqEioHbWIrmLjm/2+XnrfSEAaTbMkOgtQ0=;
  b=nlBtbWVTREXGn4aic6tqikoqSB4CU3G9+ViMY7RMq3J2RfjKUW0/5Ggo
   Uj3uQYrnJNtUCBVNaq6O55MrCedvYLR0JYoSo383+J7Ja2UMkSaWSvVwY
   KdQRIMSlc7lmT5gqpsJXUhOoHA7SrooRRhlofCILv2i7x5K+UCddu4Tgb
   +EpSslNaHGMh0+jpaBM2peYm+Lqh5B4oPRae0U/P+8pN2jZnlBvBTLzZs
   b7CRElXc2hMXf/0d+j6bquWnxh1pLfohgwfKo35lfrK11sfe/bGzV8wdT
   G1NAnYB2uK6x8Cie6rNjjTryl0xvMr90ZLUrnRdNswO4t0FktZ2HnqGpb
   A==;
X-CSE-ConnectionGUID: yrbsd3ABQ2SJLkW74MXDDg==
X-CSE-MsgGUID: 2Jm87rFuRn6RtF5/zDhf3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="65614822"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="65614822"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 12:00:30 -0800
X-CSE-ConnectionGUID: fitNQtX+SamGf2SDIx8n7A==
X-CSE-MsgGUID: 0eb+XjEzTDmn+UITKdqIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="198828357"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Nov 2025 12:00:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPR7K-000000007Xh-4BiR;
	Sat, 29 Nov 2025 20:00:26 +0000
Date: Sun, 30 Nov 2025 04:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 c9359cd3e28faa6f3350e94476eff699c987461c
Message-ID: <202511300412.bxdY3RwN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: c9359cd3e28faa6f3350e94476eff699c987461c  Merge branch 'hwmon-lock' into hwmon-staging

elapsed time: 1593m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251129    gcc-8.5.0
arc                   randconfig-002-20251129    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251129    clang-20
arm                   randconfig-002-20251129    gcc-10.5.0
arm                   randconfig-003-20251129    gcc-13.4.0
arm                   randconfig-004-20251129    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251129    clang-22
arm64                 randconfig-002-20251129    clang-22
arm64                 randconfig-003-20251129    gcc-8.5.0
arm64                 randconfig-004-20251129    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251129    gcc-15.1.0
csky                  randconfig-002-20251129    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251129    clang-22
hexagon               randconfig-002-20251129    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251130    gcc-14
i386        buildonly-randconfig-002-20251130    gcc-14
i386        buildonly-randconfig-003-20251130    gcc-14
i386        buildonly-randconfig-004-20251130    gcc-14
i386        buildonly-randconfig-005-20251130    gcc-14
i386        buildonly-randconfig-006-20251130    clang-20
i386                  randconfig-001-20251129    gcc-14
i386                  randconfig-002-20251129    gcc-12
i386                  randconfig-003-20251129    clang-20
i386                  randconfig-004-20251129    gcc-14
i386                  randconfig-005-20251129    clang-20
i386                  randconfig-006-20251129    clang-20
i386                  randconfig-007-20251129    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251129    gcc-15.1.0
loongarch             randconfig-002-20251129    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251129    gcc-11.5.0
nios2                 randconfig-002-20251129    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251129    gcc-10.5.0
parisc                randconfig-002-20251129    gcc-13.4.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251129    gcc-8.5.0
powerpc               randconfig-002-20251129    clang-22
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251129    gcc-8.5.0
powerpc64             randconfig-002-20251129    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-002-20251130    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251130    clang-22
s390                  randconfig-002-20251130    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251130    gcc-14.3.0
sh                    randconfig-002-20251130    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251129    gcc-8.5.0
sparc                 randconfig-002-20251129    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251129    gcc-8.5.0
sparc64               randconfig-002-20251129    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251129    clang-22
um                    randconfig-002-20251129    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251129    gcc-14
x86_64      buildonly-randconfig-002-20251129    clang-20
x86_64      buildonly-randconfig-003-20251129    clang-20
x86_64      buildonly-randconfig-004-20251129    gcc-14
x86_64      buildonly-randconfig-005-20251129    gcc-14
x86_64      buildonly-randconfig-006-20251129    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251129    gcc-14
x86_64                randconfig-072-20251129    clang-20
x86_64                randconfig-073-20251129    gcc-14
x86_64                randconfig-074-20251129    gcc-12
x86_64                randconfig-075-20251129    gcc-14
x86_64                randconfig-076-20251129    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251129    gcc-10.5.0
xtensa                randconfig-002-20251129    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
