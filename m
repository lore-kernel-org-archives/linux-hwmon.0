Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E51E0B96
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Oct 2024 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729520852; cv=none; b=LTm8DQtcFSZ8EjYWPuRif6Hyt42IzxmxbZ5UZdrupHSv9VOzQiyrQy/L6VROeQhXgqoNJuXKbuRgMWa6sYCeFhRESA39ogkWo6LkfZHqNF63+fwoijE2HVMi7f5zmQvnd8CQcWv05Xl/3m2DIJzFWz1I84BKECgMPXrCui26QiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729520852; c=relaxed/simple;
	bh=i+3wQxjpiyT7CMlBlMbR/WrhF/BfQZyAiBku2bdOhpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GJuGlY/gpgrUb6S+eujJrYfGsKo7dQK1KhZ2XXEwLr+JXe8i3Un4xv2WU+RXNbcjjFyp7+nLds/dHBG/MAiemMImFH7291A32GaBzqbgyDSUcVv7FKu+w0AInAICDr53lIOmbLDKOfTORL9V/jghBHxZGEdNwIx4sg6Xx6XtAko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIcvJiaQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIcvJiaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729520851; x=1761056851;
  h=date:from:to:cc:subject:message-id;
  bh=i+3wQxjpiyT7CMlBlMbR/WrhF/BfQZyAiBku2bdOhpo=;
  b=SIcvJiaQZUUs3+WMTFrjI0XZsAb+KecIhc74vObLqSh09gL1wL5TgKSa
   Wfhaa+U+6mXApFQu6m7DZDH4Rxow2r4XdhQfj8V51i4tR9cxAVN01LAUu
   P1NUgt3WrX8/XLWp7/gHHIs3+Bs+271Q4iMUbzN+GXPL7NDeKplPiP12R
   GAYIZ7yZBSxhbLaIaHrB3XVc/xEfRN4I7MJsvT2WW43rvxQ0+MbCapXLA
   eNd2tQQn9g6rx0uzgmUaw8Cq5JpRmAae/YjOj+WNX7HmCJ6mFJzL4ftvG
   P1Lelb50e2Li/ipjKnagYxwWnkmE4phvDjAaK870kRyqSj4wpVJ4nhZ/0
   A==;
X-CSE-ConnectionGUID: 6BvhNHgeSnSvMgip0RVhxw==
X-CSE-MsgGUID: Om9Jmxy1RdS2z68vZy+b3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32690523"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32690523"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 07:27:30 -0700
X-CSE-ConnectionGUID: ksVH/BlNSwqDgQx7rizZLA==
X-CSE-MsgGUID: uz/osNnFQymMC+w//fdsMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84157302"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2024 07:27:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2tNW-000SH0-1l;
	Mon, 21 Oct 2024 14:27:26 +0000
Date: Mon, 21 Oct 2024 22:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 892282ca302bb3e5d0af91e58679f40a07180c32
Message-ID: <202410212240.UdpZ5bhl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 892282ca302bb3e5d0af91e58679f40a07180c32  Merge branch 'fixes-v6.12' into testing

elapsed time: 1176m

configs tested: 106
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                 allnoconfig    gcc-14.1.0
alpha                allyesconfig    clang-20
alpha                   defconfig    gcc-14.1.0
arc                  alldefconfig    clang-14
arc                  allmodconfig    clang-20
arc                   allnoconfig    gcc-14.1.0
arc                  allyesconfig    clang-20
arc              axs101_defconfig    clang-20
arc                     defconfig    gcc-14.1.0
arc         haps_hs_smp_defconfig    clang-14
arm                  allmodconfig    clang-20
arm                   allnoconfig    gcc-14.1.0
arm                  allyesconfig    clang-20
arm         davinci_all_defconfig    clang-20
arm                     defconfig    gcc-14.1.0
arm              ep93xx_defconfig    clang-14
arm               h3600_defconfig    clang-14
arm               imxrt_defconfig    clang-20
arm              moxart_defconfig    clang-20
arm                mps2_defconfig    clang-20
arm            mvebu_v7_defconfig    clang-14
arm             s3c6400_defconfig    clang-14
arm64                allmodconfig    clang-20
arm64                 allnoconfig    gcc-14.1.0
arm64                   defconfig    gcc-14.1.0
csky                  allnoconfig    gcc-14.1.0
csky                    defconfig    gcc-14.1.0
hexagon              allmodconfig    clang-20
hexagon               allnoconfig    gcc-14.1.0
hexagon              allyesconfig    clang-20
hexagon                 defconfig    gcc-14.1.0
i386                 allmodconfig    clang-18
i386                  allnoconfig    clang-18
i386                 allyesconfig    clang-18
i386                    defconfig    clang-18
loongarch            allmodconfig    gcc-14.1.0
loongarch             allnoconfig    gcc-14.1.0
loongarch               defconfig    gcc-14.1.0
m68k                 allmodconfig    gcc-14.1.0
m68k                  allnoconfig    gcc-14.1.0
m68k                 allyesconfig    gcc-14.1.0
m68k                    defconfig    gcc-14.1.0
m68k           m5208evb_defconfig    clang-14
m68k              multi_defconfig    clang-14
m68k                q40_defconfig    clang-20
microblaze           allmodconfig    gcc-14.1.0
microblaze            allnoconfig    gcc-14.1.0
microblaze           allyesconfig    gcc-14.1.0
microblaze              defconfig    gcc-14.1.0
mips                  allnoconfig    gcc-14.1.0
mips               ip32_defconfig    clang-20
nios2                 allnoconfig    gcc-14.1.0
nios2                   defconfig    gcc-14.1.0
openrisc              allnoconfig    clang-20
openrisc             allyesconfig    gcc-14.1.0
openrisc                defconfig    gcc-12
parisc               alldefconfig    clang-20
parisc               allmodconfig    gcc-14.1.0
parisc                allnoconfig    clang-20
parisc               allyesconfig    gcc-14.1.0
parisc                  defconfig    gcc-12
parisc64                defconfig    gcc-14.1.0
powerpc              allmodconfig    gcc-14.1.0
powerpc               allnoconfig    clang-20
powerpc              allyesconfig    gcc-14.1.0
powerpc       bluestone_defconfig    clang-20
powerpc          ep88xc_defconfig    clang-14
powerpc          ep88xc_defconfig    clang-20
powerpc          ppc6xx_defconfig    clang-20
powerpc         rainier_defconfig    clang-20
powerpc             wii_defconfig    clang-14
powerpc             wii_defconfig    clang-20
riscv                allmodconfig    gcc-14.1.0
riscv                 allnoconfig    clang-20
riscv                allyesconfig    gcc-14.1.0
riscv                   defconfig    gcc-12
s390                 allmodconfig    gcc-14.1.0
s390                  allnoconfig    clang-20
s390                 allyesconfig    gcc-14.1.0
s390                    defconfig    gcc-12
sh                   allmodconfig    gcc-14.1.0
sh                    allnoconfig    gcc-14.1.0
sh                   allyesconfig    gcc-14.1.0
sh             ap325rxa_defconfig    clang-20
sh                      defconfig    gcc-12
sh              sdk7786_defconfig    clang-20
sparc                allmodconfig    gcc-14.1.0
sparc64                 defconfig    gcc-12
um                   allmodconfig    clang-20
um                    allnoconfig    clang-20
um                   allyesconfig    clang-20
um                      defconfig    gcc-12
um                 i386_defconfig    gcc-12
um               x86_64_defconfig    gcc-12
x86_64                allnoconfig    clang-18
x86_64               allyesconfig    clang-18
x86_64                  defconfig    clang-18
x86_64                      kexec    clang-18
x86_64                      kexec    gcc-12
x86_64                   rhel-8.3    gcc-12
x86_64               rhel-8.3-bpf    clang-18
x86_64             rhel-8.3-kunit    clang-18
x86_64               rhel-8.3-ltp    clang-18
x86_64              rhel-8.3-rust    clang-18
xtensa                allnoconfig    gcc-14.1.0
xtensa      audio_kc705_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
