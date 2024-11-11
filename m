Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B8189F2B
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2024 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324562; cv=none; b=qLBvg4FALTkHzhvEV5jNtxGtapKb2lqFdH39IZxE7FRVNwfBPP1nrv5ZDssZbQli01u0EpmsmzoYRY9HFv1dkAQ4y4mzZH7juEAAPvXelsNLs8kO3+0Ph3z5w8LGkmogSQo+di4bAHoGEervw57X5CzckIJaQ0C8HbojVkWIhmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324562; c=relaxed/simple;
	bh=ecfz3uXaEfTsq5Vvyu9T1FyCnC8APlOUSTeKtq6vzmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZWNNVvqKckqqzCjGqiF47jSAbOVZ+r0AI3QItya8oYbGy+uKZ5jUDKNAH9NcKfCROBvhz0d3LiQsauWUu5qy+etb5A2GDtoA/5OASsQtDfgTtznfgueyCHcOkN3BWjHl26HVJ4+WqYJDEQuJpG8nNwBRAtt5JhZvEh4oMKMs44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLqOnX9f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLqOnX9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731324560; x=1762860560;
  h=date:from:to:cc:subject:message-id;
  bh=ecfz3uXaEfTsq5Vvyu9T1FyCnC8APlOUSTeKtq6vzmU=;
  b=FLqOnX9fPrxBLLvKfGCj1TRo4+0nsvAD8h3G910+FHRnwEDCYmRb8Fxb
   QAtgqDLCmAFJgySVVglcakGXySvXv7wUp4JczvJ7Y7p0+UXNlEZH5+X28
   H+QpOp7L+lDb4+vIlwenm78DMJoVYw/vzEWd4frjus3pB3Hbhhv9GA+yH
   HSor6XVpsX1U1lGjrzAEXcnM67a4yU6O272Tw9muFSbhPQmeTMrp6iPVc
   cw1qbCBi213Gykgg9K6j/8ARhFizr6tpvcRCejZRqRPqGXKrOkgp6Wwvl
   YHQHnHKrbuIuqTOijn3X2rGYSBWQIsbARhZaUUPYYhi1ol03dmx2UZG2f
   Q==;
X-CSE-ConnectionGUID: OrTIS0aaQdGYc8r7AeZidA==
X-CSE-MsgGUID: joX37JtNQVm535a88kxJxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34814580"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34814580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:29:17 -0800
X-CSE-ConnectionGUID: EGgnD1QzQpyfeR/bdpAvJQ==
X-CSE-MsgGUID: tHBTK33lQn6akEWWa/qYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="86992618"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2024 03:29:16 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tASbZ-0000Er-1v;
	Mon, 11 Nov 2024 11:29:13 +0000
Date: Mon, 11 Nov 2024 19:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 a84d5a4a3de032a97be09d4803757dec27ecb26b
Message-ID: <202411111939.d42LoRnp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: a84d5a4a3de032a97be09d4803757dec27ecb26b  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 724m

configs tested: 241
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241111    gcc-13.2.0
arc                   randconfig-002-20241111    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                        neponset_defconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241111    clang-17
arm                   randconfig-002-20241111    clang-20
arm                   randconfig-003-20241111    clang-20
arm                   randconfig-004-20241111    clang-20
arm                           sama7_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241111    clang-20
arm64                 randconfig-002-20241111    gcc-14.2.0
arm64                 randconfig-003-20241111    clang-20
arm64                 randconfig-004-20241111    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241111    gcc-14.2.0
csky                  randconfig-002-20241111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241111    clang-20
hexagon               randconfig-002-20241111    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241111    gcc-11
i386        buildonly-randconfig-002-20241111    gcc-11
i386        buildonly-randconfig-002-20241111    gcc-12
i386        buildonly-randconfig-003-20241111    clang-19
i386        buildonly-randconfig-003-20241111    gcc-11
i386        buildonly-randconfig-004-20241111    gcc-11
i386        buildonly-randconfig-004-20241111    gcc-12
i386        buildonly-randconfig-005-20241111    clang-19
i386        buildonly-randconfig-005-20241111    gcc-11
i386        buildonly-randconfig-006-20241111    clang-19
i386        buildonly-randconfig-006-20241111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241111    clang-19
i386                  randconfig-001-20241111    gcc-11
i386                  randconfig-002-20241111    gcc-11
i386                  randconfig-002-20241111    gcc-12
i386                  randconfig-003-20241111    clang-19
i386                  randconfig-003-20241111    gcc-11
i386                  randconfig-004-20241111    gcc-11
i386                  randconfig-004-20241111    gcc-12
i386                  randconfig-005-20241111    gcc-11
i386                  randconfig-005-20241111    gcc-12
i386                  randconfig-006-20241111    gcc-11
i386                  randconfig-006-20241111    gcc-12
i386                  randconfig-011-20241111    clang-19
i386                  randconfig-011-20241111    gcc-11
i386                  randconfig-012-20241111    gcc-11
i386                  randconfig-012-20241111    gcc-12
i386                  randconfig-013-20241111    clang-19
i386                  randconfig-013-20241111    gcc-11
i386                  randconfig-014-20241111    clang-19
i386                  randconfig-014-20241111    gcc-11
i386                  randconfig-015-20241111    gcc-11
i386                  randconfig-015-20241111    gcc-12
i386                  randconfig-016-20241111    clang-19
i386                  randconfig-016-20241111    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241111    gcc-14.2.0
loongarch             randconfig-002-20241111    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-20
mips                      maltaaprp_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241111    gcc-14.2.0
nios2                 randconfig-002-20241111    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241111    gcc-14.2.0
parisc                randconfig-002-20241111    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-20
powerpc                       maple_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241111    gcc-14.2.0
powerpc               randconfig-002-20241111    gcc-14.2.0
powerpc               randconfig-003-20241111    clang-20
powerpc                     sequoia_defconfig    clang-20
powerpc                     skiroot_defconfig    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc                     tqm5200_defconfig    clang-20
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20241111    clang-20
powerpc64             randconfig-002-20241111    clang-20
powerpc64             randconfig-003-20241111    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241111    clang-20
riscv                 randconfig-002-20241111    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241111    gcc-14.2.0
s390                  randconfig-002-20241111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241111    gcc-14.2.0
sh                    randconfig-002-20241111    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    clang-20
sh                        sh7757lcr_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241111    gcc-14.2.0
sparc64               randconfig-002-20241111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241111    clang-20
um                    randconfig-002-20241111    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241111    gcc-12
x86_64      buildonly-randconfig-002-20241111    gcc-12
x86_64      buildonly-randconfig-003-20241111    gcc-12
x86_64      buildonly-randconfig-004-20241111    gcc-12
x86_64      buildonly-randconfig-005-20241111    gcc-12
x86_64      buildonly-randconfig-006-20241111    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241111    clang-19
x86_64                randconfig-002-20241111    clang-19
x86_64                randconfig-003-20241111    clang-19
x86_64                randconfig-004-20241111    gcc-12
x86_64                randconfig-005-20241111    gcc-12
x86_64                randconfig-006-20241111    clang-19
x86_64                randconfig-011-20241111    clang-19
x86_64                randconfig-012-20241111    gcc-12
x86_64                randconfig-013-20241111    clang-19
x86_64                randconfig-014-20241111    clang-19
x86_64                randconfig-015-20241111    clang-19
x86_64                randconfig-016-20241111    gcc-12
x86_64                randconfig-071-20241111    gcc-12
x86_64                randconfig-072-20241111    gcc-12
x86_64                randconfig-073-20241111    clang-19
x86_64                randconfig-074-20241111    clang-19
x86_64                randconfig-075-20241111    clang-19
x86_64                randconfig-076-20241111    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                randconfig-001-20241111    gcc-14.2.0
xtensa                randconfig-002-20241111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
