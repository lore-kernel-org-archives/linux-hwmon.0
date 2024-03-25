Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A46EB4E
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711392087; cv=none; b=nPrA1r87qBLAsWfBpvg89UIamOjezNRmZl/Is5oLhR/uiX3agcbPSg66kAX3LWgkZ7ZTZRKL8Ukz/IdLnsQV/U5qhzTbTrNlX3wrpCdndOruI08AU3pvQ2pxukoGVmSlvbt5PfmFhIWVzREcpJihkgvGUwPACBGOVMuQlJh57+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711392087; c=relaxed/simple;
	bh=s5U7lCIPvOyqN2EYdsWdWt+/P++ksAcBsmobMticNdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tQ2jMLhL/MxlN8qqNQA4zng7B5x/fR2QZaCMwgPD78UtzJY5hYC7R49sbM85hNMr8G6cJ/aSTfxdWcmRKRA6des7jioytMOZNj7pb0YMpkZGOJ8kCxbg2QMOsynoySqC0sZbp/HalevAvQPBjq7eQultZ1rCR2xwuxmfoGtZb20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfycTrcj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfycTrcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711392085; x=1742928085;
  h=date:from:to:cc:subject:message-id;
  bh=s5U7lCIPvOyqN2EYdsWdWt+/P++ksAcBsmobMticNdE=;
  b=RfycTrcjsOxX5t7U64VNRUgNd2BpW7Y77fvPVoBkHgvoaiu9alTjKVRb
   vPU3ekfj2NN8Q/i1jMA/kiEUIUto1pbSnujZSbxfyoN7GKGvBzVqk+cGJ
   6F3RCu4tx1dDE1wZ4AKomd3I4oeQAZ1ksYGIflZI3qLd7sPnIpuPQEpp0
   +ZcISzS+WufXp61yWjvfPrLl1QbaCS4GbLi03+HaCPcvwhTa2KC4A0+QC
   SKqh0MA+RwIjQJipMipFqvaFuvmhiQEryJtw+RVnNWy495hy1j9jBmMRx
   GxozQsehrIEO23XXEerPaQBwx9LuUhPhjjLIk/8vlp0/40w0+LKbblRWu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6624200"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6624200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 11:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="16139469"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Mar 2024 11:41:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ropG5-000Mla-0j;
	Mon, 25 Mar 2024 18:41:21 +0000
Date: Tue, 26 Mar 2024 02:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:kunit] BUILD SUCCESS
 008f8a4fb1f5ce99ec5e86558ddaead707b18828
Message-ID: <202403260243.qw1zCjDo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git kunit
branch HEAD: 008f8a4fb1f5ce99ec5e86558ddaead707b18828  powerpc: Add support for suppressing warning backtraces

elapsed time: 1100m

configs tested: 143
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                        multi_v5_defconfig   gcc  
arm                       spear13xx_defconfig   gcc  
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240325   gcc  
i386         buildonly-randconfig-003-20240325   gcc  
i386         buildonly-randconfig-004-20240325   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240325   gcc  
i386                  randconfig-002-20240325   gcc  
i386                  randconfig-004-20240325   gcc  
i386                  randconfig-005-20240325   gcc  
i386                  randconfig-011-20240325   gcc  
i386                  randconfig-015-20240325   gcc  
i386                  randconfig-016-20240325   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                        fsp2_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240325   clang
x86_64       buildonly-randconfig-002-20240325   clang
x86_64       buildonly-randconfig-003-20240325   clang
x86_64       buildonly-randconfig-005-20240325   clang
x86_64       buildonly-randconfig-006-20240325   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240325   clang
x86_64                randconfig-006-20240325   clang
x86_64                randconfig-011-20240325   clang
x86_64                randconfig-012-20240325   clang
x86_64                randconfig-015-20240325   clang
x86_64                randconfig-071-20240325   clang
x86_64                randconfig-072-20240325   clang
x86_64                randconfig-074-20240325   clang
x86_64                randconfig-075-20240325   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
