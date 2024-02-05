Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688732C92
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Feb 2024 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146783; cv=none; b=O0YVx+EDfSjrmkb7N2v8Lpq5jevORltGaoJQif//VpF7fliBLmYN1W8w7YP1qcf7eb8RTF/AjdQPCcF+u25fbmQyll4sNmHlN6JQcAQ9xvKT7rFlkndinXQxEmSZl3CGImuZ/IZIRWksGwFW8s8iqy+b00VvQKDIIrZejNt6QXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146783; c=relaxed/simple;
	bh=rShDXF3JDta374k8eZw4WY3c0l/g4zbQK4fpPAHvMTo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iXmJSIl4keaJLtBv8bkoH+IzJcxaEVUTjZLo3toH2HNwluEmK8mCHpC00Xjj46PvzOVTZKHyoJv6jYquErFTC+oNiFdRWjhq31m+GZMAkHkX95yxVDSP/5gEDjubL4EIgikaE6wGpHchDdc46Nzfu7fOnhVaXtZwhgCHEyiQiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TW3HMLpN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TW3HMLpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707146781; x=1738682781;
  h=date:from:to:cc:subject:message-id;
  bh=rShDXF3JDta374k8eZw4WY3c0l/g4zbQK4fpPAHvMTo=;
  b=TW3HMLpNId+X61+MjkD9mOy84kr8T9CuTqRMg5sZbY+X2lM+gmCuUSP0
   iLVh31VyzvNt9mv++Ev58udgulgvE0W1SBwX5Zq1uBw+v1BpPLVC/hMSf
   DdasFe30ObJzgBeLGK6mylzx9cHmkUOxNyhbB15zJYUi2vUtbeE/NNQAx
   BDU9rDbN5VUdx4adVuoNBtkDCj4IMYmIt46sFH7zGx5Xyyn/YsbKmmILx
   GlNbbxBmqhO9L1sZ9mwfcbdOnLYpeIQX74e+S6w/duczhqZvd2wvixT4v
   IaKP85BzuB1Vk4gT8bq7DsAXlTSZYxrfHBF20AN6xUMEIw9P+C5u3yXmh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11189475"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11189475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 07:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="721349"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Feb 2024 07:25:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX0qf-0000c4-2A;
	Mon, 05 Feb 2024 15:25:29 +0000
Date: Mon, 05 Feb 2024 23:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD REGRESSION
 34cf8c657cf0365791cdc658ddbca9cc907726ce
Message-ID: <202402052352.VNOEAAPx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 34cf8c657cf0365791cdc658ddbca9cc907726ce  hwmon: (coretemp) Enlarge per package core count limit

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-allmodconfig
    `-- standard-input:Error:unknown-pseudo-op:cfi_def_

elapsed time: 1446m

configs tested: 178
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240205   gcc  
arc                   randconfig-002-20240205   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       imx_v6_v7_defconfig   clang
arm                       multi_v4t_defconfig   clang
arm                         mv78xx0_defconfig   clang
arm                   randconfig-001-20240205   clang
arm                   randconfig-002-20240205   gcc  
arm                   randconfig-003-20240205   clang
arm                   randconfig-004-20240205   clang
arm                         s5pv210_defconfig   gcc  
arm                        spear6xx_defconfig   clang
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240205   gcc  
arm64                 randconfig-002-20240205   gcc  
arm64                 randconfig-003-20240205   gcc  
arm64                 randconfig-004-20240205   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240205   gcc  
csky                  randconfig-002-20240205   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240205   clang
hexagon               randconfig-002-20240205   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240205   clang
i386         buildonly-randconfig-002-20240205   clang
i386         buildonly-randconfig-003-20240205   clang
i386         buildonly-randconfig-004-20240205   clang
i386         buildonly-randconfig-005-20240205   clang
i386         buildonly-randconfig-006-20240205   clang
i386                                defconfig   clang
i386                  randconfig-001-20240205   clang
i386                  randconfig-002-20240205   clang
i386                  randconfig-003-20240205   clang
i386                  randconfig-004-20240205   gcc  
i386                  randconfig-005-20240205   clang
i386                  randconfig-006-20240205   gcc  
i386                  randconfig-011-20240205   gcc  
i386                  randconfig-012-20240205   clang
i386                  randconfig-013-20240205   gcc  
i386                  randconfig-014-20240205   gcc  
i386                  randconfig-015-20240205   clang
i386                  randconfig-016-20240205   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240205   gcc  
loongarch             randconfig-002-20240205   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240205   gcc  
nios2                 randconfig-002-20240205   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240205   gcc  
parisc                randconfig-002-20240205   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                       holly_defconfig   clang
powerpc               randconfig-001-20240205   clang
powerpc               randconfig-002-20240205   clang
powerpc               randconfig-003-20240205   gcc  
powerpc64             randconfig-001-20240205   clang
powerpc64             randconfig-002-20240205   clang
powerpc64             randconfig-003-20240205   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240205   clang
riscv                 randconfig-002-20240205   gcc  
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240205   clang
s390                  randconfig-002-20240205   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240205   gcc  
sh                    randconfig-002-20240205   gcc  
sh                           se7750_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240205   gcc  
sparc64               randconfig-002-20240205   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240205   clang
um                    randconfig-002-20240205   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240205   clang
x86_64       buildonly-randconfig-002-20240205   clang
x86_64       buildonly-randconfig-003-20240205   gcc  
x86_64       buildonly-randconfig-004-20240205   gcc  
x86_64       buildonly-randconfig-005-20240205   gcc  
x86_64       buildonly-randconfig-006-20240205   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240205   gcc  
x86_64                randconfig-002-20240205   gcc  
x86_64                randconfig-003-20240205   clang
x86_64                randconfig-004-20240205   gcc  
x86_64                randconfig-005-20240205   gcc  
x86_64                randconfig-006-20240205   gcc  
x86_64                randconfig-011-20240205   gcc  
x86_64                randconfig-012-20240205   gcc  
x86_64                randconfig-013-20240205   clang
x86_64                randconfig-014-20240205   clang
x86_64                randconfig-015-20240205   gcc  
x86_64                randconfig-016-20240205   clang
x86_64                randconfig-071-20240205   clang
x86_64                randconfig-072-20240205   gcc  
x86_64                randconfig-073-20240205   clang
x86_64                randconfig-074-20240205   clang
x86_64                randconfig-075-20240205   gcc  
x86_64                randconfig-076-20240205   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240205   gcc  
xtensa                randconfig-002-20240205   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
