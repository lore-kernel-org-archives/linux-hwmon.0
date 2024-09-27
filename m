Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E4A136352
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Sep 2024 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727471447; cv=none; b=TgqYvlvD97Td3WjgpZg98AQi7cyq17z7yx/P60zKLEvhOc84yTrdjIf8uhjJ+Xuk/DoKhDmXjn0bu2cx44rG1qCVNuAw+cF0x+kWH72v0Erdpr9JWHZfpUeOXEcm3Z9xUp9f1TzKtRHtsDD4uTf5v3LwUcq5rNtxA7lQmHgmDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727471447; c=relaxed/simple;
	bh=n1+VZ7SkJaIyqxoX3acGAHFkTk7bebgBfMb8Hp5+iJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=swOgffJu/katMUhLXFhp6C6gog06KxcfxG/eCRpz98BL4TWclnH8mQPxfb2weaSJG+1SJxuUeRqzVRL9w99+OMBzSGLVuG6ISUcRS9Jv7M9glod6N7WFrp798wKIbttBRL6nTTs5kkt31jOuzeHAAQMxpxY8NDsZ2zd23G3A6CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MV++8b87; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MV++8b87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727471445; x=1759007445;
  h=date:from:to:cc:subject:message-id;
  bh=n1+VZ7SkJaIyqxoX3acGAHFkTk7bebgBfMb8Hp5+iJ4=;
  b=MV++8b87FZztMRp7ASQmjegEvJcAWHEQlnv5wcmJm6nzlKXsW/jRG1N0
   6gKtrliQ+cFdEnwTIe64N1Gvb06EWa5tgRhA4j4jDdvKQ2cfhDcQ8bCr8
   BfhWYxju282w1A6aODV6kvtteoVUhxH+0YsOY6GGs4dXTCQ5iOQobC4cY
   HXxe60s1D/YGr0Xsgn9VE20y7p6EDEYg8SvmVyCVuvMv1d1b6XOhRtqFG
   FTpq6DtwyO6l9HGU3HnpMVI3bh6rB/Ct88jTA+p3wMa+U698YfEzdzhb0
   iFQjeRyVtu140DlPJqB+GoB/8xlHHofAe0s3x3qywP8BChFk+GMlpg5Sm
   Q==;
X-CSE-ConnectionGUID: RI3HojpUSgGR70vU0YAB8w==
X-CSE-MsgGUID: A+qXqRtmTbym9+dffjMI5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26503872"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26503872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 14:10:44 -0700
X-CSE-ConnectionGUID: H/url7hJSmyK3tKJtn0TIw==
X-CSE-MsgGUID: JIz+4YVsR2e91hkC2P75cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72963347"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 14:10:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suIEa-000MdC-1S;
	Fri, 27 Sep 2024 21:10:40 +0000
Date: Sat, 28 Sep 2024 05:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 dc4766de906ca130de75f8a1f0627562b5c0889a
Message-ID: <202409280514.1PUYEfSQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: dc4766de906ca130de75f8a1f0627562b5c0889a  hwmon: (adt7475) Fix memory leak in adt7475_fan_pwm_config()

elapsed time: 1454m

configs tested: 251
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    clang-20
arc                      axs103_smp_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20240927    gcc-14.1.0
arc                   randconfig-002-20240927    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            hisi_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                          moxart_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.1.0
arm                         orion5x_defconfig    gcc-14.1.0
arm                          pxa910_defconfig    gcc-14.1.0
arm                   randconfig-001-20240927    gcc-14.1.0
arm                   randconfig-002-20240927    gcc-14.1.0
arm                   randconfig-003-20240927    gcc-14.1.0
arm                   randconfig-004-20240927    gcc-14.1.0
arm                         s5pv210_defconfig    gcc-14.1.0
arm                           sunxi_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm                         vf610m4_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240927    gcc-14.1.0
arm64                 randconfig-002-20240927    gcc-14.1.0
arm64                 randconfig-003-20240927    gcc-14.1.0
arm64                 randconfig-004-20240927    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240927    gcc-14.1.0
csky                  randconfig-002-20240927    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240927    gcc-14.1.0
hexagon               randconfig-002-20240927    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240927    clang-18
i386        buildonly-randconfig-002-20240927    clang-18
i386        buildonly-randconfig-002-20240927    gcc-12
i386        buildonly-randconfig-003-20240927    clang-18
i386        buildonly-randconfig-004-20240927    clang-18
i386        buildonly-randconfig-005-20240927    clang-18
i386        buildonly-randconfig-006-20240927    clang-18
i386        buildonly-randconfig-006-20240927    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240927    clang-18
i386                  randconfig-002-20240927    clang-18
i386                  randconfig-003-20240927    clang-18
i386                  randconfig-004-20240927    clang-18
i386                  randconfig-004-20240927    gcc-12
i386                  randconfig-005-20240927    clang-18
i386                  randconfig-006-20240927    clang-18
i386                  randconfig-011-20240927    clang-18
i386                  randconfig-011-20240927    gcc-12
i386                  randconfig-012-20240927    clang-18
i386                  randconfig-013-20240927    clang-18
i386                  randconfig-013-20240927    gcc-12
i386                  randconfig-014-20240927    clang-18
i386                  randconfig-014-20240927    gcc-12
i386                  randconfig-015-20240927    clang-18
i386                  randconfig-015-20240927    gcc-11
i386                  randconfig-016-20240927    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240927    gcc-14.1.0
loongarch             randconfig-002-20240927    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    clang-20
mips                        bcm63xx_defconfig    clang-20
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                     cu1000-neo_defconfig    clang-20
mips                           gcw0_defconfig    gcc-14.1.0
mips                           ip28_defconfig    clang-20
mips                        maltaup_defconfig    clang-20
mips                        qi_lb60_defconfig    clang-20
mips                           rs90_defconfig    gcc-14.1.0
mips                         rt305x_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240927    gcc-14.1.0
nios2                 randconfig-002-20240927    gcc-14.1.0
openrisc                         alldefconfig    clang-20
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240927    gcc-14.1.0
parisc                randconfig-002-20240927    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    clang-20
powerpc                      katmai_defconfig    gcc-14.1.0
powerpc                 linkstation_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240927    gcc-14.1.0
powerpc               randconfig-002-20240927    gcc-14.1.0
powerpc               randconfig-003-20240927    gcc-14.1.0
powerpc                     redwood_defconfig    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc64             randconfig-001-20240927    gcc-14.1.0
powerpc64             randconfig-002-20240927    gcc-14.1.0
powerpc64             randconfig-003-20240927    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240927    gcc-14.1.0
riscv                 randconfig-002-20240927    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240927    gcc-14.1.0
s390                  randconfig-002-20240927    gcc-14.1.0
s390                       zfcpdump_defconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-14.1.0
sh                        edosk7705_defconfig    gcc-14.1.0
sh                             espt_defconfig    clang-20
sh                    randconfig-001-20240927    gcc-14.1.0
sh                    randconfig-002-20240927    gcc-14.1.0
sh                          rsk7201_defconfig    clang-20
sh                          rsk7269_defconfig    gcc-14.1.0
sh                           se7343_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7724_defconfig    clang-20
sh                             shx3_defconfig    gcc-14.1.0
sh                          urquell_defconfig    gcc-14.1.0
sparc                            alldefconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    clang-20
sparc                       sparc32_defconfig    gcc-14.1.0
sparc64                          alldefconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240927    gcc-14.1.0
sparc64               randconfig-002-20240927    gcc-14.1.0
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240927    gcc-14.1.0
um                    randconfig-002-20240927    gcc-14.1.0
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240927    clang-18
x86_64      buildonly-randconfig-002-20240927    clang-18
x86_64      buildonly-randconfig-003-20240927    clang-18
x86_64      buildonly-randconfig-004-20240927    clang-18
x86_64      buildonly-randconfig-005-20240927    clang-18
x86_64      buildonly-randconfig-006-20240927    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240927    clang-18
x86_64                randconfig-002-20240927    clang-18
x86_64                randconfig-003-20240927    clang-18
x86_64                randconfig-004-20240927    clang-18
x86_64                randconfig-005-20240927    clang-18
x86_64                randconfig-006-20240927    clang-18
x86_64                randconfig-011-20240927    clang-18
x86_64                randconfig-012-20240927    clang-18
x86_64                randconfig-013-20240927    clang-18
x86_64                randconfig-014-20240927    clang-18
x86_64                randconfig-015-20240927    clang-18
x86_64                randconfig-016-20240927    clang-18
x86_64                randconfig-071-20240927    clang-18
x86_64                randconfig-072-20240927    clang-18
x86_64                randconfig-073-20240927    clang-18
x86_64                randconfig-074-20240927    clang-18
x86_64                randconfig-075-20240927    clang-18
x86_64                randconfig-076-20240927    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20240927    gcc-14.1.0
xtensa                randconfig-002-20240927    gcc-14.1.0
xtensa                    xip_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
