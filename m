Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5DAC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Apr 2022 02:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiDKCul (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Apr 2022 22:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239189AbiDKCul (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Apr 2022 22:50:41 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B8642A2F
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Apr 2022 19:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649645308; x=1681181308;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lFThzPYq4RpKSSsOej6LmcqZrzbJe1/jdJck/7A/12A=;
  b=CezoOm+/gsHpMuVubc/iCmjmNSoPOTu5QngqAsyL8r1xR+sP5+AUrnDX
   mV5U3uLcpoqp7Qoah/ENfasAvDlWAW1xqUcK2Iu7O0ICqdggm2LCbWJ+X
   gpuBVpltNGopMPBwNZIKp57d/o4T48LumJgigNzIZM+j/0NIJY7uNXKOo
   pKewlllRcybzxGbWRvQuzY6XazhKStwLUXVXSWuhvzJVm0H4bnSk4NC1h
   LjzfLGmABjL0yq2of5ZrXsSI9Y4onzNYh9y6VXbsCF3+mu4xnDho85aWg
   bbckbb+fvuNxwDpdLbMVdIRX6xtuYdgRBt0UmVbEmdBBwURmFnL7tlogp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="243903388"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="243903388"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 19:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="589635225"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Apr 2022 19:48:26 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ndk6L-0001Lj-O1;
        Mon, 11 Apr 2022 02:48:25 +0000
Date:   Mon, 11 Apr 2022 10:48:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9a282ff1f3845e65a239b87a848b973f5edd1df3
Message-ID: <625396e6.8QzfKtOstRnPyFs2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9a282ff1f3845e65a239b87a848b973f5edd1df3  hwmon: (intel-m10-bmc-hwmon) use devm_hwmon_sanitize_name()

elapsed time: 739m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
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
h8300                            allyesconfig
m68k                       m5275evb_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                             allyesconfig
sh                            hp6xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220410
arm                  randconfig-c002-20220411
i386                 randconfig-c001-20220411
x86_64               randconfig-c001-20220411
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
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
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a016-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                 randconfig-a014-20220411
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
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
i386                 randconfig-a004-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a003-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a006-20220411
i386                 randconfig-a002-20220411
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
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
