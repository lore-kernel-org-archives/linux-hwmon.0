Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5502922071
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Aug 2024 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675705; cv=none; b=gmUtt+FVbWEQe590OA052I2QkINCY7UFcWisatdt6HO1fzRwZhrluT+jHi08hof1k7C4mrbi5CYByCG7XZs9Zp8RzYW/VSQuJWTKQI85a2JGjQ6UC8jtqlW9SJzLxGrj+GhGYzaEfp9T8Q2sE2B+Z2RQsOURv7GFwHB31UscIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675705; c=relaxed/simple;
	bh=2eKyhQxin1UwmDFmUAD/RK1lgZZyLXQA+4gnu1mlSg4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJ4wewxoFLazkqVmBpZqNQSVCnBDnWZpV0C/HEwErxJAEiHnUrdZwKG9ztzeyMjhteRfshVC9+wlZ9v/NTUQQy+0f8AstlS8GMztuCVGTlM1BkYgHa3/HxdZW1y7kq1NPwNPzSWL7UiynDBwnOOja3tgvVPODOsyhRKruZp8q7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVUj069j; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVUj069j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724675704; x=1756211704;
  h=date:from:to:cc:subject:message-id;
  bh=2eKyhQxin1UwmDFmUAD/RK1lgZZyLXQA+4gnu1mlSg4=;
  b=cVUj069j4hoBlIGnmvpz036IPZgq7BrDA/vmk5LFn1I5+dGArM8p5h24
   sZLHWDhweSDQJeL/aG0AocEihusd8UC4se74My/2TXML3BAtcRxAHkGyn
   nK/N6jq7gG2plZNA6XaCg3wBp1JKeJs1rF0HsPP4gRSZoOcoCxL8nRPMd
   ae+rQvRkA/yq5ilMoRBbp+zRkQC59QN1DZ/7CeO3h8fRpdyEOiKsvX8Y3
   dZuWq8Q4r9lvt/izm5zK3NV1/XMyX8C2GBqmwiL/Te/Vs0aX6jHfUT6Nb
   JUseAtRpPlyPT86JzjOyBbkpVjqNi8qixyaIOrHij97l9HF21GdWUe7i5
   g==;
X-CSE-ConnectionGUID: phQXBOMLSyaOoRXryq6msw==
X-CSE-MsgGUID: xxXIlF8pSpKv0jz13kG//w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45611389"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="45611389"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:35:03 -0700
X-CSE-ConnectionGUID: BeBTKP63TNC6G1vOvJ9SRw==
X-CSE-MsgGUID: Op+yOgzhQBOrVsldMKKHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="67195103"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Aug 2024 05:35:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siYvz-000H2x-18;
	Mon, 26 Aug 2024 12:34:59 +0000
Date: Mon, 26 Aug 2024 20:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 9efaebc0072b8e95505544bf385c20ee8a29d799
Message-ID: <202408262010.0BfzCDMa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 9efaebc0072b8e95505544bf385c20ee8a29d799  hwmon: (asus-ec-sensors) remove VRM temp X570-E GAMING

elapsed time: 797m

configs tested: 211
configs skipped: 12

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
arc                        nsimosci_defconfig   gcc-12.3.0
arc                   randconfig-001-20240826   gcc-13.2.0
arc                   randconfig-002-20240826   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-12.3.0
arm                       netwinder_defconfig   gcc-12.3.0
arm                   randconfig-001-20240826   gcc-13.2.0
arm                   randconfig-002-20240826   gcc-13.2.0
arm                   randconfig-003-20240826   gcc-13.2.0
arm                   randconfig-004-20240826   gcc-13.2.0
arm                           stm32_defconfig   gcc-12.3.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240826   gcc-13.2.0
arm64                 randconfig-002-20240826   gcc-13.2.0
arm64                 randconfig-003-20240826   gcc-13.2.0
arm64                 randconfig-004-20240826   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240826   gcc-13.2.0
csky                  randconfig-002-20240826   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240826   clang-18
i386         buildonly-randconfig-002-20240826   clang-18
i386         buildonly-randconfig-002-20240826   gcc-12
i386         buildonly-randconfig-003-20240826   clang-18
i386         buildonly-randconfig-004-20240826   clang-18
i386         buildonly-randconfig-005-20240826   clang-18
i386         buildonly-randconfig-006-20240826   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240826   clang-18
i386                  randconfig-001-20240826   gcc-12
i386                  randconfig-002-20240826   clang-18
i386                  randconfig-002-20240826   gcc-12
i386                  randconfig-003-20240826   clang-18
i386                  randconfig-004-20240826   clang-18
i386                  randconfig-004-20240826   gcc-12
i386                  randconfig-005-20240826   clang-18
i386                  randconfig-005-20240826   gcc-12
i386                  randconfig-006-20240826   clang-18
i386                  randconfig-011-20240826   clang-18
i386                  randconfig-011-20240826   gcc-12
i386                  randconfig-012-20240826   clang-18
i386                  randconfig-012-20240826   gcc-12
i386                  randconfig-013-20240826   clang-18
i386                  randconfig-013-20240826   gcc-12
i386                  randconfig-014-20240826   clang-18
i386                  randconfig-014-20240826   gcc-12
i386                  randconfig-015-20240826   clang-18
i386                  randconfig-015-20240826   gcc-12
i386                  randconfig-016-20240826   clang-18
i386                  randconfig-016-20240826   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240826   gcc-13.2.0
loongarch             randconfig-002-20240826   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   gcc-12.3.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240826   gcc-13.2.0
nios2                 randconfig-002-20240826   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240826   gcc-13.2.0
parisc                randconfig-002-20240826   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 linkstation_defconfig   gcc-12.3.0
powerpc                  mpc866_ads_defconfig   gcc-12.3.0
powerpc                  mpc885_ads_defconfig   gcc-12.3.0
powerpc                      pcm030_defconfig   gcc-12.3.0
powerpc               randconfig-001-20240826   gcc-13.2.0
powerpc64             randconfig-001-20240826   gcc-13.2.0
powerpc64             randconfig-002-20240826   gcc-13.2.0
powerpc64             randconfig-003-20240826   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-12.3.0
riscv                 randconfig-001-20240826   gcc-13.2.0
riscv                 randconfig-002-20240826   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240826   gcc-13.2.0
s390                  randconfig-002-20240826   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240826   gcc-13.2.0
sh                    randconfig-002-20240826   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-12.3.0
sh                   rts7751r2dplus_defconfig   gcc-12.3.0
sh                           se7724_defconfig   gcc-12.3.0
sh                           sh2007_defconfig   gcc-12.3.0
sh                             shx3_defconfig   gcc-12.3.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240826   gcc-13.2.0
sparc64               randconfig-002-20240826   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240826   gcc-13.2.0
um                    randconfig-002-20240826   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-12.3.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240826   clang-18
x86_64       buildonly-randconfig-002-20240826   clang-18
x86_64       buildonly-randconfig-002-20240826   gcc-12
x86_64       buildonly-randconfig-003-20240826   clang-18
x86_64       buildonly-randconfig-003-20240826   gcc-12
x86_64       buildonly-randconfig-004-20240826   clang-18
x86_64       buildonly-randconfig-004-20240826   gcc-12
x86_64       buildonly-randconfig-005-20240826   clang-18
x86_64       buildonly-randconfig-006-20240826   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240826   clang-18
x86_64                randconfig-001-20240826   gcc-12
x86_64                randconfig-002-20240826   clang-18
x86_64                randconfig-003-20240826   clang-18
x86_64                randconfig-004-20240826   clang-18
x86_64                randconfig-005-20240826   clang-18
x86_64                randconfig-005-20240826   gcc-12
x86_64                randconfig-006-20240826   clang-18
x86_64                randconfig-011-20240826   clang-18
x86_64                randconfig-012-20240826   clang-18
x86_64                randconfig-013-20240826   clang-18
x86_64                randconfig-013-20240826   gcc-12
x86_64                randconfig-014-20240826   clang-18
x86_64                randconfig-014-20240826   gcc-12
x86_64                randconfig-015-20240826   clang-18
x86_64                randconfig-016-20240826   clang-18
x86_64                randconfig-071-20240826   clang-18
x86_64                randconfig-072-20240826   clang-18
x86_64                randconfig-073-20240826   clang-18
x86_64                randconfig-074-20240826   clang-18
x86_64                randconfig-074-20240826   gcc-12
x86_64                randconfig-075-20240826   clang-18
x86_64                randconfig-075-20240826   gcc-12
x86_64                randconfig-076-20240826   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240826   gcc-13.2.0
xtensa                randconfig-002-20240826   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
