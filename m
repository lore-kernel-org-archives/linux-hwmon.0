Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1FFC54E94
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Jan 2023 05:12:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjAYFMs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 00:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbjAYFMr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 00:12:47 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EDE30C1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 21:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674623564; x=1706159564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h3fCDTZqrRvOZD5/jPnSQEcXtDFTqnQ+A1NFDmmF3ZU=;
  b=DORuBhv2AKtd6/cZpldpI7Imp051GQEmq6JaPcklEo0NXg7aGK55YlDL
   LihXQKiGNKD/wxn/DhOQcgn7B23CkBVt5UgRSOdgbe8oBPBQvcPDAuSvb
   7d3c/ahD+dCruwQVWB8ssXl59HhMMsJ35lI3PdYl3bG0RR9wboUX9HnNl
   GtYjGMFB2BZuluv/QmYXW2X106CyCnzQSw8kjK8kby3UiVttNvj+/40gR
   SVDsLYaVZnn65t1quUIp8oYi81T/9RQvGF0pJrRvwn0hNK4Hz4ciuevQU
   k+7/Neu4akr7M+bx0RwKCG3QU/X1Ftw+Uiks3g0mDpo8iZoyCGLcdt0uy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412717980"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="412717980"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 21:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="730931208"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="730931208"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2023 21:12:43 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKY5S-00073A-0d;
        Wed, 25 Jan 2023 05:12:42 +0000
Date:   Wed, 25 Jan 2023 13:12:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 41/41] FATAL: modpost:
 drivers/hwmon/mc34vr500: struct i2c_device_id is not terminated with a NULL
 entry!
Message-ID: <202301251348.HFHcROTP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   ecabca1a36d59ec32fa315f3dc2e81784670b25b
commit: ecabca1a36d59ec32fa315f3dc2e81784670b25b [41/41] hwmon: add initial NXP MC34VR500 PMIC monitoring support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230125/202301251348.HFHcROTP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=ecabca1a36d59ec32fa315f3dc2e81784670b25b
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout ecabca1a36d59ec32fa315f3dc2e81784670b25b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/hwmon/mc34vr500: struct i2c_device_id is 24 bytes.  The last of 1 is:
0x6d 0x63 0x33 0x34 0x76 0x72 0x35 0x30 0x30 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>> FATAL: modpost: drivers/hwmon/mc34vr500: struct i2c_device_id is not terminated with a NULL entry!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
