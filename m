Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7BA214A97
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 16:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769962439; cv=none; b=ktVaL1tZFxbecXqBkFnGcx/xP9HDqga2cmFb0JaCmuvXwRj3h40rpF95uQ5zM39wJFPkVp0S9p7KcFtDBudn14VEnyzRcxPAx40CF9SLB1UOuN+dhEprF+GAf1Bewc1APwjvi7BuoP+kVFCp8+R/i2W483NfBjtSReiz6H0Lb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769962439; c=relaxed/simple;
	bh=kpAMnm3n8NbBZYep6d5NIs/1HkgH1L1WoanpUaDacoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FLL0oEfL1U+dD8lY3hxwCeJbITpVVKFIRfZsSbLqTAQ+d+g29bk/aozc2xM7aoDRuMN8meu7UEDI04TKJr0UoWPZ2F2+ShT0nG8CRzCG7yFgZsnI5lfbrJbsqAeNYyxhTQ5TjI45ZcU7wAjpiXOCGXZVRcI2Xgv91p+2qDf2JEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKss+We8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKss+We8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769962438; x=1801498438;
  h=date:from:to:cc:subject:message-id;
  bh=kpAMnm3n8NbBZYep6d5NIs/1HkgH1L1WoanpUaDacoo=;
  b=gKss+We8OyRWMMRnd79vXGuh7ndvm84YJJD8nGT5oWrQ0YI2QbJ7loTo
   HJrhvjeeFKYrwtVygnXOiZ1n9hQyPTcxCafIqM143mYCrx1VKLw/wWxP6
   ZA0avhIRQn8UeO8REJQzEtxfagIP5Nbv9JFQMUfm91/aJv5yWIG1ebBQt
   9OShsvDnayuAxcMctFTZl3q+hJHNJPj8Z+NpvNUT3uPGIF4/EKHAbHWYN
   kyhpbvoe0lqOPXn/6SDUxhr2oBs/fR0OgciqbBCxvlIgA+oUWalAD6Ub3
   /b9bDWXgNQoNW6kNAbcHLMe591h1e2KtDDevoJFOGJT8gJWilv1l2f0fu
   Q==;
X-CSE-ConnectionGUID: T1Kux4StS6uUHHqXO4ewAA==
X-CSE-MsgGUID: ugmRad0jQ+qaTbi7VCb5fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="88716828"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="88716828"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 08:13:57 -0800
X-CSE-ConnectionGUID: uzG+6U1UQ1eDdlK7HXv8Wg==
X-CSE-MsgGUID: L2BDXw2ORe23k5J7IiWyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="246907574"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Feb 2026 08:13:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vma5B-00000000eqe-0Js2;
	Sun, 01 Feb 2026 16:13:53 +0000
Date: Mon, 02 Feb 2026 00:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 676f2cc2c7da7b5d5dcc6fc249bf005647c0abbd
Message-ID: <202602020047.3fgGfzD9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 676f2cc2c7da7b5d5dcc6fc249bf005647c0abbd  hwmon: (spd5118) Explicitly enable temperature sensor in probe function

elapsed time: 847m

configs tested: 264
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260201    gcc-10.5.0
arc                   randconfig-001-20260201    gcc-14.3.0
arc                   randconfig-002-20260201    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    clang-22
arm                        mvebu_v5_defconfig    clang-22
arm                        neponset_defconfig    gcc-15.2.0
arm                   randconfig-001-20260201    gcc-10.5.0
arm                   randconfig-001-20260201    gcc-8.5.0
arm                   randconfig-002-20260201    clang-22
arm                   randconfig-002-20260201    gcc-10.5.0
arm                   randconfig-003-20260201    gcc-10.5.0
arm                   randconfig-003-20260201    gcc-8.5.0
arm                   randconfig-004-20260201    clang-22
arm                   randconfig-004-20260201    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260201    gcc-13.4.0
arm64                 randconfig-001-20260201    gcc-15.2.0
arm64                 randconfig-002-20260201    clang-20
arm64                 randconfig-002-20260201    gcc-15.2.0
arm64                 randconfig-003-20260201    gcc-15.2.0
arm64                 randconfig-003-20260201    gcc-8.5.0
arm64                 randconfig-004-20260201    gcc-12.5.0
arm64                 randconfig-004-20260201    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260201    gcc-11.5.0
csky                  randconfig-001-20260201    gcc-15.2.0
csky                  randconfig-002-20260201    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260201    clang-22
hexagon               randconfig-001-20260201    gcc-15.2.0
hexagon               randconfig-002-20260201    clang-22
hexagon               randconfig-002-20260201    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260201    clang-20
i386        buildonly-randconfig-001-20260201    gcc-14
i386        buildonly-randconfig-002-20260201    clang-20
i386        buildonly-randconfig-003-20260201    clang-20
i386        buildonly-randconfig-003-20260201    gcc-14
i386        buildonly-randconfig-004-20260201    clang-20
i386        buildonly-randconfig-005-20260201    clang-20
i386        buildonly-randconfig-005-20260201    gcc-13
i386        buildonly-randconfig-006-20260201    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260201    clang-20
i386                  randconfig-002-20260201    clang-20
i386                  randconfig-003-20260201    clang-20
i386                  randconfig-004-20260201    clang-20
i386                  randconfig-005-20260201    clang-20
i386                  randconfig-006-20260201    clang-20
i386                  randconfig-007-20260201    clang-20
i386                  randconfig-011-20260201    gcc-14
i386                  randconfig-012-20260201    gcc-14
i386                  randconfig-013-20260201    gcc-14
i386                  randconfig-014-20260201    gcc-14
i386                  randconfig-015-20260201    gcc-14
i386                  randconfig-016-20260201    gcc-14
i386                  randconfig-017-20260201    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260201    clang-22
loongarch             randconfig-001-20260201    gcc-15.2.0
loongarch             randconfig-002-20260201    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         apollo_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5475evb_defconfig    clang-22
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath25_defconfig    clang-22
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                           ip22_defconfig    gcc-15.2.0
mips                          malta_defconfig    gcc-15.2.0
mips                      maltaaprp_defconfig    clang-22
mips                      maltasmvp_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    clang-22
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260201    gcc-10.5.0
nios2                 randconfig-001-20260201    gcc-15.2.0
nios2                 randconfig-002-20260201    gcc-15.2.0
nios2                 randconfig-002-20260201    gcc-9.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260201    gcc-14.3.0
parisc                randconfig-002-20260201    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc                      ppc6xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260201    gcc-12.5.0
powerpc               randconfig-001-20260201    gcc-14.3.0
powerpc               randconfig-002-20260201    gcc-11.5.0
powerpc               randconfig-002-20260201    gcc-14.3.0
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc                     stx_gp3_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260201    gcc-10.5.0
powerpc64             randconfig-001-20260201    gcc-14.3.0
powerpc64             randconfig-002-20260201    gcc-14.3.0
powerpc64             randconfig-002-20260201    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260201    gcc-13.4.0
riscv                 randconfig-002-20260201    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260201    gcc-13.4.0
s390                  randconfig-002-20260201    gcc-13.4.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-15.2.0
sh                            migor_defconfig    clang-22
sh                    randconfig-001-20260201    gcc-13.4.0
sh                    randconfig-002-20260201    gcc-13.4.0
sh                          rsk7264_defconfig    gcc-15.2.0
sh                          sdk7780_defconfig    gcc-15.2.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260201    gcc-8.5.0
sparc                 randconfig-002-20260201    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260201    gcc-8.5.0
sparc64               randconfig-002-20260201    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260201    gcc-8.5.0
um                    randconfig-002-20260201    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260201    clang-20
x86_64      buildonly-randconfig-002-20260201    clang-20
x86_64      buildonly-randconfig-003-20260201    clang-20
x86_64      buildonly-randconfig-004-20260201    clang-20
x86_64      buildonly-randconfig-004-20260201    gcc-14
x86_64      buildonly-randconfig-005-20260201    clang-20
x86_64      buildonly-randconfig-006-20260201    clang-20
x86_64      buildonly-randconfig-006-20260201    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260201    clang-20
x86_64                randconfig-001-20260201    gcc-14
x86_64                randconfig-002-20260201    gcc-14
x86_64                randconfig-003-20260201    gcc-14
x86_64                randconfig-004-20260201    gcc-14
x86_64                randconfig-005-20260201    gcc-14
x86_64                randconfig-006-20260201    clang-20
x86_64                randconfig-006-20260201    gcc-14
x86_64                randconfig-011-20260201    gcc-14
x86_64                randconfig-012-20260201    clang-20
x86_64                randconfig-012-20260201    gcc-14
x86_64                randconfig-013-20260201    clang-20
x86_64                randconfig-013-20260201    gcc-14
x86_64                randconfig-014-20260201    gcc-14
x86_64                randconfig-015-20260201    gcc-14
x86_64                randconfig-016-20260201    clang-20
x86_64                randconfig-016-20260201    gcc-14
x86_64                randconfig-071-20260201    clang-20
x86_64                randconfig-071-20260201    gcc-14
x86_64                randconfig-072-20260201    clang-20
x86_64                randconfig-072-20260201    gcc-14
x86_64                randconfig-073-20260201    clang-20
x86_64                randconfig-073-20260201    gcc-14
x86_64                randconfig-074-20260201    clang-20
x86_64                randconfig-074-20260201    gcc-14
x86_64                randconfig-075-20260201    clang-20
x86_64                randconfig-075-20260201    gcc-14
x86_64                randconfig-076-20260201    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260201    gcc-8.5.0
xtensa                randconfig-002-20260201    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
