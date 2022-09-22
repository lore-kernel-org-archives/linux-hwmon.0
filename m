Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5ABECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 02:45:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiIVCpA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 22:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiIVCo6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 22:44:58 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB4B4A138
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 19:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663814698; x=1695350698;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UeQT/YHKuL4TPVewAPT/3GM9xPwsDZNRif2ccJl0NeI=;
  b=CONFmLiCcTcdSt/zOtnNZe98S8LcfSBYfIeF9JlmxHOj/+Ba5+vf05HM
   dn6UWujk0r9HjcXord5aWE786AjdPJTJfD8O88mYIm2+fLll1FiheK5jD
   YouLFCRrMQkh5pLTX5kAFx27g2qzqip84zGyD8PfagNsB+81ph73R7HyB
   T8lXrCa3g293ygGPba7JD3OXQtQrm56JQ8tNjF7om+EAJk5ChxLhvMCeG
   OYA8SMPQgs4OjHe5hP6Ou1zw3D0FZPNUDN6NBpga8iTH5/sbAqb06XY6x
   jBPZYZNVaLUcCH0tPg2jNvz5eUVzwSfiAjNiJXZNvbK+Ai0LwSrL7YF+6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280549858"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="280549858"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 19:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="723472681"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2022 19:44:56 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obCCu-0004Dc-13;
        Thu, 22 Sep 2022 02:44:56 +0000
Date:   Thu, 22 Sep 2022 10:44:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 103974b1117651a5884e2bc7832d7b02990e0232
Message-ID: <632bcbf1.pI3OutwNWwDfvEvl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 103974b1117651a5884e2bc7832d7b02990e0232  hwmon: (mr75203) fix undefined reference to `__divdi3'

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
x86_64                        randconfig-a013
arc                                 defconfig
s390                 randconfig-r044-20220921
x86_64                        randconfig-a011
s390                             allmodconfig
x86_64                        randconfig-a015
alpha                               defconfig
i386                                defconfig
i386                          randconfig-a001
s390                                defconfig
i386                          randconfig-a003
powerpc                           allnoconfig
mips                             allyesconfig
s390                             allyesconfig
i386                          randconfig-a005
m68k                             allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
x86_64                        randconfig-a002
alpha                            allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a004
arc                              allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a014
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm                                 defconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
