Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71536FAE
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Feb 2024 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706927253; cv=none; b=WoTm5+pZER35OvaKKiv8OhsExeg1HPVdkuvztShje9JWmLJBFX4az5T7p6TUTUtZbvjoNhJ7Qdze+uW++S45VlL+qxZCPZLED2u0vig8W6rMKegtG0FZ895eTFcZuHljdnQdYlPaoLS4hFvSuJyAdXaZgdt4fWfk0FkA+Zzdbn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706927253; c=relaxed/simple;
	bh=J8M4G3bN9qOhjx9XcFMproNxKpM5Y9pGZkmOIe67hyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhZX/zQTeuG4XoN0EzgscJ0FDF0YTYRguMkm7CPFC7Thog7cAw6k+vlef8ekfIHL3cdB2HPByvz5jDAZJ+0X+7c71rRwAPPp3+9BERweqo6APZbuqlhfr+M6kpzmfxEUqyJpVt3w8lZnkfYkBDGY48Zhb92mxHX40opFjP4HRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NY/5gyxh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NY/5gyxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706927252; x=1738463252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8M4G3bN9qOhjx9XcFMproNxKpM5Y9pGZkmOIe67hyk=;
  b=NY/5gyxhrqtPgD2+tgPURFFCoCRQqCZg5dyq/+lwuEOQQdzooL/iYhmL
   P2DtO0OXWu7hnzgLPF6Sb+AVMeyPdlylDaUMmBQYvaWI8/MNUtJsCya04
   7X0jzpf4Mn0Ucp3RwFKgS4WglJW+MVhdKseofgbo1NRMRsY2/vmnQyuV4
   zNjy1y/Bvku50bd8yb7854oWu+DMApMgytJLBVDZl7DHRhTPGK1BSFUP9
   l7xyrt8Sk7HB+bOEeJ6l+0l5DsvTQhbc/DMKvrnIWl+jwBAqhmIgVRipf
   sAR8qOy6exK14UcJqpyPi8oKlfFJUGzL6Yvw7FG1oOs/O4jRFevfl94Y+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="453461"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="453461"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 18:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="23502376"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Feb 2024 18:27:30 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW5jA-0004Xe-1s;
	Sat, 03 Feb 2024 02:27:27 +0000
Date: Sat, 3 Feb 2024 10:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Hsu <ythsu0511@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 15/25]
 drivers/hwmon/pmbus/mpq8785.c:81:10: error: 'struct i2c_driver' has no
 member named 'probe_new'
Message-ID: <202402031017.zrY0cnpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   efba2dfc184bb0ec9fd22caa8d6b1a768973debe
commit: 3b3b35e1f9a0a5bf281161708811a5df8f67b392 [15/25] hwmon: Add driver for MPS MPQ8785 Synchronous Step-Down Converter
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402031017.zrY0cnpR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031017.zrY0cnpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031017.zrY0cnpR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mpq8785.c:81:10: error: 'struct i2c_driver' has no member named 'probe_new'
      81 |         .probe_new = mpq8785_probe,
         |          ^~~~~~~~~
>> drivers/hwmon/pmbus/mpq8785.c:81:22: error: initialization of 'const struct i2c_device_id *' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
      81 |         .probe_new = mpq8785_probe,
         |                      ^~~~~~~~~~~~~
   drivers/hwmon/pmbus/mpq8785.c:81:22: note: (near initialization for 'mpq8785_driver.id_table')
   drivers/hwmon/pmbus/mpq8785.c:82:21: warning: initialized field overwritten [-Woverride-init]
      82 |         .id_table = mpq8785_id,
         |                     ^~~~~~~~~~
   drivers/hwmon/pmbus/mpq8785.c:82:21: note: (near initialization for 'mpq8785_driver.id_table')
   cc1: some warnings being treated as errors


vim +81 drivers/hwmon/pmbus/mpq8785.c

    75	
    76	static struct i2c_driver mpq8785_driver = {
    77		.driver = {
    78			   .name = "mpq8785",
    79			   .of_match_table = of_match_ptr(mpq8785_of_match),
    80		},
  > 81		.probe_new = mpq8785_probe,
    82		.id_table = mpq8785_id,
    83	};
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
