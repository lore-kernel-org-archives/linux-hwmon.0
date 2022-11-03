Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7EEC433FE
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Nov 2022 09:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiKCJZQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Nov 2022 05:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbiKCJYe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Nov 2022 05:24:34 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02224DFD6
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Nov 2022 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667467463; x=1699003463;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W95vfIzx9sjjd2nXzsbzQf+I7xClS7vS1bgl24x36Y4=;
  b=G/rnJFwfegTJaRwUtLN6irKYrTcwie39Z5qiOV1C7PdgLX79VBBrVLOi
   bd8Li1n4wXL7FCWuU+6LOnugP9xo5y6fQ4DmS2ql9tQoohC7/cRGy22m3
   nx406zYbjoaNjUG43hTjdblLHG9dFUvoKcMkIw5VSBeArKQNcqQFvnpxi
   6+SbU9QJe6coR/iYFaKk7NSueRW37DB1CFWyYRRXVvEIHuBRsWZEybttE
   KX4SQh4qEic/wsdnvt9tNM+R5o089sKIlJbxWHz+bFFp3VSk4LO2FHuHR
   GgvJ2ymHh7kYHMnF/ni6+qSBVHQpJTWBqIhU/QCCzIK+9JoKg63tKRL22
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="307248164"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="307248164"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 02:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="759875956"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="759875956"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Nov 2022 02:24:18 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oqWSP-000FlK-2v;
        Thu, 03 Nov 2022 09:24:17 +0000
Date:   Thu, 03 Nov 2022 17:23:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 52a7ce84b151ed06b1f61d750cac7a2556a5ca83
Message-ID: <636388ab.ZrcAjL98t3iav7NF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 52a7ce84b151ed06b1f61d750cac7a2556a5ca83  docs: hwmon: (smpro-hwmon) Improve grammar and formatting

elapsed time: 723m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                              allyesconfig
arc                                 defconfig
alpha                            allyesconfig
alpha                               defconfig
m68k                             allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                                defconfig
s390                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
arm                                 defconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a011
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
s390                 randconfig-r044-20221102
x86_64                              defconfig
arc                  randconfig-r043-20221102
x86_64                          rhel-8.3-func
x86_64                        randconfig-a015
riscv                randconfig-r042-20221102
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                        randconfig-a002
arm64                            allyesconfig
x86_64                           allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
i386                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
mips                             allyesconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016

clang tested configs:
hexagon              randconfig-r041-20221102
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a006
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
riscv                randconfig-r042-20221103
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
s390                 randconfig-r044-20221103

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
