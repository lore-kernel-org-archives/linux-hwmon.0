Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCA3101A6
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145542; cv=none; b=AGvKCOvjLRahmCkbCYlfBxuB7yOG4LbHCFmFg1sUeDaH7rULmOj7Xtf2Ptd4mqswr+D+ih6kYwFjWuOTcXjm/EizxsatXDQJfCzSUWoszT8WmR/qEgOqqd01qUu4Fb7XjuhetyknhOM/LEWX+O5NO/CX6eu3lfB3sB1XZFGVKo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145542; c=relaxed/simple;
	bh=ROPkYrEWZD/+huVQs4a0UCx+wsh5M8U4sREQJqfQPE8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LLte5OMKBFcGOF3Kvu1Hr7QEyoUDJj8PX+XAdmmZZ770BcOYY6sTDeht6N27hCJDGR9mFLu3rJFFzsmX6eIFWKnVf9Y9VVXYs3DbIEOg8zLq1w9NyNSINLDWuRRGTXJeYUQA0F/uY04YOkxsXsiJlQJ5sU7hQe/r8+HaCstOdzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA2nZXey; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA2nZXey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764145540; x=1795681540;
  h=date:from:to:cc:subject:message-id;
  bh=ROPkYrEWZD/+huVQs4a0UCx+wsh5M8U4sREQJqfQPE8=;
  b=iA2nZXeyBrw8EpvmhdkXRNBwUgUOZsHfLIDi96a6Q77AqUr5E1+dH0Bx
   zmLaVfeLOn4hSe0DkXeFoajD2N6HfQWaU8Q8si3XJf0auSLWKnaWIGeaB
   QD9+Rs+6NIAnsWVDcAkYf24lhXo2RDTQZXfOS5i2mYp8bOMD5N+/jKnSw
   hsPsXSe8bryU7e36WMna7f6d4fzEDEk99B7xwV635DpYfFJKosej6YfrV
   wQP1n7CHSI1ye3AXkQ7dPLLqQEaD3x22KJomDPSUnRf8ZXajF43Oq4p5m
   ydHIOkIzh53gcD2HHhiNvAf1ygJ/3B7dOqP/V9swEcm1hIgEMEeqIp49U
   Q==;
X-CSE-ConnectionGUID: xlsFS5s+TtCFuOxS17LgTQ==
X-CSE-MsgGUID: CLXRizRZSrS5PvTFOzYQXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76796264"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76796264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 00:25:40 -0800
X-CSE-ConnectionGUID: fo1FnSXvTLyAhE80zAoXBQ==
X-CSE-MsgGUID: z9Kcv3VYQzihb3Putq8ZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197030279"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2025 00:25:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOAqF-000000002cl-3oP9;
	Wed, 26 Nov 2025 08:25:35 +0000
Date: Wed, 26 Nov 2025 16:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 fe5dbe3110c559a2e6d13f114238621d89cb24f8
Message-ID: <202511261638.eWcvZYMq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: fe5dbe3110c559a2e6d13f114238621d89cb24f8  hwmon: (asus-ec-sensors) correct Pro WS TRX50-SAGE WIFI entry

elapsed time: 1658m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251125    gcc-9.5.0
arc                   randconfig-002-20251125    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20251125    clang-22
arm                   randconfig-002-20251125    gcc-10.5.0
arm                   randconfig-003-20251125    gcc-10.5.0
arm                   randconfig-004-20251125    gcc-8.5.0
arm                        spear6xx_defconfig    clang-22
arm64                            alldefconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251126    gcc-8.5.0
arm64                 randconfig-002-20251126    clang-19
arm64                 randconfig-003-20251126    clang-22
arm64                 randconfig-004-20251126    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251126    gcc-11.5.0
csky                  randconfig-002-20251126    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251125    clang-19
hexagon               randconfig-002-20251125    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251126    clang-20
i386        buildonly-randconfig-004-20251126    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251125    gcc-15.1.0
loongarch             randconfig-002-20251125    gcc-12.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251125    gcc-8.5.0
nios2                 randconfig-002-20251125    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251125    gcc-13.4.0
parisc                randconfig-002-20251125    gcc-10.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-22
powerpc               randconfig-001-20251125    clang-19
powerpc               randconfig-002-20251125    gcc-8.5.0
powerpc64             randconfig-001-20251125    clang-16
powerpc64             randconfig-002-20251125    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251125    gcc-8.5.0
riscv                 randconfig-002-20251125    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251125    gcc-8.5.0
s390                  randconfig-002-20251125    gcc-14.3.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251125    gcc-15.1.0
sh                    randconfig-002-20251125    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251125    gcc-14.3.0
sparc                 randconfig-002-20251125    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251125    clang-22
sparc64               randconfig-002-20251125    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251125    clang-22
um                    randconfig-002-20251125    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-002-20251126    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251126    clang-20
x86_64                randconfig-002-20251126    gcc-14
x86_64                randconfig-003-20251126    clang-20
x86_64                randconfig-004-20251126    gcc-14
x86_64                randconfig-005-20251126    gcc-12
x86_64                randconfig-006-20251126    clang-20
x86_64                randconfig-071-20251126    clang-20
x86_64                randconfig-072-20251126    gcc-14
x86_64                randconfig-073-20251126    clang-20
x86_64                randconfig-074-20251126    gcc-14
x86_64                randconfig-075-20251126    clang-20
x86_64                randconfig-076-20251126    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251125    gcc-8.5.0
xtensa                randconfig-002-20251125    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
