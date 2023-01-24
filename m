Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB669C54EED
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 21:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjAXVk0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234384AbjAXVkZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 16:40:25 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555B87ECB
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 13:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674596424; x=1706132424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+4gXBn+CiWiSXzKmf75cTJsSW9p7I7gPrFpc4ztksQ=;
  b=G0bUcZ7qZ+dGKdfSeYtOFndeAp0ThG63TevNQZ5ZSP+/UdOovdesN660
   fehlRoWJX+5COV+rUt+CVMQGKmdLui5Wjem8H4S5z/GbLARTTvAPn46vS
   v1PpXkNffNVEJud4QSBqh0s5BM8vJ3Ssz3bIbpnue7Oq+k7qv43Yhccx5
   SR5p6eVGPsC7/UUYVtCYCRkisD9n6L3RGq6LKwc7jyLLgebw89s9J/DbK
   6gz+dEE6gJf07smm+ijdaawsWsnxOBnvgWE8lzFczN2gNNhGgwfNnn+k0
   uVF0vHAuGxh9pDPqPK8MRsnhUYVrg5lh3cYk3MldbeTATdTtksd5HJc6v
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412645877"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="412645877"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 13:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="664254618"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="664254618"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2023 13:40:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKR1i-0006nk-08;
        Tue, 24 Jan 2023 21:40:22 +0000
Date:   Wed, 25 Jan 2023 05:40:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 41/41] FATAL: modpost:
 drivers/hwmon/mc34vr500: struct of_device_id is not terminated with a NULL
 entry!
Message-ID: <202301250559.SIEQsOH2-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   513d7b190ab3715103357afd8e2ddf4b5e986ff3
commit: 513d7b190ab3715103357afd8e2ddf4b5e986ff3 [41/41] hwmon: add initial NXP MC34VR500 PMIC monitoring support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230125/202301250559.SIEQsOH2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=513d7b190ab3715103357afd8e2ddf4b5e986ff3
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 513d7b190ab3715103357afd8e2ddf4b5e986ff3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/hwmon/mc34vr500: struct of_device_id is 196 bytes.  The last of 1 is:
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x6e 0x78 0x70 0x2c 0x6d 0x63 0x33 0x34 0x76 0x72 0x35 0x30 0x30 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>> FATAL: modpost: drivers/hwmon/mc34vr500: struct of_device_id is not terminated with a NULL entry!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
