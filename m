Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576541C94
	for <linux-hwmon@vger.kernel.org>; Thu, 28 Nov 2024 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732775824; cv=none; b=CXH2NVMddHyydU0DOV6NNms7Q4+Gm+To96QNZQGb/671whYIuKD/2nb0ORE7xSmxbjVyaZZqLLMK3AFZ9FF4IKsJ7vmhptbm3ycEf6ZbbZRM3PIVwv+8se3w/JEKBIaGgyu2AXk9z+BJnVPzSW3exikWZhpDXgYxXGebK4l+XUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732775824; c=relaxed/simple;
	bh=8dpWQzMViGVo3IfjFQ5yFbfEDubs2jEsWfg8jTlO2v4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VGihFi2zD5gVM1RNB0ziCnJOqFx+IkWlq+z6j6Bbj7J9hK3eSo1g8+WkpTEkJROb0260S7UGd32gdWCTbopoPvs+bTjEtxoY93GmKj/WQzvb6TX5TwSrHTQk6GgYWiDO4Q7B+Ogh3awMS2RPAza7kCpIo8WkeC4wpUMtmFLk7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAt/RmdJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAt/RmdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732775823; x=1764311823;
  h=date:from:to:cc:subject:message-id;
  bh=8dpWQzMViGVo3IfjFQ5yFbfEDubs2jEsWfg8jTlO2v4=;
  b=DAt/RmdJUuUgK2b7T/AmwxyDd/DOCiO49WVNhGg0AzOvi5z2Tt83le4s
   OVI6e2VjDlAvXlmXiOkarLyQYA0Uml00HTFMWIWb0OzkVW4//oIE+MUc3
   +BmhdZEUPbTDjWDF52cZYUWr+OzAv/44AiRCwZahWsrpqc2bvt1wXGw5m
   AN7IjEuxWmqN9O4587EZfPbo5m6yeSp4Wacp//z9u6DvKmyrtBn71p2fC
   AQGGUZfGWrLLaE2tpnTe3xpk0LQMHkmHh2pzhnP3Wa79S+1bLQOa5l8FU
   BfHMSfnUBHLbaeAdNvGMwc4GI9AZ3NqTwNFomUj4JK1g8FoOF2mXcJxvv
   A==;
X-CSE-ConnectionGUID: PSdqS89vTdGlTZV9/1LWAA==
X-CSE-MsgGUID: i7zZpi+6R/eU5mH9V7KMBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="20589312"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="20589312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 22:37:02 -0800
X-CSE-ConnectionGUID: Q71+Ux5MR4C1hRlBW0y4mw==
X-CSE-MsgGUID: vgQ4dkGzSX2+App7cyNeew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97106462"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2024 22:37:00 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGY94-0009BX-1G;
	Thu, 28 Nov 2024 06:36:58 +0000
Date: Thu, 28 Nov 2024 14:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 0acad14bb2df9d494c1b2ed2ccef9375a7853345
Message-ID: <202411281459.8QDfKIm1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 0acad14bb2df9d494c1b2ed2ccef9375a7853345  Merge branch 'fixes-v6.13' into testing

elapsed time: 720m

configs tested: 181
configs skipped: 26

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                   randconfig-001-20241128    clang-20
arc                   randconfig-002-20241128    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    gcc-14.2.0
arm                             mxs_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20241128    clang-20
arm                   randconfig-002-20241128    clang-20
arm                   randconfig-003-20241128    clang-20
arm                   randconfig-004-20241128    clang-20
arm                           sama5_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241128    clang-20
arm64                 randconfig-002-20241128    clang-20
arm64                 randconfig-003-20241128    clang-20
arm64                 randconfig-004-20241128    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241128    clang-20
csky                  randconfig-002-20241128    clang-20
hexagon                          alldefconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241128    clang-20
hexagon               randconfig-002-20241128    clang-20
i386        buildonly-randconfig-001-20241128    clang-19
i386        buildonly-randconfig-002-20241128    clang-19
i386        buildonly-randconfig-003-20241128    clang-19
i386        buildonly-randconfig-004-20241128    clang-19
i386        buildonly-randconfig-005-20241128    clang-19
i386        buildonly-randconfig-006-20241128    clang-19
i386                  randconfig-001-20241128    clang-19
i386                  randconfig-002-20241128    clang-19
i386                  randconfig-003-20241128    clang-19
i386                  randconfig-004-20241128    clang-19
i386                  randconfig-005-20241128    clang-19
i386                  randconfig-006-20241128    clang-19
i386                  randconfig-011-20241128    clang-19
i386                  randconfig-012-20241128    clang-19
i386                  randconfig-013-20241128    clang-19
i386                  randconfig-014-20241128    clang-19
i386                  randconfig-015-20241128    clang-19
i386                  randconfig-016-20241128    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20241128    clang-20
loongarch             randconfig-002-20241128    clang-20
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241128    clang-20
nios2                 randconfig-002-20241128    clang-20
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241128    clang-20
parisc                randconfig-002-20241128    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                       ebony_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241128    clang-20
powerpc               randconfig-002-20241128    clang-20
powerpc               randconfig-003-20241128    clang-20
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241128    clang-20
powerpc64             randconfig-002-20241128    clang-20
powerpc64             randconfig-003-20241128    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241128    clang-20
riscv                 randconfig-002-20241128    clang-20
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241128    clang-20
s390                  randconfig-002-20241128    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    clang-20
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20241128    clang-20
sh                    randconfig-002-20241128    clang-20
sh                          rsk7201_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241128    clang-20
sparc64               randconfig-002-20241128    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-14.2.0
um                    randconfig-001-20241128    clang-20
um                    randconfig-002-20241128    clang-20
x86_64      buildonly-randconfig-001-20241128    clang-19
x86_64      buildonly-randconfig-002-20241128    clang-19
x86_64      buildonly-randconfig-003-20241128    clang-19
x86_64      buildonly-randconfig-004-20241128    clang-19
x86_64      buildonly-randconfig-005-20241128    clang-19
x86_64      buildonly-randconfig-006-20241128    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241128    clang-19
x86_64                randconfig-002-20241128    clang-19
x86_64                randconfig-003-20241128    clang-19
x86_64                randconfig-004-20241128    clang-19
x86_64                randconfig-005-20241128    clang-19
x86_64                randconfig-006-20241128    clang-19
x86_64                randconfig-011-20241128    clang-19
x86_64                randconfig-012-20241128    clang-19
x86_64                randconfig-013-20241128    clang-19
x86_64                randconfig-014-20241128    clang-19
x86_64                randconfig-015-20241128    clang-19
x86_64                randconfig-016-20241128    clang-19
x86_64                randconfig-071-20241128    clang-19
x86_64                randconfig-072-20241128    clang-19
x86_64                randconfig-073-20241128    clang-19
x86_64                randconfig-074-20241128    clang-19
x86_64                randconfig-075-20241128    clang-19
x86_64                randconfig-076-20241128    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                          rhel-9.4-func    clang-19
x86_64                    rhel-9.4-kselftests    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241128    clang-20
xtensa                randconfig-002-20241128    clang-20
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
