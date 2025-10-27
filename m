Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A28025FA29
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Oct 2025 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761586999; cv=none; b=njocoKBPC7v2io3OQQvKDMJ7e1uilayVQZGfGCENklQXFHtVqk+TJuTm8FBKmlN/kguFJYFTCTyexccVhnhLg7XBnu3l1yhGxxFU1uSJWiA1VIDzOQMFZeZAEeIG6wACREWLCvolAA+PbVRTbTg8RgBUe2pexPugjismkggyGlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761586999; c=relaxed/simple;
	bh=1Zf+LSfpC3GMacZRmyF7IZVh+sx1Xps6UuJScqLguJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KpafP4IBGi9EpSzG0heeCDhRzSsFc1MVZnodCOPQ27DWxwmgGqKV2xrpMT1/KfSYmYVikIV74NTjJmZdFnwuf04pyRUtR+QWeJ4n6FaLwOaysxf3si0lnunJALym7VSd3mnrb4GzxW2yBLj9gZ/0EzFhlMUqgOiW+zZGmDUqPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3v5A1vV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3v5A1vV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761586997; x=1793122997;
  h=date:from:to:cc:subject:message-id;
  bh=1Zf+LSfpC3GMacZRmyF7IZVh+sx1Xps6UuJScqLguJo=;
  b=I3v5A1vVJ7hIfPVkSYziFNiwoetgtQ7hiVo5LZxnGYIOYKPKozZUg2Nu
   9CG0Vx+hd0H08VMis359RgGozoHvvimvC0oXAk8TEc4If83aKLIzFUHtf
   jpynsPHKGkOT89TAKF1Vo7IVHEMPywvXfmWUlPPlMaisbMeEjg0cvPIwx
   AQ5eFj0Ps8Qv/TLSnOB1CDxwhQVTzLY7pnQMvDcxV/A9Dlopdxm3l6JSC
   bHt+6Uev+xKQE/HdUDkjAYYPsLkFfMPbQmySz3NaYPaiaYNN21lgJSgEk
   mo23vzQVFHkffiYm2O7kNOwIVIauuXmpcFdDR7dtc/Rgftx3QgiF7SlMA
   A==;
X-CSE-ConnectionGUID: 69SJMOf8Q/qEqtp2e1ob6Q==
X-CSE-MsgGUID: 6fYd6HO4TtKf/RNhEMKpCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74796798"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="74796798"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 10:43:16 -0700
X-CSE-ConnectionGUID: 2f73qsCQQn6TrEPfEiOFtA==
X-CSE-MsgGUID: RUWQ3eELQfi68TgqENPNqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185003303"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Oct 2025 10:43:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDRFQ-000H3J-12;
	Mon, 27 Oct 2025 17:43:12 +0000
Date: Tue, 28 Oct 2025 01:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 bc0422ae3a466270f5587321af984042d16975f7
Message-ID: <202510280113.w1WW6ShR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: bc0422ae3a466270f5587321af984042d16975f7  Merge branch 'fixes-v6.18' into testing

elapsed time: 895m

configs tested: 216
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251027    clang-22
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-002-20251027    clang-22
arc                   randconfig-002-20251027    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       imx_v4_v5_defconfig    clang-22
arm                           imxrt_defconfig    clang-22
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-003-20251027    clang-22
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-004-20251027    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-002-20251027    clang-22
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-003-20251027    clang-22
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-004-20251027    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251027    gcc-10.5.0
csky                  randconfig-001-20251027    gcc-14.3.0
csky                  randconfig-002-20251027    gcc-10.5.0
csky                  randconfig-002-20251027    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251027    clang-22
hexagon               randconfig-001-20251027    gcc-10.5.0
hexagon               randconfig-002-20251027    clang-17
hexagon               randconfig-002-20251027    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251027    gcc-14
i386                  randconfig-002-20251027    gcc-14
i386                  randconfig-003-20251027    gcc-14
i386                  randconfig-004-20251027    gcc-14
i386                  randconfig-005-20251027    gcc-14
i386                  randconfig-006-20251027    gcc-14
i386                  randconfig-007-20251027    gcc-14
i386                  randconfig-011-20251027    clang-20
i386                  randconfig-012-20251027    clang-20
i386                  randconfig-013-20251027    clang-20
i386                  randconfig-014-20251027    clang-20
i386                  randconfig-015-20251027    clang-20
i386                  randconfig-016-20251027    clang-20
i386                  randconfig-017-20251027    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251027    gcc-10.5.0
loongarch             randconfig-001-20251027    gcc-15.1.0
loongarch             randconfig-002-20251027    gcc-10.5.0
loongarch             randconfig-002-20251027    gcc-13.4.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251027    gcc-10.5.0
nios2                 randconfig-001-20251027    gcc-8.5.0
nios2                 randconfig-002-20251027    gcc-10.5.0
nios2                 randconfig-002-20251027    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251027    gcc-10.5.0
parisc                randconfig-001-20251027    gcc-8.5.0
parisc                randconfig-002-20251027    gcc-10.5.0
parisc                randconfig-002-20251027    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                      pcm030_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251027    clang-22
powerpc               randconfig-001-20251027    gcc-10.5.0
powerpc               randconfig-002-20251027    clang-22
powerpc               randconfig-002-20251027    gcc-10.5.0
powerpc               randconfig-003-20251027    gcc-10.5.0
powerpc               randconfig-003-20251027    gcc-8.5.0
powerpc64             randconfig-001-20251027    gcc-10.5.0
powerpc64             randconfig-001-20251027    gcc-8.5.0
powerpc64             randconfig-002-20251027    gcc-10.5.0
powerpc64             randconfig-003-20251027    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251027    gcc-13.4.0
riscv                 randconfig-002-20251027    clang-22
riscv                 randconfig-002-20251027    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-14
s390                  randconfig-001-20251027    clang-22
s390                  randconfig-001-20251027    gcc-13.4.0
s390                  randconfig-002-20251027    gcc-13.4.0
s390                  randconfig-002-20251027    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251027    gcc-12.5.0
sh                    randconfig-001-20251027    gcc-13.4.0
sh                    randconfig-002-20251027    gcc-13.4.0
sh                    randconfig-002-20251027    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251027    gcc-12.5.0
sparc                 randconfig-001-20251027    gcc-13.4.0
sparc                 randconfig-002-20251027    gcc-13.4.0
sparc                 randconfig-002-20251027    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251027    gcc-13.4.0
sparc64               randconfig-001-20251027    gcc-14.3.0
sparc64               randconfig-002-20251027    gcc-13.4.0
sparc64               randconfig-002-20251027    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251027    clang-22
um                    randconfig-001-20251027    gcc-13.4.0
um                    randconfig-002-20251027    clang-22
um                    randconfig-002-20251027    gcc-13.4.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251027    clang-20
x86_64                randconfig-072-20251027    clang-20
x86_64                randconfig-073-20251027    clang-20
x86_64                randconfig-074-20251027    clang-20
x86_64                randconfig-075-20251027    clang-20
x86_64                randconfig-076-20251027    clang-20
x86_64                randconfig-077-20251027    clang-20
x86_64                randconfig-078-20251027    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251027    gcc-12.5.0
xtensa                randconfig-001-20251027    gcc-13.4.0
xtensa                randconfig-002-20251027    gcc-10.5.0
xtensa                randconfig-002-20251027    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
