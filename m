Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D29C54EE9
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Sep 2022 00:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiI1ABC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Sep 2022 20:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiI1ABB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2022 20:01:01 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53B267CAC
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Sep 2022 17:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664323259; x=1695859259;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DyPK3y+ydWfb1XoIV1YXypbeZ0MPhr+k1Xa/uI7fl90=;
  b=mf4oJVkoze/pWXfg7Y+eVtzOKMoRsSzv9Jjb3klLBVnQtCG8IxrniEkc
   qieFdoe7o/pgZDJr3TcSqjzzkTJ0e+wk0sJtF7eM1+WxCx4rDhCinA1lP
   Xq6baO71Q+NPnytzUxaTXH9GqBMj8dXjTw4Nd3Wp1ohoLU33/XKCRdrj3
   FOHDFElPj/Z3Mg+wgmODPk3/caq4Vjmvt+nJDubEyULjabhSYlQjNOPhr
   IJn6F5M2VsV3wrypY67QEZgkij3OJWubTezbyj/3W8zybcjk3QglRwQPv
   fA7PRMDyneso/Nq7Fm7bOkJ6B2EbVNkbxvg2K2nIpaSWf0VR+rDFpxa42
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="387746180"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="387746180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 17:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="690186152"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="690186152"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2022 17:00:58 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odKVV-0001im-2m;
        Wed, 28 Sep 2022 00:00:57 +0000
Date:   Wed, 28 Sep 2022 08:00:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 b8ac3539dc9c6d2759d4213440f8c6738b9fed24
Message-ID: <63338e9c.L0ET8KfbUZDt7kSC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: b8ac3539dc9c6d2759d4213440f8c6738b9fed24  watchdog: twl4030_wdt: add missing of.h include

elapsed time: 750m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
i386                 randconfig-a001-20220926
x86_64               randconfig-a002-20220926
i386                 randconfig-a004-20220926
x86_64                               rhel-8.3
i386                 randconfig-a002-20220926
x86_64               randconfig-a004-20220926
i386                 randconfig-a003-20220926
x86_64               randconfig-a001-20220926
i386                 randconfig-a005-20220926
x86_64               randconfig-a003-20220926
i386                 randconfig-a006-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64                           allyesconfig
arc                  randconfig-r043-20220925
i386                                defconfig
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a016-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
