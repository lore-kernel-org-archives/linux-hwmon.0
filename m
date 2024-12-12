Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88551223C5E
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Dec 2024 17:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024932; cv=none; b=C9tzfKCPzYRJArqe1LZeskubq+bIjPuYr2ni6z2KkROVKYM78+nsVXfISy/xa6zwxjExKyyaapZ74CUWw8ERb7bBLoIOs7Ya2nc5yTxWDhpOPkvpjPbI1jn8GXIXfr5i9uNop4X8xlHeS/iku1TSrGyJW4XWdoRkY7ZOIzR6kaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024932; c=relaxed/simple;
	bh=ITQ+jOzApFKK/zF7IGHkBQHfpgWguqc/XUKSNNCY/FY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CuanPY4tkOnA53GHYSQC7n8wXdLOZKto5BPdx4xmFSSnnxf8lRFSkRh6abdvbhN4P34koigLDd/7UGp9Zhc9U19CmdmpKeER+NWgBDBufOCvUnsmnS22FOl8k2eoOAOGtc5x+iR44/JMKPKnssbLqe0KfCmSz4Fk5rxDsAxDqcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMyha7fq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMyha7fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734024930; x=1765560930;
  h=date:from:to:cc:subject:message-id;
  bh=ITQ+jOzApFKK/zF7IGHkBQHfpgWguqc/XUKSNNCY/FY=;
  b=ZMyha7fqr/hF+eAdgA/UNKFi69YFCIBTPtajABoyBSfnCON6kYgjRAUX
   /IyQab+saOZMe2ioCRJxhWZDs2oCgL/nXrRSN/qn24XkZulTpwStc+dZP
   phC7+/EJYBnoOUoHM5MG3O9upQVTZ55xLGY+sqr8Y0lgp+2DUmJL5LY5h
   1ulmyAi26AgO7Ay9voBxOs3nmr3nY29TzQo0k8Nt9FM9WVAj7EQ74lSzV
   eorEusANMZq+zeydmJr2rabr/p2lmfIkqcOzlpWyzdKI7YPbC4bEmvElL
   5zuxW9yjqgo8PbVACYZS/mkEtfsBsXfBLNfRpiHEVwh0mFI1JV/yiYpH4
   w==;
X-CSE-ConnectionGUID: E5/tWEcmTteVCNFvhxsqIg==
X-CSE-MsgGUID: LhYhJkEpTqyRk5NKGGHypA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38392233"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38392233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 09:35:30 -0800
X-CSE-ConnectionGUID: cKwx/LN5Sxmdba3U7TZh/Q==
X-CSE-MsgGUID: VNtyQkMySFezNIK26BuPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96145353"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2024 09:35:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLn5y-000Ac3-19;
	Thu, 12 Dec 2024 17:35:26 +0000
Date: Fri, 13 Dec 2024 01:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 30ccd0a84a894cc9f4f37c9c850dbde84f6715da
Message-ID: <202412130101.dkW3xRrd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 30ccd0a84a894cc9f4f37c9c850dbde84f6715da  Merge branch 'fixes-v6.13' into testing

elapsed time: 1451m

configs tested: 65
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241212    gcc-13.2.0
arc                  randconfig-002-20241212    gcc-13.2.0
arm                  randconfig-001-20241212    gcc-14.2.0
arm                  randconfig-002-20241212    clang-20
arm                  randconfig-003-20241212    clang-19
arm                  randconfig-004-20241212    clang-20
arm64                randconfig-001-20241212    clang-20
arm64                randconfig-002-20241212    clang-15
arm64                randconfig-003-20241212    clang-20
arm64                randconfig-004-20241212    gcc-14.2.0
csky                 randconfig-001-20241212    gcc-14.2.0
csky                 randconfig-002-20241212    gcc-14.2.0
hexagon              randconfig-001-20241212    clang-14
hexagon              randconfig-002-20241212    clang-16
i386       buildonly-randconfig-001-20241212    clang-19
i386       buildonly-randconfig-002-20241212    clang-19
i386       buildonly-randconfig-003-20241212    clang-19
i386       buildonly-randconfig-004-20241212    clang-19
i386       buildonly-randconfig-005-20241212    clang-19
i386       buildonly-randconfig-006-20241212    gcc-12
loongarch            randconfig-001-20241212    gcc-14.2.0
loongarch            randconfig-002-20241212    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20241212    gcc-14.2.0
nios2                randconfig-002-20241212    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241212    gcc-14.2.0
parisc               randconfig-002-20241212    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20241212    gcc-14.2.0
powerpc              randconfig-002-20241212    clang-20
powerpc              randconfig-003-20241212    clang-15
powerpc64            randconfig-001-20241212    clang-20
powerpc64            randconfig-002-20241212    gcc-14.2.0
powerpc64            randconfig-003-20241212    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241212    clang-17
riscv                randconfig-002-20241212    clang-20
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241212    clang-18
s390                 randconfig-002-20241212    clang-20
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241212    gcc-14.2.0
sh                   randconfig-002-20241212    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241212    gcc-14.2.0
sparc                randconfig-002-20241212    gcc-14.2.0
sparc64              randconfig-001-20241212    gcc-14.2.0
sparc64              randconfig-002-20241212    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241212    gcc-12
um                   randconfig-002-20241212    clang-20
x86_64     buildonly-randconfig-001-20241212    clang-19
x86_64     buildonly-randconfig-002-20241212    gcc-12
x86_64     buildonly-randconfig-003-20241212    clang-19
x86_64     buildonly-randconfig-004-20241212    clang-19
x86_64     buildonly-randconfig-005-20241212    gcc-11
x86_64     buildonly-randconfig-006-20241212    clang-19
xtensa               randconfig-001-20241212    gcc-14.2.0
xtensa               randconfig-002-20241212    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
