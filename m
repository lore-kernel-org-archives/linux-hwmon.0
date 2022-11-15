Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131F2C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Nov 2022 12:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiKOMja (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiKOMj3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Nov 2022 07:39:29 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C551FF97
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Nov 2022 04:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668515967; x=1700051967;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=isV1LMueNI1CoUR+f46qD9mkCfbzj7k8zqV0CicC3Ao=;
  b=RCO8K3jBw81t4P9EnJwJDIQ/wtQpW/urWR6rneyBAd8qfBKTP5i+qTbf
   tSy4S0OoODSnmefME/2Nj4ERemyug3eSn4e2I2dX0u0OlOQXZepPk8bXs
   JxJqwTLXzE8WdkQ2BIw8qvQjDq9oVHcTsWEzt9QtUxX48wfpO7ck674PM
   oZF9CI3bALPobiFu2ypSn1Ipl5+lTarw7TJX9oILdaREDAz2AyqZp+JRi
   AfcMOqRxHs5aJWuUrSjbzxLORVS1jhoOjAIaYNWE8rDBlkMjrQqrUhfKQ
   a6mgX8skLfHBqHja7HbIAOASvvaGw22JtrUs3fInJBYOonW+tuKdT6w1v
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="299765710"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="299765710"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 04:39:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="813667049"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="813667049"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2022 04:39:06 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ouvDV-0001MT-2e;
        Tue, 15 Nov 2022 12:39:05 +0000
Date:   Tue, 15 Nov 2022 20:38:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 d802a72b9bc1124fa45c527bed2f8c0320d1c42f
Message-ID: <63738838.At0kPC2phO567EJY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: d802a72b9bc1124fa45c527bed2f8c0320d1c42f  hwmon: (i5500_temp) fix missing pci_disable_device()

elapsed time: 720m

configs tested: 75
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
sh                               allmodconfig
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a003-20221114
arc                  randconfig-r043-20221114
x86_64               randconfig-a006-20221114
x86_64               randconfig-a005-20221114
m68k                             allmodconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
i386                                defconfig
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a001-20221114
alpha                            allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
i386                 randconfig-a004-20221114
i386                 randconfig-a002-20221114
x86_64                           rhel-8.3-kvm
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a003-20221114
x86_64                           allyesconfig
ia64                             allmodconfig
x86_64                            allnoconfig
i386                             allyesconfig
s390                                defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
xtensa                         virt_defconfig
sh                            shmin_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
parisc                generic-32bit_defconfig
sh                     magicpanelr2_defconfig
mips                           gcw0_defconfig
arm                                 defconfig
powerpc                     stx_gp3_defconfig
sh                           sh2007_defconfig
loongarch                        allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-c001

clang tested configs:
riscv                randconfig-r042-20221114
hexagon              randconfig-r045-20221114
hexagon              randconfig-r041-20221114
s390                 randconfig-r044-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a016-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114
arm                        magician_defconfig
x86_64               randconfig-k001-20221114

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
