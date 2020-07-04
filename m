Return-Path: <SRS0=THek=AP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C247C433DF
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 20:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71011208D5
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 20:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgGDUkH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Jul 2020 16:40:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:1760 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726895AbgGDUkH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 4 Jul 2020 16:40:07 -0400
IronPort-SDR: +5t7bKZmusby5K59gi4uRRwTE/190f2wAR5TtXT3dTAqBB4srblbcZPRCRbV0ZOlSh83qUp6I/
 x9a5sLyr0T+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9672"; a="147284627"
X-IronPort-AV: E=Sophos;i="5.75,313,1589266800"; 
   d="scan'208";a="147284627"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2020 13:40:03 -0700
IronPort-SDR: 0sJe+Y4m75b5hE724+PdwDpMsYOmKFLYd2qoTDgsNVziBzSO5Z7a/RD8owyvMJfwI0IXREoExX
 MAk0PxNAQd2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,313,1589266800"; 
   d="scan'208";a="296550327"
Received: from lkp-server01.sh.intel.com (HELO 6dc8ab148a5d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Jul 2020 13:40:02 -0700
Received: from kbuild by 6dc8ab148a5d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jrox7-0000lg-Mp; Sat, 04 Jul 2020 20:40:01 +0000
Date:   Sun, 05 Jul 2020 04:39:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 44536b3b3366480c830b1cd840954f59b2f5bb69
Message-ID: <5f00e916.r97zIbsCyxpa38Z3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 44536b3b3366480c830b1cd840954f59b2f5bb69  Documentation: hwmon/w83l786ng: drop duplicate words

elapsed time: 1339m

configs tested: 173
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                               allnoconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                       aspeed_g4_defconfig
m68k                       m5249evb_defconfig
arm                            mmp2_defconfig
sh                            shmin_defconfig
powerpc                      pmac32_defconfig
sh                                  defconfig
arm                          moxart_defconfig
arm                            qcom_defconfig
arm                          iop32x_defconfig
mips                           ip28_defconfig
powerpc                     pq2fads_defconfig
arm                         at91_dt_defconfig
sh                           cayman_defconfig
m68k                         amcore_defconfig
arc                             nps_defconfig
arm                        trizeps4_defconfig
microblaze                    nommu_defconfig
mips                           ip27_defconfig
sh                         apsh4a3a_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                            titan_defconfig
powerpc                     skiroot_defconfig
sh                               allmodconfig
arm                         assabet_defconfig
powerpc                      ppc40x_defconfig
arm                          pxa3xx_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      ppc6xx_defconfig
mips                          ath25_defconfig
ia64                             allyesconfig
powerpc                       maple_defconfig
mips                      pistachio_defconfig
h8300                               defconfig
arm                          simpad_defconfig
arm                           efm32_defconfig
sh                               alldefconfig
powerpc                    mvme5100_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
m68k                       m5475evb_defconfig
arm                         s5pv210_defconfig
arm                        vexpress_defconfig
arm                         lpc32xx_defconfig
mips                   sb1250_swarm_defconfig
powerpc                  mpc885_ads_defconfig
arm                   milbeaut_m10v_defconfig
sh                        dreamcast_defconfig
openrisc                    or1ksim_defconfig
m68k                             alldefconfig
arc                      axs103_smp_defconfig
ia64                          tiger_defconfig
arm                         vf610m4_defconfig
h8300                     edosk2674_defconfig
mips                        jmr3927_defconfig
arm                         nhk8815_defconfig
powerpc                     mpc5200_defconfig
s390                          debug_defconfig
ia64                                defconfig
s390                             alldefconfig
arm                         bcm2835_defconfig
sparc                            alldefconfig
arm                           viper_defconfig
arm                         orion5x_defconfig
m68k                          multi_defconfig
arm                       imx_v4_v5_defconfig
arm                             rpc_defconfig
arm                         mv78xx0_defconfig
s390                                defconfig
powerpc                      tqm8xx_defconfig
mips                     loongson1b_defconfig
powerpc                    gamecube_defconfig
arm                         ebsa110_defconfig
powerpc                       ppc64_defconfig
m68k                       bvme6000_defconfig
sh                     sh7710voipgw_defconfig
nios2                         10m50_defconfig
powerpc                          alldefconfig
arm                           stm32_defconfig
arc                            hsdk_defconfig
mips                        vocore2_defconfig
mips                      pic32mzda_defconfig
arm                              zx_defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
arm                      jornada720_defconfig
mips                         tb0219_defconfig
powerpc                  storcenter_defconfig
arm                          tango4_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
arm                          badge4_defconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
c6x                        evmc6678_defconfig
sh                   sh7770_generic_defconfig
sparc64                          allmodconfig
microblaze                        allnoconfig
parisc                generic-64bit_defconfig
mips                 decstation_r4k_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                              allnoconfig
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
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                              defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
arc                              allyesconfig
sh                                allnoconfig
mips                              allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allyesconfig
riscv                            allmodconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc                            allyesconfig
sparc64                          allyesconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
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
