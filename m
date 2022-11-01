Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE67FA373D
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Nov 2022 04:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiKAEOo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Nov 2022 00:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKAEOn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Nov 2022 00:14:43 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1062D13D6C
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Oct 2022 21:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667276082; x=1698812082;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HDBOJYHTUhYmgROK/qsVjgNlfThGWNOj7/WEeMlNX7U=;
  b=J4H+F23rh2PLpwsznZl5NiL8dVB2uaphCgje6mdF1DEI6nz6wtvCAtI6
   o4nVgYLbadsgkGZ2okZio99GAqex/hH64YGPtcNLJ/S74xT+rJEPgetv7
   GSbJWMBozCwoAFGMNahBOc+585vkyhVHhguUART2+mwrsd5noUTDaW4Av
   TXy/IuP3KsCPRV79kE117s487262VInVGmhH8U99NSOUaWtkzMYpC6Qyi
   XWEEBJIbPA4n4ZSJsLmwPTHDGrMmbPWxGMLgEmjUxDitsakrLAqyVkJM4
   NXCzWfKs+8JxD9qWRjZuDg8IuQBmTBHHt595VCpuJ+FNC21oHAKE8psWt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="292364518"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; 
   d="scan'208";a="292364518"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 21:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="963009877"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; 
   d="scan'208";a="963009877"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2022 21:14:40 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1opiff-000DJk-1t;
        Tue, 01 Nov 2022 04:14:39 +0000
Date:   Tue, 01 Nov 2022 12:14:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 e18a9e894913b626396e2a8b864d980d28c66429
Message-ID: <63609d23.+6imnvkObOYB7q6R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e18a9e894913b626396e2a8b864d980d28c66429  hwmon: (scmi) Register explicitly with Thermal Framework

elapsed time: 809m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
mips                             allyesconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
powerpc                          allmodconfig
s390                             allmodconfig
s390                                defconfig
m68k                             allmodconfig
arm                                 defconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
i386                 randconfig-a011-20221031
m68k                             allyesconfig
i386                 randconfig-a012-20221031
i386                 randconfig-a013-20221031
arm64                            allyesconfig
ia64                             allmodconfig
i386                 randconfig-a014-20221031
i386                 randconfig-a016-20221031
i386                 randconfig-a015-20221031
arm                              allyesconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                           allyesconfig
x86_64               randconfig-a012-20221031
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a015-20221031
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a011-20221031
x86_64               randconfig-a013-20221031
x86_64                          rhel-8.3-func
x86_64               randconfig-a016-20221031
x86_64               randconfig-a014-20221031
arc                  randconfig-r043-20221031
riscv                randconfig-r042-20221031
arc                  randconfig-r043-20221030
s390                 randconfig-r044-20221031
i386                                defconfig
i386                             allyesconfig

clang tested configs:
i386                 randconfig-a001-20221031
x86_64               randconfig-a003-20221031
i386                 randconfig-a003-20221031
i386                 randconfig-a002-20221031
i386                 randconfig-a004-20221031
x86_64               randconfig-a002-20221031
i386                 randconfig-a006-20221031
i386                 randconfig-a005-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a004-20221031
hexagon              randconfig-r045-20221031
x86_64               randconfig-a006-20221031
hexagon              randconfig-r041-20221030
x86_64               randconfig-a005-20221031
riscv                randconfig-r042-20221030
s390                 randconfig-r044-20221030
hexagon              randconfig-r041-20221031
hexagon              randconfig-r045-20221030

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
