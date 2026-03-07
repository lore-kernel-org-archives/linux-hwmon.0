Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF823EA93
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 17:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904649; cv=none; b=Odi9j/w9OgaOejaXHpSEN4fUG85FNK2g9VqrTiToIggyq60h8ED20oNOO5MR1RJbabuTWE7QaRVV833c7MZgNI+EW0xVCMgTOY8uc3PtHesZ9pN/LbAnh+LO2muJWCaauIxwVPchxr1ogJ5//A/2kc7D5IKywB7uN6SieyFLvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904649; c=relaxed/simple;
	bh=4Sjy4Q+iOn29zzJ+SaD5xCeYzkEJs8VLzM19KxFBLfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVFZaHlzRf4b29qdXAL4RZGrwWylQcRwfj5XepuBNfJdGh1128ksIYvLomZx+2plnXqLrDxbZrMZ71H5+u4ulBN3cSlr4yH3i4Ua9dIP4VFq/67kZcWP/imCdvDuLmB+UtPIb/BbgBEkI1XAtX9utVhFjChYFYSR3EUZgFROxkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvP955kn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvP955kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772904649; x=1804440649;
  h=date:from:to:cc:subject:message-id;
  bh=4Sjy4Q+iOn29zzJ+SaD5xCeYzkEJs8VLzM19KxFBLfQ=;
  b=gvP955knEDNUPJ+VqR71c/8VVokBCiBBDyfWj1y2BgjGNdC4AbcJMH2f
   XtNwH262UiWqB3OfVAyxi3BnZBh2tD4CIoiuFQqy/Ac14plQbK4Bl+FqO
   llqZj4xH8hINIBlo25ZV8yMeDoL8eF9kc/jwNgnTKY5v7Ky6P5BcM7TJY
   42P5Hok6R2X8HbjJSRNfNf+NPsrS8a/hpr541S2Wdw/KniB+XF2IaZE6X
   pE3LiZHuKDbi8bNw474dbirJNwbD37cDJ9UE/fZMJF40oOuCPdO4K13bw
   ZqQbjt6zMbrH0iwqch6gj10OExRmdY2kD77atUluvofb0S/5z9cx/xjAW
   g==;
X-CSE-ConnectionGUID: rt5MD7wdRpmeizD5h8CqSQ==
X-CSE-MsgGUID: oXXY0VM0Rg6yYvOdegmh7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73686245"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="73686245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 09:30:48 -0800
X-CSE-ConnectionGUID: 1NZwxz0PSzOZfNiC83Gthg==
X-CSE-MsgGUID: SJtSvGdvRKmCLAMoEksPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="218534886"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 09:30:47 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyvUC-000000002O1-0vA1;
	Sat, 07 Mar 2026 17:30:44 +0000
Date: Sun, 08 Mar 2026 01:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 86df46cf3cba914a9a94314360a0707d15e92b3e
Message-ID: <202603080138.UTgijezp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 86df46cf3cba914a9a94314360a0707d15e92b3e  hwmon: (pmbus/max16601) Remove use of i2c_match_id()

elapsed time: 1369m

configs tested: 221
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260307    gcc-15.2.0
arc                   randconfig-002-20260307    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260307    gcc-15.2.0
arm                   randconfig-002-20260307    gcc-15.2.0
arm                   randconfig-003-20260307    gcc-15.2.0
arm                   randconfig-004-20260307    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260307    gcc-8.5.0
arm64                 randconfig-002-20260307    gcc-8.5.0
arm64                 randconfig-003-20260307    gcc-8.5.0
arm64                 randconfig-004-20260307    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260307    gcc-8.5.0
csky                  randconfig-002-20260307    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260307    clang-23
hexagon               randconfig-001-20260307    gcc-15.2.0
hexagon               randconfig-002-20260307    clang-23
hexagon               randconfig-002-20260307    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260307    gcc-14
i386        buildonly-randconfig-002-20260307    gcc-14
i386        buildonly-randconfig-003-20260307    gcc-12
i386        buildonly-randconfig-003-20260307    gcc-14
i386        buildonly-randconfig-004-20260307    clang-20
i386        buildonly-randconfig-004-20260307    gcc-14
i386        buildonly-randconfig-005-20260307    gcc-14
i386        buildonly-randconfig-006-20260307    clang-20
i386        buildonly-randconfig-006-20260307    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260307    clang-20
i386                  randconfig-002-20260307    clang-20
i386                  randconfig-003-20260307    clang-20
i386                  randconfig-004-20260307    clang-20
i386                  randconfig-005-20260307    clang-20
i386                  randconfig-006-20260307    clang-20
i386                  randconfig-007-20260307    clang-20
i386                  randconfig-011-20260307    clang-20
i386                  randconfig-011-20260307    gcc-14
i386                  randconfig-012-20260307    clang-20
i386                  randconfig-012-20260307    gcc-14
i386                  randconfig-013-20260307    clang-20
i386                  randconfig-013-20260307    gcc-14
i386                  randconfig-014-20260307    clang-20
i386                  randconfig-014-20260307    gcc-14
i386                  randconfig-015-20260307    gcc-14
i386                  randconfig-016-20260307    gcc-14
i386                  randconfig-017-20260307    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260307    gcc-15.2.0
loongarch             randconfig-002-20260307    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260307    gcc-10.5.0
nios2                 randconfig-001-20260307    gcc-15.2.0
nios2                 randconfig-002-20260307    gcc-15.2.0
nios2                 randconfig-002-20260307    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260307    gcc-12.5.0
parisc                randconfig-002-20260307    gcc-12.5.0
parisc                randconfig-002-20260307    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   currituck_defconfig    clang-23
powerpc               randconfig-001-20260307    gcc-12.5.0
powerpc               randconfig-001-20260307    gcc-8.5.0
powerpc               randconfig-002-20260307    gcc-11.5.0
powerpc               randconfig-002-20260307    gcc-12.5.0
powerpc64             randconfig-001-20260307    gcc-12.5.0
powerpc64             randconfig-001-20260307    gcc-8.5.0
powerpc64             randconfig-002-20260307    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260307    clang-17
riscv                 randconfig-001-20260307    clang-23
riscv                 randconfig-002-20260307    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260307    clang-23
s390                  randconfig-002-20260307    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260307    clang-23
sh                    randconfig-001-20260307    gcc-15.2.0
sh                    randconfig-002-20260307    clang-23
sh                    randconfig-002-20260307    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260307    gcc-15.2.0
sparc                 randconfig-001-20260307    gcc-8.5.0
sparc                 randconfig-002-20260307    gcc-11.5.0
sparc                 randconfig-002-20260307    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260307    clang-23
sparc64               randconfig-001-20260307    gcc-8.5.0
sparc64               randconfig-002-20260307    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260307    gcc-14
um                    randconfig-001-20260307    gcc-8.5.0
um                    randconfig-002-20260307    clang-23
um                    randconfig-002-20260307    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260307    clang-20
x86_64      buildonly-randconfig-001-20260307    gcc-14
x86_64      buildonly-randconfig-002-20260307    clang-20
x86_64      buildonly-randconfig-002-20260307    gcc-14
x86_64      buildonly-randconfig-003-20260307    clang-20
x86_64      buildonly-randconfig-003-20260307    gcc-14
x86_64      buildonly-randconfig-004-20260307    clang-20
x86_64      buildonly-randconfig-005-20260307    clang-20
x86_64      buildonly-randconfig-006-20260307    clang-20
x86_64      buildonly-randconfig-006-20260307    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260307    gcc-14
x86_64                randconfig-002-20260307    gcc-14
x86_64                randconfig-003-20260307    gcc-14
x86_64                randconfig-004-20260307    gcc-14
x86_64                randconfig-005-20260307    gcc-14
x86_64                randconfig-006-20260307    gcc-14
x86_64                randconfig-011-20260307    gcc-14
x86_64                randconfig-012-20260307    gcc-14
x86_64                randconfig-013-20260307    gcc-14
x86_64                randconfig-014-20260307    gcc-14
x86_64                randconfig-015-20260307    gcc-14
x86_64                randconfig-016-20260307    gcc-14
x86_64                randconfig-071-20260307    gcc-14
x86_64                randconfig-072-20260307    gcc-14
x86_64                randconfig-073-20260307    gcc-14
x86_64                randconfig-074-20260307    gcc-14
x86_64                randconfig-075-20260307    gcc-14
x86_64                randconfig-076-20260307    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260307    gcc-8.5.0
xtensa                randconfig-002-20260307    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
