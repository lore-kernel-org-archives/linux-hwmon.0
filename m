Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC10ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Sep 2022 13:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbiIINsH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Sep 2022 09:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiIINrv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2022 09:47:51 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D9413FA6F
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Sep 2022 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662731254; x=1694267254;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=40R44W3EMWDBfVpNLqLkiB/uXD2m7rqsGJSZtwY0uFc=;
  b=T7rlc2s6YBtB4bg28y9z/ZHbDFStjlS5NY2K0u9eMkZzKOxCOdm2+KFV
   zO3SZQ6H+ogEw+xUDnvQ5RynKwBcObv5uwTUX8oKq/v+I9fazOTPVlMlL
   16jofWgevRBuvHOY9o0Zn2oIIZ95kq9C/vHlG8S3SmaKXbjeDJ090sjWI
   016B23E93wZwyspl6rE/ydiNccdILSD/1jUl9/q55dAufftAITmgBhqSq
   7pOsjYi0DZSX9mIZG7QzVZ4Rn0AsUTlPw4asxVv+GJXAsSKzcFHIU4qmX
   yw79N9AJzHW1gShvU+s8plTpU9KGd5U+j8gABBt3haUoNOaEirn/W39og
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="295057334"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="295057334"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 06:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="648442854"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Sep 2022 06:46:26 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWeKv-0001Ff-1w;
        Fri, 09 Sep 2022 13:46:25 +0000
Date:   Fri, 09 Sep 2022 21:45:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 32505e87ea13e10bdc890ee811ddf1b98bd75269
Message-ID: <631b4376.WGfmEiQ5EtSt4wGG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 32505e87ea13e10bdc890ee811ddf1b98bd75269  hwmon: (aquacomputer_d5next) Add support for Aquacomputer High Flow Next

elapsed time: 1107m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a001
sh                               allmodconfig
x86_64                        randconfig-a004
i386                          randconfig-a003
m68k                             allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a002
i386                          randconfig-a005
i386                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
arm                                 defconfig
s390                 randconfig-r044-20220908
arc                  randconfig-r043-20220908
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220907
i386                             allyesconfig
i386                          randconfig-a014
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
s390                 randconfig-r044-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r041-20220908
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220908
hexagon              randconfig-r045-20220907
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
