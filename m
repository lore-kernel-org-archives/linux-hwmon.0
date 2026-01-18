Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237DC2222B7
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Jan 2026 06:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768716489; cv=none; b=butl3DPsLB89uKMlZgVrd3wn1gf3TAJTFMRBJweJTj2s3vv+o+FWq8qy3GfNloFh8T1sa+LpsKlz4Yw9y9D4L4ov/zB1ieaZq1SPexQajn77qotL5hrK7XXBjC/lLrCbybNLTjg/VkDxBrVargKrRD+DlssZAVKN8GDu0d33R54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768716489; c=relaxed/simple;
	bh=Z/ET4xwOVDhr2grgLl/UbnApPfOQZEW4bQwhKpsBuIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GSNEZG7sVa0LiGhiaLrZA3VuFAR47H8o7uHHcNEKjwVVkt9swG37W0DuzVsZdivNAKs9HvL6q7QtjSzpcdQqhJkeXIAomiFC69U/uGSrW+pfgB7GBwTKS79fXa9vhByIgWqCy9P9k8d555IkSGbeVtu8cXk14cwWppgPIS5Btbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceh0045n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceh0045n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768716488; x=1800252488;
  h=date:from:to:cc:subject:message-id;
  bh=Z/ET4xwOVDhr2grgLl/UbnApPfOQZEW4bQwhKpsBuIE=;
  b=ceh0045neUGbRKWeVxKPXcyebpcTx9JVJvckCntkDRsoYXeff6uigA58
   qEFEAdbFlmqQNkx6lOA7AIx8pvj1anf0sJDUQm1sznYl7tAdBTvquk+t4
   G0RL1gEwdqnIunxFjRLPWcNEJcdyWmxStBZz6Q4JBg3kbYyp3042moHY1
   S71D9Uj7y5wXd5HVDaTeJugzWU5KB8YWL6U/+MziKIQ1k+xMjwOWhap61
   Xrv6fgmmaZwVf16l8aaSMTHer8jX3gZU8YaQ2s8hcKccCxnPYlsMRUxlQ
   Uueu47LeVHkvjgbY2O4pOcub9fBrAEax9a6495Chir4wzpSvoWdp7AQBx
   g==;
X-CSE-ConnectionGUID: AuscWT6DTDqolmEnZPLpzg==
X-CSE-MsgGUID: ekSfLEJPS4+eI2vgxWUvxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69940811"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="69940811"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:08:08 -0800
X-CSE-ConnectionGUID: TDNv0ykpSlKk/kk7X0m+hg==
X-CSE-MsgGUID: vKLoPiakT4e3pm8CJyGPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205620581"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2026 22:08:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhLxD-00000000Mhg-41i7;
	Sun, 18 Jan 2026 06:08:03 +0000
Date: Sun, 18 Jan 2026 14:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 830e0bef79aaaea8b1ef426b8032e70c63a58653
Message-ID: <202601181416.iQrDyyGw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 830e0bef79aaaea8b1ef426b8032e70c63a58653  hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist

elapsed time: 758m

configs tested: 248
configs skipped: 5

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
arc                          axs103_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260118    gcc-13.4.0
arc                   randconfig-001-20260118    gcc-15.2.0
arc                   randconfig-002-20260118    gcc-14.3.0
arc                   randconfig-002-20260118    gcc-15.2.0
arc                    vdk_hs38_smp_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         axm55xx_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                         lpc32xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260118    gcc-10.5.0
arm                   randconfig-001-20260118    gcc-15.2.0
arm                   randconfig-002-20260118    gcc-15.2.0
arm                   randconfig-002-20260118    gcc-8.5.0
arm                   randconfig-003-20260118    clang-22
arm                   randconfig-003-20260118    gcc-15.2.0
arm                   randconfig-004-20260118    gcc-15.2.0
arm                           sama5_defconfig    gcc-15.2.0
arm                       spear13xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm64                            alldefconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260118    clang-17
arm64                 randconfig-002-20260118    clang-17
arm64                 randconfig-003-20260118    clang-17
arm64                 randconfig-004-20260118    clang-17
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260118    clang-17
csky                  randconfig-002-20260118    clang-17
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260118    clang-22
hexagon               randconfig-002-20260118    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260118    gcc-14
i386        buildonly-randconfig-002-20260118    clang-20
i386        buildonly-randconfig-002-20260118    gcc-14
i386        buildonly-randconfig-003-20260118    gcc-14
i386        buildonly-randconfig-004-20260118    gcc-14
i386        buildonly-randconfig-005-20260118    gcc-14
i386        buildonly-randconfig-006-20260118    clang-20
i386        buildonly-randconfig-006-20260118    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260118    gcc-14
i386                  randconfig-002-20260118    gcc-14
i386                  randconfig-003-20260118    gcc-14
i386                  randconfig-004-20260118    gcc-14
i386                  randconfig-005-20260118    gcc-14
i386                  randconfig-006-20260118    gcc-14
i386                  randconfig-007-20260118    gcc-14
i386                  randconfig-011-20260118    clang-20
i386                  randconfig-012-20260118    clang-20
i386                  randconfig-013-20260118    clang-20
i386                  randconfig-014-20260118    clang-20
i386                  randconfig-015-20260118    clang-20
i386                  randconfig-016-20260118    clang-20
i386                  randconfig-017-20260118    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260118    clang-22
loongarch             randconfig-002-20260118    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                        mvme147_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                           ip32_defconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-22
mips                     loongson2k_defconfig    clang-22
mips                         rt305x_defconfig    gcc-15.2.0
nios2                         10m50_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260118    clang-22
nios2                 randconfig-002-20260118    clang-22
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
parisc                randconfig-001-20260118    clang-22
parisc                randconfig-002-20260118    clang-22
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   bluestone_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    clang-22
powerpc               randconfig-001-20260118    clang-22
powerpc               randconfig-002-20260118    clang-22
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260118    clang-22
powerpc64             randconfig-002-20260118    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260118    gcc-15.2.0
riscv                 randconfig-002-20260118    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260118    gcc-15.2.0
s390                  randconfig-002-20260118    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    clang-22
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260118    gcc-15.2.0
sh                    randconfig-002-20260118    gcc-15.2.0
sh                          rsk7203_defconfig    gcc-15.2.0
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7724_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260118    gcc-12.5.0
sparc                 randconfig-001-20260118    gcc-13.4.0
sparc                 randconfig-002-20260118    gcc-12.5.0
sparc                 randconfig-002-20260118    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260118    gcc-12.5.0
sparc64               randconfig-002-20260118    gcc-12.5.0
sparc64               randconfig-002-20260118    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260118    clang-22
um                    randconfig-001-20260118    gcc-12.5.0
um                    randconfig-002-20260118    gcc-12.5.0
um                    randconfig-002-20260118    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260118    gcc-14
x86_64      buildonly-randconfig-002-20260118    clang-20
x86_64      buildonly-randconfig-002-20260118    gcc-14
x86_64      buildonly-randconfig-003-20260118    gcc-14
x86_64      buildonly-randconfig-004-20260118    gcc-14
x86_64      buildonly-randconfig-005-20260118    gcc-14
x86_64      buildonly-randconfig-006-20260118    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260118    gcc-14
x86_64                randconfig-002-20260118    gcc-14
x86_64                randconfig-003-20260118    gcc-14
x86_64                randconfig-004-20260118    gcc-14
x86_64                randconfig-005-20260118    gcc-14
x86_64                randconfig-006-20260118    gcc-14
x86_64                randconfig-011-20260118    gcc-12
x86_64                randconfig-011-20260118    gcc-14
x86_64                randconfig-012-20260118    gcc-14
x86_64                randconfig-013-20260118    gcc-14
x86_64                randconfig-014-20260118    gcc-14
x86_64                randconfig-015-20260118    clang-20
x86_64                randconfig-015-20260118    gcc-14
x86_64                randconfig-016-20260118    gcc-14
x86_64                randconfig-071-20260118    clang-20
x86_64                randconfig-072-20260118    clang-20
x86_64                randconfig-073-20260118    clang-20
x86_64                randconfig-074-20260118    clang-20
x86_64                randconfig-075-20260118    clang-20
x86_64                randconfig-076-20260118    clang-20
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
xtensa                randconfig-001-20260118    gcc-12.5.0
xtensa                randconfig-001-20260118    gcc-8.5.0
xtensa                randconfig-002-20260118    gcc-12.5.0
xtensa                randconfig-002-20260118    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
