Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F5E5680
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726835453; cv=none; b=IN/uKarQ7henNtDTH8RFUQUnHGwSuVZbRmYE22L/VCwAY7cvomOeqMBEGOqFmyjTg5f0gLtEYnTEZzKpnN8LLcByiD0oUV9aPgnSA0aND0RySQPss4XaQJEZSGL2SfDjYTQlh1/KQSIF8qY4AH2gc/hEzrVQbNEM1QzsDIByeQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726835453; c=relaxed/simple;
	bh=SQl6HTm3CWA81g/swXRfVTcufWMkCkPu9Zl/ET5VlqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QmPBCEqoJKLO7SN8L2utmZg66pFPsvPkue+ERoFlG2eSKiQfvDyyZgciJlr4D0qcfhcnm1vX1GEJv4ez9U0b3VaCViofDN1Yq8o0gyi2lrIhFUIEWeXMH6FriPcBAEMVMcuyHI4QaE2xKLg2obZ3eByDUsHhEMOOKCN4vTrLhB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyjKltHz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyjKltHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726835452; x=1758371452;
  h=date:from:to:cc:subject:message-id;
  bh=SQl6HTm3CWA81g/swXRfVTcufWMkCkPu9Zl/ET5VlqA=;
  b=QyjKltHzOMMgl9P6ZO5bDDnPmSIjwXDzeBF/8SNHzVpxs3OF/ay49Gsx
   d94WgOUSObXrp5zfkFoy8z5tHY6Dcpo4EnHoErteJi7BNwikavVknp+Eb
   WY7sRZO9C0oP/H9yolNmJ3zwrgbnqjSFmdGAOpXTOFcjx+O3D0ejuy4df
   spqXeIdPUUt0MODYm4Z+gHaiYE+Uq70sTG5IVLl1fM8pJvbKHJuVIvLrV
   TwzQlEQfF5tBRTSbYrYHSKP0I15pxIdfEMDqtX9pYoFOtIChAre30TcVs
   iCgW5OCdYBgHgPBX1/MHjslwpbiFat4dJcmSNqtbJ7tJoQVN0Nd2ElqX0
   A==;
X-CSE-ConnectionGUID: Xh/Yv1mWQSO/pN1dDZZajg==
X-CSE-MsgGUID: q0C2BY7/RZeD24olYyUaLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25983850"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25983850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 05:30:52 -0700
X-CSE-ConnectionGUID: DYdul/PkTbeoGv5vJMU8pw==
X-CSE-MsgGUID: v+r81w6wRrWpA8ZKwl0T9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="101017750"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Sep 2024 05:30:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srcmc-000EON-0A;
	Fri, 20 Sep 2024 12:30:46 +0000
Date: Fri, 20 Sep 2024 20:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 cf617014db18017cd2cf15ec13d822a4915d516a
Message-ID: <202409202034.zRX817EO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: cf617014db18017cd2cf15ec13d822a4915d516a  Merge branch 'fixes-v6.12' into testing

elapsed time: 2002m

configs tested: 115
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                     davinci_all_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                           allnoconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240920    gcc-12
i386        buildonly-randconfig-002-20240920    gcc-12
i386        buildonly-randconfig-003-20240920    gcc-12
i386        buildonly-randconfig-004-20240920    gcc-12
i386        buildonly-randconfig-005-20240920    gcc-12
i386        buildonly-randconfig-006-20240920    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240920    gcc-12
i386                  randconfig-002-20240920    gcc-12
i386                  randconfig-003-20240920    gcc-12
i386                  randconfig-004-20240920    gcc-12
i386                  randconfig-005-20240920    gcc-12
i386                  randconfig-006-20240920    gcc-12
i386                  randconfig-011-20240920    gcc-12
i386                  randconfig-012-20240920    gcc-12
i386                  randconfig-013-20240920    gcc-12
i386                  randconfig-014-20240920    gcc-12
i386                  randconfig-015-20240920    gcc-12
i386                  randconfig-016-20240920    gcc-12
loongarch                        alldefconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                      mmu_defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         db1xxx_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      katmai_defconfig    gcc-14.1.0
powerpc                       maple_defconfig    gcc-14.1.0
powerpc                   microwatt_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-14.1.0
sh                          rsk7201_defconfig    gcc-14.1.0
sh                          rsk7269_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                                allnoconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240920    gcc-12
x86_64      buildonly-randconfig-002-20240920    gcc-12
x86_64      buildonly-randconfig-003-20240920    gcc-12
x86_64      buildonly-randconfig-004-20240920    gcc-12
x86_64      buildonly-randconfig-005-20240920    gcc-12
x86_64      buildonly-randconfig-006-20240920    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240920    gcc-12
x86_64                randconfig-002-20240920    gcc-12
x86_64                randconfig-003-20240920    gcc-12
x86_64                randconfig-004-20240920    gcc-12
x86_64                randconfig-005-20240920    gcc-12
x86_64                randconfig-006-20240920    gcc-12
x86_64                randconfig-011-20240920    gcc-12
x86_64                randconfig-012-20240920    gcc-12
x86_64                randconfig-013-20240920    gcc-12
x86_64                randconfig-014-20240920    gcc-12
x86_64                randconfig-015-20240920    gcc-12
x86_64                randconfig-016-20240920    gcc-12
x86_64                randconfig-071-20240920    gcc-12
x86_64                randconfig-072-20240920    gcc-12
x86_64                randconfig-073-20240920    gcc-12
x86_64                randconfig-074-20240920    gcc-12
x86_64                randconfig-075-20240920    gcc-12
x86_64                randconfig-076-20240920    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                          iss_defconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
