Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B515B109
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Jul 2024 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927898; cv=none; b=DcDHe1G3dd1shTxu2rEcDSd8LmOvoEwpNup2+/U3i8D6sPLwfWK04gU2IfgzuIHXL0kX8igwFtuulNNrFpN5k/iVNb4DavCvyer6A4ajLaa4Ia71myWwgC0jSG6OoCgO7kcdn75SVNpy/8xt6j/DkXDjLlVFwJfYKaiIT/nyuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927898; c=relaxed/simple;
	bh=vWejdBLOLIbnIUdS3j57Hrf5VzaiF/johQZudRwNF0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WlyBgFwrAZ6ZMwtaNdoE5bPnvZGZC71/WBODECpJEzD6LbSCFsmUCU5n6unzhIMEGwZGZ/HZuTLs0VD3jiGCetIPTJRCG1QduvtyAq436M/HAWTWpRvnEPZWn+XafyF276P8ge7a2fdeb+YIt80UZqBR3Cj4budFg5/yI3RqiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbzlnYmR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbzlnYmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719927896; x=1751463896;
  h=date:from:to:cc:subject:message-id;
  bh=vWejdBLOLIbnIUdS3j57Hrf5VzaiF/johQZudRwNF0g=;
  b=LbzlnYmRlXkeO6utfbvSnstX/Q9UK4tq2WsW0jmt1ER5zW3Qm4E+eK5E
   MY6Fboh3eni5OelCq+6qPbRfl4hIow+g3vCOWKNrb0ATxnLGrCNgJDFZe
   tbBVvO4kPJuNawUqo68+sT7BgQLRYNiE11FuY66KqAVMBg27VkDg+2yrX
   CdkCdI3SkSSrTXFrARCxRKz5iqFwiPo18r0y9NmN4WjZStCZ/ciNAR/wV
   BMwrOcW++0ofmIccVX1etmVMVzvAecM9LOeQMV1z4+cLV5R8qF+aihJm2
   3ZrZKds85g0Mr5oPP9ghUuANj1JQ7FdOxeT8BoltJ+NOmbggLdxOpmZzc
   g==;
X-CSE-ConnectionGUID: sG94xdhLSx2GrJf9i8XiNw==
X-CSE-MsgGUID: 5FuuTMO5TfGGAWC3jPmW4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16826395"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="16826395"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 06:44:55 -0700
X-CSE-ConnectionGUID: X9bvhAJeRICGaRkbFPaWNg==
X-CSE-MsgGUID: QjwQahWnRCuN73okR5x0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="83460485"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2024 06:44:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOdoR-000OFc-24;
	Tue, 02 Jul 2024 13:44:51 +0000
Date: Tue, 02 Jul 2024 21:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 b399a16d385bd153ec739b96205811f30a7f8f4e
Message-ID: <202407022154.NqIXArIw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: b399a16d385bd153ec739b96205811f30a7f8f4e  Merge branch 'hwmon-amc6821' into testing

elapsed time: 2144m

configs tested: 102
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240702   gcc-13.2.0
arc                   randconfig-002-20240702   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                       multi_v4t_defconfig   clang-19
arm                       omap2plus_defconfig   gcc-13.2.0
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
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                           ip32_defconfig   clang-19
mips                     loongson2k_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240702   gcc-13.2.0
nios2                 randconfig-002-20240702   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
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
um                                allnoconfig   clang-17
x86_64                           alldefconfig   gcc-13
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
