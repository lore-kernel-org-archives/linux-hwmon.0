Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E112B89
	for <linux-hwmon@vger.kernel.org>; Sun, 10 Mar 2024 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710079032; cv=none; b=CCFXtlkSFK7TtEbRJbJpHETFK34KgZMianme3o/ki7dx975fC7qdfiK0XsGU2rvbtNOggStWxUpTKgB5YYNuFMXTsnGy3+mO4NFHqauzMpTYhj8sed31txGR7KETsC1z2pal7Nh4oh9b1uEqgEbqbl4Rz2WhxOdRvxqJAurLjDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710079032; c=relaxed/simple;
	bh=HEsjf8LsPBsDFUgdcHEsV+/tvYNDqufKoaN/buMv6jE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A+ZHcBy5JTb1NzCJ7x8ELhceRg4d7t9UkmaAiPUnYnKbA0GE8eucVM3o5G6DRM6Y4VQwNxplXaoqMJ2m+nUMiPES2yualbVVHrlRoffXbyJg/fHlp0aPIl8OtMzfLVeSAcnqmkuYc6SxxDxjTm68/stc6AkmH0O5+xQ4C/UxZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEIxVYtR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEIxVYtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710079031; x=1741615031;
  h=date:from:to:cc:subject:message-id;
  bh=HEsjf8LsPBsDFUgdcHEsV+/tvYNDqufKoaN/buMv6jE=;
  b=YEIxVYtRJAa1D0nf0vLMZMQvF2EQLnVugQufuZ89gTpKBgkx1/Syz4c2
   lfSEV43NBkYcL+g0LNdtsDM9Bdy9DFy4Y1y0k23VlfCrYjg/8plELl36g
   eVywRuewLMGOJN1xp2l5Z1tGUIKlWXdO+KVaPN2cxeGB6bpOjEV1/CdSo
   UsbeCBicrQaM3s0p1qMMyx4eS+cQJQ0G5+u6022lMFarb+9BHKd8p63U3
   QBcFgk/E6NP3kqwCQjii7vyOOi4JE8+Upri/iKbC2aEM7iHtAcrSeT2pp
   SrGKNDS1U0sLx78kQDrPlWUKcLiXvBCcuN7rWlT2KhLi3XLtCrtLN1shP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4630849"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="4630849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 06:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="34063425"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2024 06:57:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjJfn-0008I1-00;
	Sun, 10 Mar 2024 13:57:07 +0000
Date: Sun, 10 Mar 2024 21:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:kunit] BUILD SUCCESS
 48cb8d435f6b43ff2f67f615efd587c62ff544f1
Message-ID: <202403102114.PurUkOX4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git kunit
branch HEAD: 48cb8d435f6b43ff2f67f615efd587c62ff544f1  powerpc: Add support for suppressing warning backtraces

elapsed time: 726m

configs tested: 181
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240310   gcc  
arc                   randconfig-002-20240310   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   clang
arm                   randconfig-001-20240310   gcc  
arm                   randconfig-002-20240310   gcc  
arm                   randconfig-003-20240310   gcc  
arm                   randconfig-004-20240310   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240310   clang
arm64                 randconfig-002-20240310   gcc  
arm64                 randconfig-003-20240310   clang
arm64                 randconfig-004-20240310   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240310   gcc  
csky                  randconfig-002-20240310   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240310   clang
hexagon               randconfig-002-20240310   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240310   clang
i386         buildonly-randconfig-002-20240310   clang
i386         buildonly-randconfig-003-20240310   clang
i386         buildonly-randconfig-004-20240310   clang
i386         buildonly-randconfig-005-20240310   gcc  
i386         buildonly-randconfig-006-20240310   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240310   gcc  
i386                  randconfig-002-20240310   gcc  
i386                  randconfig-003-20240310   clang
i386                  randconfig-004-20240310   gcc  
i386                  randconfig-005-20240310   gcc  
i386                  randconfig-006-20240310   gcc  
i386                  randconfig-011-20240310   clang
i386                  randconfig-012-20240310   clang
i386                  randconfig-013-20240310   clang
i386                  randconfig-014-20240310   clang
i386                  randconfig-015-20240310   clang
i386                  randconfig-016-20240310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240310   gcc  
loongarch             randconfig-002-20240310   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                           ip22_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240310   gcc  
nios2                 randconfig-002-20240310   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240310   gcc  
parisc                randconfig-002-20240310   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc               randconfig-001-20240310   gcc  
powerpc               randconfig-002-20240310   clang
powerpc               randconfig-003-20240310   clang
powerpc64             randconfig-001-20240310   gcc  
powerpc64             randconfig-002-20240310   gcc  
powerpc64             randconfig-003-20240310   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240310   gcc  
riscv                 randconfig-002-20240310   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240310   clang
s390                  randconfig-002-20240310   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240310   gcc  
sh                    randconfig-002-20240310   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240310   gcc  
sparc64               randconfig-002-20240310   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240310   gcc  
um                    randconfig-002-20240310   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240310   clang
x86_64       buildonly-randconfig-002-20240310   gcc  
x86_64       buildonly-randconfig-003-20240310   clang
x86_64       buildonly-randconfig-004-20240310   gcc  
x86_64       buildonly-randconfig-005-20240310   clang
x86_64       buildonly-randconfig-006-20240310   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240310   clang
x86_64                randconfig-002-20240310   gcc  
x86_64                randconfig-003-20240310   gcc  
x86_64                randconfig-004-20240310   gcc  
x86_64                randconfig-005-20240310   clang
x86_64                randconfig-006-20240310   gcc  
x86_64                randconfig-011-20240310   gcc  
x86_64                randconfig-012-20240310   clang
x86_64                randconfig-013-20240310   clang
x86_64                randconfig-014-20240310   gcc  
x86_64                randconfig-015-20240310   clang
x86_64                randconfig-016-20240310   gcc  
x86_64                randconfig-071-20240310   gcc  
x86_64                randconfig-072-20240310   gcc  
x86_64                randconfig-073-20240310   gcc  
x86_64                randconfig-074-20240310   gcc  
x86_64                randconfig-075-20240310   clang
x86_64                randconfig-076-20240310   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240310   gcc  
xtensa                randconfig-002-20240310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
