Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0E3C5550
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285939; cv=none; b=FuUh1VILxTxSBivufnNga1AWIJlNJaIAnZ+UbRpo33xNIWQx1fKb7zPf1q7Z6DgQoDySPvg1tZghtCDkBhiyRLfvQzNRhbuxVdzM3zt2Ob3b2+euQZhdEXocZkUwRM9i5lBr0PRu9JAOytk1pLKf0vjV4UwPpUCd78zKIPKS0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285939; c=relaxed/simple;
	bh=vXn6H8TBs+Dlh6yYJcHRBt1TqtfJUWd5I8lFSBni+Uk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dyRyeu8eaqLySmHpBsfvBsPqVg30xxfPY+fNP+X4/g8tkXnkSOfNd70/BhTLb8RozOXoUMn4xLsEcidUtmVRY0oYGXCKbH4QNjTBfOU06wy997HBKczVJQtufcxPPoSaKXvVy8g0cpODhzfJ6Lo+VENf0SiAJ/mN65BfSrywDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4kTeJwY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4kTeJwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774285939; x=1805821939;
  h=date:from:to:cc:subject:message-id;
  bh=vXn6H8TBs+Dlh6yYJcHRBt1TqtfJUWd5I8lFSBni+Uk=;
  b=A4kTeJwYDGEiVswIP2c8JGCQ4TjRNBLmAIY+wPZJhVDTRuN6xFlR36x0
   +CGD29egnzcPS2jCikVyroAOiYcE/E5JZvyV6neXnE2e02JB38Nqy2GjO
   PcF8gfL9AF3C7z+NtCzuHdxRiMKcIpkdXy8zuSRbZhr8cNyNvZ2YthdQa
   UgjYD2EosyX/fsIFcFeRqQW1KyybIDUkF7fgGj+nu2rBRhPBlaJj+nigi
   mKrrybP0EwsCkoGgl/AtFEhNIXgaHH2fH//Tb0TV5JfejLgGIH0ZJ22Zv
   /Ekx6yZmTKLMhuKI1DuEF3SzE/2Jh9DzCP34uxwXRih9aJU5i9E32jtMg
   g==;
X-CSE-ConnectionGUID: fLsOPWqjSteueodCE8+wdA==
X-CSE-MsgGUID: M2VmuQ4mR6mjipyNI3qAWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75173180"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75173180"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 10:12:18 -0700
X-CSE-ConnectionGUID: HFxlMf8CRGi/wWciE+ae1g==
X-CSE-MsgGUID: nVncQ5W5S4KkpkN7WPOg2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="221250569"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2026 10:12:16 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4ip3-000000002mv-2UyA;
	Mon, 23 Mar 2026 17:12:13 +0000
Date: Tue, 24 Mar 2026 01:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 19c8b6155d143f768d17dd664fdfda846bf6ca14
Message-ID: <202603240132.RFvfguo9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 19c8b6155d143f768d17dd664fdfda846bf6ca14  hwmon: (peci/cputemp) Fix off-by-one in cputemp_is_visible()

elapsed time: 756m

configs tested: 194
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260323    gcc-8.5.0
arc                   randconfig-002-20260323    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260323    gcc-8.5.0
arm                   randconfig-002-20260323    gcc-8.5.0
arm                   randconfig-003-20260323    gcc-8.5.0
arm                   randconfig-004-20260323    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260323    gcc-10.5.0
arm64                 randconfig-002-20260323    gcc-10.5.0
arm64                 randconfig-003-20260323    gcc-10.5.0
arm64                 randconfig-004-20260323    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260323    gcc-10.5.0
csky                  randconfig-002-20260323    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260323    clang-23
hexagon               randconfig-001-20260323    gcc-8.5.0
hexagon               randconfig-002-20260323    clang-17
hexagon               randconfig-002-20260323    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260323    clang-20
i386        buildonly-randconfig-002-20260323    clang-20
i386        buildonly-randconfig-003-20260323    clang-20
i386        buildonly-randconfig-004-20260323    clang-20
i386        buildonly-randconfig-005-20260323    clang-20
i386        buildonly-randconfig-006-20260323    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260323    clang-20
i386                  randconfig-002-20260323    clang-20
i386                  randconfig-003-20260323    clang-20
i386                  randconfig-004-20260323    clang-20
i386                  randconfig-005-20260323    clang-20
i386                  randconfig-006-20260323    clang-20
i386                  randconfig-007-20260323    clang-20
i386                  randconfig-011-20260323    clang-20
i386                  randconfig-012-20260323    clang-20
i386                  randconfig-013-20260323    clang-20
i386                  randconfig-014-20260323    clang-20
i386                  randconfig-015-20260323    clang-20
i386                  randconfig-016-20260323    clang-20
i386                  randconfig-017-20260323    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260323    clang-18
loongarch             randconfig-001-20260323    gcc-8.5.0
loongarch             randconfig-002-20260323    clang-23
loongarch             randconfig-002-20260323    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          rb532_defconfig    clang-18
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260323    gcc-8.5.0
nios2                 randconfig-002-20260323    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260323    gcc-13.4.0
parisc                randconfig-002-20260323    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    clang-23
powerpc               randconfig-001-20260323    gcc-13.4.0
powerpc               randconfig-002-20260323    gcc-13.4.0
powerpc                     stx_gp3_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260323    gcc-13.4.0
powerpc64             randconfig-002-20260323    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          rsk7201_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260323    clang-23
sparc                 randconfig-002-20260323    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260323    clang-23
sparc64               randconfig-002-20260323    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260323    clang-23
um                    randconfig-002-20260323    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260323    clang-20
x86_64      buildonly-randconfig-002-20260323    clang-20
x86_64      buildonly-randconfig-003-20260323    clang-20
x86_64      buildonly-randconfig-003-20260323    gcc-14
x86_64      buildonly-randconfig-004-20260323    clang-20
x86_64      buildonly-randconfig-005-20260323    clang-20
x86_64      buildonly-randconfig-006-20260323    clang-20
x86_64      buildonly-randconfig-006-20260323    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260323    clang-20
x86_64                randconfig-002-20260323    clang-20
x86_64                randconfig-003-20260323    clang-20
x86_64                randconfig-004-20260323    clang-20
x86_64                randconfig-005-20260323    clang-20
x86_64                randconfig-006-20260323    clang-20
x86_64                randconfig-011-20260323    clang-20
x86_64                randconfig-012-20260323    clang-20
x86_64                randconfig-013-20260323    clang-20
x86_64                randconfig-014-20260323    clang-20
x86_64                randconfig-015-20260323    clang-20
x86_64                randconfig-016-20260323    clang-20
x86_64                randconfig-071-20260323    gcc-13
x86_64                randconfig-072-20260323    gcc-13
x86_64                randconfig-073-20260323    gcc-13
x86_64                randconfig-074-20260323    gcc-13
x86_64                randconfig-075-20260323    gcc-13
x86_64                randconfig-076-20260323    gcc-13
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260323    clang-23
xtensa                randconfig-002-20260323    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
