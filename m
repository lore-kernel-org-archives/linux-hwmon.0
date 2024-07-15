Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0D18786F
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039817; cv=none; b=cp9CfOz9ty0BgSxhNrJ9wfh40Okz7gZhCo1LHUeFHz6vMbw5SO7RP5xQfVmvKGv1pSm5+8XBqZ/7XeqJwx2r886wxuxvu1AsHXbIhFfU4tyHWHLhuJIKkNJVMG6NfmX5SpKqs2aVBcr8+5kKvCHV9kGOjDh6uDpKsXz9OxhiFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039817; c=relaxed/simple;
	bh=BTJsl+pdIb0hXCjbbe9Z525vKB9AUXuUCaY+Hwi8ARA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L0k0wDQ/qu7Z6yn9eQd0Vy77c2G45wAka1/iIQLGAcIpCNpCK+yZvTTt04GDXWOa0GeyKjs35ReltqKnlMIQkGxcextBx2jHRHttzYhy4fPM1Un0mpOwxEVkGQaUBQcB8g/dTQMVf343tSmCxjAuXLcB5JkHaD8/xt+L0iTVrm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlcU7pit; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlcU7pit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721039815; x=1752575815;
  h=date:from:to:cc:subject:message-id;
  bh=BTJsl+pdIb0hXCjbbe9Z525vKB9AUXuUCaY+Hwi8ARA=;
  b=SlcU7pitnKGWug4wvnfv/wKSOdX4sJo3LIDsv4tzd3I7l/tSGb3TWrSC
   pMG+EnSsznj96Otntx0yg0PT950WSvbnB9hFQdMuVAZcctkOq0BAuLWH8
   xWP6v/C46rDSuymOXp2vfvxMbjABulo7wV4mXZW4GxYs8rM47zt2ePzu/
   jbvfRb+Dgssa6ugb2AoDBIN/uPM8ND7xLJliaUGKeInbc5Vt0zjZbhRji
   m2XWLuvTfBJj36doEPvalzK9NByW4YKPzoUK3xZEyRjYT3kcPR9rxKyjX
   z6CIyUo1tcJm0RT5mvQOKXpyp4JbYT407oxfYLZhhjEJz3KBvjFDujpab
   g==;
X-CSE-ConnectionGUID: Le0klSW/SaS2nvpwF8ZIJA==
X-CSE-MsgGUID: QLF5bY8TTFGnI3nYGwr1oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="21321386"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="21321386"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 03:36:54 -0700
X-CSE-ConnectionGUID: gBMQTUigRCaJrcG1/xeH/g==
X-CSE-MsgGUID: Jyf9DNj2QnuzfMxZzx47KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="50349788"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jul 2024 03:36:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTJ4c-000eE2-17;
	Mon, 15 Jul 2024 10:36:50 +0000
Date: Mon, 15 Jul 2024 18:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 1ea3fd1eb9869fcdcbc9c68f9728bfc47b9503f1
Message-ID: <202407151812.7l3xNgOL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 1ea3fd1eb9869fcdcbc9c68f9728bfc47b9503f1  hwmon: (max6697) Fix swapped temp{1,8} critical alarms

elapsed time: 916m

configs tested: 192
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240715   gcc-13.2.0
arc                   randconfig-002-20240715   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         at91_dt_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                       netwinder_defconfig   gcc-13.2.0
arm                            qcom_defconfig   gcc-13.2.0
arm                   randconfig-001-20240715   gcc-14.1.0
arm                   randconfig-002-20240715   gcc-14.1.0
arm                   randconfig-003-20240715   gcc-14.1.0
arm                   randconfig-004-20240715   clang-19
arm                         socfpga_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240715   clang-19
arm64                 randconfig-002-20240715   clang-19
arm64                 randconfig-003-20240715   clang-19
arm64                 randconfig-004-20240715   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240715   gcc-14.1.0
csky                  randconfig-002-20240715   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240715   clang-19
hexagon               randconfig-002-20240715   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240715   clang-18
i386         buildonly-randconfig-002-20240715   clang-18
i386         buildonly-randconfig-003-20240715   gcc-13
i386         buildonly-randconfig-004-20240715   gcc-12
i386         buildonly-randconfig-005-20240715   clang-18
i386         buildonly-randconfig-006-20240715   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240715   gcc-13
i386                  randconfig-002-20240715   clang-18
i386                  randconfig-003-20240715   clang-18
i386                  randconfig-004-20240715   gcc-13
i386                  randconfig-005-20240715   gcc-13
i386                  randconfig-006-20240715   gcc-13
i386                  randconfig-011-20240715   gcc-9
i386                  randconfig-012-20240715   gcc-13
i386                  randconfig-013-20240715   gcc-7
i386                  randconfig-014-20240715   clang-18
i386                  randconfig-015-20240715   clang-18
i386                  randconfig-016-20240715   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240715   gcc-14.1.0
loongarch             randconfig-002-20240715   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240715   gcc-14.1.0
nios2                 randconfig-002-20240715   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240715   gcc-14.1.0
parisc                randconfig-002-20240715   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240715   clang-17
powerpc               randconfig-002-20240715   clang-19
powerpc               randconfig-003-20240715   gcc-14.1.0
powerpc                     taishan_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240715   clang-14
powerpc64             randconfig-002-20240715   gcc-14.1.0
powerpc64             randconfig-003-20240715   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240715   gcc-14.1.0
riscv                 randconfig-002-20240715   gcc-14.1.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240715   gcc-14.1.0
s390                  randconfig-002-20240715   gcc-14.1.0
s390                       zfcpdump_defconfig   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240715   gcc-14.1.0
sh                    randconfig-002-20240715   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240715   gcc-14.1.0
sparc64               randconfig-002-20240715   gcc-14.1.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-19
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240715   gcc-12
um                    randconfig-002-20240715   clang-19
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240715   clang-18
x86_64       buildonly-randconfig-002-20240715   gcc-13
x86_64       buildonly-randconfig-003-20240715   clang-18
x86_64       buildonly-randconfig-004-20240715   gcc-13
x86_64       buildonly-randconfig-005-20240715   gcc-13
x86_64       buildonly-randconfig-006-20240715   gcc-8
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240715   gcc-9
x86_64                randconfig-002-20240715   gcc-7
x86_64                randconfig-003-20240715   clang-18
x86_64                randconfig-004-20240715   clang-18
x86_64                randconfig-005-20240715   gcc-11
x86_64                randconfig-006-20240715   clang-18
x86_64                randconfig-011-20240715   gcc-12
x86_64                randconfig-012-20240715   clang-18
x86_64                randconfig-013-20240715   clang-18
x86_64                randconfig-014-20240715   gcc-12
x86_64                randconfig-015-20240715   gcc-10
x86_64                randconfig-016-20240715   gcc-10
x86_64                randconfig-071-20240715   gcc-13
x86_64                randconfig-072-20240715   gcc-13
x86_64                randconfig-073-20240715   gcc-13
x86_64                randconfig-074-20240715   gcc-12
x86_64                randconfig-075-20240715   clang-18
x86_64                randconfig-076-20240715   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-002-20240715   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
