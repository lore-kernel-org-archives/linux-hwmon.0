Return-Path: <SRS0=q2GL=CB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B054C433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Aug 2020 05:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73FB520767
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Aug 2020 05:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgHWFYi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Aug 2020 01:24:38 -0400
Received: from mga01.intel.com ([192.55.52.88]:63444 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725908AbgHWFYh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Aug 2020 01:24:37 -0400
IronPort-SDR: QX5hADDLtWrdu1VwAcQkYtyBW7wdNttw4MNLaAQo2MGV1Z4ImJ59Djqld/ru77wkxSTG7ue4LF
 JB9M3Kt8OfJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9721"; a="173804714"
X-IronPort-AV: E=Sophos;i="5.76,343,1592895600"; 
   d="scan'208";a="173804714"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2020 22:24:36 -0700
IronPort-SDR: Ioc0513rWo0TJUtdLPhSLA9bGMeXMVm9MqwW9ieKI93e6eKbgZgrCwoeu1Fq7EjTiLd3bXWfIe
 kok+kdN3iajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,343,1592895600"; 
   d="scan'208";a="328131688"
Received: from lkp-server01.sh.intel.com (HELO 91ed66e1ca04) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2020 22:24:34 -0700
Received: from kbuild by 91ed66e1ca04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k9iUc-0001x7-7t; Sun, 23 Aug 2020 05:24:34 +0000
Date:   Sun, 23 Aug 2020 13:24:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 caf074d22f8fd7801ee27518ebe1c3f8b5d219a4
Message-ID: <5f41fd88.AaXDDd8InICnAhAb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: caf074d22f8fd7801ee27518ebe1c3f8b5d219a4  dt-bindings: hwmon: Add bindings for ADM1266

elapsed time: 724m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
mips                      pic32mzda_defconfig
sparc                       sparc32_defconfig
powerpc                      pasemi_defconfig
m68k                        m5307c3_defconfig
arm                            hisi_defconfig
mips                       rbtx49xx_defconfig
mips                           ci20_defconfig
mips                           ip22_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200823
i386                 randconfig-a004-20200823
i386                 randconfig-a003-20200823
i386                 randconfig-a005-20200823
i386                 randconfig-a006-20200823
i386                 randconfig-a001-20200823
i386                 randconfig-a013-20200823
i386                 randconfig-a012-20200823
i386                 randconfig-a011-20200823
i386                 randconfig-a016-20200823
i386                 randconfig-a014-20200823
i386                 randconfig-a015-20200823
x86_64               randconfig-a002-20200823
x86_64               randconfig-a003-20200823
x86_64               randconfig-a005-20200823
x86_64               randconfig-a001-20200823
x86_64               randconfig-a006-20200823
x86_64               randconfig-a004-20200823
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
