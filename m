Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D21F80AB
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Oct 2024 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018729; cv=none; b=mC8bJSsrhk4b68BKMZ8HwSFIHq55xxq/i0AF3vkACwMi7TGta5R9k5IMhos8c6XIDWx+r8VQNtdOlk4uUJ392UXpODEVG5EJBWr8gPfd5U8VreDz5gdHyw9c+lYAOmiaId4i6Cs/Zzowd4b+nYq6zC9SqYrnYqxuZGnoGCvvuTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018729; c=relaxed/simple;
	bh=WLIO+ofoiDlNVBCjUbEAhSAp2lwQlU+x3htmkUb03Dk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N0BhqB+zD87zgUw9eOYzdcO/v9q1OI3yKdyIkUbl3qhHwgXE/He0rhOLA8hqILeqIF70SzPQnkaGRI5N4mqZnCzaZCga0l8CZteg3GxvKo05PF5TlX+3amUYGMJB4n2g9fo8kkyNWarEoAuJ3MbLZWCFfQzL8pdjoopybJmZ+6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1MJJCH/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1MJJCH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729018728; x=1760554728;
  h=date:from:to:cc:subject:message-id;
  bh=WLIO+ofoiDlNVBCjUbEAhSAp2lwQlU+x3htmkUb03Dk=;
  b=n1MJJCH/7HGT03ND/vsHVtq71EfKc38rJUfXAsX60ZDHea+NLPeZ+hhl
   dK6pK/g9tQKaKVQMetPi+VUV7IIs5mZN2CKW+rfXl+3pIwVG7cgcold2F
   l9rDuYaiCJn6aHHiTk1YOZjab7hAUEd9k94dkywXy/CQmWqAI1usT+UvX
   P7nXAohImg9VgSycD4HhM+QoOyDPFkCrize1i3+EWABsdTwby52c2cNXf
   uFgSjZoB+Jlpprdu4ZhZ8PDX9tHarksV88H+6bTM9Mfx6j8Ehowu7R264
   OwMSBbqaOud8hJRi48AR0SF0uJchNBkQkcIoWA2rm6j41IQULH6jF9X7b
   g==;
X-CSE-ConnectionGUID: qNeH8h7cTk+Mp7rRp/7GXA==
X-CSE-MsgGUID: 1PHKbivyTbqd5T12JxhPyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="53843489"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="53843489"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:58:47 -0700
X-CSE-ConnectionGUID: wzumI4SgTT6fc4yjprKr5A==
X-CSE-MsgGUID: 7PeGiZcfSoyLWAaKkmkCOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="82774297"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2024 11:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0mkl-000Jol-29;
	Tue, 15 Oct 2024 18:58:43 +0000
Date: Wed, 16 Oct 2024 02:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 ab04fcd57e17c05c8e7464f02022d81c6e027333
Message-ID: <202410160257.zSKKvZOR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: ab04fcd57e17c05c8e7464f02022d81c6e027333  Merge branch 'fixes-v6.12' into testing

elapsed time: 2278m

configs tested: 105
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                        mvebu_v7_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241015    clang-18
i386        buildonly-randconfig-002-20241015    clang-18
i386        buildonly-randconfig-003-20241015    clang-18
i386        buildonly-randconfig-004-20241015    clang-18
i386        buildonly-randconfig-005-20241015    clang-18
i386        buildonly-randconfig-006-20241015    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241015    clang-18
i386                  randconfig-002-20241015    clang-18
i386                  randconfig-003-20241015    clang-18
i386                  randconfig-004-20241015    clang-18
i386                  randconfig-005-20241015    clang-18
i386                  randconfig-006-20241015    clang-18
i386                  randconfig-011-20241015    clang-18
i386                  randconfig-012-20241015    clang-18
i386                  randconfig-013-20241015    clang-18
i386                  randconfig-014-20241015    clang-18
i386                  randconfig-015-20241015    clang-18
i386                  randconfig-016-20241015    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          amiga_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           gcw0_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                      ep88xc_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    clang-20
sh                             shx3_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
