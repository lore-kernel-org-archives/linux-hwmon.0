Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CFBC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 14:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245142AbiEJOJq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 10:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245485AbiEJOJ1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 10:09:27 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D941EC66
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 06:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652190246; x=1683726246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1pt/pHlny94R0DZPx+JEPB809R+SBASuNCqgFpK1h0g=;
  b=R5IfgeXDDv+8Hb2ZV1yygI4hmEUOKnA2z5Fg2Zr5uMz4H55EM2QUn6Ht
   1BnKI2WMwki9vMiSjwhnnY10ZON5PWDAYAlGZ689Mj/AbHBOcVLvgOfu5
   Jm7UztUApafBveWh+lJ1ZgxgIv/mGAok3PsU+ag+88918ZXTCfwvNB57K
   LMU4pPUYwM96IlPHqFx91Tf6k4hf4EZHqkGzvUqVFSKQFPEA6rxEFoIOL
   ogVtSTSw/Kl0cUOXrcHNNmg2Zots1cHmh8wYPSBF0pMc1uogtaeth5TyW
   bMLBb40hltha8NiVRGYlLgJsGHu6S6C02F3altfMPaYFqze/ncaRL4GTP
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269511957"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="269511957"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 06:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="657654008"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 May 2022 06:43:50 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1noQ9V-000HxQ-GZ;
        Tue, 10 May 2022 13:43:49 +0000
Date:   Tue, 10 May 2022 21:43:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 58/60]
 nct6775-platform.c:(.text.nct6775_wmi_reg_write+0x3c): undefined reference
 to `nct6775_reg_is_word_sized'
Message-ID: <202205102101.WVR7Q8TJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   ef36d83f3d676eb67ecc39c901aa3e72c59128e2
commit: 58f1d9ebfce62344f11f191cf1415b8f74a7e7d2 [58/60] hwmon: (nct6775) Add i2c driver
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220510/202205102101.WVR7Q8TJ-lkp@intel.com/config)
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

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/hwmon/nct6775-platform.o: in function `nct6775_wmi_reg_write':
>> nct6775-platform.c:(.text.nct6775_wmi_reg_write+0x3c): undefined reference to `nct6775_reg_is_word_sized'
   powerpc-linux-ld: drivers/hwmon/nct6775-platform.o: in function `nct6775_wmi_reg_read':
>> nct6775-platform.c:(.text.nct6775_wmi_reg_read+0x3c): undefined reference to `nct6775_reg_is_word_sized'
   powerpc-linux-ld: drivers/hwmon/nct6775-platform.o: in function `nct6775_resume':
>> nct6775-platform.c:(.text.nct6775_resume+0x460): undefined reference to `nct6775_reg_is_word_sized'
   powerpc-linux-ld: drivers/hwmon/nct6775-platform.o: in function `nct6775_platform_probe':
>> nct6775-platform.c:(.text.nct6775_platform_probe+0x124): undefined reference to `nct6775_probe'
   powerpc-linux-ld: drivers/hwmon/nct6775-platform.o: in function `nct6775_reg_read':
>> nct6775-platform.c:(.text.nct6775_reg_read+0x5c): undefined reference to `nct6775_reg_is_word_sized'
   powerpc-linux-ld: drivers/hwmon/nct6775-platform.o: in function `nct6775_reg_write':
>> nct6775-platform.c:(.text.nct6775_reg_write+0x5c): undefined reference to `nct6775_reg_is_word_sized'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_beep_enable+0x14): undefined reference to `nct6775_show_beep'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_beep_enable+0x18): undefined reference to `nct6775_store_beep'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_intrusion0_alarm+0x14): undefined reference to `nct6775_show_alarm'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_intrusion0_beep+0x14): undefined reference to `nct6775_show_beep'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_intrusion0_beep+0x18): undefined reference to `nct6775_store_beep'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_intrusion1_alarm+0x14): undefined reference to `nct6775_show_alarm'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_intrusion1_beep+0x14): undefined reference to `nct6775_show_beep'
>> powerpc-linux-ld: drivers/hwmon/nct6775-platform.o:(.data.sensor_dev_attr_intrusion1_beep+0x18): undefined reference to `nct6775_store_beep'
   powerpc-linux-ld: drivers/hwmon/nct6775-i2c.o: in function `nct6775_i2c_read':
>> nct6775-i2c.c:(.text.nct6775_i2c_read+0xd8): undefined reference to `nct6775_reg_is_word_sized'
   powerpc-linux-ld: drivers/hwmon/nct6775-i2c.o: in function `nct6775_i2c_probe':
>> nct6775-i2c.c:(.text.nct6775_i2c_probe+0x10c): undefined reference to `nct6775_probe'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SENSORS_NCT6775
   Depends on HWMON && !PPC && (ACPI_WMI || ACPI_WMI
   Selected by
   - SENSORS_NCT6775_I2C && HWMON && I2C

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
