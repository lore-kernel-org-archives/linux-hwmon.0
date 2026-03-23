Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5F4414
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 05:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774242157; cv=none; b=myLhazK0fHXD3DgCQ/S+z2FoOT+vk1yY24Hhem50+QDO4J69GG5JY7gonmP3zjcPwrOWJdLxq8AOOBbf3DwLoHkSGyrTunYYlic7SsN0WHl965uHs5lYgAC/kqlcKyjJXzwsuhxjCBqzWX7x/6HmLRUoZBxKMlG7GTX/In6wuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774242157; c=relaxed/simple;
	bh=h9y4onNDxCcYnFQ/avPUiVu+ZZs+1tHp1oqjBlW2pK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M09guK3hGMFO5ayC2bXcdfENppMVOSPqrqN+XkOh1lWJCopNDztCL5Wv2Y/76CENNNi1URRz6SuRhZJC3v6hPkzZC6c1bt0q5lAmGQ7tTR5m5GC5wc7O8W7r8D0rVuq0wr156cAOyjDiOyUP+T/vqhrAsplc/+YQdVMjNEiETO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4SV5nXs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4SV5nXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774242155; x=1805778155;
  h=date:from:to:cc:subject:message-id;
  bh=h9y4onNDxCcYnFQ/avPUiVu+ZZs+1tHp1oqjBlW2pK8=;
  b=I4SV5nXsu4qONeSVvD/BdR8rBjAA3SXZGByOba5DoTovqaDHjXE9JDGG
   R3mX/dFpOZKJWngiR/PkAuXYnqqjVMaFIsSyGxXSV/XChOo6i/ypKmP4o
   LxGg3B4JI/TZ/xtuSOAuX0gatIVwcZA/JfPcYCg5waYdS5V/ZgLlSCK01
   wyXtDW+CnVBLmA/FJml5Kbl7L+H9icirufezuYTFmW8976W8t5BY5HhdU
   hkPguOCZpeP74WQGPMr/jE5eX/XJSpS/kI+ATenmRlj7MroH1+0Ac/814
   1EAWapjOehSwhpUtq/QYqlIDW+8jSzxtlR/ipGuYTr3F3SkxKv+P+BBC+
   w==;
X-CSE-ConnectionGUID: +9/nmBXGR2ul4FtZDL/vAg==
X-CSE-MsgGUID: nDG7lHoOTdGc8F+ZMSW55Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85861048"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="85861048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 22:02:35 -0700
X-CSE-ConnectionGUID: Im9dFLpmSlO8K9zj6AiX2Q==
X-CSE-MsgGUID: kUCJNkF9TiGVK7pQpPYjtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="225656253"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Mar 2026 22:02:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4XQt-0000000002G-25jB;
	Mon, 23 Mar 2026 05:02:31 +0000
Date: Mon, 23 Mar 2026 13:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 cd041796c380961f0e3c04d9627af80131608adc
Message-ID: <202603231300.FqCTlKtl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: cd041796c380961f0e3c04d9627af80131608adc  hwmon: lm75: Add support for label

elapsed time: 725m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                   randconfig-001-20260323    gcc-8.5.0
arc                   randconfig-002-20260323    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260323    clang-23
arm                   randconfig-002-20260323    clang-23
arm                   randconfig-003-20260323    gcc-14.3.0
arm                   randconfig-004-20260323    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260323    gcc-10.5.0
arm64                 randconfig-002-20260323    gcc-11.5.0
arm64                 randconfig-003-20260323    clang-23
arm64                 randconfig-004-20260323    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260323    gcc-11.5.0
csky                  randconfig-002-20260323    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260323    clang-23
hexagon               randconfig-002-20260323    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260323    clang-20
i386        buildonly-randconfig-002-20260323    gcc-14
i386        buildonly-randconfig-003-20260323    clang-20
i386        buildonly-randconfig-004-20260323    clang-20
i386        buildonly-randconfig-005-20260323    clang-20
i386        buildonly-randconfig-006-20260323    gcc-13
i386                  randconfig-011-20260323    clang-20
i386                  randconfig-012-20260323    clang-20
i386                  randconfig-013-20260323    clang-20
i386                  randconfig-014-20260323    gcc-14
i386                  randconfig-015-20260323    clang-20
i386                  randconfig-016-20260323    clang-20
i386                  randconfig-017-20260323    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch             randconfig-001-20260323    clang-18
loongarch             randconfig-002-20260323    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         bigsur_defconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260323    gcc-8.5.0
nios2                 randconfig-002-20260323    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260323    gcc-8.5.0
parisc                randconfig-002-20260323    gcc-13.4.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260323    clang-19
powerpc               randconfig-002-20260323    gcc-13.4.0
powerpc64             randconfig-001-20260323    clang-23
powerpc64             randconfig-002-20260323    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260323    gcc-14.3.0
riscv                 randconfig-002-20260323    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260323    gcc-8.5.0
s390                  randconfig-002-20260323    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260323    gcc-15.2.0
sh                    randconfig-002-20260323    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260323    gcc-8.5.0
sparc                 randconfig-002-20260323    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260323    gcc-8.5.0
sparc64               randconfig-002-20260323    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260323    clang-23
um                    randconfig-002-20260323    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260323    clang-20
x86_64      buildonly-randconfig-002-20260323    clang-20
x86_64      buildonly-randconfig-003-20260323    gcc-14
x86_64      buildonly-randconfig-004-20260323    clang-20
x86_64      buildonly-randconfig-005-20260323    clang-20
x86_64      buildonly-randconfig-006-20260323    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260323    clang-20
x86_64                randconfig-002-20260323    gcc-14
x86_64                randconfig-003-20260323    gcc-14
x86_64                randconfig-004-20260323    clang-20
x86_64                randconfig-005-20260323    gcc-14
x86_64                randconfig-006-20260323    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260323    gcc-13.4.0
xtensa                randconfig-002-20260323    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
