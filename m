Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0382F8BE8
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Oct 2025 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034346; cv=none; b=EZq4SLagEnO6CeEVk31lntRG2uO9qnr21Qzbu85KixLHtqjK2aRN5vr+6Eh4aKdQJqSIPXc+QTcxkoJfGuhL3fe5MZqWG7xlah+aL5rgYHjtiQRvGDD86/cyGhXs/83ceKcSjkUJvrRX7gJMVxVP/mfVZGKKevHR2GzDf7Ssaks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034346; c=relaxed/simple;
	bh=PvFFdiA2Za1HWL6amtvwhME1TWQ98IZwIRqYTLVmtlE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pSPzIHHbhmg5eMYz/clO2Orw1NT1cK0poBH8SIyfwgHGZ1L/XSWQ4G+5LK9mPwx6Lrd8EwqkSCMc9IW+qKAAJabuK715THP7SqWqkHItKImkeA0SZ08EpR/zKKzRGYFJWEt7EqvDyVJlcVsWWX5UfOiE8RC1DV51aBAupA7d8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8+ql0Z3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8+ql0Z3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761034345; x=1792570345;
  h=date:from:to:cc:subject:message-id;
  bh=PvFFdiA2Za1HWL6amtvwhME1TWQ98IZwIRqYTLVmtlE=;
  b=X8+ql0Z3yiEZAfvF4vWJMi0jj/yprACrmss1wUQ9yvPmeUA9FVCuEl0M
   wCTS5mbkHt55is+MUcDGtucFEkeiHk584Kz7LzYeIanOOrTE/V3C0i/P+
   O0stWE3VPI5CLpm7Egpbtal/qpI40jAlXnMKnUCMKU6qhWXj6twIXP7Y3
   bpEa2XgRYSPiBFG80HAB6Zqb5Nq6BQiqM92JHaSRvK2Bl2sydoMsjhnS+
   jY+yXta+vm0SD4/D+vjoOzrWgU6/N8Y6axPWP9U54LolIkuecpfVNGRY8
   hhBpwbAgXy79JGEMI0OrJ71rOp5lLR3M5k1nqbY9PFS0kPWmlf0N9q27t
   Q==;
X-CSE-ConnectionGUID: HHwfVMW8S7WWbCzLB6K1AQ==
X-CSE-MsgGUID: fzW+MwT3T+em1qknUSwGfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63252975"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="63252975"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:12:19 -0700
X-CSE-ConnectionGUID: u2x0wyTiSJekb+DGBCt4fQ==
X-CSE-MsgGUID: AbZku7wnSr+gDsstFEh0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="184308808"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Oct 2025 01:12:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB7Sh-000Ae7-2J;
	Tue, 21 Oct 2025 08:11:29 +0000
Date: Tue, 21 Oct 2025 16:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 3991e3d59fa9f33c574f2695bab7b8e79876443f
Message-ID: <202510211603.d8ScXJYq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 3991e3d59fa9f33c574f2695bab7b8e79876443f  Merge branch 'hwmon-lock' into hwmon-staging

elapsed time: 1051m

configs tested: 243
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251020    gcc-14.3.0
arc                   randconfig-001-20251021    clang-22
arc                   randconfig-002-20251020    gcc-8.5.0
arc                   randconfig-002-20251021    clang-22
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                           imxrt_defconfig    gcc-15.1.0
arm                   randconfig-001-20251020    gcc-14.3.0
arm                   randconfig-001-20251021    clang-22
arm                   randconfig-002-20251020    clang-22
arm                   randconfig-002-20251021    clang-22
arm                   randconfig-003-20251020    clang-22
arm                   randconfig-003-20251021    clang-22
arm                   randconfig-004-20251020    clang-22
arm                   randconfig-004-20251021    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251020    clang-22
arm64                 randconfig-001-20251021    clang-22
arm64                 randconfig-002-20251020    gcc-12.5.0
arm64                 randconfig-002-20251021    clang-22
arm64                 randconfig-003-20251020    gcc-8.5.0
arm64                 randconfig-003-20251021    clang-22
arm64                 randconfig-004-20251020    gcc-10.5.0
arm64                 randconfig-004-20251021    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251020    gcc-15.1.0
csky                  randconfig-001-20251021    gcc-8.5.0
csky                  randconfig-002-20251020    gcc-15.1.0
csky                  randconfig-002-20251021    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251020    clang-22
hexagon               randconfig-001-20251021    gcc-8.5.0
hexagon               randconfig-002-20251020    clang-22
hexagon               randconfig-002-20251021    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251020    gcc-14
i386        buildonly-randconfig-001-20251021    clang-20
i386        buildonly-randconfig-002-20251020    clang-20
i386        buildonly-randconfig-002-20251021    clang-20
i386        buildonly-randconfig-003-20251020    gcc-14
i386        buildonly-randconfig-003-20251021    clang-20
i386        buildonly-randconfig-004-20251020    gcc-14
i386        buildonly-randconfig-004-20251021    clang-20
i386        buildonly-randconfig-005-20251020    clang-20
i386        buildonly-randconfig-005-20251021    clang-20
i386        buildonly-randconfig-006-20251020    clang-20
i386        buildonly-randconfig-006-20251021    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251021    gcc-14
i386                  randconfig-002-20251021    gcc-14
i386                  randconfig-003-20251021    gcc-14
i386                  randconfig-004-20251021    gcc-14
i386                  randconfig-005-20251021    gcc-14
i386                  randconfig-006-20251021    gcc-14
i386                  randconfig-007-20251021    gcc-14
i386                  randconfig-011-20251021    clang-20
i386                  randconfig-012-20251021    clang-20
i386                  randconfig-013-20251021    clang-20
i386                  randconfig-014-20251021    clang-20
i386                  randconfig-015-20251021    clang-20
i386                  randconfig-016-20251021    clang-20
i386                  randconfig-017-20251021    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251020    gcc-15.1.0
loongarch             randconfig-001-20251021    gcc-8.5.0
loongarch             randconfig-002-20251020    gcc-15.1.0
loongarch             randconfig-002-20251021    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251020    gcc-10.5.0
nios2                 randconfig-001-20251021    gcc-8.5.0
nios2                 randconfig-002-20251020    gcc-8.5.0
nios2                 randconfig-002-20251021    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251020    gcc-13.4.0
parisc                randconfig-001-20251021    gcc-8.5.0
parisc                randconfig-002-20251020    gcc-10.5.0
parisc                randconfig-002-20251021    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    clang-22
powerpc                        cell_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251020    clang-22
powerpc               randconfig-001-20251021    gcc-8.5.0
powerpc               randconfig-002-20251020    gcc-8.5.0
powerpc               randconfig-002-20251021    gcc-8.5.0
powerpc               randconfig-003-20251020    clang-22
powerpc               randconfig-003-20251021    gcc-8.5.0
powerpc64             randconfig-001-20251020    clang-19
powerpc64             randconfig-001-20251021    gcc-8.5.0
powerpc64             randconfig-002-20251020    gcc-11.5.0
powerpc64             randconfig-002-20251021    gcc-8.5.0
powerpc64             randconfig-003-20251020    gcc-8.5.0
powerpc64             randconfig-003-20251021    gcc-8.5.0
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251020    gcc-13.4.0
riscv                 randconfig-001-20251021    gcc-8.5.0
riscv                 randconfig-002-20251020    clang-22
riscv                 randconfig-002-20251021    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251020    gcc-11.5.0
s390                  randconfig-001-20251021    gcc-8.5.0
s390                  randconfig-002-20251020    clang-22
s390                  randconfig-002-20251021    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251020    gcc-15.1.0
sh                    randconfig-001-20251021    gcc-8.5.0
sh                    randconfig-002-20251020    gcc-15.1.0
sh                    randconfig-002-20251021    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251020    gcc-8.5.0
sparc                 randconfig-001-20251021    gcc-8.5.0
sparc                 randconfig-002-20251020    gcc-8.5.0
sparc                 randconfig-002-20251021    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251020    gcc-10.5.0
sparc64               randconfig-001-20251021    gcc-8.5.0
sparc64               randconfig-002-20251020    clang-22
sparc64               randconfig-002-20251021    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251020    clang-22
um                    randconfig-001-20251021    gcc-8.5.0
um                    randconfig-002-20251020    clang-22
um                    randconfig-002-20251021    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251020    gcc-14
x86_64      buildonly-randconfig-001-20251021    clang-20
x86_64      buildonly-randconfig-002-20251020    clang-20
x86_64      buildonly-randconfig-002-20251021    clang-20
x86_64      buildonly-randconfig-003-20251020    gcc-14
x86_64      buildonly-randconfig-003-20251021    clang-20
x86_64      buildonly-randconfig-004-20251020    gcc-14
x86_64      buildonly-randconfig-004-20251021    clang-20
x86_64      buildonly-randconfig-005-20251020    gcc-14
x86_64      buildonly-randconfig-005-20251021    clang-20
x86_64      buildonly-randconfig-006-20251020    gcc-14
x86_64      buildonly-randconfig-006-20251021    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251021    gcc-14
x86_64                randconfig-002-20251021    gcc-14
x86_64                randconfig-003-20251021    gcc-14
x86_64                randconfig-004-20251021    gcc-14
x86_64                randconfig-005-20251021    gcc-14
x86_64                randconfig-006-20251021    gcc-14
x86_64                randconfig-007-20251021    gcc-14
x86_64                randconfig-008-20251021    gcc-14
x86_64                randconfig-071-20251021    gcc-14
x86_64                randconfig-072-20251021    gcc-14
x86_64                randconfig-073-20251021    gcc-14
x86_64                randconfig-074-20251021    gcc-14
x86_64                randconfig-075-20251021    gcc-14
x86_64                randconfig-076-20251021    gcc-14
x86_64                randconfig-077-20251021    gcc-14
x86_64                randconfig-078-20251021    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251020    gcc-8.5.0
xtensa                randconfig-001-20251021    gcc-8.5.0
xtensa                randconfig-002-20251020    gcc-8.5.0
xtensa                randconfig-002-20251021    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
