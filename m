Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D827BC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 05:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiJCF2J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 01:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiJCF2J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 01:28:09 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBF22ED4A
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664774888; x=1696310888;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wy9dUyQIKw4/MmbWCu3fCUBToGp0IqPdf43m2P5+By0=;
  b=avoaBhAt2wo2WhK2+W10UbFHAzWa+mxgtkEjBeyWDV3f1TKppueeZdax
   s30y7odGqAj+nYyo7bZw1/OXSUhunzahfKYJL3MTd5ENcnlkEtjHf7OPF
   u5ZxLvIhRKCcP13NZK9rGiVMDNad751wGmW/UlqO/c5GE6+wcRIXn9uad
   ovQfQLqr2ODG5VQGwg+g37e4JYcQAb9LhSv2iFRstJhlcUC4ZCCOo7fx3
   G05gwgn9pJtcKrbt7tlirxqbrbahTwWtdGQ72bt79pjdHQPBFIam8w3hQ
   bDuk7qVfPjORqHP4sUudQOWkdjm7VKr+EFRPnYK6RBVXyUZlGRD13t/oy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="388840801"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="388840801"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2022 22:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="691930278"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="691930278"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Oct 2022 22:28:06 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofDzq-0004LV-0Q;
        Mon, 03 Oct 2022 05:28:06 +0000
Date:   Mon, 03 Oct 2022 13:27:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 adf30241dae9df4ed23ae99ea1a22a3c8b25aa1f
Message-ID: <633a72c2.iQtgMxri5nn1yCZC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: adf30241dae9df4ed23ae99ea1a22a3c8b25aa1f  watchdog: twl4030_wdt: add missing mod_devicetable.h include

elapsed time: 725m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a014-20221003
i386                 randconfig-a011-20221003
i386                 randconfig-a012-20221003
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a016-20221003
x86_64               randconfig-a011-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a012-20221003
riscv                randconfig-r042-20221003
x86_64                           rhel-8.3-syz
x86_64               randconfig-a013-20221003
i386                                defconfig
arc                  randconfig-r043-20221003
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a015-20221003
x86_64               randconfig-a016-20221003
arc                  randconfig-r043-20221002
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20221003
powerpc                          allmodconfig
mips                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                                 defconfig
powerpc                           allnoconfig
s390                             allmodconfig
i386                             allyesconfig
sh                               allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                           u8500_defconfig
sh                           se7751_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                    amigaone_defconfig
sparc                       sparc32_defconfig
m68k                        m5272c3_defconfig
arm                         axm55xx_defconfig
ia64                             alldefconfig
powerpc                     sequoia_defconfig
ia64                                defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig

clang tested configs:
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a004-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a006-20221003
hexagon              randconfig-r041-20221003
riscv                randconfig-r042-20221002
hexagon              randconfig-r041-20221002
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
s390                 randconfig-r044-20221002
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a006-20221003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
