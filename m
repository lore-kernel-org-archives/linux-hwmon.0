Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3162ED502
	for <linux-hwmon@vger.kernel.org>; Sun, 21 Jul 2024 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721554098; cv=none; b=FvSw08pU/lKx4ZQyjXVhcrYTMjQ03U6T0GRLy4KqXJtuIYys/uf/TS0Bw02FJUrIgA9epfOZ2IbdZ49a1b7xSCNJHH5RURxim8zqPEMctKuFFRrIZ7eFSnlPxRp+hNRp0Roaq668TYPg2VOeHaY7gWT0R9cSlws6KHwdOmPwFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721554098; c=relaxed/simple;
	bh=4CGSSrUcl7nfpKvPzN1TnCTK0XLDNAoHVOlWyU5qzyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e4az3L0mZMbZDDPPYQgTShf/qglAF4RbSlQRrfDe/Flx9rQAN1U/fBv3D5RgWKBGGMUNw1Z1cnxZlK5jvf4LvaxEZopBGljwa6ymfBZR+zt2RbBlSZYyxXDvvbuNHhS20mqwlVLxqd/wG2hfJjcmQaI6kFc0io6cXBD6N4KNljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVNvP+qN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVNvP+qN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721554096; x=1753090096;
  h=date:from:to:cc:subject:message-id;
  bh=4CGSSrUcl7nfpKvPzN1TnCTK0XLDNAoHVOlWyU5qzyI=;
  b=ZVNvP+qNFGe9FbVvtOTl59jQQHnZNkP9kQcUgRARFAniFBt0/kUnLV7l
   8oewB/6atf1kzrqG/ClIPh0WHYy1YWlK9Bz6gYRWxWfGpluT8l8DVB4eT
   zTp5DbhKGVmO5FsG6SO5JI6rP6oSkYnpoLahuu8KOjHv7Fk+yth50v1aL
   pWrziCGdif4BjkF0PiHDEf8BdFclIgRKSz8tN5uKe7EW+Djruhby0vVjX
   0NGqemUP1M1yITW6dIh2JIPtFLu7RraeL+yFMoRif7UPSj+wtLVPWeUGc
   4nuoByPwyPm+tjm6S2c6EcstOuDeHUCsb9zmhLz5uEtEY5coEzXYzXy/w
   Q==;
X-CSE-ConnectionGUID: 0MLeuxarQryViLsWv1h4JQ==
X-CSE-MsgGUID: 7ZMw2/q/RliwxMbjuGDuEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18836816"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="18836816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 02:28:15 -0700
X-CSE-ConnectionGUID: j7n/tpgnSaaQAlmJd6S6ug==
X-CSE-MsgGUID: y0+pTiPkSm+GBsDx+0nyug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51843627"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2024 02:28:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVSrT-000kAI-32;
	Sun, 21 Jul 2024 09:28:11 +0000
Date: Sun, 21 Jul 2024 17:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 92cdd512c107ed9cac65ac5b95cc35a3bb80beba
Message-ID: <202407211747.DAzih69i-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 92cdd512c107ed9cac65ac5b95cc35a3bb80beba  Merge branch 'kunit-improvements' into testing

elapsed time: 724m

configs tested: 198
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240721   gcc-13.2.0
arc                   randconfig-002-20240721   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                        multi_v7_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240721   gcc-14.1.0
arm                   randconfig-002-20240721   gcc-14.1.0
arm                   randconfig-003-20240721   gcc-14.1.0
arm                   randconfig-004-20240721   gcc-14.1.0
arm                           sama5_defconfig   gcc-13.2.0
arm                        spear6xx_defconfig   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240721   gcc-14.1.0
arm64                 randconfig-002-20240721   gcc-14.1.0
arm64                 randconfig-003-20240721   gcc-14.1.0
arm64                 randconfig-004-20240721   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240721   gcc-14.1.0
csky                  randconfig-002-20240721   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240721   clang-19
hexagon               randconfig-002-20240721   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240721   gcc-8
i386         buildonly-randconfig-002-20240721   clang-18
i386         buildonly-randconfig-003-20240721   clang-18
i386         buildonly-randconfig-004-20240721   clang-18
i386         buildonly-randconfig-005-20240721   gcc-13
i386         buildonly-randconfig-006-20240721   gcc-8
i386                                defconfig   clang-18
i386                  randconfig-001-20240721   gcc-8
i386                  randconfig-002-20240721   gcc-10
i386                  randconfig-003-20240721   gcc-13
i386                  randconfig-004-20240721   clang-18
i386                  randconfig-005-20240721   gcc-13
i386                  randconfig-006-20240721   gcc-13
i386                  randconfig-011-20240721   gcc-13
i386                  randconfig-012-20240721   clang-18
i386                  randconfig-013-20240721   gcc-11
i386                  randconfig-014-20240721   gcc-13
i386                  randconfig-015-20240721   gcc-11
i386                  randconfig-016-20240721   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240721   gcc-14.1.0
loongarch             randconfig-002-20240721   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-14.1.0
m68k                          sun3x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath25_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   clang-19
mips                  decstation_64_defconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                           gcw0_defconfig   gcc-13.2.0
mips                           ip30_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240721   gcc-14.1.0
nios2                 randconfig-002-20240721   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                    or1ksim_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240721   gcc-14.1.0
parisc                randconfig-002-20240721   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                      arches_defconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   clang-17
powerpc                        cell_defconfig   gcc-14.1.0
powerpc                   currituck_defconfig   clang-19
powerpc                      mgcoge_defconfig   clang-19
powerpc                      ppc6xx_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240721   gcc-14.1.0
powerpc               randconfig-002-20240721   clang-16
powerpc               randconfig-003-20240721   clang-19
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240721   gcc-14.1.0
powerpc64             randconfig-002-20240721   gcc-14.1.0
powerpc64             randconfig-003-20240721   clang-19
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240721   clang-19
riscv                 randconfig-002-20240721   gcc-14.1.0
s390                             alldefconfig   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240721   clang-19
s390                  randconfig-002-20240721   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-14.1.0
sh                          r7780mp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240721   gcc-14.1.0
sh                    randconfig-002-20240721   gcc-14.1.0
sh                           se7750_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240721   gcc-14.1.0
sparc64               randconfig-002-20240721   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240721   gcc-13
um                    randconfig-002-20240721   gcc-13
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240721   clang-18
x86_64       buildonly-randconfig-002-20240721   clang-18
x86_64       buildonly-randconfig-003-20240721   gcc-13
x86_64       buildonly-randconfig-004-20240721   clang-18
x86_64       buildonly-randconfig-005-20240721   clang-18
x86_64       buildonly-randconfig-006-20240721   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240721   gcc-13
x86_64                randconfig-002-20240721   clang-18
x86_64                randconfig-003-20240721   clang-18
x86_64                randconfig-004-20240721   gcc-13
x86_64                randconfig-005-20240721   gcc-9
x86_64                randconfig-006-20240721   clang-18
x86_64                randconfig-011-20240721   clang-18
x86_64                randconfig-012-20240721   gcc-8
x86_64                randconfig-013-20240721   gcc-8
x86_64                randconfig-014-20240721   gcc-13
x86_64                randconfig-015-20240721   clang-18
x86_64                randconfig-016-20240721   gcc-13
x86_64                randconfig-071-20240721   clang-18
x86_64                randconfig-072-20240721   clang-18
x86_64                randconfig-073-20240721   gcc-8
x86_64                randconfig-074-20240721   clang-18
x86_64                randconfig-075-20240721   gcc-13
x86_64                randconfig-076-20240721   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240721   gcc-14.1.0
xtensa                randconfig-002-20240721   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
