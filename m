Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517FF1459F7
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721333335; cv=none; b=PZI/KW1htpX22ino1KpjGWwemk5x6DESmiXs//nYsd39KB5ydgNwfGbbhyvTtjZYAf5+jrAsgIiOzIInRJjmIrKt8UbVAN3+yHlUIezkZJWO0/kAbplw/Ip2jCi/surL3iPO8N3rHWfhPa+SYyAFZWrIbpQSMmkdF6R7ceEhoaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721333335; c=relaxed/simple;
	bh=OighKPy+oFCVEAMhwsRCCYGIg8SPpEi1SC9Iv4KdWIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hu5zpVvlNPF8JGuRjCyf1ZjWKTkDBgZbe5c7K6E2YWBjlJej8NseFzZQfvdl8o2uiRmrq/dicYf6F+wUgCl4bH3RGwcMnT3sB/2dvK9Yp/+l3yKTos7uB1USo8DYyv/2QX1wMURTF/GfAk+feyElbTmOXankBzhmo8YFQR95j/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOubppVc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOubppVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721333334; x=1752869334;
  h=date:from:to:cc:subject:message-id;
  bh=OighKPy+oFCVEAMhwsRCCYGIg8SPpEi1SC9Iv4KdWIY=;
  b=fOubppVc81XAAHbw3XNgGmVsAq6gZWhT8RdVhz+3ecOBWBXNvt67ErSt
   TwWwechdWhVJomcN7TlmcHSs9c5AIpdtL9KmU6jFW6cCWiAsUapQ88Nhn
   AonKnyrdxv82j2Ahm1AhkKTZTsplIClvJL0PjQ4c08UzZzqYcVf8FDGn+
   TmtYpdJayjZ4lxrFSzJT7VabcC7njIxEGQyc5ouBiaovbz9XI8p2rwgNx
   QjdqeVOlgnx6zE7XnjOcTEa3vt/utsOC4N71/KwU910Teht0Hv+WXI4eb
   Cyv/5BO6rmkLwyh58+ihULNi5ilfXZ59rblaXFbg9yp0Wa8Px2YKb5iaB
   Q==;
X-CSE-ConnectionGUID: 3WV22mzXRWGXjzg/OCdqrg==
X-CSE-MsgGUID: YqxnwWw6Rlak3aXq+Ny8Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18882155"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="18882155"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 13:08:53 -0700
X-CSE-ConnectionGUID: eA1K/FVYQg2wMnBmKOZMKA==
X-CSE-MsgGUID: R49mDU8xQySE6i7xaIUnCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="50600000"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2024 13:08:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUXQm-000hYE-2b;
	Thu, 18 Jul 2024 20:08:48 +0000
Date: Fri, 19 Jul 2024 04:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 b9e4c0d444c3a3d22a8907836d2dd45c9ec99106
Message-ID: <202407190411.VlXagCTb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: b9e4c0d444c3a3d22a8907836d2dd45c9ec99106  Merge branch 'kunit-improvements' into testing

elapsed time: 1414m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240718   gcc-13.2.0
arc                   randconfig-002-20240718   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                            hisi_defconfig   gcc-14.1.0
arm                   randconfig-001-20240718   clang-19
arm                   randconfig-002-20240718   gcc-14.1.0
arm                   randconfig-003-20240718   clang-19
arm                   randconfig-004-20240718   gcc-14.1.0
arm                           spitz_defconfig   gcc-14.1.0
arm                       versatile_defconfig   gcc-14.1.0
arm                         vf610m4_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240718   clang-15
arm64                 randconfig-002-20240718   clang-19
arm64                 randconfig-003-20240718   gcc-14.1.0
arm64                 randconfig-004-20240718   clang-19
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240718   gcc-14.1.0
csky                  randconfig-002-20240718   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240718   clang-19
hexagon               randconfig-002-20240718   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240718   gcc-11
i386         buildonly-randconfig-002-20240718   gcc-7
i386         buildonly-randconfig-003-20240718   gcc-13
i386         buildonly-randconfig-004-20240718   clang-18
i386         buildonly-randconfig-005-20240718   gcc-9
i386         buildonly-randconfig-006-20240718   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240718   gcc-13
i386                  randconfig-002-20240718   gcc-13
i386                  randconfig-003-20240718   clang-18
i386                  randconfig-004-20240718   clang-18
i386                  randconfig-005-20240718   clang-18
i386                  randconfig-006-20240718   clang-18
i386                  randconfig-011-20240718   gcc-13
i386                  randconfig-012-20240718   gcc-13
i386                  randconfig-013-20240718   gcc-10
i386                  randconfig-014-20240718   clang-18
i386                  randconfig-015-20240718   clang-18
i386                  randconfig-016-20240718   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240718   gcc-14.1.0
loongarch             randconfig-002-20240718   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         amcore_defconfig   gcc-14.1.0
m68k                           virt_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                         cobalt_defconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240718   gcc-14.1.0
nios2                 randconfig-002-20240718   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240718   gcc-14.1.0
parisc                randconfig-002-20240718   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                 canyonlands_defconfig   clang-19
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   clang-19
powerpc                      ppc6xx_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240718   clang-17
powerpc               randconfig-002-20240718   clang-19
powerpc               randconfig-003-20240718   gcc-14.1.0
powerpc                     tqm8548_defconfig   clang-19
powerpc64             randconfig-001-20240718   clang-19
powerpc64             randconfig-002-20240718   gcc-14.1.0
powerpc64             randconfig-003-20240718   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240718   clang-17
riscv                 randconfig-002-20240718   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240718   clang-19
s390                  randconfig-002-20240718   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240718   gcc-14.1.0
sh                    randconfig-002-20240718   gcc-14.1.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240718   gcc-14.1.0
sparc64               randconfig-002-20240718   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240718   clang-19
um                    randconfig-002-20240718   clang-15
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240718   gcc-11
x86_64       buildonly-randconfig-002-20240718   clang-18
x86_64       buildonly-randconfig-003-20240718   clang-18
x86_64       buildonly-randconfig-004-20240718   clang-18
x86_64       buildonly-randconfig-005-20240718   clang-18
x86_64       buildonly-randconfig-006-20240718   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240718   gcc-13
x86_64                randconfig-002-20240718   gcc-13
x86_64                randconfig-003-20240718   clang-18
x86_64                randconfig-004-20240718   gcc-13
x86_64                randconfig-005-20240718   clang-18
x86_64                randconfig-006-20240718   clang-18
x86_64                randconfig-011-20240718   clang-18
x86_64                randconfig-012-20240718   gcc-9
x86_64                randconfig-013-20240718   clang-18
x86_64                randconfig-014-20240718   clang-18
x86_64                randconfig-015-20240718   clang-18
x86_64                randconfig-016-20240718   clang-18
x86_64                randconfig-071-20240718   clang-18
x86_64                randconfig-072-20240718   clang-18
x86_64                randconfig-073-20240718   clang-18
x86_64                randconfig-074-20240718   gcc-9
x86_64                randconfig-075-20240718   clang-18
x86_64                randconfig-076-20240718   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240718   gcc-14.1.0
xtensa                randconfig-002-20240718   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
