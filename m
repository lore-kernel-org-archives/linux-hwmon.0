Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3272AD16
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Dec 2024 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622827; cv=none; b=RQgx36E8bS+CJkysK5YR8rnOSxqqZfvwerNYmUDRF85s4X4hgJCAj8hu8DWCWCpiXESMZ41M0Os8Zp1CikVegCC0fGq+ecBp8nfBvKiL/gPGZuMQrUnbn6UieG2h7o56qZCoOyVgPnV+vPcOEwDKze6VSzuejkeysT6Gjihy8kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622827; c=relaxed/simple;
	bh=d6/MWI/W/RymAlvrKXQKKnvJVvSwkORUku5L42gvWH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FktR6dOt0wtN5jwLUa4DV5d+cynePPjOOjUwxoVzNA0k9pnhktAVXPa88VHuiqOOqxcuS/pLZiKAll3rcIcAWorRiU/IP/ChNgCMQtM71xfMIM+78IPye4ZqHFgSDXkeki+jYhVML03U7W/MtNby+hmfFxl6qowuuzltNyO2bbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O99bKbd6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O99bKbd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734622825; x=1766158825;
  h=date:from:to:cc:subject:message-id;
  bh=d6/MWI/W/RymAlvrKXQKKnvJVvSwkORUku5L42gvWH4=;
  b=O99bKbd6hZ5EYjADHNY1jn/+4qz2z6kYCAcwrQ38VE7q31ChCcIMUFoJ
   psDWFO9Y5fZIIqN6BJMY0aDQIdvT4D0ulzatuqvmdX5rSKOWzcme3koP+
   UTyxTI2HaXA8n3BP6q0e02t/wWIFBTdmqITfG+cjW4Fgi1QxXQuvdPgNE
   q/FHyl74j/2xSkCcNQ02ecCFejBluJnJ9yGftT3Pn74AiVuMXw/NFa8NK
   S2IUo1IQDwVF18fzxKiJCFv1wODRyw22Q6lq5Y9yeh61Cmamf7nOLICBL
   BdmtDc6MeGkRvHwl31lS5FCmPK121835mT5DEWatvZfD6+6cxM6I/ani2
   Q==;
X-CSE-ConnectionGUID: peHmikI7RYqJNedv//y+GQ==
X-CSE-MsgGUID: drXItOWKTu2Buw/t3Fk7Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="39077216"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="39077216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 07:40:24 -0800
X-CSE-ConnectionGUID: kXOg63kwQM2OYxW3bu2+Xw==
X-CSE-MsgGUID: MJ20eB1bSpa4rVUZHL9j4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102351827"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Dec 2024 07:40:23 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOIdQ-0000JI-37;
	Thu, 19 Dec 2024 15:40:20 +0000
Date: Thu, 19 Dec 2024 23:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 de076198d1e4934c5fc17aa52d5f1884f469ce1a
Message-ID: <202412192316.lewcpJ9B-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: de076198d1e4934c5fc17aa52d5f1884f469ce1a  hwmon: (pmbus/crps) Add Intel CRPS185 power supply

elapsed time: 1442m

configs tested: 100
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241219    gcc-13.2.0
arc                   randconfig-002-20241219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241219    clang-18
arm                   randconfig-002-20241219    gcc-14.2.0
arm                   randconfig-003-20241219    clang-18
arm                   randconfig-004-20241219    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241219    clang-16
arm64                 randconfig-002-20241219    clang-18
arm64                 randconfig-003-20241219    gcc-14.2.0
arm64                 randconfig-004-20241219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241219    gcc-14.2.0
csky                  randconfig-002-20241219    gcc-14.2.0
hexagon                          allmodconfig    clang-20
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
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241219    gcc-14.2.0
nios2                 randconfig-002-20241219    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241219    gcc-14.2.0
parisc                randconfig-002-20241219    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
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
xtensa                randconfig-001-20241219    gcc-14.2.0
xtensa                randconfig-002-20241219    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
