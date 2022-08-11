Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE70C00140
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Aug 2022 02:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbiHKCta (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 22:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbiHKCtU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 22:49:20 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D6988DF1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 19:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660186159; x=1691722159;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vnGc30CsW4hf4Hnn/F0av8+Mj9fV5043MhbY9nAem9I=;
  b=jyE7JIAxR88MfFU2GhuJwmHhX/e5Dyq3XjtPsTo0JxhQgGdw1GUV1qZG
   73fyDIXYHZRYx4uvF9JMJ2cdKaPj3C7tPeFQ2HfZd9D9ZK6qWkxZs/E8d
   jDNj5ecU4DrP4eoyArp4Y8PMrqbs8HvQgQTuctszguQLMzLJ7Zzo0sGkv
   mw1IS1x4eE5wFOHztUyLlQuWzjLKZobXCG32F9/cqaz2MMhBD25qoiUQp
   qmpgLBG3meogAefF0DOyHrecarBijbVvV9eMck7HebaO8BGYBhlJ14hdH
   babCkQGO/XSPtk5pb+GPCczQz+mE0UzeQi5LBi+Xdm0vwMvCDFgfSlVrV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="278186255"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="278186255"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 19:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="634033652"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2022 19:49:17 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oLyG4-00010M-1H;
        Thu, 11 Aug 2022 02:49:16 +0000
Date:   Thu, 11 Aug 2022 10:49:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 525d34124e55ec98cfdda01e10879bd8f8457067
Message-ID: <62f46e1c.fIFgGk71MB2Ag7ap%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 525d34124e55ec98cfdda01e10879bd8f8457067  dt-bindings: hwmon: sparx5: use correct clock

elapsed time: 717m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
arm                                 defconfig
x86_64                               rhel-8.3
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a014
arm64                            allyesconfig
i386                                defconfig
i386                          randconfig-a012
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a002
i386                          randconfig-a016
arm                              allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
i386                             allyesconfig
x86_64                        randconfig-a006
arc                  randconfig-r043-20220810
arc                              allyesconfig
x86_64                          rhel-8.3-func
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
riscv                randconfig-r042-20220810
mips                             allyesconfig
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
s390                 randconfig-r044-20220810
sh                               allmodconfig
m68k                             allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a011
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a003
i386                          randconfig-a002
hexagon              randconfig-r041-20220810
x86_64                        randconfig-a014
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r045-20220810

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
