Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA71E49F
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Sep 2024 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726915367; cv=none; b=Tq5+d9acNnTNXdsbjWUtXXA9WL9fEhQQ97lQMRjAk/ZsPAGZ+J+LUp75KmTYYAUjzGd5iQxxKL3fCTLMjTL6bFBAum18IkYrFMCQunWv+u9fpv3db2NB9nRCfUcBFOJfTk45YjHKRwH3ocECYQr4OEkPQNNpKzDbGgq7jr89/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726915367; c=relaxed/simple;
	bh=e9KW7SqAkY96YC8hTXgvbWsEDUrKRgwwm8ok5nBpkA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Urxnq721/1FQwL+92TkDo+cgBve4iUN1aPzOydY5OyYVaQiKL1ynj3gE42pVaExKpQPeahWA99+OgxONkW8/1dEqCWNPb9Y0IvpGtYbf5c2IDOOrSt2nuEwO1AKcpfCTsKhM0gj+6PPBeSC/u2tdRoryWxp79QaGBlnV0KBiRbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Py3GMhL+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Py3GMhL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726915366; x=1758451366;
  h=date:from:to:cc:subject:message-id;
  bh=e9KW7SqAkY96YC8hTXgvbWsEDUrKRgwwm8ok5nBpkA0=;
  b=Py3GMhL+YI+wYLMzTayrG0hwn1dMmS2S5kxtaUYxrzP4ft9oywVcwrhA
   g4DozO3cVxZrfgs16UWkColb5TKexYrKCAtPYt5bcrl6C7A1dMvcCTyhv
   2J+e1PHjv0/BDmM8ggTGdXbBS242iH4h8IFh089VSWD30AhyBmDD4QrWY
   fIGehLm/Z58C60f5zM0UyOkUPmPVNc8Vc3JO9oyp78Hn3GgrCBf7jxfju
   ivpuWhzHJTmTKjzRt/dCxonGDxOJZtn1wnJLQYQwJkvTtrv8OGjyga7Nq
   +K3t5Hh7Sw2BTk8ttg6YG73qC0p8r82KdACrJAVqjp4xOpOJoCLIyODsa
   g==;
X-CSE-ConnectionGUID: 6Nz/GkEuRyK5+lO5gG4WWg==
X-CSE-MsgGUID: JDy6mjr6T3ykyp/a2l/WAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13620410"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="13620410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 03:42:45 -0700
X-CSE-ConnectionGUID: OS0SLcMRTD2o5wvZc3lSDg==
X-CSE-MsgGUID: nVZtgiwAQSS2grCLYx+Tyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="101414105"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2024 03:42:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srxZZ-000FMW-2R;
	Sat, 21 Sep 2024 10:42:41 +0000
Date: Sat, 21 Sep 2024 18:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 7979be5819d5153b97b2bf35ea4080ee9929dccf
Message-ID: <202409211803.4gk1fWOi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 7979be5819d5153b97b2bf35ea4080ee9929dccf  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1229m

configs tested: 170
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240921    clang-20
arc                   randconfig-002-20240921    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                       multi_v4t_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                   randconfig-001-20240921    clang-20
arm                   randconfig-002-20240921    clang-20
arm                   randconfig-003-20240921    clang-20
arm                   randconfig-004-20240921    clang-20
arm                           sama7_defconfig    gcc-14.1.0
arm                       spear13xx_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240921    clang-20
arm64                 randconfig-002-20240921    clang-20
arm64                 randconfig-003-20240921    clang-20
arm64                 randconfig-004-20240921    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240921    clang-20
csky                  randconfig-002-20240921    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240921    clang-20
hexagon               randconfig-002-20240921    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240921    clang-18
i386        buildonly-randconfig-002-20240921    clang-18
i386        buildonly-randconfig-003-20240921    clang-18
i386        buildonly-randconfig-004-20240921    clang-18
i386        buildonly-randconfig-005-20240921    clang-18
i386        buildonly-randconfig-006-20240921    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240921    clang-18
i386                  randconfig-002-20240921    clang-18
i386                  randconfig-003-20240921    clang-18
i386                  randconfig-004-20240921    clang-18
i386                  randconfig-005-20240921    clang-18
i386                  randconfig-006-20240921    clang-18
i386                  randconfig-011-20240921    clang-18
i386                  randconfig-012-20240921    clang-18
i386                  randconfig-013-20240921    clang-18
i386                  randconfig-014-20240921    clang-18
i386                  randconfig-015-20240921    clang-18
i386                  randconfig-016-20240921    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240921    clang-20
loongarch             randconfig-002-20240921    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                     cu1000-neo_defconfig    gcc-14.1.0
mips                       lemote2f_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240921    clang-20
nios2                 randconfig-002-20240921    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240921    clang-20
parisc                randconfig-002-20240921    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      chrp32_defconfig    gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.1.0
powerpc               randconfig-002-20240921    clang-20
powerpc64             randconfig-001-20240921    clang-20
powerpc64             randconfig-002-20240921    clang-20
powerpc64             randconfig-003-20240921    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240921    clang-20
riscv                 randconfig-002-20240921    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240921    clang-20
s390                  randconfig-002-20240921    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         apsh4a3a_defconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20240921    clang-20
sh                    randconfig-002-20240921    clang-20
sh                          rsk7269_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sh                            shmin_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240921    clang-20
sparc64               randconfig-002-20240921    clang-20
um                               allmodconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240921    clang-20
um                    randconfig-002-20240921    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240921    clang-18
x86_64      buildonly-randconfig-002-20240921    clang-18
x86_64      buildonly-randconfig-003-20240921    clang-18
x86_64      buildonly-randconfig-004-20240921    clang-18
x86_64      buildonly-randconfig-005-20240921    clang-18
x86_64      buildonly-randconfig-006-20240921    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240921    clang-18
x86_64                randconfig-002-20240921    clang-18
x86_64                randconfig-003-20240921    clang-18
x86_64                randconfig-004-20240921    clang-18
x86_64                randconfig-005-20240921    clang-18
x86_64                randconfig-006-20240921    clang-18
x86_64                randconfig-011-20240921    clang-18
x86_64                randconfig-012-20240921    clang-18
x86_64                randconfig-013-20240921    clang-18
x86_64                randconfig-014-20240921    clang-18
x86_64                randconfig-015-20240921    clang-18
x86_64                randconfig-016-20240921    clang-18
x86_64                randconfig-071-20240921    clang-18
x86_64                randconfig-072-20240921    clang-18
x86_64                randconfig-073-20240921    clang-18
x86_64                randconfig-074-20240921    clang-18
x86_64                randconfig-075-20240921    clang-18
x86_64                randconfig-076-20240921    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240921    clang-20
xtensa                randconfig-002-20240921    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
