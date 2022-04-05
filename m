Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975CFC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Apr 2022 03:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiDEDEO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Apr 2022 23:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiDEDEH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Apr 2022 23:04:07 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32DB32441F
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Apr 2022 19:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649126623; x=1680662623;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fUyc6HYGnQILwktu1kc88f7b4Jd/7r34mziiiIDgHcg=;
  b=Y5VNuy5m2Ru1405HXPmhxkgQ4OiCdNNEo/xcUmc67CIJW3px43XACJV3
   srmugnYHljifMcnHS8uR0UbMLZadB4yr7B9d6hnxs79uueIqqNzitPfhf
   JUj+0UphDNCgmSsByjhzNUR2zppY68/ws7r9jZM67z4RdkGpAZpYrebFq
   k6lEhztoMBZzy7Va0N2n5XWhcCr1bdxDYUi3SXcD6UV/EZ5ldAhsMQyqA
   +3jDI0ODjhJ8Kycqj1TfQZ+qZppUrdQfwnu5DGfn4kCwhiVfD0i3/P5R5
   6pImjYRUvap8jrdBbF09cDHjeRpt5QNLZjKGk1W7NyJHYsyLFgOX7OTJN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="259482935"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="259482935"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 19:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="657764250"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Apr 2022 19:43:42 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbZAT-0002ZM-Gk;
        Tue, 05 Apr 2022 02:43:41 +0000
Date:   Tue, 05 Apr 2022 10:43:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 4fd45cc8568e6086272d3036f2c29d61e9b776a1
Message-ID: <624bacb8.oodm6iGMlI3AGhgX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 4fd45cc8568e6086272d3036f2c29d61e9b776a1  hwmon: (asus_wmi_sensors) Fix CROSSHAIR VI HERO name

elapsed time: 726m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220404
arm                       multi_v4t_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                        mvme147_defconfig
arc                        nsim_700_defconfig
xtensa                          iss_defconfig
arm                           corgi_defconfig
mips                            gpr_defconfig
arm                        multi_v7_defconfig
powerpc                 linkstation_defconfig
sh                               alldefconfig
arm                        mini2440_defconfig
arm                      integrator_defconfig
arm                        realview_defconfig
sh                           se7780_defconfig
arm                        keystone_defconfig
arm                       omap2plus_defconfig
sh                         ap325rxa_defconfig
sh                          rsk7201_defconfig
m68k                       m5475evb_defconfig
x86_64               randconfig-c001-20220404
arm                  randconfig-c002-20220404
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
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
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a011-20220404
x86_64               randconfig-a013-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a015-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a012-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a016-20220404
arc                  randconfig-r043-20220404
riscv                randconfig-r042-20220404
s390                 randconfig-r044-20220404
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                      walnut_defconfig
arm                       cns3420vb_defconfig
powerpc                     mpc512x_defconfig
i386                 randconfig-a001-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a005-20220404
i386                 randconfig-a006-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a006-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a004-20220404
hexagon              randconfig-r045-20220404
hexagon              randconfig-r041-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
