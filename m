Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7B0ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Sep 2022 03:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiIQDv5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Sep 2022 23:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIQDv4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2022 23:51:56 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AB513F3B
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 20:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663386715; x=1694922715;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I8y7QWBVc//AkZLZoLV7HUfDMUmWDBRgM2SxCU+4YGU=;
  b=hXOmE0uMeGnDUqwDcAT9hdWLpKm4DlObMHrS8moMtvY3U4pHKDdtRgYs
   xNE/Sk78BkuEGavKFQrjZdt2CS8y0OT73LlHCzCCp0nX5DCS2Twj8kxWE
   WdIFsBiNsmzPrdi897iSlX6rNFurjQbXOogsz3paIrlBpieva1p6/5fZl
   B4ncBv3GMYM6Qp0qS9/PH4469tJGFdh9+lkutxkErSnBRicx7E17b6DzR
   uwgdotODO+EZK1egpIOZHK2elC0bIuuoEkLwevLn/AROWZFs+7scdTCla
   RcFQy/fVl3icR1YO4MC/paJiQJC/WaCJOKpSY+gYkBdt3Gd+yLZZHORjD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="300490638"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="300490638"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 20:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="569045583"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2022 20:51:54 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oZOrx-0002Ru-1u;
        Sat, 17 Sep 2022 03:51:53 +0000
Date:   Sat, 17 Sep 2022 11:51:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9f74e9d42e7671dc4fc7804d4ed99002619ab5f8
Message-ID: <6325442d.PO9Pyy/nrY6nTDvG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9f74e9d42e7671dc4fc7804d4ed99002619ab5f8  hwmon: (emc2305) Remove unnecessary range check

elapsed time: 918m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
arc                  randconfig-r043-20220916
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allmodconfig
x86_64                              defconfig
m68k                             allyesconfig
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
i386                          randconfig-a001
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                           allyesconfig
i386                             allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
i386                          randconfig-a012
x86_64                        randconfig-a013
i386                          randconfig-a016
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r045-20220916
s390                 randconfig-r044-20220916
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
