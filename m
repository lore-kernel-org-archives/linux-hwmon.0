Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21E1EF380
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Apr 2025 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801546; cv=none; b=A+VTxkVUyn1WP+SXwFew3Dz3DcCCbXc9U+6Ow6HF8fK3K9+whh0X+77SbvvL3d03yojidY7LhMEXUpvJ9S+DX5BfjsQITPN0tTCEzvSOyqa7/yW248McSkoIHD+PjRD027nZ2FhI0DMTXwpIIJcPQ8sQu5n6fUQz20RxCy6D4v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801546; c=relaxed/simple;
	bh=Sn1gl8Z3DQwVEKnzgi9ovJRTRasFdJIx/atxlsowIDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NoaWpTVuihyiiH17rhtj3gQVyAZhmU/s02olDsH0d+gBK65T9e1jL3SH8yxATebbOcTPMTaneE41YNi8qkCcRj7LWkLkR3sDgGVV0Z8XF7/jwdJ46RD3mHRohiNNBLQSuAKcwmN3Eqmfiw3Svjj6Zy4REYOqmNWK/7iIaVEfHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2i214uM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2i214uM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744801544; x=1776337544;
  h=date:from:to:cc:subject:message-id;
  bh=Sn1gl8Z3DQwVEKnzgi9ovJRTRasFdJIx/atxlsowIDM=;
  b=L2i214uM6Ljx++xno9WF9qIFCNgQvdZ+Yt3vbO9My+heRXPL5tJ4baXX
   HC4AMCK0hryQxTMN0fDmqS4Yl2lzjAKhNbLABgnnJqHr0+Vt3U2VHEQ1g
   ck1uuYcXbOBkyKPtzewAkFyHIbUBkP+RBnkqMFi+l9Nc9OkI313eFfYeb
   jRPkNwPeLq+MpynpYYHDeXLbs51r2wQ6PErXkRKOLfxplmOP4hg0lrGQC
   OWxCbzIXp0iIQP+7dsqWJliOlXwnIbY0bEOP2+qjEolqS/Oo/Ri+vybRe
   cEYWGWuk190hA83nKZ0nrBQNWqep80vUzHLxQOmJLfSM1Vs7ZLfU6F83X
   w==;
X-CSE-ConnectionGUID: 2xSAmlb2QH24TidzP+A99A==
X-CSE-MsgGUID: iKW4D8wkQMW+l+PdP6uWWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33958996"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="33958996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:05:44 -0700
X-CSE-ConnectionGUID: qEKTqq17TLGS+4aAUU9oow==
X-CSE-MsgGUID: wajZgIxhQ32y4OzrhOev2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131405575"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 04:05:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u50aJ-000JZx-35;
	Wed, 16 Apr 2025 11:05:39 +0000
Date: Wed, 16 Apr 2025 19:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 8f47f2d1355a3846d0ac2b1e05b3bb8aaf3a6c2f
Message-ID: <202504161934.R6A632F5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8f47f2d1355a3846d0ac2b1e05b3bb8aaf3a6c2f  hwmon: (lm90) Use to_delayed_work()

elapsed time: 1448m

configs tested: 114
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250415    gcc-14.2.0
arc                   randconfig-002-20250415    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250415    clang-21
arm                   randconfig-002-20250415    clang-21
arm                   randconfig-003-20250415    gcc-10.5.0
arm                   randconfig-004-20250415    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250415    clang-16
arm64                 randconfig-002-20250415    gcc-7.5.0
arm64                 randconfig-003-20250415    gcc-9.5.0
arm64                 randconfig-004-20250415    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250415    gcc-13.3.0
csky                  randconfig-002-20250415    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250415    clang-20
hexagon               randconfig-002-20250415    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250415    clang-20
i386        buildonly-randconfig-002-20250415    clang-20
i386        buildonly-randconfig-003-20250415    clang-20
i386        buildonly-randconfig-004-20250415    clang-20
i386        buildonly-randconfig-005-20250415    gcc-12
i386        buildonly-randconfig-006-20250415    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250415    gcc-14.2.0
loongarch             randconfig-002-20250415    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250415    gcc-13.3.0
nios2                 randconfig-002-20250415    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250415    gcc-12.4.0
parisc                randconfig-002-20250415    gcc-10.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250415    gcc-5.5.0
powerpc               randconfig-002-20250415    clang-17
powerpc               randconfig-003-20250415    gcc-7.5.0
powerpc64             randconfig-001-20250415    gcc-7.5.0
powerpc64             randconfig-002-20250415    clang-17
powerpc64             randconfig-003-20250415    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250415    gcc-14.2.0
riscv                 randconfig-002-20250415    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250415    clang-21
s390                  randconfig-002-20250415    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250415    gcc-11.5.0
sh                    randconfig-002-20250415    gcc-9.3.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250415    gcc-6.5.0
sparc                 randconfig-002-20250415    gcc-12.4.0
sparc64               randconfig-001-20250415    gcc-14.2.0
sparc64               randconfig-002-20250415    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250415    clang-21
um                    randconfig-002-20250415    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250415    clang-20
x86_64      buildonly-randconfig-002-20250415    gcc-11
x86_64      buildonly-randconfig-003-20250415    gcc-12
x86_64      buildonly-randconfig-004-20250415    clang-20
x86_64      buildonly-randconfig-005-20250415    clang-20
x86_64      buildonly-randconfig-006-20250415    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250415    gcc-6.5.0
xtensa                randconfig-002-20250415    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
