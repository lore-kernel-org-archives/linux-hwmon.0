Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3374190692
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Oct 2024 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104907; cv=none; b=mA9nO62Jo7WrcnrK4tdpZT2PjpedXXuZhSrOlcZ60C1mu6xn4TQidgHG++tTFa2g8I4g8NKbxIaW2MBo/PQ8DP1/IbuAiVxx28x8r8LtnUZWq34SIezSOGS3noWA+Jd6XRWMLVInChAm+xuUH2L5xkncb+6dj8Di47H2FjCiRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104907; c=relaxed/simple;
	bh=R919hcESRoMVCnk+FDiXmFKBm/V+o/Gl1HjKteDFH4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUMd4HbEIJkBSRF5RsXCiFfXHk1SI7gevg9MDG91299at0z4U9VeGmt27vFKIFwx8t391fP8G0xe1JuHtQSYUQKKpBEPPDZQ6Uw9cpC8GLtcMAe/EC6Wwgy/VQ73Vt4JAb94yjg3ekQQ1R5/Mq4lEN0iyW4iOeqe2HW4YYJPMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUak3lpq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUak3lpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730104905; x=1761640905;
  h=date:from:to:cc:subject:message-id;
  bh=R919hcESRoMVCnk+FDiXmFKBm/V+o/Gl1HjKteDFH4c=;
  b=mUak3lpqMOjp3pTDk1QebIBM/JEcCLXUZt50FL/bJUxkt8SIOr/PqTMp
   LaU+Y0vMISyF/T3g91z0kViYYpqRGH6frCUh1cFKB6IZ2AIvVhfPI2RA0
   A/TkpSPwaVwtlJtE6etXZOIcSiORZzlH8kL1LWoaIYtfa3MniKpCnDoQ4
   E3LAkfUY1LztnYmqZu8Kk+e/K0nGr9OCdrVZ92k2CXCqOy2rLxsOJyVc6
   20gew43FacDmAA4946QhTZSQ6z6eUDxfO+AnqPyiF+WPX4gRqoNQsQptO
   WLUzAQVFC/1udlMo79CYXq1g0s6eXzUGC/X6b/DYNezjbvCGbOLLlXYzn
   A==;
X-CSE-ConnectionGUID: IPo/gXM3REOpIBcZw28fkQ==
X-CSE-MsgGUID: QuhDwj0eTBuM8CnSycDqBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29653823"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29653823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 01:41:44 -0700
X-CSE-ConnectionGUID: B5BwBnjSQRG9Mi1xtYALDQ==
X-CSE-MsgGUID: lVU+rgJpSRmrCvJk9VBHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81652957"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2024 01:41:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5LJl-000cDM-02;
	Mon, 28 Oct 2024 08:41:41 +0000
Date: Mon, 28 Oct 2024 16:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 a5b94a7500c9d45a64b921b757f32872a56a9003
Message-ID: <202410281640.7JYQuKZv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: a5b94a7500c9d45a64b921b757f32872a56a9003  Merge branch 'fixes-v6.12' into testing

elapsed time: 724m

configs tested: 132
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                           tb10x_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ep93xx_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                             alldefconfig    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241028    gcc-12
i386        buildonly-randconfig-002-20241028    clang-19
i386        buildonly-randconfig-003-20241028    clang-19
i386        buildonly-randconfig-004-20241028    clang-19
i386        buildonly-randconfig-005-20241028    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    clang-20
m68k                        m5407c3_defconfig    clang-20
m68k                            q40_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    clang-20
mips                        bcm63xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    clang-20
sh                            migor_defconfig    clang-20
sh                          rsk7264_defconfig    clang-20
sh                          sdk7780_defconfig    clang-20
sh                           se7343_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241028    gcc-12
x86_64      buildonly-randconfig-002-20241028    gcc-12
x86_64      buildonly-randconfig-003-20241028    gcc-12
x86_64      buildonly-randconfig-004-20241028    gcc-12
x86_64      buildonly-randconfig-005-20241028    gcc-12
x86_64      buildonly-randconfig-006-20241028    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241028    gcc-12
x86_64                randconfig-002-20241028    gcc-12
x86_64                randconfig-003-20241028    gcc-12
x86_64                randconfig-004-20241028    gcc-12
x86_64                randconfig-005-20241028    gcc-12
x86_64                randconfig-006-20241028    gcc-12
x86_64                randconfig-011-20241028    gcc-12
x86_64                randconfig-012-20241028    gcc-12
x86_64                randconfig-013-20241028    gcc-12
x86_64                randconfig-014-20241028    gcc-12
x86_64                randconfig-015-20241028    gcc-12
x86_64                randconfig-016-20241028    gcc-12
x86_64                randconfig-071-20241028    gcc-12
x86_64                randconfig-072-20241028    gcc-12
x86_64                randconfig-073-20241028    gcc-12
x86_64                randconfig-074-20241028    gcc-12
x86_64                randconfig-075-20241028    gcc-12
x86_64                randconfig-076-20241028    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
