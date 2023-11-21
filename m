Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYX58uUg"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4222BC
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2023 23:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700551317; x=1732087317;
  h=date:from:to:cc:subject:message-id;
  bh=uoInVpozjqxOQuI7BwpbeidvTh59WLLz8Dkv0JAgOEw=;
  b=OYX58uUgz2a0T3JhEx/OOoRPU+ErJUIvF4C4PWjp0Bx2IlzDEqCXGn7S
   pOCs0diS7R+6+AdGq+VD7KCfYd04sG40/MwVA7k4Hli5TI9LfToUL1m3H
   QST5hX2vcBZrb9FXzuAVHxCUCBxdNs7XkJ2ufcLlempuWYqJdZY1MBxq7
   vkhfEQthGllhB3tpTCHwNRLNSw0GIBivzFJlo2Bv808WG6o9Q9I9wDzDb
   dCAu4aRu/JYRx3Et4hZVnvWSgUiNW6McMRfLI/MIV0a5ciRWnUFh0LggK
   wZ+LxgCrsI2UN7tyG/eMxIG+/tbl7xXK4SpK1WFIk9+79TfhRG+vHx0gi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422881653"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422881653"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:21:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="742954292"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="742954292"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Nov 2023 23:21:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5L4m-0007Um-2L;
	Tue, 21 Nov 2023 07:21:44 +0000
Date: Tue, 21 Nov 2023 15:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 c03cd01890c5e41138cc5709e37859bc917aab5d
Message-ID: <202311211559.7V6T1PyL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c03cd01890c5e41138cc5709e37859bc917aab5d  ABI: sysfs-class-hwmon: document emergency/max/min temperature alarms

Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-001-20231120
|   |-- drivers-char-apm-emulation.c:warning:unused-variable-driver_version
|   |-- drivers-infiniband-core-mad_priv.h:warning:field-wc-within-struct-ib_mad_private_header-is-less-aligned-than-struct-ib_wc-and-is-usually-due-to-struct-ib_mad_private_header-being-packed-which-can-lead
|   |-- include-linux-platform_data-cros_ec_commands.h:warning:field-within-struct-ec_params_motion_sense-is-less-aligned-than-union-ec_params_motion_sense::(anonymous-at-include-linux-platform_data-cros_ec_c
|   `-- net-smc-smc_llc.c:warning:field-within-struct-smc_llc_hdr-is-less-aligned-than-union-smc_llc_hdr::(anonymous-at-net-smc-smc_llc.c)-and-is-usually-due-to-struct-smc_llc_hdr-being-packed-which-can-lead-
|-- arm-randconfig-002-20231120
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-dar-within-struct-dw_edma_v0_ch_regs-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usually-due-to-struc
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-llp-within-struct-dw_edma_v0_ch_regs-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usually-due-to-struc
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-rd_abort_imwr-within-struct-dw_edma_v0_regs-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usually-due-t
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-rd_done_imwr-within-struct-dw_edma_v0_regs-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usually-due-to
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-rd_engine_hshake_cnt-within-struct-dw_edma_v0_unroll-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usua
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-rd_err_status-within-struct-dw_edma_v0_regs-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usually-due-t
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-sar-within-struct-dw_edma_v0_ch_regs-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usually-due-to-struc
|   |-- drivers-dma-dw-edma-dw-edma-v0-regs.h:warning:field-wr_engine_hshake_cnt-within-struct-dw_edma_v0_unroll-is-less-aligned-than-union-(unnamed-union-at-drivers-dma-dw-edma-dw-edma-v0-regs.h)-and-is-usua
|   |-- fs-bcachefs-fsck.c:warning:stack-frame-size-()-exceeds-limit-()-in-reattach_inode
|   `-- sound-soc-codecs-mt6660.h:warning:field-io_lock-within-struct-mt6660_chip-is-less-aligned-than-struct-mutex-and-is-usually-due-to-struct-mt6660_chip-being-packed-which-can-lead-to-unaligned-accesses
|-- powerpc-randconfig-001-20231120
|   |-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_give_timebase
|   |-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_take_timebase
|   `-- fs-bcachefs-fsck.c:warning:stack-frame-size-()-exceeds-limit-()-in-reattach_inode
|-- powerpc-randconfig-003-20231120
|   |-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_give_timebase
|   `-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_take_timebase
`-- powerpc64-randconfig-001-20231120
    |-- arch-powerpc-kernel-rtas_pci.c:warning:no-previous-prototype-for-function-rtas_read_config
    |-- arch-powerpc-kernel-rtas_pci.c:warning:no-previous-prototype-for-function-rtas_write_config
    `-- arch-powerpc-kernel-rtas_pci.c:warning:result-of-comparison-of-constant-with-expression-of-type-u32-(aka-unsigned-int-)-is-always-false

elapsed time: 2913m

configs tested: 238
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231120   gcc  
arc                   randconfig-001-20231121   gcc  
arc                   randconfig-002-20231120   gcc  
arc                   randconfig-002-20231121   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20231120   clang
arm                   randconfig-001-20231121   gcc  
arm                   randconfig-002-20231120   clang
arm                   randconfig-002-20231121   gcc  
arm                   randconfig-003-20231120   clang
arm                   randconfig-003-20231121   gcc  
arm                   randconfig-004-20231120   clang
arm                   randconfig-004-20231121   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                 randconfig-001-20231120   clang
arm64                 randconfig-001-20231121   gcc  
arm64                 randconfig-002-20231120   clang
arm64                 randconfig-002-20231121   gcc  
arm64                 randconfig-003-20231120   clang
arm64                 randconfig-003-20231121   gcc  
arm64                 randconfig-004-20231120   clang
arm64                 randconfig-004-20231121   gcc  
csky                  randconfig-001-20231120   gcc  
csky                  randconfig-001-20231121   gcc  
csky                  randconfig-002-20231120   gcc  
csky                  randconfig-002-20231121   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231120   clang
hexagon               randconfig-002-20231120   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231119   gcc  
i386         buildonly-randconfig-002-20231119   gcc  
i386         buildonly-randconfig-003-20231119   gcc  
i386         buildonly-randconfig-004-20231119   gcc  
i386         buildonly-randconfig-005-20231119   gcc  
i386         buildonly-randconfig-006-20231119   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231119   gcc  
i386                  randconfig-002-20231119   gcc  
i386                  randconfig-003-20231119   gcc  
i386                  randconfig-004-20231119   gcc  
i386                  randconfig-005-20231119   gcc  
i386                  randconfig-006-20231119   gcc  
i386                  randconfig-011-20231119   clang
i386                  randconfig-011-20231120   gcc  
i386                  randconfig-011-20231121   clang
i386                  randconfig-012-20231119   clang
i386                  randconfig-012-20231120   gcc  
i386                  randconfig-012-20231121   clang
i386                  randconfig-013-20231119   clang
i386                  randconfig-013-20231120   gcc  
i386                  randconfig-013-20231121   clang
i386                  randconfig-014-20231119   clang
i386                  randconfig-014-20231120   gcc  
i386                  randconfig-014-20231121   clang
i386                  randconfig-015-20231119   clang
i386                  randconfig-015-20231120   gcc  
i386                  randconfig-015-20231121   clang
i386                  randconfig-016-20231119   clang
i386                  randconfig-016-20231120   gcc  
i386                  randconfig-016-20231121   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231120   gcc  
loongarch             randconfig-001-20231121   gcc  
loongarch             randconfig-002-20231120   gcc  
loongarch             randconfig-002-20231121   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231120   gcc  
nios2                 randconfig-001-20231121   gcc  
nios2                 randconfig-002-20231120   gcc  
nios2                 randconfig-002-20231121   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231120   gcc  
parisc                randconfig-001-20231121   gcc  
parisc                randconfig-002-20231120   gcc  
parisc                randconfig-002-20231121   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc               randconfig-001-20231120   clang
powerpc               randconfig-001-20231121   gcc  
powerpc               randconfig-002-20231120   clang
powerpc               randconfig-002-20231121   gcc  
powerpc               randconfig-003-20231120   clang
powerpc               randconfig-003-20231121   gcc  
powerpc64             randconfig-001-20231120   clang
powerpc64             randconfig-001-20231121   gcc  
powerpc64             randconfig-002-20231120   clang
powerpc64             randconfig-002-20231121   gcc  
powerpc64             randconfig-003-20231120   clang
powerpc64             randconfig-003-20231121   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231120   clang
riscv                 randconfig-001-20231121   gcc  
riscv                 randconfig-002-20231120   clang
riscv                 randconfig-002-20231121   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231120   gcc  
s390                  randconfig-002-20231120   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231120   gcc  
sh                    randconfig-001-20231121   gcc  
sh                    randconfig-002-20231120   gcc  
sh                    randconfig-002-20231121   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231120   gcc  
sparc64               randconfig-001-20231121   gcc  
sparc64               randconfig-002-20231120   gcc  
sparc64               randconfig-002-20231121   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231120   clang
um                    randconfig-001-20231121   gcc  
um                    randconfig-002-20231120   clang
um                    randconfig-002-20231121   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231119   gcc  
x86_64       buildonly-randconfig-001-20231121   gcc  
x86_64       buildonly-randconfig-002-20231119   gcc  
x86_64       buildonly-randconfig-002-20231121   gcc  
x86_64       buildonly-randconfig-003-20231119   gcc  
x86_64       buildonly-randconfig-003-20231121   gcc  
x86_64       buildonly-randconfig-004-20231119   gcc  
x86_64       buildonly-randconfig-004-20231121   gcc  
x86_64       buildonly-randconfig-005-20231119   gcc  
x86_64       buildonly-randconfig-005-20231121   gcc  
x86_64       buildonly-randconfig-006-20231119   gcc  
x86_64       buildonly-randconfig-006-20231121   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231119   clang
x86_64                randconfig-002-20231119   clang
x86_64                randconfig-003-20231119   clang
x86_64                randconfig-004-20231119   clang
x86_64                randconfig-005-20231119   clang
x86_64                randconfig-006-20231119   clang
x86_64                randconfig-011-20231119   gcc  
x86_64                randconfig-011-20231121   gcc  
x86_64                randconfig-012-20231119   gcc  
x86_64                randconfig-012-20231121   gcc  
x86_64                randconfig-013-20231119   gcc  
x86_64                randconfig-013-20231121   gcc  
x86_64                randconfig-014-20231119   gcc  
x86_64                randconfig-014-20231121   gcc  
x86_64                randconfig-015-20231119   gcc  
x86_64                randconfig-015-20231121   gcc  
x86_64                randconfig-016-20231119   gcc  
x86_64                randconfig-016-20231121   gcc  
x86_64                randconfig-071-20231119   gcc  
x86_64                randconfig-071-20231121   gcc  
x86_64                randconfig-072-20231119   gcc  
x86_64                randconfig-072-20231121   gcc  
x86_64                randconfig-073-20231119   gcc  
x86_64                randconfig-073-20231121   gcc  
x86_64                randconfig-074-20231119   gcc  
x86_64                randconfig-074-20231121   gcc  
x86_64                randconfig-075-20231119   gcc  
x86_64                randconfig-075-20231121   gcc  
x86_64                randconfig-076-20231119   gcc  
x86_64                randconfig-076-20231121   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231120   gcc  
xtensa                randconfig-001-20231121   gcc  
xtensa                randconfig-002-20231120   gcc  
xtensa                randconfig-002-20231121   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
