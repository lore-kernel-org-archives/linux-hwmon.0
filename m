Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B9320370D
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Dec 2024 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148381; cv=none; b=oT0BjKYfcnLoIDRrCwcav3f/YviqJesV04XCf4XnsShir+1RWMEdhstbNbkiBECQjNUrxDUIxMGT3XMBXMYtlima9LzJHklQ9qQUEy+ed1zjVTp4HCf0T7s07za1rwcJhEqWUdNrHJdaETbNNzn4pjWSaOYS8qNOg1tGlHX7fQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148381; c=relaxed/simple;
	bh=ttz0HHSnAT969y1k/9Vq7+ziJkVe3O+3eHkU/MPbroY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=US77ZeTr2Oq84JEJPDsUxmDbD/oJQSJjIRbmYE1ErKNwQbXE+M3JztrrVTKpvXTSlWDrG0r5vyvTMi1TvCenS1ewCmImi9fJAmPr3TcSolzMNBQz5BiirzGBqKtvPe6rJIu4m3R3YlPJf94pJokN/cD6S5VvAh8ldr6AGUaw6wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYOK79CK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYOK79CK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733148380; x=1764684380;
  h=date:from:to:cc:subject:message-id;
  bh=ttz0HHSnAT969y1k/9Vq7+ziJkVe3O+3eHkU/MPbroY=;
  b=JYOK79CKyCkNEtP8mSMjkLg1rGnZmnm6r1/UDuHkbTebApVoQg9yjmRG
   NHzdk+ge5ETWYUKPoRzE2bja2SoqsrwJnI5yVIXuTHhv4y4neHIGD3DrL
   zVEcd/G37cogg1TCHLy5LadMeynkM1QJRffuzS8iewRs9OpIKTb/YRrlt
   B3A50ke59JMfXeWY7839p4T49NcGt4ywV9TXDvJZdNgHMCORXVVD6sZ/O
   tBFv5Zy0Dn7OMNiYx0MEMr59Qj63nVN6m0z0yW+KENEFi/Z0W/NiPqIq2
   nRpRVhS40N9qx7sQHrj1IHi1UeTUyk+OoEFmrDFNSMMa1/jqQEvYLDEtI
   g==;
X-CSE-ConnectionGUID: Kx2ZM7NeT7yY7FkwbcZEwQ==
X-CSE-MsgGUID: IMJ1cRxRRw+y2rYdxWppUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="55806080"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="55806080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:06:18 -0800
X-CSE-ConnectionGUID: 7vTj/3OQR/SfcGemAcKLpQ==
X-CSE-MsgGUID: ju8itG60SHqD4l9qZQ8pxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93286117"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2024 06:06:17 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI742-0002TZ-2x;
	Mon, 02 Dec 2024 14:06:14 +0000
Date: Mon, 02 Dec 2024 22:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 a7f3166624f6e06c896178fb045a424ef5499858
Message-ID: <202412022238.OaINBV33-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: a7f3166624f6e06c896178fb045a424ef5499858  Merge branch 'fixes-v6.13' into testing

elapsed time: 790m

configs tested: 137
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241202    gcc-13.2.0
arc                   randconfig-001-20241202    gcc-14.2.0
arc                   randconfig-002-20241202    gcc-13.2.0
arc                   randconfig-002-20241202    gcc-14.2.0
arc                        vdk_hs38_defconfig    clang-14
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241202    gcc-14.2.0
arm                   randconfig-002-20241202    clang-20
arm                   randconfig-002-20241202    gcc-14.2.0
arm                   randconfig-003-20241202    gcc-14.2.0
arm                   randconfig-004-20241202    clang-20
arm                   randconfig-004-20241202    gcc-14.2.0
arm                         s5pv210_defconfig    clang-14
arm                        spear6xx_defconfig    clang-14
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241202    gcc-14.2.0
arm64                 randconfig-002-20241202    gcc-14.2.0
arm64                 randconfig-003-20241202    gcc-14.2.0
arm64                 randconfig-004-20241202    clang-14
arm64                 randconfig-004-20241202    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241202    clang-19
i386        buildonly-randconfig-001-20241202    gcc-12
i386        buildonly-randconfig-002-20241202    clang-19
i386        buildonly-randconfig-002-20241202    gcc-12
i386        buildonly-randconfig-003-20241202    clang-19
i386        buildonly-randconfig-003-20241202    gcc-12
i386        buildonly-randconfig-004-20241202    clang-19
i386        buildonly-randconfig-005-20241202    clang-19
i386        buildonly-randconfig-006-20241202    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    clang-20
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-14
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                           ip30_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-20
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    clang-14
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-14
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    clang-14
powerpc                    mvme5100_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    clang-14
powerpc                     tqm8555_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7780_defconfig    clang-14
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    clang-20
sh                              ul2_defconfig    clang-14
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                           x86_64_defconfig    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241202    clang-19
x86_64      buildonly-randconfig-002-20241202    clang-19
x86_64      buildonly-randconfig-002-20241202    gcc-12
x86_64      buildonly-randconfig-003-20241202    clang-19
x86_64      buildonly-randconfig-003-20241202    gcc-12
x86_64      buildonly-randconfig-004-20241202    clang-19
x86_64      buildonly-randconfig-005-20241202    clang-19
x86_64      buildonly-randconfig-005-20241202    gcc-12
x86_64      buildonly-randconfig-006-20241202    clang-19
x86_64      buildonly-randconfig-006-20241202    gcc-12
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
