Return-Path: <SRS0=Agb6=7R=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405A7C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Jun 2020 23:34:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2662F206A2
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Jun 2020 23:34:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFDXe2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Jun 2020 19:34:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:25902 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgFDXe0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 4 Jun 2020 19:34:26 -0400
IronPort-SDR: EbWR5/GKvE7sveJJG1wZzb3HJdMY5R4oJGjQph1Ll9ZSr9ZqyiQdrUA5WzsFCW4WhigYkHSdTf
 IeZdfBH2B82A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 16:34:25 -0700
IronPort-SDR: TZPd2ktC73coERxBDZ2YT2Z4jR+GyfqqteNLn4m5p8K5gUGLkDUpwIOOT5iCfL5mrJk62NN6qX
 6IP1poBrLpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,474,1583222400"; 
   d="scan'208";a="417087060"
Received: from lkp-server02.sh.intel.com (HELO 6de3076d9aaa) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Jun 2020 16:34:24 -0700
Received: from kbuild by 6de3076d9aaa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgzNP-00006n-Nc; Thu, 04 Jun 2020 23:34:23 +0000
Date:   Fri, 05 Jun 2020 07:34:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 ac11b65c0d26503b91388579f588570c62e49d91
Message-ID: <5ed984ec.MXHc8fWpQ1TUbcw3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: ac11b65c0d26503b91388579f588570c62e49d91  hwmon: (bt1-pvt) Define Temp- and Volt-to-N poly as maybe-unused

elapsed time: 480m

configs tested: 92
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
mips                            ar7_defconfig
csky                             alldefconfig
sh                             shx3_defconfig
nios2                               defconfig
mips                        jmr3927_defconfig
alpha                               defconfig
powerpc                  mpc866_ads_defconfig
mips                        workpad_defconfig
s390                             alldefconfig
sh                        sh7757lcr_defconfig
sh                          r7780mp_defconfig
ia64                      gensparse_defconfig
nds32                            alldefconfig
m68k                        m5407c3_defconfig
mips                          malta_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                            defconfig
openrisc                         allyesconfig
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
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                              allnoconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
