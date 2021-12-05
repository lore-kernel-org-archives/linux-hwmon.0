Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4860CC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Dec 2021 01:23:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhLEB0h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Dec 2021 20:26:37 -0500
Received: from mga01.intel.com ([192.55.52.88]:62187 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230403AbhLEB0g (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 4 Dec 2021 20:26:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="261177100"
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="261177100"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 17:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="460439053"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Dec 2021 17:23:07 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mtgF8-000Jea-Ml; Sun, 05 Dec 2021 01:23:06 +0000
Date:   Sun, 5 Dec 2021 09:22:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alistair Francis <alistair@alistair23.me>, kernel@pengutronix.de,
        robh+dt@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        alistair23@gmail.com, linux-hwmon@vger.kernel.org,
        andreas@kemnade.info, s.hauer@pengutronix.de
Subject: Re: [PATCH v16 8/8] ARM: dts: imx7d: remarkable2: Enable lcdif
Message-ID: <202112050943.k8t5MaMs-lkp@intel.com>
References: <20211202120758.41478-9-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202120758.41478-9-alistair@alistair23.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Alistair,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on lee-mfd/for-mfd-next robh/for-next v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alistair-Francis/Add-support-for-the-silergy-sy7636a/20211202-201116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: arm-randconfig-c002-20211202 (https://download.01.org/0day-ci/archive/20211205/202112050943.k8t5MaMs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/690ae9a20c4cbd1aab1695c0ca6c8d7dbe1d51a6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alistair-Francis/Add-support-for-the-silergy-sy7636a/20211202-201116
        git checkout 690ae9a20c4cbd1aab1695c0ca6c8d7dbe1d51a6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/imx7d-remarkable2.dts:258.3-260.5 Properties must precede subnodes
>> FATAL ERROR: Unable to parse input tree

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
