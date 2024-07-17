Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2A7E767
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721213349; cv=none; b=IRNWBalRnUY0A7crSQicE1Mt2ctCFTMyhWfQ1t1ye7/nLIO74IDdoCulry5MqRdqRgkz9UZC6UUX+x9CEFpn2ZraJNmj+u8Aw/TcE2cukpNhpNt1JwqkW/ok9x/30cyyJDeo+1xX9yZGz5vZ0L9xWoDiLQlHWaAanbOIcp+BMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721213349; c=relaxed/simple;
	bh=50S1wOz7trTFoo8ikUVPMRvmFbYmJnmjIZnwJJe06oU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uwBpWP+xbsPZs33iSNFc19/ywUKw5Ef6qe2Jj4u2x03zM6ub2jfaerNYLm4vqtW11MGN9bqahy+rG9G7qOCVbxxjZvvznocoYbqtrsiwVxBY+it2sJBZZc2cr57osfR25Ae/Zyqiq0jNMynlj9yekgqAHFxrvd9E81eYLtDL2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idFtZ4Cr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idFtZ4Cr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721213347; x=1752749347;
  h=date:from:to:cc:subject:message-id;
  bh=50S1wOz7trTFoo8ikUVPMRvmFbYmJnmjIZnwJJe06oU=;
  b=idFtZ4CrWowRVkE2BEfKnfJozX+O+vJsej+ZPlrmUxDHLMla7wCWnntw
   a7um8s7/nOz9F0aRWFQ1JoOgWfpHlgwnV+InB+pfiErC3Ajpp6dnHZYwg
   OjlYyYZERWSHb/32Ae/+TNIqKUcl756b+qW3sYZu9v6+4++WF+feUMB/x
   15VIdSBeirEf88TFwLrCRQOVxk8OCMceEAx4QoKHxJb9LPVObO4o0/dWg
   EKamyuDLP0x9QsXaZhgObLwUkXr8WRrBYxfDAWqJBlF1HzH4kS868Iyu3
   d+vkI2XoA2s+xfPizRDhl27ryOThZ10VN6JJDormq1v9XXAPrkO8PU8xF
   Q==;
X-CSE-ConnectionGUID: 7P0gNiFJSAi7+gI936gpTw==
X-CSE-MsgGUID: Akl+AJbWSlWcUtdtoMK4Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="30087377"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="30087377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 03:49:07 -0700
X-CSE-ConnectionGUID: 1ML29PxaSwybxdiCpLfsfQ==
X-CSE-MsgGUID: iycLolFcQqWU+RaeaUuRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50420129"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2024 03:49:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU2DY-000gFa-0u;
	Wed, 17 Jul 2024 10:49:04 +0000
Date: Wed, 17 Jul 2024 18:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 ebca81d515e8c9f5ed00cf414509284b9047ca1a
Message-ID: <202407171816.gHZm3d1P-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: ebca81d515e8c9f5ed00cf414509284b9047ca1a  Merge branch 'hwmon-max1619' into hwmon-staging

elapsed time: 721m

configs tested: 127
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240717   gcc-13.2.0
arc                   randconfig-002-20240717   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240717   gcc-14.1.0
arm                   randconfig-002-20240717   gcc-14.1.0
arm                   randconfig-003-20240717   gcc-14.1.0
arm                   randconfig-004-20240717   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240717   gcc-14.1.0
arm64                 randconfig-002-20240717   clang-19
arm64                 randconfig-003-20240717   clang-16
arm64                 randconfig-004-20240717   clang-19
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240717   gcc-14.1.0
csky                  randconfig-002-20240717   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240717   clang-19
hexagon               randconfig-002-20240717   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240717   clang-18
i386         buildonly-randconfig-002-20240717   gcc-13
i386         buildonly-randconfig-003-20240717   gcc-13
i386         buildonly-randconfig-004-20240717   gcc-13
i386         buildonly-randconfig-005-20240717   gcc-10
i386         buildonly-randconfig-006-20240717   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240717   gcc-8
i386                  randconfig-002-20240717   clang-18
i386                  randconfig-003-20240717   clang-18
i386                  randconfig-004-20240717   gcc-8
i386                  randconfig-005-20240717   gcc-10
i386                  randconfig-006-20240717   gcc-13
i386                  randconfig-011-20240717   gcc-9
i386                  randconfig-012-20240717   gcc-13
i386                  randconfig-013-20240717   clang-18
i386                  randconfig-014-20240717   clang-18
i386                  randconfig-015-20240717   clang-18
i386                  randconfig-016-20240717   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240717   gcc-14.1.0
loongarch             randconfig-002-20240717   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240717   gcc-14.1.0
nios2                 randconfig-002-20240717   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240717   gcc-14.1.0
parisc                randconfig-002-20240717   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240717   clang-19
powerpc               randconfig-002-20240717   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240717   gcc-13
x86_64       buildonly-randconfig-002-20240717   gcc-13
x86_64       buildonly-randconfig-003-20240717   gcc-13
x86_64       buildonly-randconfig-004-20240717   clang-18
x86_64       buildonly-randconfig-005-20240717   clang-18
x86_64       buildonly-randconfig-006-20240717   gcc-13
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240717   gcc-7
x86_64                randconfig-002-20240717   gcc-9
x86_64                randconfig-003-20240717   clang-18
x86_64                randconfig-004-20240717   gcc-9
x86_64                randconfig-005-20240717   clang-18
x86_64                randconfig-006-20240717   gcc-11
x86_64                randconfig-011-20240717   gcc-8
x86_64                randconfig-012-20240717   clang-18
x86_64                randconfig-013-20240717   gcc-12
x86_64                randconfig-014-20240717   gcc-10
x86_64                randconfig-015-20240717   clang-18
x86_64                randconfig-016-20240717   clang-18
x86_64                randconfig-071-20240717   gcc-12
x86_64                randconfig-072-20240717   clang-18
x86_64                randconfig-073-20240717   gcc-10
x86_64                randconfig-074-20240717   gcc-13
x86_64                randconfig-075-20240717   gcc-13
x86_64                randconfig-076-20240717   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
