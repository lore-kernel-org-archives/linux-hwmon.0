Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6037483
	for <linux-hwmon@vger.kernel.org>; Fri, 29 Mar 2024 01:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711675293; cv=none; b=V5D2sbSDyYT6cUWcOR0Mz10AMR+3ow1zbbQxWSuTrBEcARny02CINJRcblFckhrpv5IVeN+wZg7vW3Qt/d2uhu07OTj7MsT1a16ZEOpktsmO8bg0p3iVIkBHPScgMfEu4FHDCz1Hj/64yXVke0ikdGTdK4p5nuW42dNa4EtDrEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711675293; c=relaxed/simple;
	bh=zwf8DFpz49VirCsYNuVkX1owbdpr9moDouphbVLVYcs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rGyedFhEzcWfsPXf7MNGTxgWNSYqfLCt2C5G0FFjeRRbpbohewgmxlczGC2VPHQRUcW57JOqbT9qIv9HvqC0a8qGAzd/Arosx5cqqJcvMcODTF9URGw2Hb6db7FgIqlCD9izsTQMH5fzpfZvv1w5redxXkTQkihwSs7NG05cYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ut1UvbTQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ut1UvbTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711675292; x=1743211292;
  h=date:from:to:cc:subject:message-id;
  bh=zwf8DFpz49VirCsYNuVkX1owbdpr9moDouphbVLVYcs=;
  b=Ut1UvbTQBd8UB+qpSwA2lnyWfHYyWZScb9oWEqPgqiURjs4WWnNWzFoW
   K2zdgEGQCBVaF4wZhWpaOqPXaepNigL77/MirP6x8YgrtDusTrdlwWsgB
   pxpTZB0WOuPg2qPiTAsrDrZbHMLo7jM12s69SxZIlZZYgRGFmcmI8Bga+
   NLKRCdACFp2kmvmZxz7MxxVX3pjCMZSieO+79vEkm7rptyyeo6LmzB/4S
   WwB+VHg16Gw/6Bv8HWQ0sOJvbTM7tEs1auoC93JkOezHK8BHn58s8VDi1
   On7s7Tvwt3mSn49llT9ImM9jYMYX5/rrcDH79LPtOH+44pJeMBTvLRBqj
   Q==;
X-CSE-ConnectionGUID: 9QiD8wxYTrSKhbgaR3lCwA==
X-CSE-MsgGUID: XmmJN3PRSIOYXI/PObCa3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10678007"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="10678007"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 18:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16878791"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Mar 2024 18:21:29 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq0vv-0002hj-0o;
	Fri, 29 Mar 2024 01:21:27 +0000
Date: Fri, 29 Mar 2024 09:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 ad98b547d596561b6bdc5c2fdf8aa1a620c9e6fa
Message-ID: <202403290915.lW4mf5g6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: ad98b547d596561b6bdc5c2fdf8aa1a620c9e6fa  Merge branch 'kunit-v3' into testing

elapsed time: 1449m

configs tested: 170
configs skipped: 10

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
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240328   gcc  
arc                   randconfig-002-20240328   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240328   gcc  
arm                   randconfig-002-20240328   gcc  
arm                   randconfig-003-20240328   gcc  
arm                   randconfig-004-20240328   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240328   gcc  
arm64                 randconfig-002-20240328   gcc  
arm64                 randconfig-003-20240328   gcc  
arm64                 randconfig-004-20240328   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240328   gcc  
csky                  randconfig-002-20240328   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240328   clang
hexagon               randconfig-002-20240328   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240328   gcc  
i386         buildonly-randconfig-002-20240328   gcc  
i386         buildonly-randconfig-003-20240328   clang
i386         buildonly-randconfig-004-20240328   gcc  
i386         buildonly-randconfig-005-20240328   gcc  
i386         buildonly-randconfig-006-20240328   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240328   clang
i386                  randconfig-002-20240328   clang
i386                  randconfig-003-20240328   clang
i386                  randconfig-004-20240328   clang
i386                  randconfig-005-20240328   gcc  
i386                  randconfig-006-20240328   gcc  
i386                  randconfig-011-20240328   clang
i386                  randconfig-012-20240328   clang
i386                  randconfig-013-20240328   clang
i386                  randconfig-014-20240328   clang
i386                  randconfig-015-20240328   clang
i386                  randconfig-016-20240328   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240328   gcc  
loongarch             randconfig-002-20240328   gcc  
m68k                             alldefconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                           ip22_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240328   gcc  
nios2                 randconfig-002-20240328   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240328   gcc  
parisc                randconfig-002-20240328   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      cm5200_defconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc               randconfig-001-20240328   clang
powerpc               randconfig-002-20240328   clang
powerpc               randconfig-003-20240328   clang
powerpc                     skiroot_defconfig   clang
powerpc                     tqm8555_defconfig   clang
powerpc64             randconfig-001-20240328   clang
powerpc64             randconfig-002-20240328   gcc  
powerpc64             randconfig-003-20240328   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240328   gcc  
riscv                 randconfig-002-20240328   gcc  
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240328   clang
s390                  randconfig-002-20240328   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                    randconfig-001-20240328   gcc  
sh                    randconfig-002-20240328   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240328   gcc  
sparc64               randconfig-002-20240328   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240328   gcc  
um                    randconfig-002-20240328   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240328   gcc  
x86_64       buildonly-randconfig-002-20240328   clang
x86_64       buildonly-randconfig-003-20240328   gcc  
x86_64       buildonly-randconfig-004-20240328   gcc  
x86_64       buildonly-randconfig-005-20240328   gcc  
x86_64       buildonly-randconfig-006-20240328   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240328   clang
x86_64                randconfig-002-20240328   gcc  
x86_64                randconfig-003-20240328   clang
x86_64                randconfig-004-20240328   gcc  
x86_64                randconfig-005-20240328   clang
x86_64                randconfig-006-20240328   clang
x86_64                randconfig-011-20240328   clang
x86_64                randconfig-012-20240328   clang
x86_64                randconfig-013-20240328   gcc  
x86_64                randconfig-014-20240328   gcc  
x86_64                randconfig-015-20240328   clang
x86_64                randconfig-016-20240328   clang
x86_64                randconfig-071-20240328   gcc  
x86_64                randconfig-072-20240328   clang
x86_64                randconfig-073-20240328   gcc  
x86_64                randconfig-074-20240328   gcc  
x86_64                randconfig-075-20240328   gcc  
x86_64                randconfig-076-20240328   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240328   gcc  
xtensa                randconfig-002-20240328   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
