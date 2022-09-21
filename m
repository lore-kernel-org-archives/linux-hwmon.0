Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C15C32771
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 05:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiIUFzM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 01:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiIUFzI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 01:55:08 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27AF275D1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 22:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663739707; x=1695275707;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aEczjsxmv6b5htTFKpkNP9+RZ9EXS+kYO71tgapMriY=;
  b=lyi3YZUqDXC7Cn9bpryQqnSQCvtR3HXAoRqtJI47BzALv6KasrRnVFmD
   UqH3eNGjGNheXkuDGIWbQ78CuLLqjDvOqqRoIxmKqBjW1jSp72CVkerUE
   gmh3MQMt5m9bICVIvf+9+C5Z4VWc4GoIKOrytmSDn9+zvS1wDegSNje6t
   5nAaYjX3QrHt286ZASbgXVTQivbXJuDPQO1k8XI06wdmPjUG+B7r6uPYV
   ddhbt2wIRKCc5CN0XG4J/jkK6r30oWaVSBvobLY9X0hyiQBbw3y96s9IS
   reul/f9cc5xj4kl8PhWmoFJj853aF5AXrTbrk/RlXy0uv9lUjOP2Y7ahr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="286978249"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="286978249"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 22:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="687731929"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2022 22:55:06 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oashN-0003IN-1l;
        Wed, 21 Sep 2022 05:55:05 +0000
Date:   Wed, 21 Sep 2022 13:54:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 7f62cf781e6567d59c8935dc8c6068ce2bb904b7
Message-ID: <632aa720.Uvml7YZ/NIFEaDjG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 7f62cf781e6567d59c8935dc8c6068ce2bb904b7  hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                           x86_64_defconfig
um                             i386_defconfig
alpha                               defconfig
i386                                defconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
s390                 randconfig-r044-20220921
s390                                defconfig
s390                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
i386                          randconfig-a003
i386                             allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
