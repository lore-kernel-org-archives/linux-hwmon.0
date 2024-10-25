Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47718BC06
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Oct 2024 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845113; cv=none; b=Zoq7i/K35cTAK/sHgcLrznWZiSizUKos7Tj+ngKR8KkX3iQEA1YDrUF/8uDJO/juU1rm6oZFkfazN0TmHHLgrVvJ99FkDxZYZ7XlfjaM5TwWEE7Z/Pi5CPvO+WEmu0R/CR5yb0Ako039xV7ra/Ewa+IGtlcYG/+7P/82vkfIysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845113; c=relaxed/simple;
	bh=c/+psHASy6Cdwd3u8Sie3uQgNAr0JI0YcxUkmaoFrMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNJCny6/6APa50y8yiBYRMkWTlHwhRlV3RjbucydycaZ1RNw7AaZfdXPOVKEqMf5KD29CAKHNcHn7+/e6GR8n4hL0HedQKsM81TPWvdfYa4lDCOUVH/oY8WAr3+FeF/niHVnMBJdbAH8gr/vrefMfwhKRloRomVekfkhvZjHTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ud/Z9tNK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ud/Z9tNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729845111; x=1761381111;
  h=date:from:to:cc:subject:message-id;
  bh=c/+psHASy6Cdwd3u8Sie3uQgNAr0JI0YcxUkmaoFrMw=;
  b=Ud/Z9tNKF4vTM0qNPwQuGFSzhKGwil/Ggz5q1BZHsrXiMJiwhcFBVOad
   esgIMQnYr6mgjWu4fyT8M7AWaVglADiTpO60Z4tD59ZqqLdIAPi36120b
   G1/3vlNdjLt6oNzr6/+F5KxHdLa3cTF0Cp5EhjdDYxeltgfMkZ/Isg3QH
   4rfHbd2/mmfc4G+WNB2yvQ6sJXXY/rbA+8w0ZVrvz0qM5N11+8BBBgd1q
   IqB/ezuSNg3cklfLvIOG+c8wETsohMfNUT78yqctt28JsACDRyNxKqGuf
   G12mtotUpftvDYZV7iqjy//cQ5jJ8l7U5Yf3oCSp10WOXdDr0aSo2UkwN
   g==;
X-CSE-ConnectionGUID: rstst26NR8aNwKDfmCKp4g==
X-CSE-MsgGUID: BiiMCBkgSrqnCvc3YYcCdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17138629"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="17138629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 01:31:51 -0700
X-CSE-ConnectionGUID: t4+IvZcoQ3SU9fmN1bqZpA==
X-CSE-MsgGUID: PmyOmAw4RLyjtABtK9B8fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85435020"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2024 01:31:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4FjX-000XrQ-32;
	Fri, 25 Oct 2024 08:31:47 +0000
Date: Fri, 25 Oct 2024 16:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 f866ccd8e3afb7d55070fbc8f1a16622b560a7bc
Message-ID: <202410251620.AwsexbkL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: f866ccd8e3afb7d55070fbc8f1a16622b560a7bc  Merge branch 'fixes-v6.12' into testing

elapsed time: 1058m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-14.1.0
alpha                 allyesconfig    clang-20
alpha                    defconfig    gcc-14.1.0
arc                   allmodconfig    clang-20
arc                    allnoconfig    gcc-14.1.0
arc                   allyesconfig    clang-20
arc                      defconfig    gcc-14.1.0
arm                   allmodconfig    clang-20
arm                    allnoconfig    gcc-14.1.0
arm                   allyesconfig    clang-20
arm                      defconfig    gcc-14.1.0
arm              lpc32xx_defconfig    gcc-14.1.0
arm              s3c6400_defconfig    gcc-14.1.0
arm               sp7021_defconfig    gcc-14.1.0
arm         vt8500_v6_v7_defconfig    gcc-14.1.0
arm64                 allmodconfig    clang-20
arm64                  allnoconfig    gcc-14.1.0
arm64                    defconfig    gcc-14.1.0
csky                   allnoconfig    gcc-14.1.0
csky                     defconfig    gcc-14.1.0
hexagon               allmodconfig    clang-20
hexagon                allnoconfig    gcc-14.1.0
hexagon               allyesconfig    clang-20
hexagon                  defconfig    gcc-14.1.0
i386                  alldefconfig    gcc-14.1.0
i386                  allmodconfig    clang-19
i386                   allnoconfig    clang-19
i386                  allyesconfig    clang-19
i386                     defconfig    clang-19
loongarch             allmodconfig    gcc-14.1.0
loongarch              allnoconfig    gcc-14.1.0
loongarch                defconfig    gcc-14.1.0
m68k                  allmodconfig    gcc-14.1.0
m68k                   allnoconfig    gcc-14.1.0
m68k                  allyesconfig    gcc-14.1.0
m68k                     defconfig    gcc-14.1.0
microblaze            allmodconfig    gcc-14.1.0
microblaze             allnoconfig    gcc-14.1.0
microblaze            allyesconfig    gcc-14.1.0
microblaze               defconfig    gcc-14.1.0
mips                   allnoconfig    gcc-14.1.0
mips                 gpr_defconfig    gcc-14.1.0
mips                jazz_defconfig    gcc-14.1.0
nios2                  allnoconfig    gcc-14.1.0
nios2                    defconfig    gcc-14.1.0
openrisc               allnoconfig    clang-20
openrisc               allnoconfig    gcc-14.1.0
openrisc              allyesconfig    gcc-14.1.0
openrisc                 defconfig    gcc-12
parisc                allmodconfig    gcc-14.1.0
parisc                 allnoconfig    clang-20
parisc                 allnoconfig    gcc-14.1.0
parisc                allyesconfig    gcc-14.1.0
parisc                   defconfig    gcc-12
parisc64                 defconfig    gcc-14.1.0
powerpc               allmodconfig    gcc-14.1.0
powerpc                allnoconfig    clang-20
powerpc                allnoconfig    gcc-14.1.0
powerpc               allyesconfig    gcc-14.1.0
powerpc          sequoia_defconfig    gcc-14.1.0
powerpc           tqm8xx_defconfig    gcc-14.1.0
powerpc             warp_defconfig    gcc-14.1.0
riscv                 allmodconfig    gcc-14.1.0
riscv                  allnoconfig    clang-20
riscv                  allnoconfig    gcc-14.1.0
riscv                 allyesconfig    gcc-14.1.0
riscv                    defconfig    gcc-12
s390                  allmodconfig    gcc-14.1.0
s390                   allnoconfig    clang-20
s390                  allyesconfig    gcc-14.1.0
s390                     defconfig    gcc-12
sh                    allmodconfig    gcc-14.1.0
sh                     allnoconfig    gcc-14.1.0
sh                    allyesconfig    gcc-14.1.0
sh                       defconfig    gcc-12
sh              ecovec24_defconfig    gcc-14.1.0
sh             edosk7705_defconfig    gcc-14.1.0
sh               kfr2r09_defconfig    gcc-14.1.0
sh          magicpanelr2_defconfig    gcc-14.1.0
sh                se7619_defconfig    gcc-14.1.0
sh                se7705_defconfig    gcc-14.1.0
sparc                 allmodconfig    gcc-14.1.0
sparc64                  defconfig    gcc-12
um                    allmodconfig    clang-20
um                     allnoconfig    clang-17
um                     allnoconfig    clang-20
um                    allyesconfig    clang-20
um                       defconfig    gcc-12
um                  i386_defconfig    gcc-12
um                x86_64_defconfig    gcc-12
x86_64                 allnoconfig    clang-19
x86_64                allyesconfig    clang-19
x86_64                   defconfig    clang-19
x86_64                       kexec    clang-19
x86_64                       kexec    gcc-12
x86_64                    rhel-8.3    gcc-12
xtensa                 allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
