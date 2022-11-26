Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04980C43217
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Nov 2022 11:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiKZLl0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Nov 2022 06:41:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiKZLlZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Nov 2022 06:41:25 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E3D1A20E
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 03:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669462885; x=1700998885;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xyy4jxLXi0m2kpnkMGgDAaoOAWeiKQSIPUhoI62fymQ=;
  b=g48jLJbQP3bsiBKW2IFk+0Rt3PDtzpPQvZdOLd0xybk9vF9NMk+1HYMO
   rk7Vl8ECO4S6ljE7ii0TicX+YN0ee5pmir+THr9eMCmUr1R8yv1D58yFC
   tOwJAmqd9JF6jSl9f+1FAuUNbO/MbaBMx5y4iFbKM8lPkPsY0Q82F+U/4
   CgkmqsBkb/RwkdYk2oKNBZa2Uy1zZiUvH7dHoLOM1NBlkpvSf05wqC3Sf
   h48DPedqZXjztCxtf2QnGLV13wqIEm/3vB8DY5Ie0tedVhR7NFLvIPisU
   t27bQmOjo3kcMVwbc/l2wb0mvscOQ62jS9MyAxXnRnBRBLjhZv2R80SPQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="341497455"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="341497455"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 03:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785148353"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="785148353"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2022 03:41:23 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oytYh-0006GH-0s;
        Sat, 26 Nov 2022 11:41:23 +0000
Date:   Sat, 26 Nov 2022 19:41:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 2745705ee6aa2bb17c58768edc3906c931b7c618
Message-ID: <6381fb55.9PORoPsPwerz9VBV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 2745705ee6aa2bb17c58768edc3906c931b7c618  hwmon: (asus-ec-sensors) Add checks for devm_kcalloc

elapsed time: 1112m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20221124
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
s390                                defconfig
sh                               allmodconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a005
i386                             allyesconfig
i386                                defconfig
x86_64                            allnoconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
arm                           tegra_defconfig
sparc                            alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
riscv                randconfig-r042-20221124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
