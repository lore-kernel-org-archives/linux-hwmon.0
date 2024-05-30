Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031BD6BB58
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096104; cv=none; b=SNdqmEnaIz3Hhc+8fJtcIJwoZsk6yxbzIopDUUbgAnzszSn9JMXtMLJZm0kvjvlKcCbTbi7b8u42V5fjCRMTeKck4DT1MIhs9vy+sxKthQJ4P5eX5mXYLzaGF+0PT01s7t7bJ90zD5XAAIOc6K2rkqyASkBN8ozWQ5iNo2vo/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096104; c=relaxed/simple;
	bh=gO2vWCidhSV5KLjif76Z727jWMwSKjor9N8vpz3P4GY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBGxAOG0ISJm5O20YwlbDCV5qWP/UE0biJBlKzYQ8a4ONY/FEVe4AIieto+8JlbCJx3B9O73Nr3YsOZmGmU8TRweJtM/OF4I/SsIqRmxtTZwSNP8DQnuj7jQop19/sfoOGpuii2fLraNG7HVl9Q2AX0VQYIWb2S4FmiVFnTlo8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mO7Fcbop; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mO7Fcbop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717096103; x=1748632103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gO2vWCidhSV5KLjif76Z727jWMwSKjor9N8vpz3P4GY=;
  b=mO7Fcbopti21Vr0+E4PXWlxiCd5lvHwJOn+XjPDSYblPy0nvuh0wxf03
   pQvVB1UynEamr8cj3LosO/n0guNwc71Zo93C8CDYonzENDJiJxl82Ar/J
   Ub6lUbmDOZ9fnPTBZCn+M518EzP8oSByRCN+P7CQC1Q6/Jhlzo4UHIO1I
   awOzdDJGWHp2LL5qpnUTmKnyh6xVvyw+8CksKshGFN7plBIgL+u5/O8qf
   HuUqsi82bxpadQWhuyWcTFKf49+cBPXkU8akNS6HIel5rtbXrPcgJ8rq4
   eObXWIfTmggMHh2mXIUBilB+3KoyRCACE2sk+f3yA2O3XkpyOkhJLOCUg
   Q==;
X-CSE-ConnectionGUID: enn/GrKYSL2FIVjtyNWphg==
X-CSE-MsgGUID: ALktycrPSGaVWvj2v7s3hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="38999077"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="38999077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:08:22 -0700
X-CSE-ConnectionGUID: gxKI2LvNT5OXN4t3E97tUQ==
X-CSE-MsgGUID: /DebC4OcRJ6nY/mMyhj0iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="67105271"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2024 12:08:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCl8N-000Fsb-10;
	Thu, 30 May 2024 19:08:19 +0000
Date: Fri, 31 May 2024 03:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 15/26] drivers/hwmon/hwmon.c:400:14: error:
 implicit declaration of function 'i2c_check_functionality'
Message-ID: <202405310233.vhe3KdmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   9068c716a2fe05d33b869804c6c9a5b7a6561a8b
commit: 6e3608a4eb2b4aab2f4a22167ea141dc7efd2712 [15/26] hwmon: Add PEC attribute support to hardware monitoring core
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20240531/202405310233.vhe3KdmZ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310233.vhe3KdmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310233.vhe3KdmZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/hwmon.c: In function 'hwmon_pec_register':
>> drivers/hwmon/hwmon.c:400:14: error: implicit declaration of function 'i2c_check_functionality' [-Werror=implicit-function-declaration]
     400 |             !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/i2c_check_functionality +400 drivers/hwmon/hwmon.c

   393	
   394	static int hwmon_pec_register(struct device *hdev)
   395	{
   396		struct i2c_client *client = i2c_verify_client(hdev->parent);
   397		int err;
   398	
   399		if (!client ||
 > 400		    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
   401			return 0;
   402	
   403		err = device_create_file(&client->dev, &dev_attr_pec);
   404		if (err)
   405			return err;
   406	
   407		return devm_add_action_or_reset(hdev, hwmon_remove_pec, &client->dev);
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
