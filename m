Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E92561CA
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Mar 2025 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794479; cv=none; b=P5+gu9RmRJ7L8dJpr5SNAkfwOaUfwULyV2dh684fVt2HpNSb+81Ymeln6yWaZo1kiWkR2R3T+srJshCGM0kPzCvXXoviiRM46M9kj5Cd5L8BNPTC6KzGgbQwW4IOF+JFcUqYjawyQnsKnzhxKbuNWC7XhLESaGkWNWfepQnZ4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794479; c=relaxed/simple;
	bh=Qic5LbA3POI5RfhvdSEdfVa4eXsTLC+HtYdUtyxIAl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S7PRXAmdp54CLft22Ew27gaTLXfAvRz0S5kGVfmmNnfh4S+xaeKeuFFmb7fGLzauFs6cypfBQP3cRMuQYuuFshPVRd1glHaZR/q2XmG+6xoLzohv5C4ZSHKlrUhhKGNVNjsWieTzC0NPqYJ2PqH7/oLasvIxdfnYdranLNmpiA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzX+BAq0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzX+BAq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741794477; x=1773330477;
  h=date:from:to:cc:subject:message-id;
  bh=Qic5LbA3POI5RfhvdSEdfVa4eXsTLC+HtYdUtyxIAl8=;
  b=YzX+BAq0YWsncMGwiN29KtkEvRfRHGIbMNKM50Uuzp8NHmrMNebrRQv+
   sZDsKSL1+LPXtaWNz/75u2CZDjAkkvCcdRQziGHVG5ubkPB/eKyUhtOov
   t9IUPzbrTqeL85QLC6j9fexSh5JIuwrbkrhxoYh+q97XT9qGclnUMLz0k
   P+Bu+9lgLORinC1+08E4ojzRzUATiH08QberDVC/H54rWt/vUP8cDJuww
   Dsw79vUTaae5ZHR5BoMFDfQehI5qhsHHQYqcggY4Ob/l0OvGj/4m+SeLe
   lI5tXdvU9RWKkM2hQlw7PWMpYFoC1O0LtfeG20qSaN75hS/nsx63HhLnW
   w==;
X-CSE-ConnectionGUID: rZ1o0tDmTIGfteIXunFjJA==
X-CSE-MsgGUID: ROkT7orBQAqJM5mD2pF5cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42739895"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="42739895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 08:47:57 -0700
X-CSE-ConnectionGUID: G6C0THOyT9CMPXWpaz11yA==
X-CSE-MsgGUID: ad2lT/yUTq2GTQ/IQ6loMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120691922"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Mar 2025 08:47:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsOJF-0008fm-31;
	Wed, 12 Mar 2025 15:47:53 +0000
Date: Wed, 12 Mar 2025 23:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 dbcfcb239b3b452ef8782842c36fb17dd1b9092f
Message-ID: <202503122308.vCistre9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: dbcfcb239b3b452ef8782842c36fb17dd1b9092f  hwmon: (dell-smm) Increment the number of fans

elapsed time: 1457m

configs tested: 94
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250312    gcc-13.2.0
arc                   randconfig-002-20250312    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250312    clang-19
arm                   randconfig-002-20250312    clang-21
arm                   randconfig-003-20250312    clang-19
arm                   randconfig-004-20250312    clang-21
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250312    clang-21
arm64                 randconfig-002-20250312    gcc-14.2.0
arm64                 randconfig-003-20250312    gcc-14.2.0
arm64                 randconfig-004-20250312    gcc-14.2.0
csky                  randconfig-001-20250312    gcc-14.2.0
csky                  randconfig-002-20250312    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250312    clang-21
hexagon               randconfig-002-20250312    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250312    clang-19
i386        buildonly-randconfig-002-20250312    clang-19
i386        buildonly-randconfig-003-20250312    gcc-12
i386        buildonly-randconfig-004-20250312    gcc-12
i386        buildonly-randconfig-005-20250312    gcc-12
i386        buildonly-randconfig-006-20250312    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250312    gcc-14.2.0
loongarch             randconfig-002-20250312    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250312    gcc-14.2.0
nios2                 randconfig-002-20250312    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250312    gcc-14.2.0
parisc                randconfig-002-20250312    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250312    clang-21
powerpc               randconfig-002-20250312    clang-21
powerpc               randconfig-003-20250312    clang-21
powerpc64             randconfig-001-20250312    clang-17
powerpc64             randconfig-002-20250312    clang-15
powerpc64             randconfig-003-20250312    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250312    clang-21
riscv                 randconfig-002-20250312    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250312    clang-15
s390                  randconfig-002-20250312    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250312    gcc-14.2.0
sh                    randconfig-002-20250312    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250312    gcc-14.2.0
sparc                 randconfig-002-20250312    gcc-14.2.0
sparc64               randconfig-001-20250312    gcc-14.2.0
sparc64               randconfig-002-20250312    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250312    gcc-12
um                    randconfig-002-20250312    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250312    clang-19
x86_64      buildonly-randconfig-002-20250312    clang-19
x86_64      buildonly-randconfig-003-20250312    gcc-12
x86_64      buildonly-randconfig-004-20250312    clang-19
x86_64      buildonly-randconfig-005-20250312    clang-19
x86_64      buildonly-randconfig-006-20250312    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250312    gcc-14.2.0
xtensa                randconfig-002-20250312    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
