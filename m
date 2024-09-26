Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954A74C91
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Sep 2024 02:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727318812; cv=none; b=eym5kh5Oq6/s4xaGxHZ0WEUZdBVR1F6KEOayWoqmGJtPi8N9FAn52Jnfz39HXY6RTOj3R+vFyiwmfwrynppsc3nztRG5WEXYaDlzZLJseBGYQMnw26aC2RQXxt0V8Zolp27yLBt9YabSL2G3rPn/Sf9kgppTErs3gWUhUeWZ75U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727318812; c=relaxed/simple;
	bh=2VHUgmotyG3fxLa+M21lOBqrhvC8f/qSyl0PHGlzWZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E76bFeNOkQxli8XFCG6oSKL3uT3KpSz3IYlbFsqSCymaMIhSDM3ZrCSV81IqZClGb3QLCzrHwiST80M3TlfWzpnPSDICq3vBDrrFT6Jx84yuDWQOy/I+YIJKyMeb104HpX26Wv8ZSGU1TJFrWD1mqUaVHGzByGsUWfYAWM8nV9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2l/+5jQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2l/+5jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727318810; x=1758854810;
  h=date:from:to:cc:subject:message-id;
  bh=2VHUgmotyG3fxLa+M21lOBqrhvC8f/qSyl0PHGlzWZI=;
  b=B2l/+5jQgZI2atE0K3PothCxGokLI0SJg6D29sRSg3s9vnnHHVjqXtkd
   A378zHKaTJAeCdAvCPZ72N2EmB5rP6ftpeuQrl4WqmML6QVSDd4aSp+FN
   yT4a6wWLD0DQlKMhViNrS2ylmPhnVpTU/yZgoKIdKL8c1TlCAEZAVVBb0
   QPZjlJ4o8j0Ujr/Oz/RW50k6m0XFbPFYUDk457GHsi0jI0tJtT+C7oTCy
   SpeuHqM0t31vanN6utXoLlOp6W4cfXfQJBdNh6bR3BdEbtzl6m/JLR7+6
   xw7qnU/Vno2ne7Srce6EBy/Fdx04MxPwPSz8zes7pYYs8k7gp7MCYvh6o
   w==;
X-CSE-ConnectionGUID: wqdwVTlsRJ2VAF71MBRvjw==
X-CSE-MsgGUID: T/Z5m3rgQxy5Scfyf2kQNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48927134"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="48927134"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 19:46:49 -0700
X-CSE-ConnectionGUID: jKfEVddjQmKLw8pfgoOeiw==
X-CSE-MsgGUID: SkLjD0dsRKCStVDnr5wwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="76353804"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2024 19:46:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1steWj-000K9L-1b;
	Thu, 26 Sep 2024 02:46:45 +0000
Date: Thu, 26 Sep 2024 10:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 a0a17c87bd21abca9cd0aa2f386f7a19163e4cef
Message-ID: <202409261034.xXOnPV9W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: a0a17c87bd21abca9cd0aa2f386f7a19163e4cef  Merge branch 'fixes-v6.12' into testing

elapsed time: 1229m

configs tested: 355
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240925    gcc-13.2.0
arc                   randconfig-001-20240925    gcc-14.1.0
arc                   randconfig-001-20240926    gcc-14.1.0
arc                   randconfig-002-20240925    gcc-13.2.0
arc                   randconfig-002-20240925    gcc-14.1.0
arc                   randconfig-002-20240926    gcc-14.1.0
arc                           tb10x_defconfig    clang-20
arc                           tb10x_defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              alldefconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                     am200epdkit_defconfig    gcc-14.1.0
arm                       aspeed_g5_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          gemini_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                          moxart_defconfig    gcc-14.1.0
arm                       multi_v4t_defconfig    gcc-14.1.0
arm                        multi_v5_defconfig    clang-20
arm                        multi_v7_defconfig    clang-20
arm                       netwinder_defconfig    clang-20
arm                           omap1_defconfig    clang-20
arm                          pxa910_defconfig    gcc-14.1.0
arm                   randconfig-001-20240925    gcc-14.1.0
arm                   randconfig-001-20240926    gcc-14.1.0
arm                   randconfig-002-20240925    clang-20
arm                   randconfig-002-20240925    gcc-14.1.0
arm                   randconfig-002-20240926    gcc-14.1.0
arm                   randconfig-003-20240925    clang-20
arm                   randconfig-003-20240925    gcc-14.1.0
arm                   randconfig-003-20240926    gcc-14.1.0
arm                   randconfig-004-20240925    gcc-14.1.0
arm                   randconfig-004-20240926    gcc-14.1.0
arm                         s3c6400_defconfig    clang-20
arm                           tegra_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm                        vexpress_defconfig    clang-20
arm                         vf610m4_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240925    gcc-14.1.0
arm64                 randconfig-001-20240926    gcc-14.1.0
arm64                 randconfig-002-20240925    gcc-14.1.0
arm64                 randconfig-002-20240926    gcc-14.1.0
arm64                 randconfig-003-20240925    clang-20
arm64                 randconfig-003-20240925    gcc-14.1.0
arm64                 randconfig-003-20240926    gcc-14.1.0
arm64                 randconfig-004-20240925    gcc-14.1.0
arm64                 randconfig-004-20240926    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    clang-20
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240925    gcc-14.1.0
csky                  randconfig-001-20240926    gcc-14.1.0
csky                  randconfig-002-20240925    gcc-14.1.0
csky                  randconfig-002-20240926    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240925    clang-20
hexagon               randconfig-001-20240925    gcc-14.1.0
hexagon               randconfig-001-20240926    gcc-14.1.0
hexagon               randconfig-002-20240925    clang-20
hexagon               randconfig-002-20240925    gcc-14.1.0
hexagon               randconfig-002-20240926    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240925    clang-18
i386        buildonly-randconfig-001-20240926    gcc-12
i386        buildonly-randconfig-002-20240925    clang-18
i386        buildonly-randconfig-002-20240926    gcc-12
i386        buildonly-randconfig-003-20240925    clang-18
i386        buildonly-randconfig-003-20240926    gcc-12
i386        buildonly-randconfig-004-20240925    clang-18
i386        buildonly-randconfig-004-20240925    gcc-12
i386        buildonly-randconfig-004-20240926    gcc-12
i386        buildonly-randconfig-005-20240925    clang-18
i386        buildonly-randconfig-005-20240926    gcc-12
i386        buildonly-randconfig-006-20240925    clang-18
i386        buildonly-randconfig-006-20240926    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240925    clang-18
i386                  randconfig-001-20240925    gcc-12
i386                  randconfig-001-20240926    gcc-12
i386                  randconfig-002-20240925    clang-18
i386                  randconfig-002-20240926    gcc-12
i386                  randconfig-003-20240925    clang-18
i386                  randconfig-003-20240925    gcc-12
i386                  randconfig-003-20240926    gcc-12
i386                  randconfig-004-20240925    clang-18
i386                  randconfig-004-20240926    gcc-12
i386                  randconfig-005-20240925    clang-18
i386                  randconfig-005-20240926    gcc-12
i386                  randconfig-006-20240925    clang-18
i386                  randconfig-006-20240925    gcc-12
i386                  randconfig-006-20240926    gcc-12
i386                  randconfig-011-20240925    clang-18
i386                  randconfig-011-20240925    gcc-12
i386                  randconfig-011-20240926    gcc-12
i386                  randconfig-012-20240925    clang-18
i386                  randconfig-012-20240925    gcc-12
i386                  randconfig-012-20240926    gcc-12
i386                  randconfig-013-20240925    clang-18
i386                  randconfig-013-20240926    gcc-12
i386                  randconfig-014-20240925    clang-18
i386                  randconfig-014-20240926    gcc-12
i386                  randconfig-015-20240925    clang-18
i386                  randconfig-015-20240926    gcc-12
i386                  randconfig-016-20240925    clang-18
i386                  randconfig-016-20240925    gcc-12
i386                  randconfig-016-20240926    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240925    gcc-14.1.0
loongarch             randconfig-001-20240926    gcc-14.1.0
loongarch             randconfig-002-20240925    gcc-14.1.0
loongarch             randconfig-002-20240926    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         amcore_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          hp300_defconfig    clang-20
m68k                       m5208evb_defconfig    clang-20
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    clang-20
m68k                        m5407c3_defconfig    gcc-14.1.0
m68k                          multi_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    clang-20
mips                          eyeq5_defconfig    clang-20
mips                           ip27_defconfig    clang-20
mips                           ip28_defconfig    clang-20
mips                           ip32_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                           rs90_defconfig    clang-20
nios2                            alldefconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240925    gcc-14.1.0
nios2                 randconfig-001-20240926    gcc-14.1.0
nios2                 randconfig-002-20240925    gcc-14.1.0
nios2                 randconfig-002-20240926    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.1.0
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240925    gcc-14.1.0
parisc                randconfig-001-20240926    gcc-14.1.0
parisc                randconfig-002-20240925    gcc-14.1.0
parisc                randconfig-002-20240926    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    clang-20
powerpc                   bluestone_defconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                       holly_defconfig    gcc-14.1.0
powerpc                     kmeter1_defconfig    gcc-14.1.0
powerpc                       maple_defconfig    clang-20
powerpc                       maple_defconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                   microwatt_defconfig    clang-20
powerpc                 mpc8315_rdb_defconfig    gcc-14.1.0
powerpc                      pasemi_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                     rainier_defconfig    clang-20
powerpc               randconfig-001-20240925    gcc-14.1.0
powerpc               randconfig-001-20240926    gcc-14.1.0
powerpc               randconfig-002-20240925    clang-20
powerpc               randconfig-002-20240925    gcc-14.1.0
powerpc               randconfig-002-20240926    gcc-14.1.0
powerpc               randconfig-003-20240926    gcc-14.1.0
powerpc                     skiroot_defconfig    clang-20
powerpc                     stx_gp3_defconfig    clang-20
powerpc                     stx_gp3_defconfig    gcc-14.1.0
powerpc                     tqm5200_defconfig    clang-20
powerpc                     tqm5200_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc                     tqm8555_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig    clang-20
powerpc64             randconfig-001-20240925    gcc-14.1.0
powerpc64             randconfig-001-20240926    gcc-14.1.0
powerpc64             randconfig-002-20240925    clang-20
powerpc64             randconfig-002-20240925    gcc-14.1.0
powerpc64             randconfig-002-20240926    gcc-14.1.0
powerpc64             randconfig-003-20240925    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.1.0
riscv                 randconfig-001-20240925    clang-20
riscv                 randconfig-001-20240925    gcc-14.1.0
riscv                 randconfig-001-20240926    gcc-14.1.0
riscv                 randconfig-002-20240925    clang-20
riscv                 randconfig-002-20240925    gcc-14.1.0
riscv                 randconfig-002-20240926    gcc-14.1.0
s390                             alldefconfig    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20240925    clang-20
s390                  randconfig-001-20240925    gcc-14.1.0
s390                  randconfig-001-20240926    gcc-14.1.0
s390                  randconfig-002-20240925    gcc-14.1.0
s390                  randconfig-002-20240926    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.1.0
sh                ecovec24-romimage_defconfig    clang-20
sh                    randconfig-001-20240925    gcc-14.1.0
sh                    randconfig-001-20240926    gcc-14.1.0
sh                    randconfig-002-20240925    gcc-14.1.0
sh                    randconfig-002-20240926    gcc-14.1.0
sh                          rsk7203_defconfig    clang-20
sh                          rsk7203_defconfig    gcc-14.1.0
sh                           se7722_defconfig    clang-20
sh                   secureedge5410_defconfig    clang-20
sh                        sh7757lcr_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    gcc-14.1.0
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            alldefconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20240925    gcc-14.1.0
sparc64               randconfig-001-20240926    gcc-14.1.0
sparc64               randconfig-002-20240925    gcc-14.1.0
sparc64               randconfig-002-20240926    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240925    clang-20
um                    randconfig-001-20240925    gcc-14.1.0
um                    randconfig-001-20240926    gcc-14.1.0
um                    randconfig-002-20240925    clang-20
um                    randconfig-002-20240925    gcc-14.1.0
um                    randconfig-002-20240926    gcc-14.1.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240925    clang-18
x86_64      buildonly-randconfig-001-20240926    gcc-11
x86_64      buildonly-randconfig-002-20240925    clang-18
x86_64      buildonly-randconfig-002-20240926    gcc-11
x86_64      buildonly-randconfig-003-20240925    clang-18
x86_64      buildonly-randconfig-003-20240926    gcc-11
x86_64      buildonly-randconfig-004-20240925    clang-18
x86_64      buildonly-randconfig-004-20240926    gcc-11
x86_64      buildonly-randconfig-005-20240925    clang-18
x86_64      buildonly-randconfig-005-20240926    gcc-11
x86_64      buildonly-randconfig-006-20240925    clang-18
x86_64      buildonly-randconfig-006-20240926    gcc-11
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20240925    clang-18
x86_64                randconfig-001-20240926    gcc-11
x86_64                randconfig-002-20240925    clang-18
x86_64                randconfig-002-20240926    gcc-11
x86_64                randconfig-003-20240925    clang-18
x86_64                randconfig-003-20240926    gcc-11
x86_64                randconfig-004-20240925    clang-18
x86_64                randconfig-004-20240926    gcc-11
x86_64                randconfig-005-20240925    clang-18
x86_64                randconfig-005-20240926    gcc-11
x86_64                randconfig-006-20240925    clang-18
x86_64                randconfig-006-20240926    gcc-11
x86_64                randconfig-011-20240925    clang-18
x86_64                randconfig-011-20240926    gcc-11
x86_64                randconfig-012-20240925    clang-18
x86_64                randconfig-012-20240926    gcc-11
x86_64                randconfig-013-20240925    clang-18
x86_64                randconfig-013-20240926    gcc-11
x86_64                randconfig-014-20240925    clang-18
x86_64                randconfig-014-20240926    gcc-11
x86_64                randconfig-015-20240925    clang-18
x86_64                randconfig-015-20240926    gcc-11
x86_64                randconfig-016-20240925    clang-18
x86_64                randconfig-016-20240926    gcc-11
x86_64                randconfig-071-20240925    clang-18
x86_64                randconfig-071-20240926    gcc-11
x86_64                randconfig-072-20240925    clang-18
x86_64                randconfig-072-20240926    gcc-11
x86_64                randconfig-073-20240925    clang-18
x86_64                randconfig-073-20240926    gcc-11
x86_64                randconfig-074-20240925    clang-18
x86_64                randconfig-074-20240926    gcc-11
x86_64                randconfig-075-20240925    clang-18
x86_64                randconfig-075-20240926    gcc-11
x86_64                randconfig-076-20240925    clang-18
x86_64                randconfig-076-20240926    gcc-11
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240925    gcc-14.1.0
xtensa                randconfig-001-20240926    gcc-14.1.0
xtensa                randconfig-002-20240925    gcc-14.1.0
xtensa                randconfig-002-20240926    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
