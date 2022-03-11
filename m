Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F0DC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Mar 2022 22:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiCKWua (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Mar 2022 17:50:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiCKWuW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Mar 2022 17:50:22 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A9A240D32
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Mar 2022 14:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647038018; x=1678574018;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P8CPhrjrT7UGEI/MR8Gqkk25+6ViyqqJ8+v328vHqec=;
  b=Z31r4Wf1OMrwZBxxa1GmT1+Ff6W54RyUIj9dX/+OXkGzQllpQlxJ8tuJ
   JbSmdMVn5wwa8S7CvI5DobdwdV0EVFKaaCQ9uV1Y0yyyB0Xu0/9SZdsIF
   29DhFlRXEs/Q7hzLwkzmg3fQzy3NA/3uuBQzXKv0xaXN3IeMv+sHhpvbp
   PRK5E9io+bamt23wu9aaJvDgpXykgvMbYAhV40K1j5xoJROOcTHypr6TU
   Tw7shlueSMgvGcz5WnqCo+XA1gkmqRkNbIP932QjH2cfqkpFFcypfwksU
   lZd/RxNktdPzIV2PwWOEwYYM0MW83UrAinwZyNFIDuqVOEt7bKG5LdiLB
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="280402556"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="280402556"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 13:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="514641911"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 13:26:08 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSmlz-00077l-U3; Fri, 11 Mar 2022 21:26:07 +0000
Date:   Sat, 12 Mar 2022 05:25:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 d7e5876bf57044f8be42e2eecae47ea1d3e46f8d
Message-ID: <622bbe64.fnVDT2wsCp6cPewH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: d7e5876bf57044f8be42e2eecae47ea1d3e46f8d  dt-bindings: reset: mt7986: Add reset-controller header file

elapsed time: 1578m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                            lart_defconfig
sh                            shmin_defconfig
sh                            titan_defconfig
m68k                          multi_defconfig
nios2                         3c120_defconfig
sparc                            allyesconfig
ia64                        generic_defconfig
sh                            hp6xx_defconfig
arc                          axs103_defconfig
sh                           se7206_defconfig
h8300                    h8300h-sim_defconfig
arm                         s3c6400_defconfig
arm                        keystone_defconfig
powerpc                     tqm8548_defconfig
arm                  randconfig-c002-20220310
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                  randconfig-r043-20220310
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                           allyesconfig
arm                  colibri_pxa270_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220310
hexagon              randconfig-r045-20220310
s390                 randconfig-r044-20220310
riscv                randconfig-r042-20220310

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
