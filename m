Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF9146D6A
	for <linux-hwmon@vger.kernel.org>; Thu,  8 May 2025 04:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746678104; cv=none; b=f+rgKjk/Bh08MDjcZTZMsFlmJDt3ACskVTSceusRKW1QltNTghKxjkSPiI06eQm5RXn9x7Gg07A8VKUXeD/ywwqTsfFSxAtvbsAWkl5orAsM37pKCGI8WPvuFH9+ZRctCKPMREwA08RFxW+OcVDxmPzrYJj60+g4nfMnMP/H1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746678104; c=relaxed/simple;
	bh=WJ4/leTnteQtxyGJto3ELS3XkopSdiZypyvYzo+JpTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U2RfOX452bxX1MlRIfYI1kXII9TK6tNvDIup2hWbknIxmJeXmafMX8tkOjlbGeY0PWsuVTQ0Izl/SQlPnDEhUE3f1whyWyNmQRzObAUT5pFZAFlfO7GPtEqc8vuvbw7F+z1a6zY/2c+T4iQTFtFvwe5K8//hidoQY7Uwr1wSZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6wK2saY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6wK2saY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746678103; x=1778214103;
  h=date:from:to:cc:subject:message-id;
  bh=WJ4/leTnteQtxyGJto3ELS3XkopSdiZypyvYzo+JpTw=;
  b=W6wK2saYlsYs6IJg7qyarbTErbohBgp9C842w01HF55YXuG6nlZ2962A
   nP8a3u0biCkuhT88zWNSs6XfMgaWG7iQhm5bSI0UGHWuETsOoA/BW9xjP
   qChFvafrDrw+CE1Fk9z5MU5Qyc7OyxlnV7hCeHQpxlLraC347PNydvb1c
   B4OnLkrpD3gwoUG6Nffzqv0jKuXM2tcHPFCbdkRVStoJ61x9Ks65mkPHl
   J6e052+0XA98J1dO7Mr3U5dpWrnuDsq+wIatO4omu7+pc+9NGYtCMLyCV
   AvjmbL3Fg1yD96vxARB0vtY7hX5bxfog4L+eM+ft4s+MdhjXlR1MzlnM5
   Q==;
X-CSE-ConnectionGUID: i4r+Bq77QcGZerZK79DMrg==
X-CSE-MsgGUID: RLlBLIH2SGuwhRa5ns8Rig==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51097741"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="51097741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:21:41 -0700
X-CSE-ConnectionGUID: YtC2132PSj+PwQe9kaDMxQ==
X-CSE-MsgGUID: ngrcinymTcyW0e9ydbm9Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="140205884"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 21:21:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCslN-000A1A-33;
	Thu, 08 May 2025 04:21:37 +0000
Date: Thu, 08 May 2025 12:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 aa6cacb8ea96e340f4ed41a4b8a33ef2968bf839
Message-ID: <202505081208.3LeE3L8j-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: aa6cacb8ea96e340f4ed41a4b8a33ef2968bf839  Merge branch 'fixes-v6.15' into testing

elapsed time: 13691m

configs tested: 394
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250429    gcc-13.3.0
arc                   randconfig-001-20250429    gcc-14.2.0
arc                   randconfig-001-20250502    gcc-8.5.0
arc                   randconfig-002-20250429    gcc-14.2.0
arc                   randconfig-002-20250502    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                        clps711x_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                      integrator_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-16
arm                        multi_v5_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-21
arm                   randconfig-001-20250429    gcc-14.2.0
arm                   randconfig-001-20250429    gcc-7.5.0
arm                   randconfig-001-20250502    gcc-8.5.0
arm                   randconfig-002-20250429    clang-20
arm                   randconfig-002-20250429    gcc-14.2.0
arm                   randconfig-002-20250502    gcc-8.5.0
arm                   randconfig-003-20250429    gcc-10.5.0
arm                   randconfig-003-20250429    gcc-14.2.0
arm                   randconfig-003-20250502    gcc-8.5.0
arm                   randconfig-004-20250429    clang-21
arm                   randconfig-004-20250429    gcc-14.2.0
arm                   randconfig-004-20250502    gcc-8.5.0
arm                        spear6xx_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    clang-21
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250429    gcc-14.2.0
arm64                 randconfig-001-20250429    gcc-7.5.0
arm64                 randconfig-001-20250502    gcc-8.5.0
arm64                 randconfig-002-20250429    clang-21
arm64                 randconfig-002-20250429    gcc-14.2.0
arm64                 randconfig-002-20250502    gcc-8.5.0
arm64                 randconfig-003-20250429    gcc-14.2.0
arm64                 randconfig-003-20250429    gcc-9.5.0
arm64                 randconfig-003-20250502    gcc-8.5.0
arm64                 randconfig-004-20250429    gcc-14.2.0
arm64                 randconfig-004-20250429    gcc-9.5.0
arm64                 randconfig-004-20250502    gcc-8.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250429    clang-21
csky                  randconfig-001-20250429    gcc-14.2.0
csky                  randconfig-001-20250502    gcc-8.5.0
csky                  randconfig-001-20250503    gcc-8.5.0
csky                  randconfig-002-20250429    clang-21
csky                  randconfig-002-20250429    gcc-14.2.0
csky                  randconfig-002-20250502    gcc-8.5.0
csky                  randconfig-002-20250503    gcc-8.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250429    clang-21
hexagon               randconfig-001-20250502    gcc-8.5.0
hexagon               randconfig-001-20250503    gcc-8.5.0
hexagon               randconfig-002-20250429    clang-21
hexagon               randconfig-002-20250502    gcc-8.5.0
hexagon               randconfig-002-20250503    gcc-8.5.0
i386                             alldefconfig    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250429    clang-20
i386        buildonly-randconfig-001-20250429    gcc-12
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-001-20250503    clang-20
i386        buildonly-randconfig-002-20250429    clang-20
i386        buildonly-randconfig-002-20250429    gcc-11
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-002-20250503    clang-20
i386        buildonly-randconfig-003-20250429    clang-20
i386        buildonly-randconfig-003-20250429    gcc-12
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-003-20250503    clang-20
i386        buildonly-randconfig-004-20250429    clang-20
i386        buildonly-randconfig-004-20250429    gcc-12
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-005-20250429    clang-20
i386        buildonly-randconfig-005-20250502    clang-20
i386        buildonly-randconfig-005-20250503    clang-20
i386        buildonly-randconfig-006-20250429    clang-20
i386        buildonly-randconfig-006-20250429    gcc-12
i386        buildonly-randconfig-006-20250502    clang-20
i386        buildonly-randconfig-006-20250503    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250429    gcc-12
i386                  randconfig-001-20250502    clang-20
i386                  randconfig-001-20250503    clang-20
i386                  randconfig-002-20250429    gcc-12
i386                  randconfig-002-20250502    clang-20
i386                  randconfig-002-20250503    clang-20
i386                  randconfig-003-20250429    gcc-12
i386                  randconfig-003-20250502    clang-20
i386                  randconfig-003-20250503    clang-20
i386                  randconfig-004-20250429    gcc-12
i386                  randconfig-004-20250502    clang-20
i386                  randconfig-004-20250503    clang-20
i386                  randconfig-005-20250429    gcc-12
i386                  randconfig-005-20250502    clang-20
i386                  randconfig-005-20250503    clang-20
i386                  randconfig-006-20250429    gcc-12
i386                  randconfig-006-20250502    clang-20
i386                  randconfig-006-20250503    clang-20
i386                  randconfig-007-20250429    gcc-12
i386                  randconfig-007-20250502    clang-20
i386                  randconfig-007-20250503    clang-20
i386                  randconfig-011-20250429    clang-20
i386                  randconfig-011-20250502    gcc-12
i386                  randconfig-011-20250503    clang-20
i386                  randconfig-012-20250429    clang-20
i386                  randconfig-012-20250502    gcc-12
i386                  randconfig-012-20250503    clang-20
i386                  randconfig-013-20250429    clang-20
i386                  randconfig-013-20250502    gcc-12
i386                  randconfig-013-20250503    clang-20
i386                  randconfig-014-20250429    clang-20
i386                  randconfig-014-20250502    gcc-12
i386                  randconfig-014-20250503    clang-20
i386                  randconfig-015-20250429    clang-20
i386                  randconfig-015-20250502    gcc-12
i386                  randconfig-015-20250503    clang-20
i386                  randconfig-016-20250429    clang-20
i386                  randconfig-016-20250502    gcc-12
i386                  randconfig-016-20250503    clang-20
i386                  randconfig-017-20250429    clang-20
i386                  randconfig-017-20250502    gcc-12
i386                  randconfig-017-20250503    clang-20
loongarch                        alldefconfig    clang-16
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250429    clang-21
loongarch             randconfig-001-20250429    gcc-14.2.0
loongarch             randconfig-001-20250502    gcc-8.5.0
loongarch             randconfig-001-20250503    gcc-8.5.0
loongarch             randconfig-002-20250429    clang-21
loongarch             randconfig-002-20250429    gcc-13.3.0
loongarch             randconfig-002-20250502    gcc-8.5.0
loongarch             randconfig-002-20250503    gcc-8.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    clang-21
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
mips                      maltaaprp_defconfig    clang-21
mips                        maltaup_defconfig    clang-16
mips                         rt305x_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250429    clang-21
nios2                 randconfig-001-20250429    gcc-11.5.0
nios2                 randconfig-001-20250502    gcc-8.5.0
nios2                 randconfig-001-20250503    gcc-8.5.0
nios2                 randconfig-002-20250429    clang-21
nios2                 randconfig-002-20250429    gcc-7.5.0
nios2                 randconfig-002-20250502    gcc-8.5.0
nios2                 randconfig-002-20250503    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250429    clang-21
parisc                randconfig-001-20250429    gcc-14.2.0
parisc                randconfig-001-20250502    gcc-8.5.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250429    clang-21
parisc                randconfig-002-20250429    gcc-10.5.0
parisc                randconfig-002-20250502    gcc-8.5.0
parisc                randconfig-002-20250503    gcc-8.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-16
powerpc                 mpc832x_rdb_defconfig    clang-16
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250429    clang-21
powerpc               randconfig-001-20250502    gcc-8.5.0
powerpc               randconfig-001-20250503    gcc-8.5.0
powerpc               randconfig-002-20250429    clang-21
powerpc               randconfig-002-20250502    gcc-8.5.0
powerpc               randconfig-002-20250503    gcc-8.5.0
powerpc               randconfig-003-20250429    clang-21
powerpc               randconfig-003-20250502    gcc-8.5.0
powerpc               randconfig-003-20250503    gcc-8.5.0
powerpc                    socrates_defconfig    clang-21
powerpc                     tqm8560_defconfig    clang-16
powerpc64             randconfig-001-20250429    clang-21
powerpc64             randconfig-001-20250502    gcc-8.5.0
powerpc64             randconfig-001-20250503    gcc-8.5.0
powerpc64             randconfig-002-20250429    clang-21
powerpc64             randconfig-002-20250502    gcc-8.5.0
powerpc64             randconfig-002-20250503    gcc-8.5.0
powerpc64             randconfig-003-20250429    clang-21
powerpc64             randconfig-003-20250429    gcc-7.5.0
powerpc64             randconfig-003-20250502    gcc-8.5.0
powerpc64             randconfig-003-20250503    gcc-8.5.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250429    gcc-14.2.0
riscv                 randconfig-001-20250502    gcc-13.3.0
riscv                 randconfig-001-20250503    gcc-10.5.0
riscv                 randconfig-002-20250429    clang-18
riscv                 randconfig-002-20250502    gcc-13.3.0
riscv                 randconfig-002-20250503    gcc-10.5.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250429    clang-21
s390                  randconfig-001-20250502    gcc-13.3.0
s390                  randconfig-001-20250503    gcc-10.5.0
s390                  randconfig-002-20250429    clang-17
s390                  randconfig-002-20250502    gcc-13.3.0
s390                  randconfig-002-20250503    gcc-10.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    clang-21
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250429    gcc-5.5.0
sh                    randconfig-001-20250502    gcc-13.3.0
sh                    randconfig-001-20250503    gcc-10.5.0
sh                    randconfig-002-20250429    gcc-13.3.0
sh                    randconfig-002-20250502    gcc-13.3.0
sh                    randconfig-002-20250503    gcc-10.5.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    clang-21
sh                   rts7751r2dplus_defconfig    clang-16
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250429    gcc-12.4.0
sparc                 randconfig-001-20250502    gcc-13.3.0
sparc                 randconfig-001-20250503    gcc-10.5.0
sparc                 randconfig-002-20250429    gcc-10.3.0
sparc                 randconfig-002-20250502    gcc-13.3.0
sparc                 randconfig-002-20250503    gcc-10.5.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250429    gcc-12.4.0
sparc64               randconfig-001-20250502    gcc-13.3.0
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-002-20250429    gcc-8.5.0
sparc64               randconfig-002-20250502    gcc-13.3.0
sparc64               randconfig-002-20250503    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250429    clang-18
um                    randconfig-001-20250502    gcc-13.3.0
um                    randconfig-001-20250503    gcc-10.5.0
um                    randconfig-002-20250429    gcc-12
um                    randconfig-002-20250502    gcc-13.3.0
um                    randconfig-002-20250503    gcc-10.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250429    clang-20
x86_64      buildonly-randconfig-001-20250429    gcc-12
x86_64      buildonly-randconfig-001-20250502    clang-20
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250429    clang-20
x86_64      buildonly-randconfig-002-20250429    gcc-12
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250429    clang-20
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250429    clang-20
x86_64      buildonly-randconfig-004-20250429    gcc-12
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250429    clang-20
x86_64      buildonly-randconfig-005-20250502    clang-20
x86_64      buildonly-randconfig-005-20250503    gcc-12
x86_64      buildonly-randconfig-006-20250429    clang-20
x86_64      buildonly-randconfig-006-20250429    gcc-12
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64      buildonly-randconfig-006-20250503    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250429    clang-20
x86_64                randconfig-001-20250502    clang-20
x86_64                randconfig-001-20250503    clang-20
x86_64                randconfig-002-20250429    clang-20
x86_64                randconfig-002-20250502    clang-20
x86_64                randconfig-002-20250503    clang-20
x86_64                randconfig-003-20250429    clang-20
x86_64                randconfig-003-20250502    clang-20
x86_64                randconfig-003-20250503    clang-20
x86_64                randconfig-004-20250429    clang-20
x86_64                randconfig-004-20250502    clang-20
x86_64                randconfig-004-20250503    clang-20
x86_64                randconfig-005-20250429    clang-20
x86_64                randconfig-005-20250502    clang-20
x86_64                randconfig-005-20250503    clang-20
x86_64                randconfig-006-20250429    clang-20
x86_64                randconfig-006-20250502    clang-20
x86_64                randconfig-006-20250503    clang-20
x86_64                randconfig-007-20250429    clang-20
x86_64                randconfig-007-20250502    clang-20
x86_64                randconfig-007-20250503    clang-20
x86_64                randconfig-008-20250429    clang-20
x86_64                randconfig-008-20250502    clang-20
x86_64                randconfig-008-20250503    clang-20
x86_64                randconfig-071-20250429    gcc-12
x86_64                randconfig-071-20250502    clang-20
x86_64                randconfig-071-20250503    clang-20
x86_64                randconfig-072-20250429    gcc-12
x86_64                randconfig-072-20250502    clang-20
x86_64                randconfig-072-20250503    clang-20
x86_64                randconfig-073-20250429    gcc-12
x86_64                randconfig-073-20250502    clang-20
x86_64                randconfig-073-20250503    clang-20
x86_64                randconfig-074-20250429    gcc-12
x86_64                randconfig-074-20250502    clang-20
x86_64                randconfig-074-20250503    clang-20
x86_64                randconfig-075-20250429    gcc-12
x86_64                randconfig-075-20250502    clang-20
x86_64                randconfig-075-20250503    clang-20
x86_64                randconfig-076-20250429    gcc-12
x86_64                randconfig-076-20250502    clang-20
x86_64                randconfig-076-20250503    clang-20
x86_64                randconfig-077-20250429    gcc-12
x86_64                randconfig-077-20250502    clang-20
x86_64                randconfig-077-20250503    clang-20
x86_64                randconfig-078-20250429    gcc-12
x86_64                randconfig-078-20250502    clang-20
x86_64                randconfig-078-20250503    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250429    gcc-14.2.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-002-20250429    gcc-8.5.0
xtensa                randconfig-002-20250502    gcc-13.3.0
xtensa                randconfig-002-20250503    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
