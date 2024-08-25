Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107A679E5
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Aug 2024 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724605068; cv=none; b=hggNwa0tMd7qEAecfzNZOg7mown4avJT3qVor3aaZZaainNUejdN1iwG07w6xZ4Yw2SnUSgS1G5zN5kFfbfnKXbFZXOZBLOcMZ5EyrohqsyBSipb0QewNvbtUrWWLuVMMsP5Vp+3sXV1cUvVK9ZTYghziQBx687VKpKqTJTYVHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724605068; c=relaxed/simple;
	bh=Fdy9ALW5CNkNrFI3RwO/NeeNeMcoPmJK5QmsPqhkAjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qU2TFQ+5y59ERivFf3ig5rMlEMD7/VXpszaWgxGsC9T6ijdmiV7/+Otq2Nc4lKylWhgnyWnki1WOC3jS3SgpPRGuwEs7f9t5iD4E958wWq0QVJQb3YckAvX10bH+/y/Du3GIkZ5RcNbBA520RbLBaN2jYEOPKseXQegJQIkDjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEKg2CVG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEKg2CVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724605067; x=1756141067;
  h=date:from:to:cc:subject:message-id;
  bh=Fdy9ALW5CNkNrFI3RwO/NeeNeMcoPmJK5QmsPqhkAjk=;
  b=aEKg2CVGG911V6wxyYpvVx96atTu6/fU/EaeTvDWekQ9q9kKKCKKYjW1
   gij9H5n8+V7UZ1iVPu2zNrFyCDboo0Ae35tMcXyQajdRk0lubjRPu0eWK
   FaUuI/GrVx+qoSLSInC7oZFISifr9bKaS0li4E/kLPrCoKhpvMF1wqFS7
   +YX2EvL+sWlKC2TrmTZaJBQhBPfjbofmdZKLSEU7aW6fSDI8D/JUlxfXk
   cxRW8FlU/Sa4jWvzuZH2XlJ6eivrjKXvo++cInuserHl/ww2ylILbMS1a
   he5C8KpDlxv85fow7b6SzIge8MkLegg4S1pEgNq0dkeSMPdXfrbi9W8XR
   w==;
X-CSE-ConnectionGUID: cOJlMHENS2qrYeyGTc4osw==
X-CSE-MsgGUID: i7qoI1cgT6yv3MZMivDFKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="40531918"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="40531918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 09:57:46 -0700
X-CSE-ConnectionGUID: oNxDZmxrRDOo+GaQBfeIzA==
X-CSE-MsgGUID: Zqg4+WQdRomCmKR/ExFy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="85480465"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Aug 2024 09:57:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siGYg-000FJz-2n;
	Sun, 25 Aug 2024 16:57:42 +0000
Date: Mon, 26 Aug 2024 00:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 e4ea81e0fc33662dfb01e2eb0eeaba1f484a9232
Message-ID: <202408260032.hAKFLRp1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: e4ea81e0fc33662dfb01e2eb0eeaba1f484a9232  Merge branch 'kpsingh-static' into testing

elapsed time: 1433m

configs tested: 182
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-14
arm                         mv78xx0_defconfig   clang-20
arm                             mxs_defconfig   clang-14
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240825   gcc-13.2.0
arm                   randconfig-002-20240825   gcc-13.2.0
arm                   randconfig-003-20240825   gcc-13.2.0
arm                   randconfig-004-20240825   gcc-13.2.0
arm                             rpc_defconfig   clang-20
arm                         socfpga_defconfig   clang-14
arm                           sunxi_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240825   gcc-13.2.0
arm64                 randconfig-002-20240825   gcc-13.2.0
arm64                 randconfig-003-20240825   gcc-13.2.0
arm64                 randconfig-004-20240825   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240825   gcc-13.2.0
csky                  randconfig-002-20240825   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240825   clang-18
i386         buildonly-randconfig-002-20240825   clang-18
i386         buildonly-randconfig-003-20240825   clang-18
i386         buildonly-randconfig-004-20240825   clang-18
i386         buildonly-randconfig-004-20240825   gcc-12
i386         buildonly-randconfig-005-20240825   clang-18
i386         buildonly-randconfig-006-20240825   clang-18
i386         buildonly-randconfig-006-20240825   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240825   clang-18
i386                  randconfig-001-20240825   gcc-12
i386                  randconfig-002-20240825   clang-18
i386                  randconfig-002-20240825   gcc-12
i386                  randconfig-003-20240825   clang-18
i386                  randconfig-003-20240825   gcc-12
i386                  randconfig-004-20240825   clang-18
i386                  randconfig-004-20240825   gcc-12
i386                  randconfig-005-20240825   clang-18
i386                  randconfig-006-20240825   clang-18
i386                  randconfig-011-20240825   clang-18
i386                  randconfig-012-20240825   clang-18
i386                  randconfig-012-20240825   gcc-11
i386                  randconfig-013-20240825   clang-18
i386                  randconfig-014-20240825   clang-18
i386                  randconfig-015-20240825   clang-18
i386                  randconfig-016-20240825   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240825   gcc-13.2.0
loongarch             randconfig-002-20240825   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-14
mips                          rb532_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240825   gcc-13.2.0
nios2                 randconfig-002-20240825   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240825   gcc-13.2.0
parisc                randconfig-002-20240825   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-14
powerpc                 mpc8313_rdb_defconfig   clang-14
powerpc                      ppc44x_defconfig   clang-20
powerpc               randconfig-001-20240825   gcc-13.2.0
powerpc               randconfig-002-20240825   gcc-13.2.0
powerpc                        warp_defconfig   clang-14
powerpc64             randconfig-001-20240825   gcc-13.2.0
powerpc64             randconfig-002-20240825   gcc-13.2.0
powerpc64             randconfig-003-20240825   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240825   gcc-13.2.0
riscv                 randconfig-002-20240825   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-14
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240825   gcc-13.2.0
s390                  randconfig-002-20240825   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240825   gcc-13.2.0
sh                    randconfig-002-20240825   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240825   gcc-13.2.0
sparc64               randconfig-002-20240825   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240825   gcc-13.2.0
um                    randconfig-002-20240825   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240825   gcc-12
x86_64       buildonly-randconfig-005-20240825   gcc-12
x86_64       buildonly-randconfig-006-20240825   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240825   gcc-12
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240825   gcc-12
x86_64                randconfig-004-20240825   gcc-12
x86_64                randconfig-005-20240825   gcc-12
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240825   gcc-12
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240825   gcc-12
x86_64                randconfig-016-20240825   gcc-12
x86_64                randconfig-071-20240825   gcc-12
x86_64                randconfig-072-20240825   gcc-12
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240825   gcc-12
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240825   gcc-13.2.0
xtensa                randconfig-002-20240825   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
