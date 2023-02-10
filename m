Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E322C636CD
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Feb 2023 06:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjBJGkg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Feb 2023 01:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjBJGkg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Feb 2023 01:40:36 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08937AE2E
        for <linux-hwmon@vger.kernel.org>; Thu,  9 Feb 2023 22:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676011231; x=1707547231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JCRCN0YmAp4GNZs9ZShEU1oumD/gO14A9HyJAKEiZVg=;
  b=DiC8Yx2T6lsw3AKEgnYlQvLAz0B312YVEscAyn0qGZxDfriBdSwzS3Nj
   iL69XfTKkG04iITvdRM64QH6tsqbbhvPEZhxKZMskW29zEPdEywYJ5qqO
   Bljnjms4qariS7bdN4Ze0N6txRUTvjtsg0mIowlSTr2JvlT7dZG0B5cuG
   1iCirII6ufPfNy8YI1OxzQwmpHP3Pacac0wfOJuLg6yunilI0yHh+Cauw
   wNetW5mYgLPsSsP2TYbGTElzQhlJGhQpq1zFNdh8+ya2ArVvOzYFwLR3b
   GRSuIfksjMbljfuVRtn79RHrwBcf8GpM75q8PHBtZAMvcEr27CCwXE5xc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="328980257"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="328980257"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 22:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="667947347"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="667947347"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2023 22:40:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pQN59-0005d6-0O;
        Fri, 10 Feb 2023 06:40:27 +0000
Date:   Fri, 10 Feb 2023 14:39:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 102be2c2420bd156a94ea509932c9eaef89b9424
Message-ID: <63e5e69f.CKnssOnNVJWTbwAx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 102be2c2420bd156a94ea509932c9eaef89b9424  hwmon: (gxp-fan-ctrl) use devm_platform_get_and_ioremap_resource()

elapsed time: 721m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arc                  randconfig-r043-20230209
arm                  randconfig-r046-20230209
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                        randconfig-a006
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230209
hexagon              randconfig-r045-20230209
s390                 randconfig-r044-20230209
riscv                randconfig-r042-20230209
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
