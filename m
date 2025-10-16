Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C621A94F
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638996; cv=none; b=FBfLk5EuSMNHrLxT2llcTOLQbpEH+XEnAqN/sii6A8Wk3oE4KPifDxLRfmHkCnTvWTGl2yH1FtdORTX2QeB/2l7mtE82a7ycMH3Q66ptH0ZWLv7lCTWInE+d3iy/I2b/uU2IWaqeKT5jueBzr8T49TLN1FFWGBXOarL1LWz2E/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638996; c=relaxed/simple;
	bh=Q8wB7Acq3oCrya/Pi/MaoLOquMxwjAYZoSYdHsYWGns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IAUTg7uUgL4IOvUYHOwbrMWfdx+WSQHeg9AWD+zp3x0Rq/VTSQxeIGn2mKNs97lguBQV9jZTv/e+axcJ8b+uAhMf7dHMm/mPQHNlCHG1arScZ62sKaW+Ffl6m/aRCXYOqWMKHa1nx+GhWhBfuf7lK0EYv4bwm6Y6OOGJxBS0oMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgZ/Nyl0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgZ/Nyl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638995; x=1792174995;
  h=date:from:to:cc:subject:message-id;
  bh=Q8wB7Acq3oCrya/Pi/MaoLOquMxwjAYZoSYdHsYWGns=;
  b=lgZ/Nyl0yLkNB2QK/93ms0/h1kbcgmXu+Nwwm0eMnJjSxuBBcJ0htEUM
   WEWk/Q1MyERQ8Bn5xA3mnCJfgSwxWBtvT8fnd0wDVnmsbTi+y3eEYmCeZ
   H2e+lZawA1NXxEINzDGU+8AV9K21IkVV2+iW84PT8EbbeXsKl/mwFQDKA
   gga4c/MOF9Yp2VEsG7297+QpCe+LXhgeaRGttshx3C+9AX2JKj5m1QxJ9
   kVxRnOzXkVHNvNngsV9O/jWgyrpBkfUmjDFfknPF6Dzd3xE2IokrN8jq+
   OassGVdwcPhumpfb/ybkQF1Exb3LUZiEK63HR00OX9Tm/6PO9fQT/6WH0
   Q==;
X-CSE-ConnectionGUID: GmJdTn7/QJOXfonvS2Sy3g==
X-CSE-MsgGUID: 0/E7tpVfQcSSu8kIEjysiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62752976"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62752976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:23:15 -0700
X-CSE-ConnectionGUID: RQAS0j5rTSms2bfFy0QvPA==
X-CSE-MsgGUID: nQmUuNrCRrmCfHZpDI77Rw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2025 11:23:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Sd4-000587-29;
	Thu, 16 Oct 2025 18:23:10 +0000
Date: Fri, 17 Oct 2025 02:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 72804d1631b3688014e06065b9f95885ba3e08b6
Message-ID: <202510170210.LQWvZirO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 72804d1631b3688014e06065b9f95885ba3e08b6  hwmon: (scmi) Enable sensors to assure they can be read

elapsed time: 1444m

configs tested: 113
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251016    gcc-13.4.0
arc                   randconfig-002-20251016    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20251016    clang-22
arm                   randconfig-002-20251016    gcc-10.5.0
arm                   randconfig-003-20251016    clang-22
arm                   randconfig-004-20251016    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251016    clang-22
arm64                 randconfig-002-20251016    gcc-13.4.0
arm64                 randconfig-003-20251016    gcc-10.5.0
arm64                 randconfig-004-20251016    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251016    gcc-11.5.0
csky                  randconfig-002-20251016    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251016    clang-22
hexagon               randconfig-002-20251016    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251016    clang-20
i386        buildonly-randconfig-002-20251016    gcc-14
i386        buildonly-randconfig-003-20251016    clang-20
i386        buildonly-randconfig-004-20251016    clang-20
i386        buildonly-randconfig-005-20251016    clang-20
i386        buildonly-randconfig-006-20251016    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251016    gcc-15.1.0
loongarch             randconfig-002-20251016    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251016    gcc-8.5.0
nios2                 randconfig-002-20251016    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251016    gcc-9.5.0
parisc                randconfig-002-20251016    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251016    clang-16
powerpc               randconfig-002-20251016    gcc-8.5.0
powerpc               randconfig-003-20251016    clang-22
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-002-20251016    clang-22
powerpc64             randconfig-003-20251016    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251016    gcc-9.5.0
riscv                 randconfig-002-20251016    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251016    clang-18
s390                  randconfig-002-20251016    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251016    gcc-14.3.0
sh                    randconfig-002-20251016    gcc-14.3.0
sh                          rsk7269_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251016    gcc-15.1.0
sparc                 randconfig-002-20251016    gcc-8.5.0
sparc64               randconfig-001-20251016    gcc-13.4.0
sparc64               randconfig-002-20251016    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251016    gcc-12
um                    randconfig-002-20251016    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251016    clang-20
x86_64      buildonly-randconfig-002-20251016    gcc-14
x86_64      buildonly-randconfig-003-20251016    gcc-14
x86_64      buildonly-randconfig-004-20251016    gcc-12
x86_64      buildonly-randconfig-005-20251016    gcc-14
x86_64      buildonly-randconfig-006-20251016    gcc-12
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251016    gcc-10.5.0
xtensa                randconfig-002-20251016    gcc-9.5.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
