Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BE617BC4
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Feb 2024 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706995541; cv=none; b=RKX0zIvN+E1OQYq/dm83EvRPV1GNjww9S1ALl83402tmXF4jBU5/tiv1iemJ7R91cqo2UhxUZWNy+75nNunt6gjiTl7+C1BomK4hW/7PX1rSgliMtgRJObgj4hBVeRwgOQr5cxD5yfFBJUG8LzNlITyWqEGtsllUyNABcFNHO2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706995541; c=relaxed/simple;
	bh=anEXvHi/liQI/P/VZNOnTUNZ5Rc2871TTLyj8CFp6hY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrNfLH81DMskgHbQW9DKq5F2fFLOkDLeLvMvCRYE80Sztewy44Kgr/3IKnQaC+MO4ZSaUGFnAAUpLsV6OIylbP/RY56Pc6nkyTXGSl3wwqR8SXdxx0e2XvaYS3yRbjVJqaIWrjDq8qlo1d/epCIrQFBW90InErhdEUk1sEOrB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AalGWHEL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AalGWHEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706995539; x=1738531539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anEXvHi/liQI/P/VZNOnTUNZ5Rc2871TTLyj8CFp6hY=;
  b=AalGWHELZYxUdVGBWwiDLVmF9XwzJZ24IxzQyKWtTbVR3i2oFoSt+5nn
   ntc0EfEFGR3xG+y5LEm7FEmTs6WGPzjKj5RfryNsGwskRn+qH5c32vNii
   aXsXh6u1aPNDkcJBippIJyF6J7ahycXrtP+kyB7B77nwO8TAWiyE8xQrs
   fDmZRawyuhVj742W/nN5RD4KXIpo9MowK2lz+R6xWJ74B4uLXEDY+ZSx7
   xsyguEqotPG24ofaBcTW9QCsdf2Wf/pT3fh/WRe6hqoELo79s8VjvYFYx
   IXEFiK6rYP6lHLUFRWSVv4kyxeDJN9Ts7K67fg77Jdn9GYxjB12qC6PuN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="22817478"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="22817478"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 13:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="31164985"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2024 13:25:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWNW2-0005cw-1V;
	Sat, 03 Feb 2024 21:25:34 +0000
Date: Sun, 4 Feb 2024 05:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Savic <savicaleksa83@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 34/34]
 drivers/hwmon/asus_rog_ryujin.c:574: undefined reference to `hid_hw_close'
Message-ID: <202402040512.f0f23Wq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   57319c16d5cc3d49067c181c5f5ba49613163144
commit: 57319c16d5cc3d49067c181c5f5ba49613163144 [34/34] hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler
config: i386-randconfig-141-20240204 (https://download.01.org/0day-ci/archive/20240204/202402040512.f0f23Wq1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040512.f0f23Wq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040512.f0f23Wq1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hwmon/asus_rog_ryujin.o: in function `rog_ryujin_remove':
>> drivers/hwmon/asus_rog_ryujin.c:574: undefined reference to `hid_hw_close'
>> ld: drivers/hwmon/asus_rog_ryujin.c:575: undefined reference to `hid_hw_stop'
   ld: drivers/hwmon/asus_rog_ryujin.o: in function `rog_ryujin_write_expanded':
>> drivers/hwmon/asus_rog_ryujin.c:161: undefined reference to `hid_hw_output_report'
   ld: drivers/hwmon/asus_rog_ryujin.o: in function `hid_parse':
>> include/linux/hid.h:1118: undefined reference to `hid_open_report'
   ld: drivers/hwmon/asus_rog_ryujin.o: in function `rog_ryujin_probe':
>> drivers/hwmon/asus_rog_ryujin.c:523: undefined reference to `hid_hw_start'
>> ld: drivers/hwmon/asus_rog_ryujin.c:529: undefined reference to `hid_hw_open'
   ld: drivers/hwmon/asus_rog_ryujin.c:564: undefined reference to `hid_hw_stop'
>> ld: drivers/hwmon/asus_rog_ryujin.c:562: undefined reference to `hid_hw_close'
   ld: drivers/hwmon/asus_rog_ryujin.o: in function `rog_ryujin_exit':
>> drivers/hwmon/asus_rog_ryujin.c:600: undefined reference to `hid_unregister_driver'
   ld: drivers/hwmon/asus_rog_ryujin.o: in function `rog_ryujin_init':
>> drivers/hwmon/asus_rog_ryujin.c:595: undefined reference to `__hid_register_driver'


vim +574 drivers/hwmon/asus_rog_ryujin.c

   496	
   497	static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id *id)
   498	{
   499		struct rog_ryujin_data *priv;
   500		int ret;
   501	
   502		priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
   503		if (!priv)
   504			return -ENOMEM;
   505	
   506		priv->hdev = hdev;
   507		hid_set_drvdata(hdev, priv);
   508	
   509		/*
   510		 * Initialize priv->updated to STATUS_VALIDITY seconds in the past, making
   511		 * the initial empty data invalid for rog_ryujin_read() without the need for
   512		 * a special case there.
   513		 */
   514		priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
   515	
   516		ret = hid_parse(hdev);
   517		if (ret) {
   518			hid_err(hdev, "hid parse failed with %d\n", ret);
   519			return ret;
   520		}
   521	
   522		/* Enable hidraw so existing user-space tools can continue to work */
 > 523		ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
   524		if (ret) {
   525			hid_err(hdev, "hid hw start failed with %d\n", ret);
   526			return ret;
   527		}
   528	
 > 529		ret = hid_hw_open(hdev);
   530		if (ret) {
   531			hid_err(hdev, "hid hw open failed with %d\n", ret);
   532			goto fail_and_stop;
   533		}
   534	
   535		priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
   536		if (!priv->buffer) {
   537			ret = -ENOMEM;
   538			goto fail_and_close;
   539		}
   540	
   541		mutex_init(&priv->status_report_request_mutex);
   542		mutex_init(&priv->buffer_lock);
   543		spin_lock_init(&priv->status_report_request_lock);
   544		init_completion(&priv->cooler_status_received);
   545		init_completion(&priv->controller_status_received);
   546		init_completion(&priv->cooler_duty_received);
   547		init_completion(&priv->controller_duty_received);
   548		init_completion(&priv->cooler_duty_set);
   549		init_completion(&priv->controller_duty_set);
   550	
   551		priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "rog_ryujin",
   552								  priv, &rog_ryujin_chip_info, NULL);
   553		if (IS_ERR(priv->hwmon_dev)) {
   554			ret = PTR_ERR(priv->hwmon_dev);
   555			hid_err(hdev, "hwmon registration failed with %d\n", ret);
   556			goto fail_and_close;
   557		}
   558	
   559		return 0;
   560	
   561	fail_and_close:
 > 562		hid_hw_close(hdev);
   563	fail_and_stop:
   564		hid_hw_stop(hdev);
   565		return ret;
   566	}
   567	
   568	static void rog_ryujin_remove(struct hid_device *hdev)
   569	{
   570		struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
   571	
   572		hwmon_device_unregister(priv->hwmon_dev);
   573	
 > 574		hid_hw_close(hdev);
 > 575		hid_hw_stop(hdev);
   576	}
   577	
   578	static const struct hid_device_id rog_ryujin_table[] = {
   579		{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_AIO) },
   580		{ }
   581	};
   582	
   583	MODULE_DEVICE_TABLE(hid, rog_ryujin_table);
   584	
   585	static struct hid_driver rog_ryujin_driver = {
   586		.name = "rog_ryujin",
   587		.id_table = rog_ryujin_table,
   588		.probe = rog_ryujin_probe,
   589		.remove = rog_ryujin_remove,
   590		.raw_event = rog_ryujin_raw_event,
   591	};
   592	
   593	static int __init rog_ryujin_init(void)
   594	{
 > 595		return hid_register_driver(&rog_ryujin_driver);
   596	}
   597	
   598	static void __exit rog_ryujin_exit(void)
   599	{
 > 600		hid_unregister_driver(&rog_ryujin_driver);
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
