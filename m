Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61604C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Apr 2022 02:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240067AbiDKCul (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Apr 2022 22:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiDKCuj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Apr 2022 22:50:39 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A87542A2E
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Apr 2022 19:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649645307; x=1681181307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x90Tcq3Tu5YviNOfPMfNoExDU5HSJfKfdK9sVBlPtR0=;
  b=Npmn4SaMZYDNpBz5MPGUVL5sks7ZbwpxxHs++UVNHFFE88ERMAnLGvHq
   Lu6CGujtfym3ytldcybClF48uPOS8kNGVGtZsPmCqCHQgIJvxTPsmvE/L
   mo6CZA2sGXEkJSguSaWu5+lb6A7jg4RJK9Bh/ZmqhaHjMN0azm1UqupZE
   ZuqLbUe3xtN6aguVcoEN8ogh/L1HjfHalayobLYYp2TyJljCoUxNbk0Nj
   azhS98dui7XU2rJy6YWxnZ750Zu1jnq/qU+msxvV0oTiFOQUqOce0DwbQ
   vyY9YWCCdit6nvLAjcVALAFR+4SIa+DHyc0sqIkY0MKMfFT1VCRvjzmgD
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="259614016"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="259614016"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 19:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="699194336"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2022 19:48:26 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ndk6L-0001Lo-Pc;
        Mon, 11 Apr 2022 02:48:25 +0000
Date:   Mon, 11 Apr 2022 10:48:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 7b2666ce445c700b8dcee994da44ddcf050a0842
Message-ID: <625396ea.DZHy7EMO71yNy0d2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 7b2666ce445c700b8dcee994da44ddcf050a0842  hwmon: (adt7470) Fix warning on module removal

elapsed time: 739m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
powerpc              randconfig-c003-20220410
i386                          randconfig-c001
m68k                             allyesconfig
sh                          landisk_defconfig
sh                         ap325rxa_defconfig
parisc                generic-32bit_defconfig
powerpc                 canyonlands_defconfig
sh                        sh7763rdp_defconfig
powerpc                   currituck_defconfig
xtensa                         virt_defconfig
powerpc                     taishan_defconfig
powerpc                 mpc8540_ads_defconfig
nios2                            alldefconfig
sh                          r7780mp_defconfig
sh                            migor_defconfig
sparc                               defconfig
xtensa                  audio_kc705_defconfig
powerpc                           allnoconfig
powerpc                      tqm8xx_defconfig
mips                             allmodconfig
openrisc                    or1ksim_defconfig
arc                        vdk_hs38_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          lboxre2_defconfig
sh                   sh7724_generic_defconfig
arm                           h3600_defconfig
arm                       multi_v4t_defconfig
arm                          pxa910_defconfig
sh                          sdk7786_defconfig
mips                            gpr_defconfig
arm                            xcep_defconfig
openrisc                         alldefconfig
m68k                        m5307c3_defconfig
powerpc                     tqm8541_defconfig
mips                       capcella_defconfig
nios2                               defconfig
m68k                        mvme16x_defconfig
xtensa                          iss_defconfig
mips                  maltasmvp_eva_defconfig
sh                         ecovec24_defconfig
xtensa                              defconfig
m68k                       m5249evb_defconfig
h8300                            allyesconfig
m68k                       m5275evb_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                             allyesconfig
sh                            hp6xx_defconfig
arm                  randconfig-c002-20220411
arm                  randconfig-c002-20220410
i386                 randconfig-c001-20220411
x86_64               randconfig-c001-20220411
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
arc                              allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a016-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                 randconfig-a014-20220411
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220410
arm                  randconfig-c002-20220410
i386                          randconfig-c001
riscv                randconfig-c006-20220410
mips                 randconfig-c004-20220410
hexagon                          alldefconfig
powerpc                    mvme5100_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     kmeter1_defconfig
powerpc                      acadia_defconfig
arm                             mxs_defconfig
arm                       netwinder_defconfig
arm                      pxa255-idp_defconfig
mips                         tb0219_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc8272_ads_defconfig
mips                         tb0287_defconfig
arm                       imx_v4_v5_defconfig
arm                          moxart_defconfig
mips                   sb1250_swarm_defconfig
mips                          malta_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a004-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a003-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a006-20220411
i386                 randconfig-a002-20220411
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220410
hexagon              randconfig-r041-20220411
hexagon              randconfig-r041-20220410
hexagon              randconfig-r045-20220411
hexagon              randconfig-r045-20220410

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
