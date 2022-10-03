Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FC4C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 10:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiJCKXS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 06:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiJCKXR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 06:23:17 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AA949B6D
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664792596; x=1696328596;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PRaTyAHEwFFPOfo6LM16l5qrzfNd8My1cm/HrlTEm/A=;
  b=a0YQ++Yn+D4k+Qu8T+ack7NqlHdzY7oSSi/tm6sZy6tTNnyiW500krwZ
   CCAalSk9gqJtiEoGMuMOzeCaw/wBj8rkK3Q11htB05nUe5lX/M4IK9Foe
   ajO/mkn/3+vVRLecACdvxGcUN2hxXTLzGBxDtuIabDgBzF19G6mddvoS/
   EMdegB/+IsAY0mhQ5O6MW4k9ctUmRnykyN7tyGPKBURK57BFtdJnunFwp
   Z5IJG3bjfLlk3j9HCR71P65B5RHVspCUPozy7UkwkSyBYaqgjAaTligR4
   /bQpD4vPcM69ztHb07vHcpeLpRpgq2OnAViakb6JCbuKmK/5Xsh+ACEW6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="366641607"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="366641607"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 03:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="654303490"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="654303490"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Oct 2022 03:23:15 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofIbS-0004X7-1q;
        Mon, 03 Oct 2022 10:23:14 +0000
Date:   Mon, 03 Oct 2022 18:22:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 0cf46a653bdae56683fece68dc50340f7520e6c4
Message-ID: <633ab7f5.J/coT5c1joyZZcFY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0cf46a653bdae56683fece68dc50340f7520e6c4  hwmon: (corsair-psu) add USB id of new revision of the HX1000i psu

elapsed time: 720m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a011-20221003
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64               randconfig-a012-20221003
x86_64               randconfig-a013-20221003
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64               randconfig-a015-20221003
arc                                 defconfig
x86_64                               rhel-8.3
x86_64               randconfig-a014-20221003
s390                             allmodconfig
x86_64               randconfig-a016-20221003
alpha                               defconfig
i386                 randconfig-a011-20221003
riscv                randconfig-r042-20221003
s390                                defconfig
i386                 randconfig-a012-20221003
arc                  randconfig-r043-20221003
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a016-20221003
s390                             allyesconfig
i386                 randconfig-a014-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
i386                                defconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig

clang tested configs:
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
hexagon              randconfig-r041-20221003
riscv                randconfig-r042-20221002
hexagon              randconfig-r041-20221002
s390                 randconfig-r044-20221002
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
i386                 randconfig-a004-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a006-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a006-20221003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
