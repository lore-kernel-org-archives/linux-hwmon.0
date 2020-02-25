Return-Path: <SRS0=jMON=4N=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241CCC35E0E
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Feb 2020 21:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F405420838
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Feb 2020 21:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgBYVgF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Feb 2020 16:36:05 -0500
Received: from mga12.intel.com ([192.55.52.136]:8416 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgBYVgF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Feb 2020 16:36:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 13:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; 
   d="scan'208";a="410377650"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Feb 2020 13:36:03 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j6hs3-0009Wf-3g; Wed, 26 Feb 2020 05:36:03 +0800
Date:   Wed, 26 Feb 2020 05:35:52 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 7e331bfd1172b8ed13199b056f336c408394c0ce
Message-ID: <5e559338.Dsc2eNJmm9jan26R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 7e331bfd1172b8ed13199b056f336c408394c0ce  hwmon: (lm73) Add support for of_match_table

elapsed time: 136m

configs tested: 60
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
nds32                randconfig-a001-20200225
mips                 randconfig-a001-20200225
parisc               randconfig-a001-20200225
riscv                randconfig-a001-20200225
alpha                randconfig-a001-20200225
m68k                 randconfig-a001-20200225
openrisc             randconfig-a001-20200226
sh                   randconfig-a001-20200226
s390                 randconfig-a001-20200226
xtensa               randconfig-a001-20200226
csky                 randconfig-a001-20200226
x86_64               randconfig-e001-20200226
x86_64               randconfig-e002-20200226
x86_64               randconfig-e003-20200226
i386                 randconfig-e001-20200226
i386                 randconfig-e002-20200226
i386                 randconfig-e003-20200226
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
