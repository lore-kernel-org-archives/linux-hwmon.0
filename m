Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A511FA55
	for <linux-hwmon@vger.kernel.org>; Sat,  9 Nov 2024 04:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731127896; cv=none; b=TrPPc4sgoXt0UgfAQCaFUwTwne8Uxkef9GbnuYoY2tY1ChP888YWbHXv6YqAhUY51hJHJ4HUeI8lYJcklLELvWGwXP5u6A9rJSrXEJw7iyp05k/OkiS9t8hLZeC1uJdSt/85HpQ/9ja741YZTlw7cDhRmLtcfjqp3ja8JvNZ9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731127896; c=relaxed/simple;
	bh=ZxRPqcfou5p/H5a++rRguc2xxlmmVIffvIYS+mkjMQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VC8d4foTh8M+DEnLMC+UrHyR5muiIV+gGSFMalMqAdNV2WogmPv2TSSLp202JBoTK12vBHGKvuibginLy88Thp/st+zuIB4F357lnTBxRdvvmGvmYRp0IQgikuJ7tDKf3KSFZlu+WfHzbkn56jeu/YkL/wx4IF2ZO5qbwcLAUhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCltCd6p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCltCd6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731127894; x=1762663894;
  h=date:from:to:cc:subject:message-id;
  bh=ZxRPqcfou5p/H5a++rRguc2xxlmmVIffvIYS+mkjMQs=;
  b=MCltCd6prQodWM9zRRuL1wndIbUgQG8viQGPoV1Q7MXGSR7eBa4CaAt0
   8qYEaRF3aq8SrvXwHfx9OJNImg0bgn/iLi2PPXzOxqaKw5P66Og5TuMjH
   myTm2u8N/jQwyNCWOONrgA4hTH18c8MfJm+LU/W06Tzo8ANNERDSm1oQy
   RtXv/sSFvb9QCx4YK4X6ziPKRmkiU7l3LntpGdYeSW4unOXWCY5GJU1Wv
   haqwo5HSYme1FWeSvZfXdkQDFwA6cnvNacThFLJI9LqD8XP2fDiUglRX6
   1VnW0Gue6r/DTqXknd71UnKmpGdIp7a01MDIA9IRqoNEbC5EiyrFkE5Wv
   Q==;
X-CSE-ConnectionGUID: CNtLoU5ZT0ihzdlidHad2w==
X-CSE-MsgGUID: C+FkGuyJToaiiS1dpANPJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41630396"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="41630396"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 20:51:33 -0800
X-CSE-ConnectionGUID: 4YuBtIcASvqExQ+QKkP1bA==
X-CSE-MsgGUID: tdOhvKhZSgu3vLi+5n0cvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="90736764"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2024 20:51:32 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9dRZ-000s5O-2e;
	Sat, 09 Nov 2024 04:51:29 +0000
Date: Sat, 09 Nov 2024 12:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 e98d562cd5075710b3b0cfcb8ea146c829041ef0
Message-ID: <202411091235.jXpl37UC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: e98d562cd5075710b3b0cfcb8ea146c829041ef0  hwmon: (jc42) Drop of_match_ptr() protection

elapsed time: 802m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-14.2.0
alpha                   allyesconfig    clang-20
alpha                   allyesconfig    gcc-14.2.0
alpha                      defconfig    gcc-14.2.0
arc                     allmodconfig    clang-20
arc                     allmodconfig    gcc-13.2.0
arc                      allnoconfig    gcc-14.2.0
arc                     allyesconfig    clang-20
arc                     allyesconfig    gcc-13.2.0
arc                        defconfig    gcc-14.2.0
arc                haps_hs_defconfig    clang-14
arm                     allmodconfig    clang-20
arm                     allmodconfig    gcc-14.2.0
arm                      allnoconfig    gcc-14.2.0
arm                     allyesconfig    clang-20
arm                     allyesconfig    gcc-14.2.0
arm                at91_dt_defconfig    clang-15
arm                        defconfig    gcc-14.2.0
arm               neponset_defconfig    clang-14
arm                  tegra_defconfig    clang-15
arm                  u8500_defconfig    clang-14
arm                wpcm450_defconfig    clang-15
arm64                   allmodconfig    clang-20
arm64                    allnoconfig    gcc-14.2.0
arm64                      defconfig    gcc-14.2.0
csky                     allnoconfig    gcc-14.2.0
csky                       defconfig    gcc-14.2.0
hexagon                 allmodconfig    clang-20
hexagon                  allnoconfig    gcc-14.2.0
hexagon                 allyesconfig    clang-20
hexagon                    defconfig    gcc-14.2.0
i386                    allmodconfig    clang-19
i386                    allmodconfig    gcc-12
i386                     allnoconfig    clang-19
i386                     allnoconfig    gcc-12
i386                    allyesconfig    clang-19
i386                    allyesconfig    gcc-12
i386                       defconfig    clang-19
loongarch               allmodconfig    gcc-14.2.0
loongarch                allnoconfig    gcc-14.2.0
loongarch                  defconfig    gcc-14.2.0
m68k                    allmodconfig    gcc-14.2.0
m68k                     allnoconfig    gcc-14.2.0
m68k                    allyesconfig    gcc-14.2.0
m68k                 amiga_defconfig    clang-15
m68k                       defconfig    gcc-14.2.0
m68k              m5249evb_defconfig    clang-14
microblaze              allmodconfig    gcc-14.2.0
microblaze               allnoconfig    gcc-14.2.0
microblaze              allyesconfig    gcc-14.2.0
microblaze                 defconfig    gcc-14.2.0
mips                     allnoconfig    gcc-14.2.0
mips               bcm63xx_defconfig    clang-15
mips                   gpr_defconfig    clang-15
mips             maltaaprp_defconfig    clang-14
mips                 rb532_defconfig    clang-14
mips               vocore2_defconfig    clang-15
nios2                    allnoconfig    gcc-14.2.0
nios2                      defconfig    gcc-14.2.0
openrisc                 allnoconfig    clang-20
openrisc                 allnoconfig    gcc-14.2.0
openrisc                allyesconfig    gcc-14.2.0
openrisc                   defconfig    gcc-12
parisc                  alldefconfig    clang-14
parisc                  allmodconfig    gcc-14.2.0
parisc                   allnoconfig    clang-20
parisc                   allnoconfig    gcc-14.2.0
parisc                  allyesconfig    gcc-14.2.0
parisc                     defconfig    gcc-12
parisc64                   defconfig    gcc-14.2.0
powerpc                 allmodconfig    gcc-14.2.0
powerpc                  allnoconfig    clang-20
powerpc                  allnoconfig    gcc-14.2.0
powerpc                 allyesconfig    clang-20
powerpc                 allyesconfig    gcc-14.2.0
powerpc             arches_defconfig    clang-14
powerpc              eiger_defconfig    clang-15
powerpc            ep8248e_defconfig    clang-14
powerpc               fsp2_defconfig    clang-14
powerpc         iss476-smp_defconfig    clang-14
powerpc        mpc8313_rdb_defconfig    clang-14
powerpc        mpc836x_rdk_defconfig    clang-14
powerpc         mpc885_ads_defconfig    clang-14
powerpc             pmac32_defconfig    clang-15
powerpc            redwood_defconfig    clang-14
riscv                   allmodconfig    clang-20
riscv                   allmodconfig    gcc-14.2.0
riscv                    allnoconfig    clang-20
riscv                    allnoconfig    gcc-14.2.0
riscv                   allyesconfig    clang-20
riscv                   allyesconfig    gcc-14.2.0
riscv                      defconfig    gcc-12
riscv           nommu_virt_defconfig    clang-15
s390                    allmodconfig    clang-20
s390                    allmodconfig    gcc-14.2.0
s390                     allnoconfig    clang-20
s390                    allyesconfig    gcc-14.2.0
s390                       defconfig    gcc-12
sh                      allmodconfig    gcc-14.2.0
sh                       allnoconfig    gcc-14.2.0
sh                      allyesconfig    gcc-14.2.0
sh                         defconfig    gcc-12
sh                ecovec24_defconfig    clang-15
sh                    espt_defconfig    clang-15
sh          secureedge5410_defconfig    clang-15
sh               sh7757lcr_defconfig    clang-15
sparc                   allmodconfig    gcc-14.2.0
sparc64                    defconfig    gcc-12
um                      allmodconfig    clang-20
um                       allnoconfig    clang-17
um                       allnoconfig    clang-20
um                      allyesconfig    clang-20
um                      allyesconfig    gcc-12
um                         defconfig    gcc-12
um                    i386_defconfig    gcc-12
um                  x86_64_defconfig    gcc-12
x86_64                   allnoconfig    clang-19
x86_64                  allyesconfig    clang-19
x86_64                     defconfig    clang-19
x86_64                     defconfig    gcc-11
x86_64                         kexec    clang-19
x86_64                         kexec    gcc-12
x86_64                      rhel-8.3    gcc-12
xtensa                  alldefconfig    clang-15
xtensa                   allnoconfig    gcc-14.2.0
xtensa                 iss_defconfig    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
