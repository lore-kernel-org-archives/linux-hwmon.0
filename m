Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51916C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Jul 2022 07:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbiGBH5o (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Jul 2022 03:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBH5o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Jul 2022 03:57:44 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9478A21E12
        for <linux-hwmon@vger.kernel.org>; Sat,  2 Jul 2022 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656748663; x=1688284663;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V4kWoIQ9g/i/Cn/5DS05DFM3szXdEZW0iESvS7c+dhA=;
  b=cye6LHRGQAK7RBxIlTTPcWEMiF26Mym9Vpn5KkDje3rnG/LoP1u82HPL
   VsdwxHKdTpgpPDLDRDwQZX1eKGax/mEClCCGiNw8zwYizqvCZGRYWyleR
   e/IkyvTVJ9QWMTxwoBc9mtMDFwYLTaQ70ftQhLUQt3hHt+AV83uZf4DR+
   RsyOUcm0z+livf66D+i3TcrbKjgjGxJYFLbpYGkhqHhkM7xrrK0Fh3OUl
   xRqCLsVLV0Hfdr54hLc7siuChZnKxmN9u3ubu77Zf9MEmKQIifyylRtUP
   IeMqdbymgmg6SURlS48RcIoBbEKxQd1rIaV8zVq3RfMKlu5S3dHz/knxg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="262603281"
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="262603281"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 00:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="591948666"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Jul 2022 00:57:41 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7Y0b-000Eye-9N;
        Sat, 02 Jul 2022 07:57:41 +0000
Date:   Sat, 02 Jul 2022 15:57:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 40b57cfa5feebd52086c742e6f1d91fbc7c90213
Message-ID: <62bffa64.pNkSKYWhTCcX5LHH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 40b57cfa5feebd52086c742e6f1d91fbc7c90213  hwmon: (lm90) Use worker for alarm notifications

elapsed time: 722m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220629
riscv                randconfig-r042-20220629
s390                 randconfig-r044-20220629
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220629
hexagon              randconfig-r041-20220629

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
