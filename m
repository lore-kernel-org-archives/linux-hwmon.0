Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D43BC6FA82
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Sep 2022 07:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiIJHc5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Sep 2022 03:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiIJHc4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Sep 2022 03:32:56 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3F139B84
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Sep 2022 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662795174; x=1694331174;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kjjtQGfN3EkSsTD9M6nWP721zECjR/ydqDHhQYChcHs=;
  b=Y5rEv+DVUimZ2Z5homekd1dIkiM9DzbO4iBrd47BtdSdEuFWxTnKM3sV
   XuGV67y3UaGanQaqQtTiU0jDa5nlKuqiSN5hfYcLC0jk2t1lqssPfTNgK
   tscSck4k2IAdXUMfmldwY9aSNzzUXISEf0TIo8sTZVQ+kRMVWBqTSoPvf
   RXM2yFaxlvtNiVP825VQWwToU246H7sP+WqoWbx+rb8YQ2nuC9sAxLd0g
   FeCKI72uyt5aAZwx7lCYqLjIfq+vCpQYx2zm7SF9CFqWf37mzWAydehNf
   HUYmMjzWJ0F2siqIMOBL1DtRlokmqPfmd6k+OkRkf1aXI4rkpjr+/k24X
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="296360237"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="296360237"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 00:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="648693211"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Sep 2022 00:32:45 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWuyq-0002Gk-1R;
        Sat, 10 Sep 2022 07:32:44 +0000
Date:   Sat, 10 Sep 2022 15:32:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 6fe8986343012da2313bb198b4eff6ae62828c69
Message-ID: <631c3d8e.F+NsWmwrzLHxXWXK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 6fe8986343012da2313bb198b4eff6ae62828c69  hwmon: (mr75203) skip reset-control deassert for SOCs that don't support it

elapsed time: 751m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                             allyesconfig
i386                          randconfig-a003
i386                          randconfig-a005
arc                  randconfig-r043-20220908
riscv                randconfig-r042-20220908
x86_64                        randconfig-a013
x86_64                        randconfig-a011
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220907
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
s390                 randconfig-r044-20220908
x86_64                           rhel-8.3-syz
i386                          randconfig-a014
mips                             allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a012
x86_64                        randconfig-a002
i386                          randconfig-a016
x86_64                        randconfig-a006
powerpc                          allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20220907
hexagon              randconfig-r041-20220908
x86_64                        randconfig-a012
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220908
x86_64                        randconfig-a014
hexagon              randconfig-r045-20220907
x86_64                        randconfig-a016
s390                 randconfig-r044-20220907
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
