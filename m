Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424ADC04FE0
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 10:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233914AbjGZKdh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 06:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbjGZKdc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 06:33:32 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199892126
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2023 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690367611; x=1721903611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ma7Y8/vUnvW/H0KkZpS1QwM5cpFyjSj8/uPBI9YabWk=;
  b=LsjttFDTOamSuLMBOcQqGzjv+M8Fxo+QRJNrATq2mjWITsnBQDN0BMQn
   ZRjkiKnHCCq1uoL5TS27QXc//W1j7Tf7phF/eRoimSnNquNLo4MO4kZaa
   T8ahEWe0++diLKOaPE4eOBGifP3+Di94GAQwliuDI0um3xCDSlD8VVCZ3
   +HW+qudnTinBIgV6mofdBN1HCZVWsi+Y3FMhmQBogseNUcsbewnduNF9Q
   BKjLanBnH62Zny+b2lhXRipDZ12BwMesyHsmGdF08H9RCBSycFmMoLeHJ
   0ucjGrSFNDWprn8flvDoRPtSdYW80kGSFwAZmMjEWeBJP22klzyQkEldl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="348255762"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="348255762"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 03:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900367128"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="900367128"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 03:33:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qObpD-0000tT-2O;
        Wed, 26 Jul 2023 10:33:03 +0000
Date:   Wed, 26 Jul 2023 18:32:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andre Werner <andre.werner@systec-electronic.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 35/35] drivers/hwmon/hs3001.c:196:13:
 warning: unused variable 'ret'
Message-ID: <202307261819.VMDuxZOM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   33faa6fcc93f78e6b0e9b5aaf986446ac3c34047
commit: 33faa6fcc93f78e6b0e9b5aaf986446ac3c34047 [35/35] hwmon: Add driver for Renesas HS3001
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307261819.VMDuxZOM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261819.VMDuxZOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261819.VMDuxZOM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/hs3001.c: In function 'hs3001_probe':
>> drivers/hwmon/hs3001.c:196:13: warning: unused variable 'ret' [-Wunused-variable]
     196 |         int ret;
         |             ^~~


vim +/ret +196 drivers/hwmon/hs3001.c

   190	
   191	static int hs3001_probe(struct i2c_client *client)
   192	{
   193		struct hs3001_data *data;
   194		struct device *hwmon_dev;
   195		struct device *dev = &client->dev;
 > 196		int ret;
   197	
   198		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
   199			return -EOPNOTSUPP;
   200	
   201		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   202		if (!data)
   203			return -ENOMEM;
   204	
   205		data->client = client;
   206	
   207		/*
   208		 * Measurement time = wake-up time + measurement time temperature
   209		 * + measurement time humidity. This is currently static, because
   210		 * enabling programming mode is not supported, yet.
   211		 */
   212		data->wait_time = (HS3001_WAKEUP_TIME + HS3001_14BIT_RESOLUTION +
   213				   HS3001_14BIT_RESOLUTION);
   214	
   215		mutex_init(&data->i2c_lock);
   216	
   217		hwmon_dev = devm_hwmon_device_register_with_info(dev,
   218								 client->name,
   219								 data,
   220								 &hs3001_chip_info,
   221								 NULL);
   222	
   223		if (IS_ERR(hwmon_dev))
   224			return dev_err_probe(dev, PTR_ERR(hwmon_dev),
   225					     "Unable to register hwmon device.\n");
   226	
   227		return 0;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
