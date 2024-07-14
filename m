Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CFFF4FB
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720955834; cv=none; b=nGixU5EKfsq2mSqr4qANfoaFG/DLGOdXiKCtNAl1Qfk6eq8+cfNjgWMAv4ErDFJDj4XDGWKaEXe3o4uqiInDw/XJCvMeRLsCq6BIyKRQIZjq/NfnlVr9EndE4862s0mzexcqsiJ62XKPIs8mgZD8IKen7/04CDRrtw+51qwv5ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720955834; c=relaxed/simple;
	bh=7wrXTdMHz6gKZ8w3RzUETshvCp+bNO0khk1EJOa6O78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DAlysbOaSBT1wTfgk4Cdg1BY3LBuSSUR3+0HnLdtsNKvlTYwLvv5AchyRTKzjwdF4l9ywkpAyTFFvNv7yGoqqypmEkccrD6zgIcjZB5yLk3UJAPJ81URLfs+T114hP2c6fp03Ent+mCUrOzCh2ZyVWz+VZoB/XPnPrLteYhzju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apdU7Yba; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apdU7Yba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720955833; x=1752491833;
  h=date:from:to:cc:subject:message-id;
  bh=7wrXTdMHz6gKZ8w3RzUETshvCp+bNO0khk1EJOa6O78=;
  b=apdU7YbaQ1aDz8a94iduZejI4n6eN7ERIC1SJnIKDsHbLKvamkzaw0UP
   4hVDgkhMohGPqtZ5sbvkIo50qIVRNNvqhpTsbt3/Zb0Zv/XsN8+8WtBei
   oaKMhf8mPGnyHLJnck6yR6X0b4FRmSZS27mUXhRbUZzZxrvGSVt94f3gh
   BaStepTwPJg/LMkosddvExDueoEGwQSgvHxr038kVn3/udyhHEiPKFUbF
   F8TOQWlgTDJCBnavKrNfEHC2HoQObRqCX6+UQfF14o7BW0vrHNj42eGdv
   Mxnci41SNMwVPcbXSRZTjdKeSSGjCCNn65c8KRKJF0f9oeuWxCIwpia3R
   w==;
X-CSE-ConnectionGUID: cp2RbfctS9uIgc1muQ2LsQ==
X-CSE-MsgGUID: dLiC162KR2CdF+PjVVuydg==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18461662"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="18461662"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 04:17:13 -0700
X-CSE-ConnectionGUID: liJMixRbQUS1sccLBePC3Q==
X-CSE-MsgGUID: DRYSG8KISaaCTz20VQMySA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="72572015"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jul 2024 04:17:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSxE4-000dMa-2u;
	Sun, 14 Jul 2024 11:17:08 +0000
Date: Sun, 14 Jul 2024 19:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 84ef07f3f08fbbf41c2c68826d43238f609a6d0e
Message-ID: <202407141954.6QTrAcxU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 84ef07f3f08fbbf41c2c68826d43238f609a6d0e  hwmon: (max6697) Fix swapped temp{1,8} critical alarms

elapsed time: 722m

configs tested: 188
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240714   gcc-13.2.0
arc                   randconfig-002-20240714   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                         lpc32xx_defconfig   gcc-13.2.0
arm                   randconfig-001-20240714   gcc-13.2.0
arm                   randconfig-002-20240714   gcc-13.2.0
arm                   randconfig-003-20240714   gcc-13.2.0
arm                   randconfig-004-20240714   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240714   gcc-13.2.0
arm64                 randconfig-002-20240714   gcc-13.2.0
arm64                 randconfig-003-20240714   gcc-13.2.0
arm64                 randconfig-004-20240714   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240714   gcc-13.2.0
csky                  randconfig-002-20240714   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240714   gcc-13
i386         buildonly-randconfig-002-20240714   clang-18
i386         buildonly-randconfig-002-20240714   gcc-13
i386         buildonly-randconfig-003-20240714   gcc-11
i386         buildonly-randconfig-003-20240714   gcc-13
i386         buildonly-randconfig-004-20240714   clang-18
i386         buildonly-randconfig-004-20240714   gcc-13
i386         buildonly-randconfig-005-20240714   gcc-13
i386         buildonly-randconfig-005-20240714   gcc-9
i386         buildonly-randconfig-006-20240714   clang-18
i386         buildonly-randconfig-006-20240714   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240714   clang-18
i386                  randconfig-001-20240714   gcc-13
i386                  randconfig-002-20240714   clang-18
i386                  randconfig-002-20240714   gcc-13
i386                  randconfig-003-20240714   clang-18
i386                  randconfig-003-20240714   gcc-13
i386                  randconfig-004-20240714   clang-18
i386                  randconfig-004-20240714   gcc-13
i386                  randconfig-005-20240714   clang-18
i386                  randconfig-005-20240714   gcc-13
i386                  randconfig-006-20240714   gcc-13
i386                  randconfig-006-20240714   gcc-7
i386                  randconfig-011-20240714   clang-18
i386                  randconfig-011-20240714   gcc-13
i386                  randconfig-012-20240714   gcc-13
i386                  randconfig-013-20240714   clang-18
i386                  randconfig-013-20240714   gcc-13
i386                  randconfig-014-20240714   gcc-10
i386                  randconfig-014-20240714   gcc-13
i386                  randconfig-015-20240714   gcc-13
i386                  randconfig-016-20240714   clang-18
i386                  randconfig-016-20240714   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240714   gcc-13.2.0
loongarch             randconfig-002-20240714   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                       bvme6000_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                malta_qemu_32r6_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240714   gcc-13.2.0
nios2                 randconfig-002-20240714   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240714   gcc-13.2.0
parisc                randconfig-002-20240714   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   currituck_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240714   gcc-13.2.0
powerpc               randconfig-002-20240714   gcc-13.2.0
powerpc               randconfig-003-20240714   gcc-13.2.0
powerpc64             randconfig-001-20240714   gcc-13.2.0
powerpc64             randconfig-002-20240714   gcc-13.2.0
powerpc64             randconfig-003-20240714   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240714   gcc-13.2.0
riscv                 randconfig-002-20240714   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240714   gcc-13.2.0
s390                  randconfig-002-20240714   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        dreamcast_defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-13.2.0
sh                    randconfig-001-20240714   gcc-13.2.0
sh                    randconfig-002-20240714   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240714   gcc-13.2.0
sparc64               randconfig-002-20240714   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240714   gcc-13.2.0
um                    randconfig-002-20240714   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240714   clang-18
x86_64       buildonly-randconfig-002-20240714   clang-18
x86_64       buildonly-randconfig-003-20240714   clang-18
x86_64       buildonly-randconfig-004-20240714   clang-18
x86_64       buildonly-randconfig-005-20240714   clang-18
x86_64       buildonly-randconfig-006-20240714   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240714   clang-18
x86_64                randconfig-002-20240714   clang-18
x86_64                randconfig-003-20240714   clang-18
x86_64                randconfig-004-20240714   clang-18
x86_64                randconfig-005-20240714   clang-18
x86_64                randconfig-006-20240714   clang-18
x86_64                randconfig-011-20240714   clang-18
x86_64                randconfig-012-20240714   clang-18
x86_64                randconfig-013-20240714   clang-18
x86_64                randconfig-014-20240714   clang-18
x86_64                randconfig-015-20240714   clang-18
x86_64                randconfig-016-20240714   clang-18
x86_64                randconfig-071-20240714   clang-18
x86_64                randconfig-072-20240714   clang-18
x86_64                randconfig-073-20240714   clang-18
x86_64                randconfig-074-20240714   clang-18
x86_64                randconfig-075-20240714   clang-18
x86_64                randconfig-076-20240714   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240714   gcc-13.2.0
xtensa                randconfig-002-20240714   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
