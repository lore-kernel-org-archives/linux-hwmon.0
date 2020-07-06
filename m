Return-Path: <SRS0=NDU9=AR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F19C433DF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 19:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42AFB206CD
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jul 2020 19:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgGFTLi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 15:11:38 -0400
Received: from mga01.intel.com ([192.55.52.88]:53894 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgGFTLh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 6 Jul 2020 15:11:37 -0400
IronPort-SDR: Q0ivueFAKWUtQxisK9epp3Q1baheOdhLADI4Ou+TLsUDbo/gdPlgnqBBh7wfUrrj/r7mDodEbg
 5zgrGaceSA9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="165554258"
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="165554258"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2020 12:11:37 -0700
IronPort-SDR: /AgI3fQsZDI6VqVdiDwzUfGt/5hPke79fiNFurlQWaA5MvB34uXpQNTWPh5jmfKwY0LZmryT/3
 0VbkMi3vE72A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="314047069"
Received: from lkp-server01.sh.intel.com (HELO 82346ce9ac16) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 12:11:35 -0700
Received: from kbuild by 82346ce9ac16 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jsWWd-0000LJ-7Y; Mon, 06 Jul 2020 19:11:35 +0000
Date:   Tue, 07 Jul 2020 03:10:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 a7cdc9f999ce7d0409ae7f7c0ba5886f737eb1c9
Message-ID: <5f03772b.I+hoHlGQ7682nsqI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: a7cdc9f999ce7d0409ae7f7c0ba5886f737eb1c9  hwmon: (tmmp513) Replace HTTP links with HTTPS links

elapsed time: 818m

configs tested: 140
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
arm                           spitz_defconfig
arm                             ezx_defconfig
sh                                  defconfig
arm                      tct_hammer_defconfig
powerpc64                           defconfig
sh                        dreamcast_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
sh                      rts7751r2d1_defconfig
parisc                              defconfig
arm                         s3c6400_defconfig
arm                            hisi_defconfig
powerpc64                        alldefconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
alpha                               defconfig
riscv                    nommu_k210_defconfig
mips                           jazz_defconfig
riscv                               defconfig
sh                          landisk_defconfig
powerpc                      ppc6xx_defconfig
mips                          ath25_defconfig
h8300                               defconfig
sh                          r7785rp_defconfig
openrisc                         allyesconfig
sparc                            alldefconfig
mips                  mips_paravirt_defconfig
sh                     sh7710voipgw_defconfig
nios2                            alldefconfig
m68k                            q40_defconfig
mips                      malta_kvm_defconfig
sh                        edosk7760_defconfig
s390                          debug_defconfig
c6x                        evmc6457_defconfig
arm                          gemini_defconfig
arm                         bcm2835_defconfig
mips                          ath79_defconfig
mips                 decstation_r4k_defconfig
mips                         rt305x_defconfig
nios2                         3c120_defconfig
mips                            gpr_defconfig
arm                          pxa168_defconfig
sparc64                          allyesconfig
arm                          moxart_defconfig
arm                            mps2_defconfig
m68k                          multi_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
mips                         bigsur_defconfig
arm                       versatile_defconfig
m68k                        stmark2_defconfig
arm                           efm32_defconfig
powerpc                 mpc8272_ads_defconfig
um                            kunit_defconfig
arm                              alldefconfig
sh                           se7705_defconfig
xtensa                          iss_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                                allnoconfig
microblaze                        allnoconfig
arc                              allyesconfig
sh                               allmodconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200706
i386                 randconfig-a002-20200706
i386                 randconfig-a006-20200706
i386                 randconfig-a004-20200706
i386                 randconfig-a005-20200706
i386                 randconfig-a003-20200706
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc                            allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
