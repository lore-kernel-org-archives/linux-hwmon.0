Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3A1426C
	for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2025 03:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739589246; cv=none; b=UdlTUYtWSXqFSAyUz1wbxoVnQn42cz7m49Sf7MCnVZE45EB4EKP3F1p+6sL48+Q8ktO4e753aOugtr5kKp68Qkq6btj/I6GrdIoX7cXlrN9S1+mMgLbpSmkCpKkmn0vagRElJyd5TTi6bUPncJrCEW1WrA65cSsKR6wIQeYjjmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739589246; c=relaxed/simple;
	bh=XbtIgK4btgu4hpVTE1orOsAv4oWywTOG76u4zgWCn9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aSQorqeL0RPYGxywyPcHHfe5Z9AVjGAl3gqIJsjkr0YH8RYwjxrzXRUYu1RcarEIryLztDi4NEX+gZ+btlDB3f1rJI1YnXt4BVSstyvpSO+z3qkWeNr053UFJXG+Qv4rh7IA0SoYuCGQ2AGWGBrNRipP+K5l7WXf6jwQ2xC0X4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ns1KFfMN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ns1KFfMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739589244; x=1771125244;
  h=date:from:to:cc:subject:message-id;
  bh=XbtIgK4btgu4hpVTE1orOsAv4oWywTOG76u4zgWCn9I=;
  b=ns1KFfMNvwR7EIWjreWRV665OTJTJe3+Fsfh0b74yF91Y9OE3kYoZBHf
   W+raoRw0vcriUF7cFI1Tuk3uCE8uGnGV1rfMQDTUPzNSTz0U0z7nHTLd5
   bC23jXz14a80HG4m0YDP2FpWVGDs0hJH25/LzSgH8nWJOrMkfuJ0Ldp/J
   lu8wB4feCVkBYX4XVzr9xgB5eZ1Ab2xOPQondcXpzzvlKV9AhXFFZO00S
   Vb3sMSoPLOtuiz+OmRvrnVT/XdH+7tkgKEouJ+PQ5ViHrZE/rHjuqAAT9
   svyy3y//Q3npdY8KdPLHqt4hfRHt/qRc0vPpwPC/n5FHYfli4kqk7fLDE
   w==;
X-CSE-ConnectionGUID: CrR0KmHbSEGISaTeSXh8sQ==
X-CSE-MsgGUID: E1W5bLifQYqjhdPXio7CZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="43996030"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="43996030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 19:14:03 -0800
X-CSE-ConnectionGUID: hx/1V0XwSv60p0vgBJR88g==
X-CSE-MsgGUID: Y7jjB4sGQEWzEy67ymYo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136844346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Feb 2025 19:13:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj8cl-001ASR-1K;
	Sat, 15 Feb 2025 03:13:47 +0000
Date: Sat, 15 Feb 2025 11:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 52885bdadeade448dc8bdd2017f88a71b8d4fc97
Message-ID: <202502151141.952q2aeC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 52885bdadeade448dc8bdd2017f88a71b8d4fc97  Merge branch 'fixes-v6.14' into testing

elapsed time: 1446m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250214    gcc-13.2.0
arc                  randconfig-002-20250214    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250214    clang-16
arm                  randconfig-002-20250214    gcc-14.2.0
arm                  randconfig-003-20250214    clang-21
arm                  randconfig-004-20250214    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250214    gcc-14.2.0
arm64                randconfig-002-20250214    gcc-14.2.0
arm64                randconfig-003-20250214    gcc-14.2.0
arm64                randconfig-004-20250214    gcc-14.2.0
csky                 randconfig-001-20250214    gcc-14.2.0
csky                 randconfig-002-20250214    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250214    clang-21
hexagon              randconfig-002-20250214    clang-15
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250214    gcc-12
i386       buildonly-randconfig-002-20250214    gcc-12
i386       buildonly-randconfig-003-20250214    clang-19
i386       buildonly-randconfig-004-20250214    gcc-12
i386       buildonly-randconfig-005-20250214    gcc-12
i386       buildonly-randconfig-006-20250214    gcc-12
i386                               defconfig    clang-19
loongarch                       allmodconfig    gcc-14.2.0
loongarch            randconfig-001-20250214    gcc-14.2.0
loongarch            randconfig-002-20250214    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20250214    gcc-14.2.0
nios2                randconfig-002-20250214    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250214    gcc-14.2.0
parisc               randconfig-002-20250214    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250214    gcc-14.2.0
powerpc              randconfig-002-20250214    clang-18
powerpc              randconfig-003-20250214    clang-21
powerpc64            randconfig-001-20250214    clang-18
powerpc64            randconfig-002-20250214    gcc-14.2.0
powerpc64            randconfig-003-20250214    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250214    clang-18
riscv                randconfig-002-20250214    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-21
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250214    gcc-14.2.0
s390                 randconfig-002-20250214    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250214    gcc-14.2.0
sh                   randconfig-002-20250214    gcc-14.2.0
sparc                randconfig-001-20250214    gcc-14.2.0
sparc                randconfig-002-20250214    gcc-14.2.0
sparc64              randconfig-001-20250214    gcc-14.2.0
sparc64              randconfig-002-20250214    gcc-14.2.0
um                              allmodconfig    clang-21
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250214    gcc-12
um                   randconfig-002-20250214    clang-16
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250214    clang-19
x86_64     buildonly-randconfig-002-20250214    clang-19
x86_64     buildonly-randconfig-003-20250214    gcc-12
x86_64     buildonly-randconfig-004-20250214    clang-19
x86_64     buildonly-randconfig-005-20250214    gcc-12
x86_64     buildonly-randconfig-006-20250214    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250214    gcc-14.2.0
xtensa               randconfig-002-20250214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
