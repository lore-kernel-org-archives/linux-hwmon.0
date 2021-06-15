Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DED5C48BDF
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Jun 2021 09:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9B4E61413
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Jun 2021 09:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhFOJzr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Jun 2021 05:55:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:13222 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231379AbhFOJzq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Jun 2021 05:55:46 -0400
IronPort-SDR: D5c1Xht99KtuzQ/DUdX++gtblkpp2LU+LOdfKHgoRqJ8WNHV/qvilOlOh9NqbgVEsm5EUQtwhb
 P0lyucdQPbRw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="291591675"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="291591675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 02:53:42 -0700
IronPort-SDR: tFcjKE0ANsW1urj+1hCLbSc0ToVUnbFs/Bp4p9pkYz1P5mRwhhpmKil3YCcgFsUeHigN2fV1w9
 3uvnUPNmphXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="421072779"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2021 02:53:41 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lt5lM-0000Ke-Jv; Tue, 15 Jun 2021 09:53:40 +0000
Date:   Tue, 15 Jun 2021 17:52:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 8e6f6d9d0e9e39fdbfda666b5ddf1db841213c44
Message-ID: <60c8786e.tkfS3L5VlCWuctU1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8e6f6d9d0e9e39fdbfda666b5ddf1db841213c44  hwmon: (ntc_thermistor) Drop unused headers.

elapsed time: 2006m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    amigaone_defconfig
mips                      malta_kvm_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
powerpc                      katmai_defconfig
arc                              allyesconfig
sh                          kfr2r09_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear3xx_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         s3c2410_defconfig
arm                         nhk8815_defconfig
powerpc                    klondike_defconfig
csky                             alldefconfig
powerpc                 mpc837x_mds_defconfig
arm                       spear13xx_defconfig
arm                          pxa910_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      chrp32_defconfig
nios2                         10m50_defconfig
arm                           omap1_defconfig
csky                                defconfig
sh                     magicpanelr2_defconfig
x86_64                           alldefconfig
powerpc                       ppc64_defconfig
mips                        bcm47xx_defconfig
sh                           se7619_defconfig
powerpc                     ppa8548_defconfig
mips                         bigsur_defconfig
sh                             sh03_defconfig
powerpc                     taishan_defconfig
arm                          ixp4xx_defconfig
mips                        nlm_xlp_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      walnut_defconfig
m68k                        mvme16x_defconfig
arm                         mv78xx0_defconfig
arm                            dove_defconfig
mips                      maltasmvp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210613
i386                 randconfig-a006-20210613
i386                 randconfig-a001-20210613
i386                 randconfig-a004-20210613
i386                 randconfig-a005-20210613
i386                 randconfig-a003-20210613
i386                 randconfig-a002-20210614
i386                 randconfig-a006-20210614
i386                 randconfig-a004-20210614
i386                 randconfig-a001-20210614
i386                 randconfig-a005-20210614
i386                 randconfig-a003-20210614
i386                 randconfig-a015-20210613
i386                 randconfig-a013-20210613
i386                 randconfig-a016-20210613
i386                 randconfig-a014-20210613
i386                 randconfig-a012-20210613
i386                 randconfig-a011-20210613
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210614
x86_64               randconfig-b001-20210613
x86_64               randconfig-a001-20210614
x86_64               randconfig-a004-20210614
x86_64               randconfig-a002-20210614
x86_64               randconfig-a003-20210614
x86_64               randconfig-a006-20210614
x86_64               randconfig-a005-20210614
x86_64               randconfig-a015-20210615
x86_64               randconfig-a011-20210615
x86_64               randconfig-a012-20210615
x86_64               randconfig-a014-20210615
x86_64               randconfig-a016-20210615
x86_64               randconfig-a013-20210615
x86_64               randconfig-a015-20210613
x86_64               randconfig-a011-20210613
x86_64               randconfig-a014-20210613
x86_64               randconfig-a012-20210613
x86_64               randconfig-a013-20210613
x86_64               randconfig-a016-20210613

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
