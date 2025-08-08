Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B072E370A
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Aug 2025 22:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754691166; cv=none; b=Qa/bLtYhHjS/UlqWkxNpy+3oEKDIswmkvMWVFKIHoCg1wLIl2vqLcJannq1OVPf16/g2lFBihruvfvZwpSDFUKieA/qkNOgV174lOyIjwDY95EiGqoN7gqKrIvIFtwRJYOsoDi856oTeeI8E30UkRsug+0a0dqHaloMqv8Y0m2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754691166; c=relaxed/simple;
	bh=XS8Qe0vlDRk56II5KiY+qDeufL8jHEW3ZOJi6TAJGbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4wx02q10nPIzJAxd6p8wNu/CV/8Y6InK0KJLCSM1y2ZuURQjNgqIZFcXD1dhmUyvlg2cOazvnW7jYxSRY4aniEnTAlYN3Smv+vfz+RvzDcmU522XleSR6My2ArZirdHzOVseJkYKzbXop2VFM+c4hFVyZb5nZqm5o0KAhuZTOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTojpI/L; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTojpI/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754691165; x=1786227165;
  h=date:from:to:cc:subject:message-id;
  bh=XS8Qe0vlDRk56II5KiY+qDeufL8jHEW3ZOJi6TAJGbI=;
  b=mTojpI/L9iZfK3yPdOZsYvD9gNgib1XutZ5i2NmnzrWlE0gH24v0tdn0
   oRwCSUyDD8qVvOEDutmRm0TuM7DLPb4eJ28K0tigpsxe/CQOjIwbf3SxQ
   Mvlox20HZIvNn8WGAt9y13heRYwdBJ2go90c1scqO+5Vdu5BRni54ntNT
   jN6awsM8am+e7dZ0+uNM6GLxFFSnLJu6IP3icPOzMzzHl8+AYZ+7V8Hik
   c45ppTwxVQpCla007aorerr2SNXwh8Q5Uf2eVtWj0Sh2aCwQoAC/DGUsQ
   2sMMAlqjr20NTMEuxmNhGU/wOVySMLYpBVmea5XEWLdxRbi+sTiUvcYu+
   g==;
X-CSE-ConnectionGUID: l1WpchD8Q5+w7naKiQKJwQ==
X-CSE-MsgGUID: CQoGsLzdTf6cCgfbnDJ4Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57109750"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57109750"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 15:12:44 -0700
X-CSE-ConnectionGUID: I9xwdOeLS2KvH4Fv3QcJEg==
X-CSE-MsgGUID: AuhyZOZ5RtCzKLZ3qwv+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165795989"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Aug 2025 15:12:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukVJb-0004MO-2B;
	Fri, 08 Aug 2025 22:12:10 +0000
Date: Sat, 09 Aug 2025 06:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:master] BUILD SUCCESS
 d7eb42bfe92efa46f8750b00bce1d82f337ba145
Message-ID: <202508090638.hIyTjXiO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git master
branch HEAD: d7eb42bfe92efa46f8750b00bce1d82f337ba145  genirq/test: Resolve irq lock inversion warnings

elapsed time: 1325m

configs tested: 318
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250808    clang-22
arc                   randconfig-001-20250808    gcc-14.3.0
arc                   randconfig-001-20250809    gcc-8.5.0
arc                   randconfig-002-20250808    clang-22
arc                   randconfig-002-20250808    gcc-12.5.0
arc                   randconfig-002-20250809    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                                 defconfig    clang-22
arm                          moxart_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250808    clang-22
arm                   randconfig-001-20250808    gcc-14.3.0
arm                   randconfig-001-20250809    gcc-8.5.0
arm                   randconfig-002-20250808    clang-22
arm                   randconfig-002-20250808    gcc-10.5.0
arm                   randconfig-002-20250809    gcc-8.5.0
arm                   randconfig-003-20250808    clang-22
arm                   randconfig-003-20250809    gcc-8.5.0
arm                   randconfig-004-20250808    clang-22
arm                   randconfig-004-20250809    gcc-8.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250808    clang-20
arm64                 randconfig-001-20250808    clang-22
arm64                 randconfig-001-20250809    gcc-8.5.0
arm64                 randconfig-002-20250808    clang-22
arm64                 randconfig-002-20250808    gcc-10.5.0
arm64                 randconfig-002-20250809    gcc-8.5.0
arm64                 randconfig-003-20250808    clang-22
arm64                 randconfig-003-20250809    gcc-8.5.0
arm64                 randconfig-004-20250808    clang-22
arm64                 randconfig-004-20250808    gcc-8.5.0
arm64                 randconfig-004-20250809    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250808    gcc-12.5.0
csky                  randconfig-001-20250808    gcc-15.1.0
csky                  randconfig-002-20250808    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250808    clang-20
hexagon               randconfig-001-20250808    gcc-12.5.0
hexagon               randconfig-002-20250808    clang-22
hexagon               randconfig-002-20250808    gcc-12.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250808    clang-20
i386        buildonly-randconfig-001-20250808    gcc-12
i386        buildonly-randconfig-001-20250809    clang-20
i386        buildonly-randconfig-002-20250808    clang-20
i386        buildonly-randconfig-002-20250808    gcc-12
i386        buildonly-randconfig-002-20250809    clang-20
i386        buildonly-randconfig-003-20250808    gcc-12
i386        buildonly-randconfig-003-20250809    clang-20
i386        buildonly-randconfig-004-20250808    clang-20
i386        buildonly-randconfig-004-20250808    gcc-12
i386        buildonly-randconfig-004-20250809    clang-20
i386        buildonly-randconfig-005-20250808    gcc-12
i386        buildonly-randconfig-005-20250809    clang-20
i386        buildonly-randconfig-006-20250808    clang-20
i386        buildonly-randconfig-006-20250808    gcc-12
i386        buildonly-randconfig-006-20250809    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250808    clang-20
i386                  randconfig-001-20250809    gcc-12
i386                  randconfig-002-20250808    clang-20
i386                  randconfig-002-20250809    gcc-12
i386                  randconfig-003-20250808    clang-20
i386                  randconfig-003-20250809    gcc-12
i386                  randconfig-004-20250808    clang-20
i386                  randconfig-004-20250809    gcc-12
i386                  randconfig-005-20250808    clang-20
i386                  randconfig-005-20250809    gcc-12
i386                  randconfig-006-20250808    clang-20
i386                  randconfig-006-20250809    gcc-12
i386                  randconfig-007-20250808    clang-20
i386                  randconfig-007-20250809    gcc-12
i386                  randconfig-011-20250808    clang-20
i386                  randconfig-012-20250808    clang-20
i386                  randconfig-013-20250808    clang-20
i386                  randconfig-014-20250808    clang-20
i386                  randconfig-015-20250808    clang-20
i386                  randconfig-016-20250808    clang-20
i386                  randconfig-017-20250808    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250808    clang-22
loongarch             randconfig-001-20250808    gcc-12.5.0
loongarch             randconfig-002-20250808    gcc-12.5.0
loongarch             randconfig-002-20250808    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250808    gcc-12.5.0
nios2                 randconfig-001-20250808    gcc-9.5.0
nios2                 randconfig-002-20250808    gcc-12.5.0
nios2                 randconfig-002-20250808    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250808    gcc-12.5.0
parisc                randconfig-001-20250808    gcc-8.5.0
parisc                randconfig-002-20250808    gcc-12.5.0
parisc                randconfig-002-20250808    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    clang-22
powerpc               randconfig-001-20250808    clang-22
powerpc               randconfig-001-20250808    gcc-12.5.0
powerpc               randconfig-002-20250808    clang-18
powerpc               randconfig-002-20250808    gcc-12.5.0
powerpc               randconfig-003-20250808    clang-22
powerpc               randconfig-003-20250808    gcc-12.5.0
powerpc64                        alldefconfig    gcc-15.1.0
powerpc64             randconfig-001-20250808    clang-18
powerpc64             randconfig-001-20250808    gcc-12.5.0
powerpc64             randconfig-002-20250808    clang-22
powerpc64             randconfig-002-20250808    gcc-12.5.0
powerpc64             randconfig-003-20250808    clang-16
powerpc64             randconfig-003-20250808    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250808    clang-22
riscv                 randconfig-001-20250809    clang-22
riscv                 randconfig-002-20250808    clang-22
riscv                 randconfig-002-20250809    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250808    clang-22
s390                  randconfig-001-20250808    gcc-10.5.0
s390                  randconfig-001-20250809    clang-22
s390                  randconfig-002-20250808    clang-22
s390                  randconfig-002-20250808    gcc-10.5.0
s390                  randconfig-002-20250809    clang-22
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250808    clang-22
sh                    randconfig-001-20250808    gcc-13.4.0
sh                    randconfig-001-20250809    clang-22
sh                    randconfig-002-20250808    clang-22
sh                    randconfig-002-20250808    gcc-10.5.0
sh                    randconfig-002-20250809    clang-22
sh                          rsk7264_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250808    clang-22
sparc                 randconfig-001-20250808    gcc-12.5.0
sparc                 randconfig-001-20250809    clang-22
sparc                 randconfig-002-20250808    clang-22
sparc                 randconfig-002-20250808    gcc-8.5.0
sparc                 randconfig-002-20250809    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250808    clang-22
sparc64               randconfig-001-20250809    clang-22
sparc64               randconfig-002-20250808    clang-22
sparc64               randconfig-002-20250809    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250808    clang-22
um                    randconfig-001-20250808    gcc-12
um                    randconfig-001-20250809    clang-22
um                    randconfig-002-20250808    clang-22
um                    randconfig-002-20250808    gcc-12
um                    randconfig-002-20250809    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250808    clang-20
x86_64      buildonly-randconfig-001-20250808    gcc-12
x86_64      buildonly-randconfig-001-20250809    gcc-12
x86_64      buildonly-randconfig-002-20250808    gcc-12
x86_64      buildonly-randconfig-002-20250809    gcc-12
x86_64      buildonly-randconfig-003-20250808    clang-20
x86_64      buildonly-randconfig-003-20250808    gcc-12
x86_64      buildonly-randconfig-003-20250809    gcc-12
x86_64      buildonly-randconfig-004-20250808    clang-20
x86_64      buildonly-randconfig-004-20250808    gcc-12
x86_64      buildonly-randconfig-004-20250809    gcc-12
x86_64      buildonly-randconfig-005-20250808    gcc-12
x86_64      buildonly-randconfig-005-20250809    gcc-12
x86_64      buildonly-randconfig-006-20250808    clang-20
x86_64      buildonly-randconfig-006-20250808    gcc-12
x86_64      buildonly-randconfig-006-20250809    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250808    gcc-12
x86_64                randconfig-001-20250809    gcc-12
x86_64                randconfig-002-20250808    gcc-12
x86_64                randconfig-002-20250809    gcc-12
x86_64                randconfig-003-20250808    gcc-12
x86_64                randconfig-003-20250809    gcc-12
x86_64                randconfig-004-20250808    gcc-12
x86_64                randconfig-004-20250809    gcc-12
x86_64                randconfig-005-20250808    gcc-12
x86_64                randconfig-005-20250809    gcc-12
x86_64                randconfig-006-20250808    gcc-12
x86_64                randconfig-006-20250809    gcc-12
x86_64                randconfig-007-20250808    gcc-12
x86_64                randconfig-007-20250809    gcc-12
x86_64                randconfig-008-20250808    gcc-12
x86_64                randconfig-008-20250809    gcc-12
x86_64                randconfig-071-20250808    clang-20
x86_64                randconfig-072-20250808    clang-20
x86_64                randconfig-073-20250808    clang-20
x86_64                randconfig-074-20250808    clang-20
x86_64                randconfig-075-20250808    clang-20
x86_64                randconfig-076-20250808    clang-20
x86_64                randconfig-077-20250808    clang-20
x86_64                randconfig-078-20250808    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250808    clang-22
xtensa                randconfig-001-20250808    gcc-9.5.0
xtensa                randconfig-001-20250809    clang-22
xtensa                randconfig-002-20250808    clang-22
xtensa                randconfig-002-20250808    gcc-8.5.0
xtensa                randconfig-002-20250809    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
