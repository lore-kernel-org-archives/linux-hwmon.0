Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795232AE96
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Dec 2024 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627214; cv=none; b=N2vSiepBAyI9qm8dhkX11WenSpSXAqDgdC0T2WWAL9/dWgF9zASaX2QvMbxm587NaWOkwwp7g4FUIIL8UTT2JnXTpR1IHb8v7S+nnuS/cAjipex1Au37+R4dmx6UYURHlNBOjU82w+l6qzqueyK72st0Q/wYVmj4vJbcJg1E8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627214; c=relaxed/simple;
	bh=yKHqfgq/Lwi+jJY42MamVMJaMk8Qxry5BD6fcTmuW80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IygIAN2CccF6AD00Ixs82JC4f31EjHxV4/EXtSamwtTNV6zYPxCxen0f+0kRvzSFGQWeRGl1+vIlGA5wrSIJd2cwmZw1zUUK4zHgGKM5jlJpphkqLvLo5jTo+t/Xsk1WqCmvqRrRlA9X7M8tbXPxpzOR1e3KFz8TyxvvAsqhDpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwP1ryMj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwP1ryMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734627212; x=1766163212;
  h=date:from:to:cc:subject:message-id;
  bh=yKHqfgq/Lwi+jJY42MamVMJaMk8Qxry5BD6fcTmuW80=;
  b=mwP1ryMjmWALl54ZJ220lRKK3zAAKt5gIUqpRl1+4wFsuflV3Q2cskqp
   ZrPksx2nfuCTtc7b4XZBqP+Wb1nRhoZvqd4Tdp473LODIOcGTnyVIkHpa
   b8JsDZJ9Cdz3v+jP0fWI5UmTySr0/PymMkSzVD37Kyy2wWQVDSk2rty8o
   oR9QsGsujApXnWd3bO4iyovqqyFLC316v+tTPuANmxkGZIqH44hcDe9zf
   YaPZfNAM6AQk83EcrlX7dtae/NbWn/A0huhZ4eJ7NIDyYUmr8M0Mil0pZ
   BoX/5sugM8sYP5Za/zBwib/old6WXhDQY102ni0Pm9oUW99LOBLtNunQA
   A==;
X-CSE-ConnectionGUID: QurNfSlZT3y65W24qPerkA==
X-CSE-MsgGUID: q98BfEDRQuqMDMqONI6zkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46157015"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="46157015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 08:53:32 -0800
X-CSE-ConnectionGUID: ZTqZv1dZRUWv8MRjedobZw==
X-CSE-MsgGUID: GeVWeoNNR2yylmHSYOT7KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98306865"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2024 08:53:31 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOJmD-0000Md-01;
	Thu, 19 Dec 2024 16:53:29 +0000
Date: Fri, 20 Dec 2024 00:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 4ef14b5c0c78439f76ec90976100ddaa35128666
Message-ID: <202412200012.lzpApsEU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 4ef14b5c0c78439f76ec90976100ddaa35128666  Merge branch 'hwmon-lm75' into hwmon-staging

elapsed time: 1443m

configs tested: 111
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241219    gcc-13.2.0
arc                   randconfig-002-20241219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-20
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20241219    clang-18
arm                   randconfig-002-20241219    gcc-14.2.0
arm                   randconfig-003-20241219    clang-18
arm                   randconfig-004-20241219    gcc-14.2.0
arm                        realview_defconfig    clang-19
arm                        spear3xx_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241219    clang-16
arm64                 randconfig-002-20241219    clang-18
arm64                 randconfig-003-20241219    gcc-14.2.0
arm64                 randconfig-004-20241219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241219    gcc-14.2.0
csky                  randconfig-002-20241219    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241219    clang-19
hexagon               randconfig-002-20241219    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241219    gcc-12
i386        buildonly-randconfig-002-20241219    gcc-12
i386        buildonly-randconfig-003-20241219    clang-19
i386        buildonly-randconfig-004-20241219    clang-19
i386        buildonly-randconfig-005-20241219    gcc-12
i386        buildonly-randconfig-006-20241219    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241219    gcc-14.2.0
loongarch             randconfig-002-20241219    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241219    gcc-14.2.0
nios2                 randconfig-002-20241219    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241219    gcc-14.2.0
parisc                randconfig-002-20241219    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241219    clang-18
powerpc               randconfig-002-20241219    clang-16
powerpc               randconfig-003-20241219    clang-20
powerpc64             randconfig-001-20241219    gcc-14.2.0
powerpc64             randconfig-002-20241219    clang-18
powerpc64             randconfig-003-20241219    clang-16
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241219    clang-16
riscv                 randconfig-002-20241219    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241219    gcc-14.2.0
s390                  randconfig-002-20241219    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241219    gcc-14.2.0
sh                    randconfig-002-20241219    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241219    gcc-14.2.0
sparc                 randconfig-002-20241219    gcc-14.2.0
sparc64               randconfig-001-20241219    gcc-14.2.0
sparc64               randconfig-002-20241219    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241219    gcc-12
um                    randconfig-002-20241219    clang-20
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241219    gcc-12
x86_64      buildonly-randconfig-002-20241219    gcc-12
x86_64      buildonly-randconfig-003-20241219    clang-19
x86_64      buildonly-randconfig-004-20241219    gcc-12
x86_64      buildonly-randconfig-005-20241219    gcc-12
x86_64      buildonly-randconfig-006-20241219    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241219    gcc-14.2.0
xtensa                randconfig-002-20241219    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
