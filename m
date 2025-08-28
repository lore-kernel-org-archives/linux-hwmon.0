Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55930AD00
	for <linux-hwmon@vger.kernel.org>; Thu, 28 Aug 2025 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376884; cv=none; b=frRqovSKTAh7cUCLfkPvmvMLUegQ1SrrYaZb0RqBSLJZs+ZPefSqk7UrQwOCvkkT5szXx4QQSxVZd5L22FjYxeIAYhPOIK2RP5qTEEdUc8lbPo1cGeSs3PwjeeEawsVk0Vj0M8YdUXo8OeJC1KhuLQzrvGUQblVC0uBJ5zZ5tHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376884; c=relaxed/simple;
	bh=FKuZ7iPtsIl0iep9wXFEmTNbfYHj0qMYDMuGCTqCGt8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NbWlzULMDDok/41R/s3momxHkv2vdRJh5aX51NcjrAHSxFj3XknVG2mC+Pqifr0XY9hGrtZai/rizmBCG7ibvlMzNrhS5z2lYLSOvEOG3BGfx4/4gsgNjqEFThSg2F/Ve40QTz6wOMndbu5uI3A58eOzhfIQ/e+SOUqctBILEo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAYD8slm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAYD8slm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756376882; x=1787912882;
  h=date:from:to:cc:subject:message-id;
  bh=FKuZ7iPtsIl0iep9wXFEmTNbfYHj0qMYDMuGCTqCGt8=;
  b=dAYD8slmIRP6lc45QBDfkNTIphwCoAlxRjYjLoQJQjO+cJEN/u0zD+MT
   IxJHDgCKHn+WmuHSmm1XlYqAMc+6mv2W+YDRtojcd8hBUzvSXIt25l6jD
   1nQJPWB3Iw9tgObaEmruYonQrRc7ZC6BdRSrHuM2z7KvLqkId6LSRz2Xo
   19ECvJGhM5HueAOKSb+XmaiKP2PYkdSUAe4oQovte4KMEUs7Q8fyA+u3a
   UcNwaghpyL35KmhhOPXsyx9D7z0KT8gymwmmFk/iL8j6l69s/rLs64gsS
   qlyi4lBStrD5GVhgg4dyAgFFzW7IslnjqpfX4cyxO7l+GMJHUeHnFQc6J
   Q==;
X-CSE-ConnectionGUID: KrPfOEY5RImKHtjm3SI/sg==
X-CSE-MsgGUID: Yb8LJ2alSy60bAbd0KyH8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69348927"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69348927"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 03:28:01 -0700
X-CSE-ConnectionGUID: GkbfRdpxQd2zneh7R/hWIA==
X-CSE-MsgGUID: A3RqL4xzTluDS/weRCDaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169322741"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2025 03:28:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urZr6-000Tdz-2m;
	Thu, 28 Aug 2025 10:27:54 +0000
Date: Thu, 28 Aug 2025 18:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 0520c3f7b3f57112b228f8c42b1ec406b7b44816
Message-ID: <202508281809.2fIVHTCY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0520c3f7b3f57112b228f8c42b1ec406b7b44816  hwmon: sbtsi_temp: AMD CPU extended temperature range support

elapsed time: 883m

configs tested: 213
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250828    clang-22
arc                   randconfig-001-20250828    gcc-8.5.0
arc                   randconfig-002-20250828    clang-22
arc                   randconfig-002-20250828    gcc-14.3.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250828    clang-22
arm                   randconfig-001-20250828    gcc-14.3.0
arm                   randconfig-002-20250828    clang-22
arm                   randconfig-002-20250828    gcc-10.5.0
arm                   randconfig-003-20250828    clang-22
arm                   randconfig-004-20250828    clang-22
arm                   randconfig-004-20250828    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250828    clang-22
arm64                 randconfig-002-20250828    clang-22
arm64                 randconfig-003-20250828    clang-22
arm64                 randconfig-003-20250828    gcc-15.1.0
arm64                 randconfig-004-20250828    clang-22
arm64                 randconfig-004-20250828    gcc-15.1.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250828    clang-22
csky                  randconfig-001-20250828    gcc-15.1.0
csky                  randconfig-002-20250828    clang-22
csky                  randconfig-002-20250828    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250828    clang-22
hexagon               randconfig-002-20250828    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250828    gcc-12
i386        buildonly-randconfig-002-20250828    gcc-12
i386        buildonly-randconfig-003-20250828    gcc-12
i386        buildonly-randconfig-004-20250828    gcc-12
i386        buildonly-randconfig-005-20250828    gcc-12
i386        buildonly-randconfig-006-20250828    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250828    gcc-12
i386                  randconfig-002-20250828    gcc-12
i386                  randconfig-003-20250828    gcc-12
i386                  randconfig-004-20250828    gcc-12
i386                  randconfig-005-20250828    gcc-12
i386                  randconfig-006-20250828    gcc-12
i386                  randconfig-007-20250828    gcc-12
i386                  randconfig-011-20250828    clang-20
i386                  randconfig-012-20250828    clang-20
i386                  randconfig-013-20250828    clang-20
i386                  randconfig-014-20250828    clang-20
i386                  randconfig-015-20250828    clang-20
i386                  randconfig-016-20250828    clang-20
i386                  randconfig-017-20250828    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250828    clang-22
loongarch             randconfig-002-20250828    clang-22
loongarch             randconfig-002-20250828    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ci20_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250828    clang-22
nios2                 randconfig-001-20250828    gcc-8.5.0
nios2                 randconfig-002-20250828    clang-22
nios2                 randconfig-002-20250828    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250828    clang-22
parisc                randconfig-001-20250828    gcc-13.4.0
parisc                randconfig-002-20250828    clang-22
parisc                randconfig-002-20250828    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250828    clang-22
powerpc               randconfig-002-20250828    clang-22
powerpc               randconfig-002-20250828    gcc-8.5.0
powerpc               randconfig-003-20250828    clang-22
powerpc               randconfig-003-20250828    gcc-8.5.0
powerpc64             randconfig-001-20250828    clang-22
powerpc64             randconfig-001-20250828    gcc-10.5.0
powerpc64             randconfig-003-20250828    clang-22
powerpc64             randconfig-003-20250828    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20250828    clang-19
riscv                 randconfig-001-20250828    clang-22
riscv                 randconfig-002-20250828    clang-19
riscv                 randconfig-002-20250828    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250828    clang-18
s390                  randconfig-001-20250828    clang-19
s390                  randconfig-002-20250828    clang-19
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250828    clang-19
sh                    randconfig-001-20250828    gcc-12.5.0
sh                    randconfig-002-20250828    clang-19
sh                    randconfig-002-20250828    gcc-14.3.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250828    clang-19
sparc                 randconfig-001-20250828    gcc-8.5.0
sparc                 randconfig-002-20250828    clang-19
sparc                 randconfig-002-20250828    gcc-12.5.0
sparc64               randconfig-001-20250828    clang-19
sparc64               randconfig-001-20250828    gcc-8.5.0
sparc64               randconfig-002-20250828    clang-19
sparc64               randconfig-002-20250828    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250828    clang-19
um                    randconfig-002-20250828    clang-19
um                    randconfig-002-20250828    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250828    gcc-12
x86_64      buildonly-randconfig-002-20250828    gcc-12
x86_64      buildonly-randconfig-003-20250828    clang-20
x86_64      buildonly-randconfig-004-20250828    gcc-12
x86_64      buildonly-randconfig-005-20250828    gcc-12
x86_64      buildonly-randconfig-006-20250828    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250828    clang-20
x86_64                randconfig-002-20250828    clang-20
x86_64                randconfig-003-20250828    clang-20
x86_64                randconfig-004-20250828    clang-20
x86_64                randconfig-005-20250828    clang-20
x86_64                randconfig-006-20250828    clang-20
x86_64                randconfig-007-20250828    clang-20
x86_64                randconfig-008-20250828    clang-20
x86_64                randconfig-071-20250828    clang-20
x86_64                randconfig-072-20250828    clang-20
x86_64                randconfig-073-20250828    clang-20
x86_64                randconfig-074-20250828    clang-20
x86_64                randconfig-075-20250828    clang-20
x86_64                randconfig-076-20250828    clang-20
x86_64                randconfig-077-20250828    clang-20
x86_64                randconfig-078-20250828    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250828    clang-19
xtensa                randconfig-001-20250828    gcc-8.5.0
xtensa                randconfig-002-20250828    clang-19
xtensa                randconfig-002-20250828    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
