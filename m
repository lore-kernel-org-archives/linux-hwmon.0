Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0052FC38A2D
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Oct 2022 07:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiJ0HPv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 03:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbiJ0HPt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 03:15:49 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8575A3FC
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 00:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666854945; x=1698390945;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BE3NxxLCi85qwkTddMTx/r13BGhD6RYxv7GjwSgUJoY=;
  b=glTAj+murfos8IgqFM/lKBogIJkEF+IX25q4QAPrzyIB7erC9S1+IyK6
   AIDdtTFqduUYUf3z0Qka0D4Kk+TDGqztzDVcx9/MQwAmc+/Etbp4pibYK
   cGj48KW6qCCbuR8x/tGX5s/8X72ij98ZN2XCcQEN7RPFzSy3GV/QhkD0t
   nxapmPuyZvHIf2owvuBiIkMEi9b2HvgETYGQVQiqSFvpaYzH0DPLclc+c
   bxv5GWf88ycSAbc9BLEDX9k9OM4aHq6jYfeMMKS7XfKTeBLkxp9XPkdY/
   jBscTSQJ8wWDssg66RyevENlRM9VfybTjxel8BcinfLTDz37P0iOxZUgV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309241112"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="309241112"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 00:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="663512529"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="663512529"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2022 00:15:43 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onx79-0008RD-01;
        Thu, 27 Oct 2022 07:15:43 +0000
Date:   Thu, 27 Oct 2022 15:15:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 56d1393d08e0d702aa5ee9a3cf4d38fcaa383b33
Message-ID: <635a301a.azBlo7SrI8z+/uJa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 56d1393d08e0d702aa5ee9a3cf4d38fcaa383b33  hwmon: (jc42) Restore the min/max/critical temperatures on resume

elapsed time: 912m

configs tested: 96
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
riscv                randconfig-r042-20221026
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
s390                             allmodconfig
m68k                             allyesconfig
alpha                               defconfig
s390                                defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                        randconfig-a013
s390                             allyesconfig
x86_64                        randconfig-a011
powerpc                           allnoconfig
x86_64                           allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a002
i386                             allyesconfig
sh                               allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
i386                          randconfig-a005
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                            q40_defconfig
arm                           imxrt_defconfig
arm                         assabet_defconfig
arm                          gemini_defconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
sh                            migor_defconfig
nios2                         3c120_defconfig
sparc                               defconfig
arc                              alldefconfig
arm                            pleb_defconfig
mips                      maltasmvp_defconfig
i386                          randconfig-c001
mips                 randconfig-c004-20221026
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
arm                           h5000_defconfig
m68k                          hp300_defconfig
alpha                            alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
powerpc                      pmac32_defconfig
mips                      bmips_stb_defconfig
x86_64                        randconfig-k001
arm                         s5pv210_defconfig
mips                      malta_kvm_defconfig
powerpc                    gamecube_defconfig
arm                          pxa168_defconfig
powerpc                 mpc8560_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
