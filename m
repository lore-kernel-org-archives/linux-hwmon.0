Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9505AC43334
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Jul 2022 10:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiGUKme (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Jul 2022 06:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbiGUKmd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jul 2022 06:42:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36F082F86
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jul 2022 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658400152; x=1689936152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ap0oXK+QAAeq+QyIEk7sy5FMFVITXJCPnQO8JUQNhao=;
  b=VWwMJoqawFN8NJQ5D4+2u9mnQJcgm/lBZsOSQ5mI0k0sXv+lhcA+BlyK
   lzdAmPs4VnNLXtQkKUJHMNV4GqZ3sNdMSMpTWT3mZ7qC0Lff41fSSdsFv
   Qco06Wuae0R/vPmmB9pxRLL/v533TsS+yKr+Y7nxoaD3qqGUooPIyQgXN
   Blcswr325ZTIUZATEEBLYU/Fl7zKf5rX66LfCqAnMvN23OOKEeoRcWd8O
   6G8Z1QKFvp74a2hR7zl5qx9b7y6boqdVCmot056zF64EbUMfcKtl/5RVR
   qIYhAMRIBURTjQCSvb8SVjaXEvfCDizlQtNmQ5KwkuuYGA4ljPrpMfbnE
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="266787497"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="266787497"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 03:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="740631824"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2022 03:42:23 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oETdP-00001G-0q;
        Thu, 21 Jul 2022 10:42:23 +0000
Date:   Thu, 21 Jul 2022 18:41:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 77/79] drivers/hwmon/tps23861.c:159:19:
 sparse: sparse: cast to restricted __le16
Message-ID: <202207211843.3aLaNmh9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   5668b5e6cffd975632ee6c32802d7d877b98e9a4
commit: 7024d59f146ea99d95b7f238e9991f32f31496b0 [77/79] hwmon: (tps23861) fix byte order in current and voltage registers
config: alpha-randconfig-s053-20220720 (https://download.01.org/0day-ci/archive/20220721/202207211843.3aLaNmh9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=7024d59f146ea99d95b7f238e9991f32f31496b0
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 7024d59f146ea99d95b7f238e9991f32f31496b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/tps23861.c:159:19: sparse: sparse: cast to restricted __le16
   drivers/hwmon/tps23861.c:184:19: sparse: sparse: cast to restricted __le16

vim +159 drivers/hwmon/tps23861.c

   139	
   140	static int tps23861_read_voltage(struct tps23861_data *data, int channel,
   141					 long *val)
   142	{
   143		uint16_t regval;
   144		long raw_val;
   145		int err;
   146	
   147		if (channel < TPS23861_NUM_PORTS) {
   148			err = regmap_bulk_read(data->regmap,
   149					       PORT_1_VOLTAGE_LSB + channel * PORT_N_VOLTAGE_LSB_OFFSET,
   150					       &regval, 2);
   151		} else {
   152			err = regmap_bulk_read(data->regmap,
   153					       INPUT_VOLTAGE_LSB,
   154					       &regval, 2);
   155		}
   156		if (err < 0)
   157			return err;
   158	
 > 159		raw_val = le16_to_cpu(regval);
   160		*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * VOLTAGE_LSB) / 1000;
   161	
   162		return 0;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
