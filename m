Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE12D46A1
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 05:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771997060; cv=none; b=dpzLVxxvmw9LdRuvbQ/cjVC5Vc2IBLKWY22dI0qpM5KgrAE4h+BmpojSo3JqX3jOkg1umjG+TRvGLaRqo42WpIzSsMjWyTV52LtpQP4ZHipqwF9oxgMmhM72NxmyKAS92oIqV1adGG7yowRz3xXe8T/ocTuk4uYBLhIliUYAKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771997060; c=relaxed/simple;
	bh=LNUnC3uGpKFQ62+l/xOLjAzJjRbplw0KNARSnCE53bY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I356rYsOEQTue8C9UwIldZyxssb/s9I1cnnQbZIYw09v7BoCdRRR4Nxbwn3ufR4OzpZ7OV6PzvC/9Dm/rCcS2KNgUbtXq7o3gL3klvq3vNNGY9QNzpcvVSzZJQbJ4jLO5NooXpvYONrK0/RuZMl4scqojnf5taKEMWKRZZ000ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ml+C7q6y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ml+C7q6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771997058; x=1803533058;
  h=date:from:to:cc:subject:message-id;
  bh=LNUnC3uGpKFQ62+l/xOLjAzJjRbplw0KNARSnCE53bY=;
  b=ml+C7q6ynTtl0HPRQ3y+wGkJZ6Iz1ixtIztXcgGnwAst2RVJURXfPaQ1
   tXwD/RWUnoVAfMjwprvA7qMq9Izqmfrwz3mM13CCLN+I6gW0kegjGSpcf
   CRhhFNcm5UCMvB3Hoa5KlfD839zhSoFnbL3gEkgJnOhQTD+ua3zATsEd/
   mXffFTH80Pi91/3voinTE0VOE2BMMKaaZHz0nEUDBWUzRB+hwe6bn42Ma
   Iwx53fSq94uspFFpFK+axNYeiajNgj07/nT0p7Oi2thmrV2TlZG/0OF1X
   PF620FS3vlo38Wq8gtzNjvt6s9tpfwOG0Rhx6iNJXA3yWyYQLuLQfSKVL
   w==;
X-CSE-ConnectionGUID: 78mPll2lRGWS/1l5SJy5Ww==
X-CSE-MsgGUID: l+62NJiFR7KY9UmdEyLmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73098152"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="73098152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 21:24:17 -0800
X-CSE-ConnectionGUID: TbfrBnR0QmiGRmUINEo8DQ==
X-CSE-MsgGUID: by8qqVVWQkSdUOtefewnNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="220629630"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Feb 2026 21:24:15 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv7NU-000000003yz-3QJF;
	Wed, 25 Feb 2026 05:24:07 +0000
Date: Wed, 25 Feb 2026 13:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 addb1581d9b6a44e29f9f00855deffe66abe3526
Message-ID: <202602251347.R5Pkdxxj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: addb1581d9b6a44e29f9f00855deffe66abe3526  dt-bindings: hwmon: convert npcm750-pwm-fan to DT schema

elapsed time: 753m

configs tested: 250
configs skipped: 8

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
arc                   randconfig-001-20260225    gcc-8.5.0
arc                   randconfig-002-20260225    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    gcc-15.2.0
arm                       omap2plus_defconfig    clang-23
arm                   randconfig-001-20260225    gcc-8.5.0
arm                   randconfig-002-20260225    gcc-8.5.0
arm                   randconfig-003-20260225    gcc-8.5.0
arm                   randconfig-004-20260225    gcc-8.5.0
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260225    gcc-9.5.0
arm64                 randconfig-002-20260225    gcc-9.5.0
arm64                 randconfig-003-20260225    gcc-9.5.0
arm64                 randconfig-004-20260225    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260225    gcc-9.5.0
csky                  randconfig-002-20260225    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260225    clang-23
hexagon               randconfig-002-20260225    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260225    clang-20
i386        buildonly-randconfig-002-20260225    clang-20
i386        buildonly-randconfig-003-20260225    clang-20
i386        buildonly-randconfig-004-20260225    clang-20
i386        buildonly-randconfig-005-20260225    clang-20
i386        buildonly-randconfig-006-20260225    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260225    gcc-14
i386                  randconfig-002-20260225    gcc-14
i386                  randconfig-003-20260225    gcc-14
i386                  randconfig-004-20260225    gcc-14
i386                  randconfig-005-20260225    gcc-14
i386                  randconfig-006-20260225    gcc-14
i386                  randconfig-007-20260225    gcc-14
i386                  randconfig-011-20260225    gcc-13
i386                  randconfig-011-20260225    gcc-14
i386                  randconfig-012-20260225    clang-20
i386                  randconfig-012-20260225    gcc-13
i386                  randconfig-013-20260225    gcc-13
i386                  randconfig-014-20260225    gcc-13
i386                  randconfig-014-20260225    gcc-14
i386                  randconfig-015-20260225    clang-20
i386                  randconfig-015-20260225    gcc-13
i386                  randconfig-016-20260225    clang-20
i386                  randconfig-016-20260225    gcc-13
i386                  randconfig-017-20260225    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260225    clang-23
loongarch             randconfig-002-20260225    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
m68k                            mac_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    gcc-15.2.0
mips                           ci20_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                     decstation_defconfig    gcc-15.2.0
mips                       lemote2f_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-23
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260225    clang-23
nios2                 randconfig-002-20260225    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                       virt_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260225    clang-19
parisc                randconfig-001-20260225    gcc-15.2.0
parisc                randconfig-002-20260225    clang-19
parisc                randconfig-002-20260225    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    amigaone_defconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    gcc-15.2.0
powerpc                      cm5200_defconfig    gcc-15.2.0
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    clang-23
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260225    clang-19
powerpc               randconfig-001-20260225    gcc-12.5.0
powerpc               randconfig-002-20260225    clang-19
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260225    clang-19
powerpc64             randconfig-001-20260225    clang-23
powerpc64             randconfig-002-20260225    clang-19
powerpc64             randconfig-002-20260225    gcc-15.2.0
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260225    gcc-12.5.0
riscv                 randconfig-002-20260225    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260225    gcc-12.5.0
s390                  randconfig-002-20260225    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                         ecovec24_defconfig    clang-23
sh                         ecovec24_defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                    randconfig-001-20260225    gcc-12.5.0
sh                    randconfig-002-20260225    gcc-12.5.0
sh                      rts7751r2d1_defconfig    clang-23
sh                   rts7751r2dplus_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                   sh7724_generic_defconfig    gcc-15.2.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sh                  sh7785lcr_32bit_defconfig    clang-23
sh                            titan_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260225    gcc-11.5.0
sparc                 randconfig-002-20260225    gcc-11.5.0
sparc                       sparc32_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260225    gcc-11.5.0
sparc64               randconfig-002-20260225    gcc-11.5.0
um                               alldefconfig    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260225    gcc-11.5.0
um                    randconfig-002-20260225    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260225    clang-20
x86_64      buildonly-randconfig-002-20260225    clang-20
x86_64      buildonly-randconfig-003-20260225    clang-20
x86_64      buildonly-randconfig-004-20260225    clang-20
x86_64      buildonly-randconfig-005-20260225    clang-20
x86_64      buildonly-randconfig-006-20260225    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260225    gcc-14
x86_64                randconfig-002-20260225    gcc-14
x86_64                randconfig-003-20260225    gcc-14
x86_64                randconfig-004-20260225    gcc-14
x86_64                randconfig-005-20260225    gcc-14
x86_64                randconfig-006-20260225    gcc-14
x86_64                randconfig-011-20260225    gcc-14
x86_64                randconfig-012-20260225    gcc-14
x86_64                randconfig-013-20260225    gcc-14
x86_64                randconfig-014-20260225    gcc-14
x86_64                randconfig-015-20260225    gcc-14
x86_64                randconfig-016-20260225    gcc-14
x86_64                randconfig-071-20260225    clang-20
x86_64                randconfig-072-20260225    clang-20
x86_64                randconfig-073-20260225    clang-20
x86_64                randconfig-074-20260225    clang-20
x86_64                randconfig-075-20260225    clang-20
x86_64                randconfig-076-20260225    clang-20
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
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260225    gcc-11.5.0
xtensa                randconfig-002-20260225    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
