Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87B6FCB
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Apr 2024 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714373014; cv=none; b=UsylCUyAq8R8TUOMOUhcT3ozJdvS2NP+ym/XPPj+0aZkgQLQsNQeHI7UJAR60Ncyy4wTsL7K9Lt/8QYvlQa+D9kkT2T68OZo+vXzTwzLHSi2hDtroFDoTyeXFFYBPeS7/kOMq6CJegEbJDbk3kzxUDf7lBGUlpuR6e6GP+N89Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714373014; c=relaxed/simple;
	bh=Y8xIon2ubV0sh1r3ydk041hIvjvW5CiskwvHvdLTqKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bzE2BS8SSVgQiin5ovLyVN/47kJDTFmqCmB+I1c2Pmqqgxrdi9aB5n5sNUavSPRgGc4NjSV+QGXgHhHqR0iVidU1fT0B5ffpKktmU0pTtAuzSQt/fEjp9cNhxDrDAt/UcptYB2z/IksOtl91r1i7TPsxkhLFDuFGYmHhWtPUk7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNPM36XR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNPM36XR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714373012; x=1745909012;
  h=date:from:to:cc:subject:message-id;
  bh=Y8xIon2ubV0sh1r3ydk041hIvjvW5CiskwvHvdLTqKY=;
  b=kNPM36XRCVggJjSi2L/My6maQW2uOyo7Tplpp+yomwCZEGmJuNe6wG7T
   q7dd0y8TuWqZabUHSH1+w56S7D3rv04+ZrybOsHO5xgbmdWKNoSOTdVd/
   +HbMCE6TwejFnpd7SHH5ZrSms1OZAPnHyP69vNoc/aNzf2LaVCUUvjyg1
   E7y+oTrDLSamUWfeO7lNRd/qQQf0+8blV5/DRlZ8BIx9Rg0ZfjIzdTSjG
   tVXYmfGs9cIsZ13M1YFqmI0tfLDKph3u5PJIQ47PrPX1TqQeVkEy5kMg+
   tjZfSMn2EqwzoqoKdMs9CaPCKFyv/38pNB8Gsv3KgVl+lqjlcOH+DC6k8
   A==;
X-CSE-ConnectionGUID: fOhpEUKWScuTW+mnOWPY7g==
X-CSE-MsgGUID: fz5gPIFkS2SHtVJ5LU1AzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32523142"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="32523142"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:43:31 -0700
X-CSE-ConnectionGUID: TNfaWmOzT2mf6UUyfHCWgg==
X-CSE-MsgGUID: QVWlzmGES6uhXh0QMi+nFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26118305"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2024 23:43:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1KjY-00070U-1I;
	Mon, 29 Apr 2024 06:43:28 +0000
Date: Mon, 29 Apr 2024 14:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2ba3ec0d5d4a6b380a10a295d4c83e4a9bcfc51a
Message-ID: <202404291448.Qwlft3UV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2ba3ec0d5d4a6b380a10a295d4c83e4a9bcfc51a  hwmon: (nzxt-kraken3) Add support for NZXT Kraken 2023 (standard and Elite) models

elapsed time: 720m

configs tested: 177
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240429   gcc  
arc                   randconfig-002-20240429   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   clang
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                   randconfig-001-20240429   clang
arm                   randconfig-002-20240429   clang
arm                   randconfig-003-20240429   clang
arm                   randconfig-004-20240429   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240429   clang
arm64                 randconfig-002-20240429   gcc  
arm64                 randconfig-003-20240429   clang
arm64                 randconfig-004-20240429   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240429   gcc  
csky                  randconfig-002-20240429   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240429   clang
hexagon               randconfig-002-20240429   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-003-20240429   gcc  
i386         buildonly-randconfig-004-20240429   clang
i386         buildonly-randconfig-005-20240429   gcc  
i386         buildonly-randconfig-006-20240429   clang
i386                                defconfig   clang
i386                  randconfig-001-20240429   clang
i386                  randconfig-002-20240429   clang
i386                  randconfig-003-20240429   clang
i386                  randconfig-004-20240429   clang
i386                  randconfig-005-20240429   gcc  
i386                  randconfig-006-20240429   clang
i386                  randconfig-011-20240429   gcc  
i386                  randconfig-012-20240429   gcc  
i386                  randconfig-013-20240429   clang
i386                  randconfig-014-20240429   gcc  
i386                  randconfig-015-20240429   clang
i386                  randconfig-016-20240429   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240429   gcc  
loongarch             randconfig-002-20240429   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240429   gcc  
nios2                 randconfig-002-20240429   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240429   gcc  
parisc                randconfig-002-20240429   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240429   gcc  
powerpc               randconfig-002-20240429   gcc  
powerpc               randconfig-003-20240429   gcc  
powerpc                     tqm8541_defconfig   clang
powerpc64             randconfig-001-20240429   clang
powerpc64             randconfig-002-20240429   clang
powerpc64             randconfig-003-20240429   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240429   gcc  
riscv                 randconfig-002-20240429   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240429   gcc  
s390                  randconfig-002-20240429   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240429   gcc  
sh                    randconfig-002-20240429   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240429   gcc  
sparc64               randconfig-002-20240429   gcc  
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240429   gcc  
um                    randconfig-002-20240429   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240429   clang
x86_64       buildonly-randconfig-002-20240429   gcc  
x86_64       buildonly-randconfig-003-20240429   clang
x86_64       buildonly-randconfig-004-20240429   gcc  
x86_64       buildonly-randconfig-005-20240429   clang
x86_64       buildonly-randconfig-006-20240429   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240429   clang
x86_64                randconfig-002-20240429   gcc  
x86_64                randconfig-003-20240429   clang
x86_64                randconfig-004-20240429   gcc  
x86_64                randconfig-005-20240429   clang
x86_64                randconfig-006-20240429   gcc  
x86_64                randconfig-011-20240429   gcc  
x86_64                randconfig-012-20240429   gcc  
x86_64                randconfig-013-20240429   gcc  
x86_64                randconfig-014-20240429   clang
x86_64                randconfig-015-20240429   clang
x86_64                randconfig-016-20240429   gcc  
x86_64                randconfig-071-20240429   clang
x86_64                randconfig-072-20240429   clang
x86_64                randconfig-073-20240429   gcc  
x86_64                randconfig-074-20240429   gcc  
x86_64                randconfig-075-20240429   clang
x86_64                randconfig-076-20240429   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240429   gcc  
xtensa                randconfig-002-20240429   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
