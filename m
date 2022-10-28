Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A23BECAAA1
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Oct 2022 02:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbiJ1CsE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 22:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236117AbiJ1CsD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 22:48:03 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EFAA2316
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Oct 2022 19:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666925282; x=1698461282;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3ABHT3TZjKbdH6APx67hn3CYflNQgNMh0Rhse/l06ts=;
  b=c/rbnxn/Pjo+nOn6kegmBDxtnKdy4xmX3ulAZdBY1nG2deSNmmc5niGN
   oSXYtVoVLbXyClqCt+G8zGxjB6OutaAWm03YdW5Ih+izJGSGJQMb1czzu
   93Cbhoay4BMBOxBphWSSurA+FkUDevBWUNaPuqeiPMnKw4NduB/EBCyKX
   0F5DqppBrrZey1P+aNwwbuzvwl4F7j5ibLAlO9KU0Cvk5vfs5Mjig3SK+
   365Z5WRRd61rsLRfa8vfkocQRpVLfJnWKte4vBlxYJfkFjHgpBDOdo6XF
   yg7+k2FyWbzudCTA21OT+OlUtks4SQfmXOBeTLg1HVUMskkd82GdqVojO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="291694982"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; 
   d="scan'208";a="291694982"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 19:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="961862492"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; 
   d="scan'208";a="961862492"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Oct 2022 19:48:00 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooFPc-0009Oo-0l;
        Fri, 28 Oct 2022 02:48:00 +0000
Date:   Fri, 28 Oct 2022 10:47:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 0ffb687b6508c36a17b99bdaf014b38532404182
Message-ID: <635b42d1.48d3yLtRVtpvj0gr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0ffb687b6508c36a17b99bdaf014b38532404182  hwmon: (jc42) Fix missing unlock on error in jc42_write()

elapsed time: 724m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
x86_64                              defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                           allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20221026
riscv                randconfig-r042-20221026
s390                 randconfig-r044-20221026
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a002
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                          randconfig-a005
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
