Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3953184E
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Nov 2025 01:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764467264; cv=none; b=fSl8doIcQ5L9II6s2eUPF7RK3Ro/XEixWiJFDgIZOW2SE6WhA94uhGcdE/VHPIxSC1DAYQfho5w6JtjBkF9iQJkTCC1dw+Y5gT5AOrCl0UmbLbmwRlgjYK/aLxfh0LUNOMMmerUWSDzWOsoPPTRwwAifLHM98yjIoMNxGvM2jsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764467264; c=relaxed/simple;
	bh=NhzrUo/w2qVA8RZCFJRxVEZvp79BXzOaqeyr9zgrKsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ju/l4iWN/sPe02VFuvZttFj1+IwdHvk9JXT5GpfSONrLnyuY0lgTaBYlaFEymsyeQ+30TAvcT8EaM+5RT1HTZlupE9llOhLk4qyEDICHtQIfyhcji0JfCIDiw3UCvLY2Y+lVvkQvMEkJlZCnOncqqadu2AEznmvEG8R7ALLqPSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGPL+crd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGPL+crd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764467262; x=1796003262;
  h=date:from:to:cc:subject:message-id;
  bh=NhzrUo/w2qVA8RZCFJRxVEZvp79BXzOaqeyr9zgrKsg=;
  b=TGPL+crd8Ph0FmIcyc5xA4q8v1aVtoqd8DUWKxAaRVmdQzmB9GYO8rcO
   vhpgnCZl5XvZnqchgfzwHlTzMjx4VKff+h2LZJI0/3nwwxQqwRBuw8gnN
   egcIZIEBoOIwFwgmsNSXVm+OU7aIA8GJPzGoQ4SNSOYwp0Jkh25MfDTRA
   mU17GcIEZLYLIqjN+8fcb7D+2/GwIntgH0uM+Jf6s18/HbHaAwyhQysSk
   oytQywh0WD1K/pHfg/LQ6ccbhxSxPTawq5O4ANvnj2zevcksqEHRi0ttr
   qM2nD92TfLyG430uEwzXRU30gxrZ36jcMeJymCwPTxOM/WI5XGZursU/e
   Q==;
X-CSE-ConnectionGUID: BDekpofGSwyja9gW9ibFMA==
X-CSE-MsgGUID: yDdPEpHmSimTbEHaesmqIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70055989"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="70055989"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 17:47:42 -0800
X-CSE-ConnectionGUID: 8xwNujJTQhStrWJ4XWM9cg==
X-CSE-MsgGUID: N9gAUqFHScuPCKEAo3HxZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="193755461"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2025 17:47:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPWXJ-000000007in-3UaU;
	Sun, 30 Nov 2025 01:47:37 +0000
Date: Sun, 30 Nov 2025 09:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 194ad0334ee172fd4416844692b9c283aaed0093
Message-ID: <202511300953.uzrUR5yT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 194ad0334ee172fd4416844692b9c283aaed0093  hwmon: (dell-smm) Add Dell G5 5505 to fan control whitelist

elapsed time: 1586m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251129    gcc-8.5.0
arc                   randconfig-002-20251129    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                          gemini_defconfig    clang-20
arm                             mxs_defconfig    clang-22
arm                   randconfig-001-20251129    clang-20
arm                   randconfig-002-20251129    gcc-10.5.0
arm                   randconfig-003-20251129    gcc-13.4.0
arm                   randconfig-004-20251129    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251130    gcc-8.5.0
arm64                 randconfig-002-20251130    gcc-11.5.0
arm64                 randconfig-003-20251130    gcc-9.5.0
arm64                 randconfig-004-20251130    gcc-12.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251130    gcc-9.5.0
csky                  randconfig-002-20251130    gcc-12.5.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251130    clang-22
hexagon               randconfig-002-20251130    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251130    gcc-14
i386        buildonly-randconfig-002-20251130    gcc-14
i386        buildonly-randconfig-003-20251130    gcc-14
i386        buildonly-randconfig-004-20251130    gcc-14
i386        buildonly-randconfig-005-20251130    gcc-14
i386        buildonly-randconfig-006-20251130    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251130    gcc-14
i386                  randconfig-002-20251130    clang-20
i386                  randconfig-003-20251130    clang-20
i386                  randconfig-004-20251130    gcc-14
i386                  randconfig-005-20251130    clang-20
i386                  randconfig-006-20251130    gcc-14
i386                  randconfig-007-20251130    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251130    gcc-15.1.0
loongarch             randconfig-002-20251130    clang-18
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251130    gcc-11.5.0
nios2                 randconfig-002-20251130    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251129    gcc-10.5.0
parisc                randconfig-002-20251129    gcc-13.4.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251129    gcc-8.5.0
powerpc               randconfig-002-20251129    clang-22
powerpc64             randconfig-001-20251129    gcc-8.5.0
powerpc64             randconfig-002-20251129    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-002-20251130    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251130    clang-22
s390                  randconfig-002-20251130    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251130    gcc-14.3.0
sh                    randconfig-002-20251130    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251130    gcc-14.3.0
sparc                 randconfig-002-20251130    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251130    clang-20
sparc64               randconfig-002-20251130    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251130    clang-22
um                    randconfig-002-20251130    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251130    gcc-14
x86_64      buildonly-randconfig-002-20251130    clang-20
x86_64      buildonly-randconfig-003-20251130    gcc-14
x86_64      buildonly-randconfig-004-20251130    gcc-14
x86_64      buildonly-randconfig-005-20251130    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251130    clang-20
x86_64                randconfig-002-20251130    gcc-14
x86_64                randconfig-003-20251130    gcc-14
x86_64                randconfig-004-20251130    gcc-14
x86_64                randconfig-005-20251130    gcc-14
x86_64                randconfig-011-20251130    clang-20
x86_64                randconfig-012-20251130    gcc-14
x86_64                randconfig-013-20251130    gcc-14
x86_64                randconfig-014-20251130    gcc-14
x86_64                randconfig-015-20251130    clang-20
x86_64                randconfig-016-20251130    gcc-14
x86_64                randconfig-073-20251130    gcc-14
x86_64                randconfig-074-20251130    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251130    gcc-12.5.0
xtensa                randconfig-002-20251130    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
