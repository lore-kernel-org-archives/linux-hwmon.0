Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E056CC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Nov 2022 05:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbiK3FVs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Nov 2022 00:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbiK3FVr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2022 00:21:47 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3E76A775
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 21:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669785706; x=1701321706;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DBKhb5OibnDyBiABH9gy7LK5YmVrazo5BNTpk7JgLsk=;
  b=mSUkFp6UvKaQdFga2wjj+NICOsx6HXCDjpOo/t50uJwbtJ7bsRGqG3y9
   F6jtOUxAy2W8HVaKisndnpszXmATJK1BLEmjpjqLoHeuVe+9ZJfWNKY3Z
   EJueJ0ifb0aXk+DwLunrI2KsnL/QjWZUFo4UmC3KnxzMUjfdPwrU4HiW1
   /dRI2l70wq3AzYEbm45zk3H+qDCBYnH6FjYs7X+IhsI04S59IjyP5ByR1
   9x6rUviNkL7VBFVq2AnIHn7xtTPu1DaAlhcBlsxm1QKfOrKEuoGE4Q2JQ
   6E9P9rSShpzXZ9zKIFTYBPpGwA+AquxGXn9HnOE8veK61FvCL0pYehikk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="342229408"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="342229408"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 21:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="646192483"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="646192483"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2022 21:21:43 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0FXT-000AeR-0q;
        Wed, 30 Nov 2022 05:21:43 +0000
Date:   Wed, 30 Nov 2022 13:20:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 10b7c400596e0010ce12b373ac7b18b7eb334e92
Message-ID: <6386e833.vVvRlP80ezv5OC67%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 10b7c400596e0010ce12b373ac7b18b7eb334e92  hwmon: (oxp-sensors) Fix pwm reading

elapsed time: 1854m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
alpha                            allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
arc                              allyesconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arc                  randconfig-r043-20221129
s390                 randconfig-r044-20221129
riscv                randconfig-r042-20221129
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
i386                                defconfig
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a001-20221128
x86_64               randconfig-a002-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
i386                             allyesconfig
m68k                             allmodconfig
arm                                 defconfig

clang tested configs:
hexagon              randconfig-r045-20221129
hexagon              randconfig-r041-20221129
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a016-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
