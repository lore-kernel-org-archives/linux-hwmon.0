Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B60C43334
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Jul 2022 07:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiGOH3O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Jul 2022 03:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbiGOH3K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Jul 2022 03:29:10 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627BC11A36
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Jul 2022 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657870149; x=1689406149;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AN0anLhfxmcIdyc2BeCFgXnF3u5kJYrxlEbgog2Oa/c=;
  b=hbeni7FisgPnB8IzTQ5AnAht1TD+zC0EvQVTOy8JuBrN8lxUBxcQBE5L
   yazAYIOW5yoi3BUalEwgDj9l9IjRtRWZD5nd0pbEQCo8U296B4ahrdvAj
   JdjuSofB8obxI/oS6yI+LO00SE7yXLeDD5Pvear+Fq+zRU7P0OqAGlv8x
   C000a4iKljqz4RwwcbVEGAMptmF/ZUPlNaIr+kP55Tu/2ihT55/YZYmhD
   oGYu0dFC7d4nQ4x9AoAE55Zipk1Hq8YQ2LSXKn4r3biK9GNaRfaEtVu/l
   T9UlRj9Loml+q3UBo/2OQUi5OBtvvt4/+cp140WeW5A2f2caREmPfCQyd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="347400604"
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; 
   d="scan'208";a="347400604"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 00:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; 
   d="scan'208";a="623752976"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jul 2022 00:29:07 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCFl5-0001fp-AE;
        Fri, 15 Jul 2022 07:29:07 +0000
Date:   Fri, 15 Jul 2022 15:28:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9992b19d756ab8f0889fcaf3e71ff93852e74694
Message-ID: <62d11730.VoHaUywdP4bk7U/6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9992b19d756ab8f0889fcaf3e71ff93852e74694  hwmon: (asus-ec-sensors) add definitions for ROG ZENITH II EXTREME

elapsed time: 2361m

configs tested: 103
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
sparc                             allnoconfig
arm                           h3600_defconfig
mips                         cobalt_defconfig
sh                        sh7785lcr_defconfig
m68k                       m5275evb_defconfig
arm                        oxnas_v6_defconfig
x86_64                                  kexec
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-a013
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220713
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                          ath79_defconfig
arm                            dove_defconfig
arm                           spitz_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     tqm8560_defconfig
arm                      pxa255-idp_defconfig
mips                        workpad_defconfig
powerpc                          g5_defconfig
powerpc                    gamecube_defconfig
arm                        vexpress_defconfig
arm                   milbeaut_m10v_defconfig
s390                             alldefconfig
powerpc                   lite5200b_defconfig
arm                          pcm027_defconfig
arm                       cns3420vb_defconfig
mips                      malta_kvm_defconfig
powerpc                        fsp2_defconfig
hexagon                             defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc44x_defconfig
mips                           ip28_defconfig
powerpc                     ppa8548_defconfig
powerpc                     kilauea_defconfig
powerpc                          allyesconfig
mips                       rbtx49xx_defconfig
mips                        omega2p_defconfig
arm                          moxart_defconfig
powerpc                     mpc512x_defconfig
mips                     cu1000-neo_defconfig
arm                         orion5x_defconfig
powerpc                      pmac32_defconfig
arm                         socfpga_defconfig
riscv                            alldefconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220714
hexagon              randconfig-r041-20220714
hexagon              randconfig-r041-20220713
s390                 randconfig-r044-20220713
hexagon              randconfig-r045-20220713
riscv                randconfig-r042-20220713

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
