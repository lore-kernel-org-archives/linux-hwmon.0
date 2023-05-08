Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00F9C77B7F
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 May 2023 08:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbjEHIXs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 May 2023 04:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbjEHIXa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 May 2023 04:23:30 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D931707
        for <linux-hwmon@vger.kernel.org>; Mon,  8 May 2023 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683534209; x=1715070209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d8hef3ly/B44n04COlg3yUbiCm7locyauOjKHCixXJI=;
  b=TJkfruB991JkM1snG2uVq2wcaorPGA9cIQUQKkQxsQ1XavObABWmpP82
   nu8Zo5DMV0VOAcuxqKqEvvQEZAB9YIE3gMPXd4jqJoDUdORnhjxuzS1Te
   bfEIMWKvsFg0qLnItc3Jkm+wkmAjaBaSdy8w34JaBK3PwmAvzrJZvj9be
   9rvAb9FZeJCe+ldG6ghdloz3Bnv91tNVKW7gyQNKr/xsryB7REH+Dm0Cw
   xFLQqknnAKfi5gGF65l+lRm8o6KUgBDzy7roHPEz5KHxwaFLATmIJQTDZ
   xyfI78HwjJkrKYvDDI0CNFt7YsDRV4ZVtx1ThauBpzkdmA6dPFJsZCKOV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329949673"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="329949673"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 01:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="872714982"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="872714982"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 May 2023 01:23:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pvw9W-00018n-0s;
        Mon, 08 May 2023 08:23:26 +0000
Date:   Mon, 8 May 2023 16:23:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 3/10] drivers/hwmon/oxp-sensors.c:299:10:
 warning: cast to smaller integer type 'enum oxp_board' from 'void *'
Message-ID: <202305081625.IMCuQoxj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   92613681c0090612f0368dcebdcc232af9d74ae8
commit: bfae15559531b4aacd626152ffea929c27304dd8 [3/10] hwmon: (oxp-sensors) Use less convoluted enum cast
config: x86_64-randconfig-a006-20230508 (https://download.01.org/0day-ci/archive/20230508/202305081625.IMCuQoxj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=bfae15559531b4aacd626152ffea929c27304dd8
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout bfae15559531b4aacd626152ffea929c27304dd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081625.IMCuQoxj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/oxp-sensors.c:299:10: warning: cast to smaller integer type 'enum oxp_board' from 'void *' [-Wvoid-pointer-to-enum-cast]
           board = (enum oxp_board)dmi_entry->driver_data;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +299 drivers/hwmon/oxp-sensors.c

   280	
   281	/* Initialization logic */
   282	static int oxp_platform_probe(struct platform_device *pdev)
   283	{
   284		const struct dmi_system_id *dmi_entry;
   285		struct device *dev = &pdev->dev;
   286		struct device *hwdev;
   287	
   288		/*
   289		 * Have to check for AMD processor here because DMI strings are the
   290		 * same between Intel and AMD boards, the only way to tell them apart
   291		 * is the CPU.
   292		 * Intel boards seem to have different EC registers and values to
   293		 * read/write.
   294		 */
   295		dmi_entry = dmi_first_match(dmi_table);
   296		if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
   297			return -ENODEV;
   298	
 > 299		board = (enum oxp_board)dmi_entry->driver_data;
   300	
   301		hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
   302							     &oxp_ec_chip_info, NULL);
   303	
   304		return PTR_ERR_OR_ZERO(hwdev);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
