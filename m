Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAA1946C2
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2024 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324563; cv=none; b=a7z0iQssqR84ESThg8SD+jlPe3c6mxyDQ92Cyo8hSV4R70pccF84m8UXF2v+q+wJu/bWbBQFdpl/axwdudUkLbb/xgd2HKcZ1ZCDg/roQwiikB5EHcp9d8kufWnIuHpMvDlVGSaT8Yk5svClTAFnUnzgxNqwLGBAwZTO+W2QwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324563; c=relaxed/simple;
	bh=YeGVtMq+BIpOD2IhI/bLzhW61bFkLwF6qsMYO6VgnFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OBwpN5lCjRn6KqhjHTjIdVSXwWpMORnZjJXLTwE/xHQK8tWLf2ghQZenF3o3uPbb+Hf0LiyEj07qIiLj6T35mtSNWjAQ+v3E1zyT0bzj98fMgEQBafmBf6KxfGVge9yeZv+a/UYNR7/MoCP5XglzGg6K+HM+SqNntG8SbhvIfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSRplb7O; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSRplb7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731324562; x=1762860562;
  h=date:from:to:cc:subject:message-id;
  bh=YeGVtMq+BIpOD2IhI/bLzhW61bFkLwF6qsMYO6VgnFY=;
  b=OSRplb7OhZljxrfjlpV9ux4MvEt1ipMwA1i+NpWaNhLFHfHW3qReH1C6
   CSWQmESyuSV1jI34FBrlKW5qlg3LnZRv6tjDIGLhCHipr9+rjhH79AjIL
   YKPCC/pQZc7tx6X4jOVieiP4NKCMsO1K/6IItgVKy9H0DabYJSTSuAflF
   590FHRFCFmdC0vvqzJSKGHbRQsZ/EifVyQqhNlsINQHRb/WIl1UD7wD9q
   0DrXowCLJlR4HwKU0oDeQ9ikizCZ4QKAVEDY5K0BhyGLvm7rPpdKimDmo
   2/1CdtA5PFHzNpOwoYYR1sW92ON+8UX8j/7SCmRLseouRulwfqWBakDtk
   Q==;
X-CSE-ConnectionGUID: e0xbPhWwTnS3+csbMJufGA==
X-CSE-MsgGUID: IPvF7LcnSaeuuyl4eEaRNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34814582"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34814582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:29:17 -0800
X-CSE-ConnectionGUID: nxype23oRMyYV8H1lTkS9Q==
X-CSE-MsgGUID: KBSBczuqRKqFGPiOamKijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="86992617"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2024 03:29:16 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tASbZ-0000Ep-1s;
	Mon, 11 Nov 2024 11:29:13 +0000
Date: Mon, 11 Nov 2024 19:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 085aba7bf91cbafbae3cfcfa8b9eb361785498b8
Message-ID: <202411111932.hfzQ9yaK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 085aba7bf91cbafbae3cfcfa8b9eb361785498b8  hwmon: (sch5627, max31827) Fix typos in driver documentation

elapsed time: 725m

configs tested: 168
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241111    gcc-13.2.0
arc                   randconfig-002-20241111    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-14
arm                      integrator_defconfig    clang-20
arm                         lpc32xx_defconfig    clang-20
arm                        multi_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20241111    clang-17
arm                   randconfig-002-20241111    clang-20
arm                   randconfig-003-20241111    clang-20
arm                   randconfig-004-20241111    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241111    clang-20
arm64                 randconfig-002-20241111    gcc-14.2.0
arm64                 randconfig-003-20241111    clang-20
arm64                 randconfig-004-20241111    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241111    gcc-14.2.0
csky                  randconfig-002-20241111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241111    clang-20
hexagon               randconfig-002-20241111    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241111    gcc-11
i386        buildonly-randconfig-002-20241111    gcc-12
i386        buildonly-randconfig-003-20241111    clang-19
i386        buildonly-randconfig-004-20241111    gcc-12
i386        buildonly-randconfig-005-20241111    clang-19
i386        buildonly-randconfig-006-20241111    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241111    clang-19
i386                  randconfig-002-20241111    gcc-12
i386                  randconfig-003-20241111    clang-19
i386                  randconfig-004-20241111    gcc-12
i386                  randconfig-005-20241111    gcc-12
i386                  randconfig-006-20241111    gcc-12
i386                  randconfig-011-20241111    clang-19
i386                  randconfig-012-20241111    gcc-12
i386                  randconfig-013-20241111    clang-19
i386                  randconfig-014-20241111    clang-19
i386                  randconfig-015-20241111    gcc-12
i386                  randconfig-016-20241111    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241111    gcc-14.2.0
loongarch             randconfig-002-20241111    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-15
mips                         db1xxx_defconfig    clang-20
mips                      maltaaprp_defconfig    clang-14
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241111    gcc-14.2.0
nios2                 randconfig-002-20241111    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241111    gcc-14.2.0
parisc                randconfig-002-20241111    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                       ebony_defconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241111    gcc-14.2.0
powerpc               randconfig-002-20241111    gcc-14.2.0
powerpc               randconfig-003-20241111    clang-20
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241111    clang-20
powerpc64             randconfig-002-20241111    clang-20
powerpc64             randconfig-003-20241111    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241111    clang-20
riscv                 randconfig-002-20241111    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241111    gcc-14.2.0
s390                  randconfig-002-20241111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241111    gcc-14.2.0
sh                    randconfig-002-20241111    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241111    gcc-14.2.0
sparc64               randconfig-002-20241111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241111    clang-20
um                    randconfig-002-20241111    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241111    gcc-12
x86_64      buildonly-randconfig-002-20241111    gcc-12
x86_64      buildonly-randconfig-003-20241111    gcc-12
x86_64      buildonly-randconfig-004-20241111    gcc-12
x86_64      buildonly-randconfig-005-20241111    gcc-12
x86_64      buildonly-randconfig-006-20241111    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241111    clang-19
x86_64                randconfig-002-20241111    clang-19
x86_64                randconfig-003-20241111    clang-19
x86_64                randconfig-004-20241111    gcc-12
x86_64                randconfig-005-20241111    gcc-12
x86_64                randconfig-006-20241111    clang-19
x86_64                randconfig-011-20241111    clang-19
x86_64                randconfig-012-20241111    gcc-12
x86_64                randconfig-013-20241111    clang-19
x86_64                randconfig-014-20241111    clang-19
x86_64                randconfig-015-20241111    clang-19
x86_64                randconfig-016-20241111    gcc-12
x86_64                randconfig-071-20241111    gcc-12
x86_64                randconfig-072-20241111    gcc-12
x86_64                randconfig-073-20241111    clang-19
x86_64                randconfig-074-20241111    clang-19
x86_64                randconfig-075-20241111    clang-19
x86_64                randconfig-076-20241111    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241111    gcc-14.2.0
xtensa                randconfig-002-20241111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
