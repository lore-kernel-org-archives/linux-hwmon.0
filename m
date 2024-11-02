Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AA1F19A
	for <linux-hwmon@vger.kernel.org>; Sat,  2 Nov 2024 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730531723; cv=none; b=bGPLGLW1j6SRQKWja5brWdv+HWcrNgk/W9VJvYxJmrfcfmvbFymsi3k9sAZw5To8XBPU+ZYtO+NPr4o4JIP5VRayL5san5ZMKVjS6WkmN178esCy0YoOS2CNmwp7Ao1kKaUpj2N+Y0yaQGkIhq+6Y4whMMXyCUCIvKdzfPaPN9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730531723; c=relaxed/simple;
	bh=PcCwXxbDDGJRt6VoalU/l0ZIvCOjZFYbkZFnlTyCMOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lJAyytQaV7RJmF4kxH2ZZcwlwH0rQy9M6oAJR/2bfRZnlbmvAnwetna9RsOPcZM4pI7P2WFLFnKU1XPVvKKADMcwTwYkP3tQ1SJelRvDbSbkJj9uSW0kOgryesW/AwUbCjLtXLgpeNfSQaBBheZseigUceLDaPXdmv1Ujewvv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVbd6IzF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVbd6IzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730531722; x=1762067722;
  h=date:from:to:cc:subject:message-id;
  bh=PcCwXxbDDGJRt6VoalU/l0ZIvCOjZFYbkZFnlTyCMOQ=;
  b=JVbd6IzFi7s14npEjo6Xhoiy3RKf++7Zme7l05eyEBMGSxxDUq1gDa3H
   iMCHfA20WrKGJhytcJUuNVepfvpEJX4cp+0xFze4LhYdCRqiPDV2vJpbd
   evLNDLwZ/6VF/VRKkslMaHecJup+e8i//l1tTGV2vTRyK5XIbLM0ZzDp4
   2vkthUc1aS9OIwboMBwRV/vbwAYhYa8DhVnGWYffvuCu4XBBymOAW9Oa1
   5nk+NwFLEoQZqrQBVUbCzDp+GKtPYTp5VPLYJHyNiWIQ+m+6A2s707cdd
   Y2322IwjShxwmGxbZORcLgHKBmz5PRAPXbd+c8SbV7kVpcFOFTpyQ9bmi
   g==;
X-CSE-ConnectionGUID: BMGg0Dg1Ramsqiqc+rpx/g==
X-CSE-MsgGUID: 38C1PcLOTZCUQaWiPtAfrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30145337"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30145337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 00:15:22 -0700
X-CSE-ConnectionGUID: Uv2bTF93R62b00AR+1JmuA==
X-CSE-MsgGUID: GKV7ub17SZ64Ju+/l2UWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="87992135"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Nov 2024 00:15:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t78Lt-000iY9-2y;
	Sat, 02 Nov 2024 07:15:17 +0000
Date: Sat, 02 Nov 2024 15:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 3f8ebee5ea6e46b35c46dbe9836e22c6e68e1030
Message-ID: <202411021528.tjU6TTNN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 3f8ebee5ea6e46b35c46dbe9836e22c6e68e1030  Merge branch 'fixes-v6.12' into testing

elapsed time: 1005m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241102    gcc-14.1.0
arc                   randconfig-002-20241102    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         bcm2835_defconfig    gcc-13.2.0
arm                   randconfig-001-20241102    gcc-14.1.0
arm                   randconfig-002-20241102    gcc-14.1.0
arm                   randconfig-003-20241102    gcc-14.1.0
arm                   randconfig-004-20241102    gcc-14.1.0
arm                         s5pv210_defconfig    gcc-13.2.0
arm                           tegra_defconfig    gcc-13.2.0
arm                           u8500_defconfig    gcc-13.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241102    gcc-14.1.0
arm64                 randconfig-002-20241102    gcc-14.1.0
arm64                 randconfig-003-20241102    gcc-14.1.0
arm64                 randconfig-004-20241102    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20241102    gcc-14.1.0
csky                  randconfig-002-20241102    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241102    gcc-14.1.0
hexagon               randconfig-002-20241102    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241102    gcc-12
i386        buildonly-randconfig-002-20241102    gcc-12
i386        buildonly-randconfig-003-20241102    gcc-12
i386        buildonly-randconfig-004-20241102    gcc-12
i386        buildonly-randconfig-005-20241102    gcc-12
i386        buildonly-randconfig-006-20241102    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241102    gcc-12
i386                  randconfig-002-20241102    gcc-12
i386                  randconfig-003-20241102    gcc-12
i386                  randconfig-004-20241102    gcc-12
i386                  randconfig-005-20241102    gcc-12
i386                  randconfig-006-20241102    gcc-12
i386                  randconfig-011-20241102    gcc-12
i386                  randconfig-012-20241102    gcc-12
i386                  randconfig-013-20241102    gcc-12
i386                  randconfig-014-20241102    gcc-12
i386                  randconfig-015-20241102    gcc-12
i386                  randconfig-016-20241102    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20241102    gcc-14.1.0
loongarch             randconfig-002-20241102    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-13.2.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-13.2.0
mips                           ip22_defconfig    gcc-13.2.0
mips                       rbtx49xx_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20241102    gcc-14.1.0
nios2                 randconfig-002-20241102    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                randconfig-001-20241102    gcc-14.1.0
parisc                randconfig-002-20241102    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-13.2.0
powerpc                        fsp2_defconfig    gcc-13.2.0
powerpc               randconfig-001-20241102    gcc-14.1.0
powerpc               randconfig-002-20241102    gcc-14.1.0
powerpc               randconfig-003-20241102    gcc-14.1.0
powerpc64             randconfig-001-20241102    gcc-14.1.0
powerpc64             randconfig-002-20241102    gcc-14.1.0
powerpc64             randconfig-003-20241102    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                 randconfig-001-20241102    gcc-14.1.0
riscv                 randconfig-002-20241102    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                  randconfig-001-20241102    gcc-14.1.0
s390                  randconfig-002-20241102    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                    randconfig-001-20241102    gcc-14.1.0
sh                    randconfig-002-20241102    gcc-14.1.0
sh                           se7712_defconfig    gcc-13.2.0
sh                        sh7757lcr_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-13.2.0
sparc64               randconfig-001-20241102    gcc-14.1.0
sparc64               randconfig-002-20241102    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                    randconfig-001-20241102    gcc-14.1.0
um                    randconfig-002-20241102    gcc-14.1.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241102    gcc-14.1.0
xtensa                randconfig-002-20241102    gcc-14.1.0
xtensa                         virt_defconfig    gcc-13.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
