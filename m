Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146D5171CD
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Nov 2024 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547876; cv=none; b=E0urdb+zpr4yoJOcriIK+kKs4oiAOKXvXtXjAB8p6bVHAGEHGvcg0BEayorh4f243B9drNY1uTthDXUta3QULsLn9G1OaePCCsda/eBxXi0OkaPYyxJhv2+SZDxh8zVXOeeDXMNNRKkp7TDc1HwZgSgTUyfuXyEdrQm+/dkDvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547876; c=relaxed/simple;
	bh=q8/wZHXkUpTbJQjAtb9FWTK+n13lesxR3kqZgWPwRSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pCH/XQ+iyXBu3d6Rmm9Nc5/QqCxQKXRi2f4PNAVHRiCoVcDdY1w1gDWFR2IYQkEQpKaBFKFVd6ovoIEB811ZE4Jugw17w3exfakWu49MpE0xFxA4JJC1917ZGQsv6DAA02Uh5r50MbpyzgAUf8ZDZoXA1WR3+EalWE7BVTPH7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtFNjsYE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtFNjsYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732547874; x=1764083874;
  h=date:from:to:cc:subject:message-id;
  bh=q8/wZHXkUpTbJQjAtb9FWTK+n13lesxR3kqZgWPwRSs=;
  b=mtFNjsYERUEP+TrwibUf2t0ws7LJTXSA7jxmdC/tFpDFJlxrDXV2W2KN
   OWkAPO+AbbKZu7xKNPXHZgT5tu3aR0d5XXe3Hz349cc1jVAqhFXyJAlez
   EhKhjiZ3s8eLQL5EGNDkUtNuhLqWDiJleGeS1qtkLhlbV7WGzLdz+nWHs
   RTMYprhe2Q9GBK6NcBreCil7xICeqd1aTyjSuydJcnd7G3BfxMzTAaf1F
   GXvXY7qzyca5LHT2UzfK2maI792EnRFTu1B5WW4FzJ/VXdCuvKg1dW1M+
   0JDVjY1qUY9Aity2DMuaTz+eKGouYZYIye1sZCzmTBhQKLh6RjNyZJja7
   A==;
X-CSE-ConnectionGUID: RHaWbXLbTvaeNL7RVV+ndQ==
X-CSE-MsgGUID: oKVCzBLdS1qNEbYXgK5x/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32598695"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32598695"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 07:17:53 -0800
X-CSE-ConnectionGUID: 9Y7XDX1LTA+WdeigIooIeg==
X-CSE-MsgGUID: mnRwCHdXTHW3yYPNQ7LXsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91429785"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2024 07:17:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFaqT-0006XV-2Y;
	Mon, 25 Nov 2024 15:17:49 +0000
Date: Mon, 25 Nov 2024 23:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 d3acfa2a878dea459bd0432f9cb8943bebb7b9ca
Message-ID: <202411252347.xiy3jujh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: d3acfa2a878dea459bd0432f9cb8943bebb7b9ca  Merge branch 'fixes-v6.13' into testing

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20241125
    |-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val-.
    `-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val64-.

elapsed time: 847m

configs tested: 174
configs skipped: 22

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    clang-20
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arm                              alldefconfig    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-20
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-20
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                             alldefconfig    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241125    gcc-12
i386        buildonly-randconfig-002-20241125    clang-19
i386        buildonly-randconfig-002-20241125    gcc-12
i386        buildonly-randconfig-003-20241125    clang-19
i386        buildonly-randconfig-003-20241125    gcc-12
i386        buildonly-randconfig-004-20241125    clang-19
i386        buildonly-randconfig-004-20241125    gcc-12
i386        buildonly-randconfig-005-20241125    clang-19
i386        buildonly-randconfig-005-20241125    gcc-12
i386        buildonly-randconfig-006-20241125    clang-19
i386        buildonly-randconfig-006-20241125    gcc-12
i386                  randconfig-001-20241125    gcc-12
i386                  randconfig-002-20241125    gcc-12
i386                  randconfig-003-20241125    gcc-12
i386                  randconfig-004-20241125    clang-19
i386                  randconfig-004-20241125    gcc-12
i386                  randconfig-005-20241125    gcc-12
i386                  randconfig-006-20241125    clang-19
i386                  randconfig-006-20241125    gcc-12
i386                  randconfig-011-20241125    clang-19
i386                  randconfig-011-20241125    gcc-12
i386                  randconfig-012-20241125    clang-19
i386                  randconfig-012-20241125    gcc-12
i386                  randconfig-013-20241125    gcc-12
i386                  randconfig-014-20241125    gcc-12
i386                  randconfig-015-20241125    gcc-12
i386                  randconfig-016-20241125    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-13.2.0
mips                          ath79_defconfig    gcc-13.2.0
mips                        bcm47xx_defconfig    clang-20
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    clang-20
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-13.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-13.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                             sh03_defconfig    clang-20
sh                             sh03_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
x86_64      buildonly-randconfig-001-20241125    clang-19
x86_64      buildonly-randconfig-001-20241125    gcc-12
x86_64      buildonly-randconfig-002-20241125    gcc-12
x86_64      buildonly-randconfig-003-20241125    clang-19
x86_64      buildonly-randconfig-003-20241125    gcc-12
x86_64      buildonly-randconfig-004-20241125    gcc-12
x86_64      buildonly-randconfig-005-20241125    clang-19
x86_64      buildonly-randconfig-005-20241125    gcc-12
x86_64      buildonly-randconfig-006-20241125    clang-19
x86_64      buildonly-randconfig-006-20241125    gcc-12
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241125    clang-19
x86_64                randconfig-001-20241125    gcc-12
x86_64                randconfig-002-20241125    clang-19
x86_64                randconfig-002-20241125    gcc-12
x86_64                randconfig-003-20241125    gcc-12
x86_64                randconfig-004-20241125    clang-19
x86_64                randconfig-004-20241125    gcc-12
x86_64                randconfig-005-20241125    gcc-12
x86_64                randconfig-006-20241125    clang-19
x86_64                randconfig-006-20241125    gcc-12
x86_64                randconfig-011-20241125    gcc-12
x86_64                randconfig-012-20241125    clang-19
x86_64                randconfig-012-20241125    gcc-12
x86_64                randconfig-013-20241125    clang-19
x86_64                randconfig-013-20241125    gcc-12
x86_64                randconfig-014-20241125    gcc-12
x86_64                randconfig-015-20241125    clang-19
x86_64                randconfig-015-20241125    gcc-12
x86_64                randconfig-016-20241125    clang-19
x86_64                randconfig-016-20241125    gcc-12
x86_64                randconfig-071-20241125    clang-19
x86_64                randconfig-071-20241125    gcc-12
x86_64                randconfig-072-20241125    gcc-12
x86_64                randconfig-073-20241125    clang-19
x86_64                randconfig-073-20241125    gcc-12
x86_64                randconfig-074-20241125    clang-19
x86_64                randconfig-074-20241125    gcc-12
x86_64                randconfig-075-20241125    clang-19
x86_64                randconfig-075-20241125    gcc-12
x86_64                randconfig-076-20241125    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
