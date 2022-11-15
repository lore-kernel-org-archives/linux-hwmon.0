Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9957C43219
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Nov 2022 15:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiKOPBq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Nov 2022 10:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiKOPBp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Nov 2022 10:01:45 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A2E248CB
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Nov 2022 07:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668524504; x=1700060504;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZfqWBag1dZP8YylHKRMPENiMOPhYjq2Q4k/1yszU8O4=;
  b=gop53Yj0uFriHmtavSd4c39bPoq06dAOYgmbD1YBA7DskLww7UoZfaVd
   Y+VNbmwKgHv3yYBe0xw1z88DR6WlbVY1jgZOVs2wM+14PuPxQBBs3h8j8
   Q0zEbMLKb3eJmcGCUnTmyn+M4C8NvWPtoRhstNesxv9HYqBA4MG4MUgUb
   9oTrenMdS280SvGBi8hzoix0EgJKyl3KL7F0tZIpQMDIfgDDratvOxq2M
   qzpXvSUUoGyOfl1DRthz8ezFDi13iONxVPwMOKq+3crd0tZaE5RR4dJiL
   iIs6TWcIvq4V2EruerSK1DmNF5ItiexseTJlo2JN1UgxWT4syRVb+s6WB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="310978105"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="310978105"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 07:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="813705732"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="813705732"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2022 07:01:09 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ouxQy-0001R9-28;
        Tue, 15 Nov 2022 15:01:08 +0000
Date:   Tue, 15 Nov 2022 23:01:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 27fea302952d8c90cafbdbee96bafeca03544401
Message-ID: <6373a9af.LA9bfG0YCHIIpw/u%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 27fea302952d8c90cafbdbee96bafeca03544401  hwmon: (nct6775) add ASUS CROSSHAIR VIII/TUF/ProArt B550M

elapsed time: 863m

configs tested: 85
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a003-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a006-20221114
x86_64               randconfig-a005-20221114
arc                  randconfig-r043-20221114
x86_64                              defconfig
i386                                defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                            allnoconfig
i386                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allmodconfig
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114
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
i386                          randconfig-c001
arm                           sunxi_defconfig
arm                               allnoconfig
loongarch                 loongson3_defconfig
arc                         haps_hs_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                            hp6xx_defconfig

clang tested configs:
riscv                randconfig-r042-20221114
hexagon              randconfig-r041-20221114
hexagon              randconfig-r045-20221114
s390                 randconfig-r044-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a016-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114
arm                        magician_defconfig
x86_64               randconfig-k001-20221114
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
