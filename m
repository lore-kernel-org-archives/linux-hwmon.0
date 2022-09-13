Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16CCC6FA82
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Sep 2022 06:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiIMGXz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Sep 2022 02:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiIMGXy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Sep 2022 02:23:54 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE22765B3
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Sep 2022 23:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663050230; x=1694586230;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w5L/hJuiataJngEL7zUre8TYpDVI+5aLgUax5GZmal8=;
  b=l3al/S8nDpof/v4Ts+gjP0sGydg4Bm0tvt7ryG7xb6w8ZWwvanfV7HHK
   tAatrCr/Aw8CfCF9EeLjvdOR73boRAbPAYszNn1zHDRZZF1ix7Q+xfDg6
   HKBq4Gg8gMFa7SspGPb0/mkQGBaL9Svgx4eaB86CHe/VNr/uPlJ7PouT+
   gVg/PwM09JMujPBrL6MSXv2jop6btnwG4Ta7kjCbcAM8eflaFUcaT7QxE
   59+ZhkOLOcPGrETb3gw/RtzCEr/D0lC1Tz9q569r1kRJlEUexi1a4Qj65
   EHEdDt58AYG18y2Ekf53QHGPj3VPYaa+z7DH5vCtVBdwNYL0EFJ5c84oA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="324292767"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="324292767"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 23:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="720045000"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2022 23:23:49 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oXzKm-0003J1-28;
        Tue, 13 Sep 2022 06:23:48 +0000
Date:   Tue, 13 Sep 2022 14:23:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 e8a253862802688458e637fb44812116464df829
Message-ID: <632021db.8JHkr/zr0B7zx4CV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: e8a253862802688458e637fb44812116464df829  hwmon: (mr75203) skip reset-control deassert for SOCs that don't support it

elapsed time: 725m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
sh                               allmodconfig
i386                 randconfig-a001-20220912
i386                 randconfig-a002-20220912
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a004-20220912
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
i386                 randconfig-a003-20220912
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a006-20220912
x86_64                           allyesconfig
i386                 randconfig-a005-20220912
x86_64                           rhel-8.3-syz
x86_64               randconfig-a001-20220912
x86_64               randconfig-a004-20220912
x86_64               randconfig-a002-20220912
arm                                 defconfig
riscv                randconfig-r042-20220911
x86_64               randconfig-a005-20220912
arc                  randconfig-r043-20220912
x86_64               randconfig-a003-20220912
x86_64               randconfig-a006-20220912
arc                  randconfig-r043-20220911
s390                 randconfig-r044-20220911
ia64                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
riscv                randconfig-r042-20220912
hexagon              randconfig-r041-20220912
hexagon              randconfig-r045-20220911
hexagon              randconfig-r041-20220911
hexagon              randconfig-r045-20220912
s390                 randconfig-r044-20220912
i386                 randconfig-a013-20220912
i386                 randconfig-a011-20220912
i386                 randconfig-a014-20220912
i386                 randconfig-a015-20220912
i386                 randconfig-a012-20220912
i386                 randconfig-a016-20220912
x86_64               randconfig-a014-20220912
x86_64               randconfig-a011-20220912
x86_64               randconfig-a012-20220912
x86_64               randconfig-a015-20220912
x86_64               randconfig-a016-20220912
x86_64               randconfig-a013-20220912

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
