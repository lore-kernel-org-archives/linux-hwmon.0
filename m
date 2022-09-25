Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1E7C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 04:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiIYEFb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 00:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIYEFa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 00:05:30 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800412A706
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664078728; x=1695614728;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9XWH7DFn8WplZ2/tIFcCH9YWj2nqfZv+Qy7YlzgWD48=;
  b=VACnWeQhGEolancRiBh1PGOmkAfQIdU8/GGR8ptoDXxiMQM2sLYSTP+C
   uUiRhrOr4UKX6sl0XpdaeAJxBcFKaF37U7zcpd2MLidGeSm3ELOi5fkvE
   nVfhvEgig1cXLR+v6VWyRdBBDaMRlM6Kinwb8EhXTHgim0OctK1WYG7h/
   sDTKbtyLndGjaPziP49wn5qQ3rehmPnbtDKenvvgIGQDvEQqX3z20jXrX
   fv6BUfwoW1zobinSRd6wv0GvUTUkfDitnXC07OLVwk+e93TUqLVj2PzdX
   YxwlzxAZxW1B8wYHHWteXNIGPfocWANvvbYInFzG34tMaXXJdyl99mhyI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="283943383"
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="283943383"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 21:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="795933244"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Sep 2022 21:05:26 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocItR-0007M4-14;
        Sun, 25 Sep 2022 04:05:25 +0000
Date:   Sun, 25 Sep 2022 12:04:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 4e877027e1b6ee9d3750bc4b1c55fe0f85cbe105
Message-ID: <632fd369.7o3UqDJIfy6HBdZP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 4e877027e1b6ee9d3750bc4b1c55fe0f85cbe105  hwmon: (via686a) Reorder symbols to get rid of a few forward declarations

elapsed time: 725m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20220925
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a013
s390                 randconfig-r044-20220925
riscv                randconfig-r042-20220925
sh                               allmodconfig
x86_64                        randconfig-a011
x86_64                           allyesconfig
arm                                 defconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                             allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a006
arm                              allyesconfig
i386                          randconfig-a014
s390                                defconfig
s390                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a001
i386                          randconfig-a016
i386                          randconfig-a003
i386                          randconfig-a005
s390                             allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220925
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
