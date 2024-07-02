Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298F15B133
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Jul 2024 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719924157; cv=none; b=KlpIjnT/85DUcqJ18WSw+TMSdoaUpdfmpT3w9a+43C/H4fYpV96/HLf1ZT3Fakudv5NhI+Nonquk24HvNuPIr7W1DJlQ1lxZr6m/1/BvxJsrqOW64pHtuuuKeazfvkrTyVbZvPcPi8iK8ZaFxFFxG8o7G2ZChdmCKFOSJZSs2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719924157; c=relaxed/simple;
	bh=qdMx2b27n1rnPtyLXaofOCUQzir3qxSEgRqwPKUKu2c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ebbeOOcbiTD/9WWjxvSqTUu6fhlrq+1/bNXMcSLRNXRTTYlpfiOEkcenEERt5INVtTIvx9jyGq0dAcx3GjjVNg3fmHGq/GoaNdMlmFZGVVAkXSFoXY7173PXH+r9Lxs4lzulOFWhA2mqcCC2p6KEiyAGHIacq3pwcBcrEcuf6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9NkSfAB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9NkSfAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719924155; x=1751460155;
  h=date:from:to:cc:subject:message-id;
  bh=qdMx2b27n1rnPtyLXaofOCUQzir3qxSEgRqwPKUKu2c=;
  b=Z9NkSfABDb12f2OtsXP058Hu1z1dXq4xtFme304YvtBUWbvGOdCjo0Ln
   VGAZNFuWncr7pvHP7VjlCqZEDs1zMxOSxbsnNwBoxFWwAXvGVv9rl/uBO
   OGhASfRrzWNUU6ZUOpQpYBd0B0uonAMGMVMmHJBPvZ7CipbH43WIh0Uf0
   cmwxUQtR1g1uSjQSG55xU87Q5dMTJG1xHyGDj19/WcFY4WALfXwd5m1za
   odPtpftQD4ldkQEq+BFBSlH/HEtw1u/fx2/PhsxS9ERhQwdk1Dncu7lgh
   0wEYFmYmBuuO4O2X6VZqMURIs2NS9nRHwRAZ9slCk0bFuttHh38SEhlD8
   A==;
X-CSE-ConnectionGUID: y6Z7HUJMRzyyzN9nSxiufA==
X-CSE-MsgGUID: PUoTuMOmSNiBAXbc3q78vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17228631"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17228631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 05:42:34 -0700
X-CSE-ConnectionGUID: HBwsE8czRfuxRYYeh1ItEg==
X-CSE-MsgGUID: 1yxAVosBRuSXnAjxPRQbnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="76618616"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2024 05:42:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOcq6-000OBG-1I;
	Tue, 02 Jul 2024 12:42:30 +0000
Date: Tue, 02 Jul 2024 20:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 4fd25249ded2103dd2df349e28cf9e7def297479
Message-ID: <202407022031.iXjZU4ME-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 4fd25249ded2103dd2df349e28cf9e7def297479  Merge branch 'hwmon-amc6821' into hwmon-staging

elapsed time: 2082m

configs tested: 102
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240702   gcc-13.2.0
arc                   randconfig-002-20240702   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                            mmp2_defconfig   gcc-13.2.0
arm                        mvebu_v7_defconfig   clang-15
arm                   randconfig-001-20240702   gcc-13.2.0
arm                   randconfig-002-20240702   gcc-13.2.0
arm                   randconfig-003-20240702   gcc-13.2.0
arm                   randconfig-004-20240702   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240702   gcc-13.2.0
arm64                 randconfig-002-20240702   clang-19
arm64                 randconfig-003-20240702   gcc-13.2.0
arm64                 randconfig-004-20240702   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240702   gcc-13.2.0
csky                  randconfig-002-20240702   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon               randconfig-001-20240702   clang-19
hexagon               randconfig-002-20240702   clang-19
i386         buildonly-randconfig-001-20240701   clang-18
i386         buildonly-randconfig-002-20240701   clang-18
i386         buildonly-randconfig-003-20240701   clang-18
i386         buildonly-randconfig-004-20240701   clang-18
i386         buildonly-randconfig-005-20240701   gcc-13
i386         buildonly-randconfig-006-20240701   gcc-9
i386                  randconfig-001-20240701   clang-18
i386                  randconfig-002-20240701   clang-18
i386                  randconfig-003-20240701   clang-18
i386                  randconfig-004-20240701   gcc-7
i386                  randconfig-005-20240701   clang-18
i386                  randconfig-006-20240701   gcc-13
i386                  randconfig-011-20240701   gcc-13
i386                  randconfig-012-20240701   clang-18
i386                  randconfig-013-20240701   clang-18
i386                  randconfig-014-20240701   gcc-8
i386                  randconfig-015-20240701   gcc-10
i386                  randconfig-016-20240701   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240702   gcc-13.2.0
loongarch             randconfig-002-20240702   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240702   gcc-13.2.0
nios2                 randconfig-002-20240702   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240702   gcc-13.2.0
parisc                randconfig-002-20240702   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240702   gcc-13.2.0
powerpc               randconfig-002-20240702   clang-16
powerpc               randconfig-003-20240702   gcc-13.2.0
powerpc64             randconfig-001-20240702   clang-19
powerpc64             randconfig-002-20240702   gcc-13.2.0
powerpc64             randconfig-003-20240702   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240702   gcc-13.2.0
riscv                 randconfig-002-20240702   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                  randconfig-001-20240702   clang-19
s390                  randconfig-002-20240702   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240702   gcc-13.2.0
sh                    randconfig-002-20240702   gcc-13.2.0
sparc64               randconfig-001-20240702   gcc-13.2.0
sparc64               randconfig-002-20240702   gcc-13.2.0
um                                allnoconfig   clang-17
um                    randconfig-001-20240702   gcc-8
um                    randconfig-002-20240702   gcc-13
x86_64       buildonly-randconfig-001-20240702   gcc-8
x86_64       buildonly-randconfig-002-20240702   clang-18
x86_64       buildonly-randconfig-003-20240702   clang-18
x86_64       buildonly-randconfig-004-20240702   clang-18
x86_64       buildonly-randconfig-005-20240702   gcc-13
x86_64       buildonly-randconfig-006-20240702   clang-18
x86_64                randconfig-001-20240702   clang-18
x86_64                randconfig-002-20240702   gcc-11
x86_64                randconfig-003-20240702   gcc-13
x86_64                randconfig-004-20240702   gcc-9
x86_64                randconfig-005-20240702   clang-18
x86_64                randconfig-006-20240702   gcc-13
x86_64                randconfig-011-20240702   clang-18
x86_64                randconfig-012-20240702   gcc-8
x86_64                randconfig-013-20240702   clang-18
x86_64                randconfig-014-20240702   gcc-13
x86_64                randconfig-015-20240702   gcc-13
x86_64                randconfig-016-20240702   clang-18
x86_64                randconfig-071-20240702   clang-18
x86_64                randconfig-072-20240702   gcc-13
x86_64                randconfig-073-20240702   gcc-8
x86_64                randconfig-074-20240702   clang-18
x86_64                randconfig-075-20240702   gcc-13
x86_64                randconfig-076-20240702   gcc-8
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240702   gcc-13.2.0
xtensa                randconfig-002-20240702   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
