Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111101BC39
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Aug 2024 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725102182; cv=none; b=ud2lJpmp/5n8MBhIkPjbSfbCd3QpGu2sV4n7hXhjAuv/FeUgsQDoK/OVAEITNCY7mbK7MzpVCbQHHkr3TtrXENqD4rEkXk39XXdzv2sH8tb0YkD9UPQmRgpEmy4A8GMX7HKdRtshHHO/ZZxlZiq+gP4ZYzqjQpH+08s8wZXWmqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725102182; c=relaxed/simple;
	bh=FTVAKomyQ8woJQ5+1h5wxiAVWIsFkZoG+cAlxghUH54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nh/ydoOQxJ+Tk3rHihixeHQ7CPehzsKGPpRFke5vUJDdKxQ9svHMFJ3g2M7xiofCBfwXgFLbdI3JdcAZRpZxSOdGbnyOPbLB4h59kXoDpk1xFRGOB4z699T7scdxCEu8lRgtvaRVs4zqcUUxwFan+16QzxZMyZKpvgO/jNvbatU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHwidT2b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHwidT2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725102181; x=1756638181;
  h=date:from:to:cc:subject:message-id;
  bh=FTVAKomyQ8woJQ5+1h5wxiAVWIsFkZoG+cAlxghUH54=;
  b=gHwidT2bvUPL0X8YMds8HCg8auQrvxNVXVd7Fh1fgiotc4g06JXppRl+
   JDllvF68mgUhfnSRRC76m8jjBXb1z/AMsIH5crG8f39v6xi0Yy+eduvbX
   LBWZcZkuoxDscdlgYHP+iBJLoijSfJawfMyw1LKwlqB+graXjjh0DrJu+
   hV+j2l3U5GlKBd0ETjwN9YN7vNjipIuE/kZuSJx7cZI2DdXCw62lugCSS
   AWDDyken2A2QR8d4iOnF7Qvzyhh4QELVAIknLnRdTDfpED4u1sFNUnxaa
   210FTgk7LT8cnSOrlCeykRZkyuhwcuFwi32moQ6MUijEbyDg3lbVOWeVl
   Q==;
X-CSE-ConnectionGUID: eKlUQ0GGS+q/EHmM5YmrAw==
X-CSE-MsgGUID: ZiBKNUSPRYOdXipci6+b6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="27616287"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="27616287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 04:03:01 -0700
X-CSE-ConnectionGUID: P/P5xblZTnuziflo5NX2Qw==
X-CSE-MsgGUID: wnEuwn3HS3+WTTsSbC1rbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="87376306"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2024 04:02:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skLse-0002dO-1n;
	Sat, 31 Aug 2024 11:02:56 +0000
Date: Sat, 31 Aug 2024 19:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 7a2afe9bd8c17f1c30ec79b9fc0d1fcd3b190207
Message-ID: <202408311924.5gwgoeQD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 7a2afe9bd8c17f1c30ec79b9fc0d1fcd3b190207  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1161m

configs tested: 185
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                        nsimosci_defconfig   clang-20
arc                   randconfig-001-20240831   gcc-14.1.0
arc                   randconfig-002-20240831   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                          ep93xx_defconfig   clang-20
arm                          gemini_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240831   gcc-14.1.0
arm                   randconfig-002-20240831   gcc-14.1.0
arm                   randconfig-003-20240831   gcc-14.1.0
arm                   randconfig-004-20240831   gcc-14.1.0
arm                        realview_defconfig   clang-20
arm                         vf610m4_defconfig   clang-20
arm                    vt8500_v6_v7_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   clang-20
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240831   gcc-14.1.0
arm64                 randconfig-002-20240831   gcc-14.1.0
arm64                 randconfig-003-20240831   gcc-14.1.0
arm64                 randconfig-004-20240831   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240831   gcc-14.1.0
csky                  randconfig-002-20240831   gcc-14.1.0
hexagon                          alldefconfig   clang-20
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240831   gcc-14.1.0
hexagon               randconfig-002-20240831   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240831   clang-18
i386         buildonly-randconfig-002-20240831   clang-18
i386         buildonly-randconfig-003-20240831   clang-18
i386         buildonly-randconfig-004-20240831   clang-18
i386         buildonly-randconfig-005-20240831   clang-18
i386         buildonly-randconfig-006-20240831   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240831   clang-18
i386                  randconfig-002-20240831   clang-18
i386                  randconfig-003-20240831   clang-18
i386                  randconfig-004-20240831   clang-18
i386                  randconfig-005-20240831   clang-18
i386                  randconfig-006-20240831   clang-18
i386                  randconfig-011-20240831   clang-18
i386                  randconfig-012-20240831   clang-18
i386                  randconfig-013-20240831   clang-18
i386                  randconfig-014-20240831   clang-18
i386                  randconfig-015-20240831   clang-18
i386                  randconfig-016-20240831   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240831   gcc-14.1.0
loongarch             randconfig-002-20240831   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                            gpr_defconfig   clang-20
mips                          malta_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                        omega2p_defconfig   clang-20
mips                         rt305x_defconfig   clang-20
nios2                            alldefconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240831   gcc-14.1.0
nios2                 randconfig-002-20240831   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
openrisc                  or1klitex_defconfig   clang-20
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                generic-64bit_defconfig   clang-20
parisc                randconfig-001-20240831   gcc-14.1.0
parisc                randconfig-002-20240831   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                    adder875_defconfig   clang-20
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   clang-20
powerpc                       ebony_defconfig   clang-20
powerpc                    gamecube_defconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                    mvme5100_defconfig   clang-20
powerpc               randconfig-001-20240831   gcc-14.1.0
powerpc                  storcenter_defconfig   clang-20
powerpc                     tqm8540_defconfig   clang-20
powerpc64             randconfig-001-20240831   gcc-14.1.0
powerpc64             randconfig-002-20240831   gcc-14.1.0
powerpc64             randconfig-003-20240831   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240831   gcc-14.1.0
riscv                 randconfig-002-20240831   gcc-14.1.0
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240831   gcc-14.1.0
s390                  randconfig-002-20240831   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                    randconfig-001-20240831   gcc-14.1.0
sh                    randconfig-002-20240831   gcc-14.1.0
sh                           se7780_defconfig   clang-20
sh                   secureedge5410_defconfig   clang-20
sh                        sh7763rdp_defconfig   clang-20
sh                        sh7785lcr_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240831   gcc-14.1.0
sparc64               randconfig-002-20240831   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240831   gcc-14.1.0
um                    randconfig-002-20240831   gcc-14.1.0
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240831   clang-18
x86_64       buildonly-randconfig-002-20240831   clang-18
x86_64       buildonly-randconfig-003-20240831   clang-18
x86_64       buildonly-randconfig-004-20240831   clang-18
x86_64       buildonly-randconfig-005-20240831   clang-18
x86_64       buildonly-randconfig-006-20240831   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240831   clang-18
x86_64                randconfig-002-20240831   clang-18
x86_64                randconfig-003-20240831   clang-18
x86_64                randconfig-004-20240831   clang-18
x86_64                randconfig-005-20240831   clang-18
x86_64                randconfig-006-20240831   clang-18
x86_64                randconfig-011-20240831   clang-18
x86_64                randconfig-012-20240831   clang-18
x86_64                randconfig-013-20240831   clang-18
x86_64                randconfig-014-20240831   clang-18
x86_64                randconfig-015-20240831   clang-18
x86_64                randconfig-016-20240831   clang-18
x86_64                randconfig-071-20240831   clang-18
x86_64                randconfig-072-20240831   clang-18
x86_64                randconfig-073-20240831   clang-18
x86_64                randconfig-074-20240831   clang-18
x86_64                randconfig-075-20240831   clang-18
x86_64                randconfig-076-20240831   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240831   gcc-14.1.0
xtensa                randconfig-002-20240831   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
