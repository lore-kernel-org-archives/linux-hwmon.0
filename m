Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A53218D5
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Sep 2025 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756727842; cv=none; b=tSUhIBZqRVzPZM68M4lqC2NbGlofjgEmVX/4L/DdzFGGvkdO/dcwUlcTyjDsH1ENAh4eRHk01/GFaqngTzxnyW1rt+7ticMHN3fPdoC0OV54faLFBxm1mPeo17WWsO0RQDJBBOaMJj0cePi1JzYauaok7PpFBgjk7hNGy6EWlMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756727842; c=relaxed/simple;
	bh=kyIqK/ZsgbNA93psoKCxM/0+3ukVQQCb2o7hK5PJQA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mCo4OaZDylud4Q84qTGCCq8PKMKYmAHJZOyN9xIEJ1rgMtYq7ldjoyjm/+Ee3WXHoM8y+tK3ZTluQXJyGVhLA8NmuHorntde8WAYyrf+pD2AoNjex82yUi1RC5qK8+6vFwy5VDirVMFF/UEGndqpqM9iOo4flnBdV7WhrleBg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vd9uar5s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vd9uar5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756727840; x=1788263840;
  h=date:from:to:cc:subject:message-id;
  bh=kyIqK/ZsgbNA93psoKCxM/0+3ukVQQCb2o7hK5PJQA4=;
  b=Vd9uar5s8PEu6vf52xVDd2DNZpdmraz4VfkPvnq2u8dLZVemtVIInOXI
   b7Xk+E85aCVrhjbTvEW1MYKA7ByP75AOMp++r1m417VoPnjYj2SRKavJw
   rvOX+YxYEDqhdTgnw8Q9TLB7RW8gGR7vImSiTBd78L60YucoduBUsHiUl
   iXJbh/xykbE6KZo+tgiyNpozyz5LcILLw9WCJPdoEwT7zyLTZYuRQdB52
   9ZfMzH+H/9xcEnsdI8OOLdo2jG8K6Q27HDD5cqfVOl57aJ+G/62LW047h
   JZ6WyA5Elb0OiyY6cBDpYKT9uXQrZZpGhTP2MSwvuB77rQTwPXoFpUU+u
   Q==;
X-CSE-ConnectionGUID: zrarJPhiQCeBd2T6hU8+tw==
X-CSE-MsgGUID: jbWOSfBHQWy0Lj7Bhi5+TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58916057"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58916057"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 04:57:20 -0700
X-CSE-ConnectionGUID: gbML8+xMSQCEbgumB6t3ZA==
X-CSE-MsgGUID: FrJ+rXAeQNCwwzhlifZcTQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Sep 2025 04:57:19 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut390-0000Yn-0X;
	Mon, 01 Sep 2025 11:56:44 +0000
Date: Mon, 01 Sep 2025 19:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 82f80a912c7fb5ca115d3009373798c13777d111
Message-ID: <202509011900.YvAlyYks-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 82f80a912c7fb5ca115d3009373798c13777d111  dt-bindings: hwmon: ti,ina2xx: Add INA780 device

elapsed time: 723m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20250901    gcc-8.5.0
arc                   randconfig-002-20250901    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20250901    clang-22
arm                   randconfig-002-20250901    clang-22
arm                   randconfig-003-20250901    clang-22
arm                   randconfig-004-20250901    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250901    clang-16
arm64                 randconfig-002-20250901    gcc-13.4.0
arm64                 randconfig-003-20250901    clang-22
arm64                 randconfig-004-20250901    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250901    gcc-12.5.0
csky                  randconfig-002-20250901    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250901    clang-17
hexagon               randconfig-002-20250901    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250901    clang-20
i386        buildonly-randconfig-002-20250901    clang-20
i386        buildonly-randconfig-003-20250901    gcc-12
i386        buildonly-randconfig-004-20250901    clang-20
i386        buildonly-randconfig-005-20250901    gcc-12
i386        buildonly-randconfig-006-20250901    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250901    gcc-15.1.0
loongarch             randconfig-002-20250901    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250901    gcc-11.5.0
nios2                 randconfig-002-20250901    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250901    gcc-11.5.0
parisc                randconfig-002-20250901    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc               randconfig-001-20250901    clang-22
powerpc               randconfig-002-20250901    clang-22
powerpc               randconfig-003-20250901    gcc-13.4.0
powerpc64             randconfig-001-20250901    clang-16
powerpc64             randconfig-002-20250901    gcc-13.4.0
powerpc64             randconfig-003-20250901    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250901    clang-22
riscv                 randconfig-002-20250901    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250901    gcc-13.4.0
s390                  randconfig-002-20250901    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250901    gcc-15.1.0
sh                    randconfig-002-20250901    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250901    gcc-8.5.0
sparc                 randconfig-002-20250901    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250901    clang-20
sparc64               randconfig-002-20250901    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250901    gcc-12
um                    randconfig-002-20250901    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250901    clang-20
x86_64      buildonly-randconfig-002-20250901    clang-20
x86_64      buildonly-randconfig-003-20250901    gcc-12
x86_64      buildonly-randconfig-004-20250901    clang-20
x86_64      buildonly-randconfig-005-20250901    gcc-12
x86_64      buildonly-randconfig-006-20250901    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250901    gcc-8.5.0
xtensa                randconfig-002-20250901    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
