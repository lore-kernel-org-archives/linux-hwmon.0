Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E5EC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 14:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243411AbiEJOrF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 10:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243656AbiEJOq4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 10:46:56 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C0E2E5D01
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652191510; x=1683727510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcVs/uBu2af9pBOkkFAoOlvK3sTpmPzr3C6HDzdSv+4=;
  b=ZwGT7Ovk/rtlK1amb/uxvtkUGSp6d2OjZgU+m5mfwnRjk9RpXc1ShOLP
   FIu6+ZErKTVLxmRnSOVt/BD1L1JwDr2ICb3OJTslcwL/n3/oZI1HIPBKA
   Ac+7S/4nXbvE2TTlfaou5xb2fxqPwCz+RcZa9Q+Rv99Fv6Ck4Zq9fAKg/
   CpQzALaHHLAT2PRP0zWJ+ooZ725FHwYpSkkfj4jBdWxcOnArgfEenEGZx
   v6yIPezsUsk81m5JSQeaFfz5pJyJXtBYNJgU8k95iNfA2esN0wtD+xsQU
   oqZGwO4Ugxu6wDvgk0ZpHKhH3C/UAQdCVxX6y4PAI5HhEi5iOmWtJmtz0
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266970355"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="266970355"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 07:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="711030914"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 May 2022 07:04:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1noQTv-000Hyu-Ie;
        Tue, 10 May 2022 14:04:55 +0000
Date:   Tue, 10 May 2022 22:04:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 58/60] ERROR: modpost: "nct6775_probe"
 [drivers/hwmon/nct6775-i2c.ko] undefined!
Message-ID: <202205102145.7H8vF3pb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   ef36d83f3d676eb67ecc39c901aa3e72c59128e2
commit: 58f1d9ebfce62344f11f191cf1415b8f74a7e7d2 [58/60] hwmon: (nct6775) Add i2c driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220510/202205102145.7H8vF3pb-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=58f1d9ebfce62344f11f191cf1415b8f74a7e7d2
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 58f1d9ebfce62344f11f191cf1415b8f74a7e7d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nct6775_probe" [drivers/hwmon/nct6775-i2c.ko] undefined!
>> ERROR: modpost: "nct6775_reg_is_word_sized" [drivers/hwmon/nct6775-i2c.ko] undefined!
>> ERROR: modpost: "nct6775_show_alarm" [drivers/hwmon/nct6775.ko] undefined!
>> ERROR: modpost: "nct6775_reg_is_word_sized" [drivers/hwmon/nct6775.ko] undefined!
>> ERROR: modpost: "nct6775_store_beep" [drivers/hwmon/nct6775.ko] undefined!
>> ERROR: modpost: "nct6775_probe" [drivers/hwmon/nct6775.ko] undefined!
>> ERROR: modpost: "nct6775_show_beep" [drivers/hwmon/nct6775.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SENSORS_NCT6775
   Depends on HWMON && !PPC && (ACPI_WMI || ACPI_WMI
   Selected by
   - SENSORS_NCT6775_I2C && HWMON && I2C

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
