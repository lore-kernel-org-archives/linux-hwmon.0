Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25D1290F
	for <linux-hwmon@vger.kernel.org>; Thu, 14 Nov 2024 00:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731544021; cv=none; b=RkYq8wKHWbkINKQp0jQCuPTNTnzf+WOg0XCNp8ukxCPw1WflsG2xvNfeYHeVcZGbumwfmpHCRiVWCKLqvSIFhfXoKNsAlkOf/MrU9hSVgQunqjPF3BM4BKk/8iYwwyZWJr/Vw4besu6msqOcM2SJwhf1M1fR+DOVKsH+l0tzxWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731544021; c=relaxed/simple;
	bh=I9s4Agbqvy1CHt0OpmoLnQhDQeknrdfVGktSs5X66HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6PZG4GpQWctvpDVsD/4a10zUxeFhL8ChNpET2jyqNtZvg3+SPeBcS2XAraiJj540kpqkSikD26vryMe1iu/9axcFXauvHhQwwFHaSftnkFv7mkXqASu6s7moGCiqjsBLXEVceB5srSPQASWhCDvyvA59xS7KMzs93V30IBw/oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+xfJhq0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+xfJhq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731544019; x=1763080019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9s4Agbqvy1CHt0OpmoLnQhDQeknrdfVGktSs5X66HQ=;
  b=e+xfJhq0fS9km3OCOrF3gTDiBrPfORhQpd26Xuag0baj0LG9tjwKiJkc
   bKUhEShmK9Jo6jShoxLwRBlOhZStRFaYEiehyKqiAMam25lKa4MKmRMua
   +HJlsdIRvb20cCmMm6j2M+831QvpG63RgXWYxoBRkYbDVmBHaas9phy0b
   103j2Q3BAG0ykDhhCjQY899voxanFnr9xaQM1DsY3X1bX+UIIWxU/W8d7
   6IaE3yrWnNHAdgrJ9oxAm0fpnlV01ck9DYHT5Iimb7SpR3y37s0pFnTzs
   MZIms8E3T6j8jUR5TwtE6jaVyHKAh13DNZhf1RnuRbFTS9LHoz2f96P7Q
   w==;
X-CSE-ConnectionGUID: 8Kbh788iS5iTNYeIKQqxeg==
X-CSE-MsgGUID: lACfpKgNRFCLvu3o5s7xtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42024308"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42024308"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:26:59 -0800
X-CSE-ConnectionGUID: WrSJlhRdTvy4UHIjfl4YHA==
X-CSE-MsgGUID: ITWvMZYgRkunkLUBgZcTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88450142"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2024 16:26:57 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBNhH-0000xd-01;
	Thu, 14 Nov 2024 00:26:55 +0000
Date: Thu, 14 Nov 2024 08:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 47/51] drivers/hwmon/tmp108.c:452:
 undefined reference to `i3cdev_to_dev'
Message-ID: <202411140803.kNbykFMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   3996187f80a0e24bff1959609065d49041cf648d
commit: c40655e3310649866c4ebf7a10f0d53802ebdfa9 [47/51] hwmon: (tmp108) Add support for I3C device
config: x86_64-randconfig-015-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140803.kNbykFMj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140803.kNbykFMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140803.kNbykFMj-lkp@intel.com/

Note: the groeck-staging/hwmon-next HEAD 3996187f80a0e24bff1959609065d49041cf648d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: drivers/hwmon/tmp108.o: in function `p3t1085_i3c_probe':
>> drivers/hwmon/tmp108.c:452: undefined reference to `i3cdev_to_dev'
   ld: drivers/hwmon/tmp108.o: in function `i3c_i2c_driver_unregister':
>> include/linux/i3c/device.h:277: undefined reference to `i3c_driver_unregister'
   ld: drivers/hwmon/tmp108.o: in function `i3c_i2c_driver_register':
>> include/linux/i3c/device.h:257: undefined reference to `i3c_driver_register_with_owner'


vim +452 drivers/hwmon/tmp108.c

   449	
   450	static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
   451	{
 > 452		struct device *dev = i3cdev_to_dev(i3cdev);
   453		struct regmap *regmap;
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
