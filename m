Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1512D979F
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Oct 2025 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943559; cv=none; b=RX3efnCsll5z8vuj0+Szks48sC9iFn/z5P3NTzYGeisPFeXoN+AG7oENdeVpWX6nP2irG9pWvsaDxEWqtIBxMZOe5Nlo0u0Te94m9cQzlW1WQ6BRCx60XO+rbaA53GNWU2HpdnbbJj4JgeoqaB+V+nzTfhfYjVSbghKEdB21NqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943559; c=relaxed/simple;
	bh=9RewauUbDN6v7rmNLCuZum9ZMiGMk4Fpj+f7f4/XtYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WgVWqpUl+5E2PAyIrp7q46pvV778HV9mDmwGI7fHIMPIwfzY0auMGjaHLlD4vqIuc+AnCAiv29HJjNLhaMJ+vJCMzbspRo8AQs/dA7xT6zWqHsn7YsC3PkMtyxpjnKXOX4BTsTK0U8SzJtIJkBOnG1/Dr+yM53ursvs8v+klo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0k977ZF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0k977ZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760943557; x=1792479557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9RewauUbDN6v7rmNLCuZum9ZMiGMk4Fpj+f7f4/XtYQ=;
  b=W0k977ZFGeXoXAqK4a1taobnx5oSYmKjPvZ5FCFAalQS4GFAgXK/tXkE
   t1485Vve7Xzxud7sbp3wPXlZcSSjHO24ol10L5IDjVvgPNvZFRU614Rpd
   OuqyRsnf7ty5zi896dkbFU8Jq6FlUdeD7xd5svagtBbT0frajd+WbY1hh
   MSs0qJaVmemCvxb0cEIV1WUuql5o0nwkU5qaNBMvK1MwcK1fsoKpr8kj/
   J09dbxayVK/KwLVlbh5DkttFpjTRZpyxRit0QOnP6yiyM0emKs8MY6tsw
   XHUZ9E00cLPQM5mfWCOWkpqf122hU3ATFiU3nic9KthAQPAbVcccgt1HM
   A==;
X-CSE-ConnectionGUID: ZDmt00xySFSvF9StDvHkHg==
X-CSE-MsgGUID: lAPGgYDlS5utoUQbt9U/Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="88524056"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="88524056"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 23:59:17 -0700
X-CSE-ConnectionGUID: NasJsiFdSzud/AeeV7ZDnw==
X-CSE-MsgGUID: xeMlOZLrQQ2WLOgooNM0TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="187674618"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2025 23:59:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAjrN-0009Zh-2l;
	Mon, 20 Oct 2025 06:59:13 +0000
Date: Mon, 20 Oct 2025 14:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 90/132] drivers/hwmon/powerz.c:221:13:
 error: 'struct powerz_priv' has no member named 'hwmon_dev'
Message-ID: <202510201412.huiIFstK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   aaf90608ff3d4f230feea2805d35f8fa93830240
commit: 1a0484738488b8c7a998c09a842a18a260dc3f40 [90/132] hwmon: (powerz) Rely on subsystem locking
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251020/202510201412.huiIFstK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201412.huiIFstK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201412.huiIFstK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/powerz.c: In function 'powerz_probe':
>> drivers/hwmon/powerz.c:221:13: error: 'struct powerz_priv' has no member named 'hwmon_dev'
     221 |         priv->hwmon_dev =
         |             ^~
   drivers/hwmon/powerz.c:224:24: error: 'struct powerz_priv' has no member named 'hwmon_dev'
     224 |         if (IS_ERR(priv->hwmon_dev)) {
         |                        ^~
   drivers/hwmon/powerz.c:226:36: error: 'struct powerz_priv' has no member named 'hwmon_dev'
     226 |                 return PTR_ERR(priv->hwmon_dev);
         |                                    ^~


vim +221 drivers/hwmon/powerz.c

   203	
   204	static int powerz_probe(struct usb_interface *intf,
   205				const struct usb_device_id *id)
   206	{
   207		struct powerz_priv *priv;
   208		struct device *parent;
   209	
   210		parent = &intf->dev;
   211	
   212		priv = devm_kzalloc(parent, sizeof(*priv), GFP_KERNEL);
   213		if (!priv)
   214			return -ENOMEM;
   215	
   216		priv->urb = usb_alloc_urb(0, GFP_KERNEL);
   217		if (!priv->urb)
   218			return -ENOMEM;
   219		init_completion(&priv->completion);
   220	
 > 221		priv->hwmon_dev =
   222		    devm_hwmon_device_register_with_info(parent, DRIVER_NAME, priv,
   223							 &powerz_chip_info, NULL);
   224		if (IS_ERR(priv->hwmon_dev)) {
   225			usb_free_urb(priv->urb);
   226			return PTR_ERR(priv->hwmon_dev);
   227		}
   228	
   229		usb_set_intfdata(intf, priv);
   230	
   231		return 0;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
