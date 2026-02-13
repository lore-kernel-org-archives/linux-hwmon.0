Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB6330B27;
	Fri, 13 Feb 2026 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973827; cv=none; b=jTbcdGuoWNUIyxlKNeRu4jEGGU7guR5uRez39OkUgaM0vA5Z9X564wIPxFB7Jwd06cCjf+0EyhJJiH/ll4Xfhb7NeH6ohUSMu9KJAm8c/14SZCwNieUsGon2J9hP9F1iDe12ry/gabOiJwJrSCAhM3ni/T9ihmO5XP++4mbYZTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973827; c=relaxed/simple;
	bh=WLpab8z9L1FvsgPhhCAmW2PjbccD56OWmkO0q/7nCGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnoDnGWCLfIvQNySD0N6FVDaBYySFYFo9MbvKXU1xo2I5uY1CxZzVUEInHjybm6GXOlam2LOM/y1m7A91nlKOi6u01PW4wZfdwyFSuge3nnPtbCnVIc5dpT/cBmhrMIABfO+lEjqT5KRMRj47g06xQ4rDW2rn5Qo3O7K8SnfihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXfuSbD1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXfuSbD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770973826; x=1802509826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WLpab8z9L1FvsgPhhCAmW2PjbccD56OWmkO0q/7nCGI=;
  b=TXfuSbD1QLR+hpgbHX/VaXA/BZ59T9MGAorGpnPUCF9OVh5dJKfvfF60
   PxZAzg74gUw+xXpCcNQ+x4WgflAQnaZImJLGH5+Tc7jtMR2DdSknkNkma
   907bIZwHKOsTNrG1Fyp3LRJQ72rvzDb3PqNSfa/jOV6bTmNfcjATTH+kd
   MS+rcZHSrvXWGmussGayHSmjSTl9TYhFZQHhwNqqGRPOTVx08jRUuGSs/
   GyNGaLtuImgObdQhfyxbEPy69po0Xf0Q66+ZywxOlfwj4hVbxgW+YegZ1
   k++uTIEifFFKy/JMBqXX+gLMn3NUDOgeN85oBBgn9ochKFbE3RaRWps5N
   A==;
X-CSE-ConnectionGUID: 0NgGteq2QDuZ4gagFfWtOw==
X-CSE-MsgGUID: hxFOHue0Rs22QL4TgjIC1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97614663"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="97614663"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:10:26 -0800
X-CSE-ConnectionGUID: O0rARFFOQ0CiE6O9xfc6iQ==
X-CSE-MsgGUID: K4gaZ9zgQ/WYA+DpW14OMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212117102"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2026 01:10:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqpBs-00000000vFs-1rlU;
	Fri, 13 Feb 2026 09:10:20 +0000
Date: Fri, 13 Feb 2026 17:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>, jbrunet@baylibre.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non
 standatd direct conversion
Message-ID: <202602131712.Lruy3UMc-lkp@intel.com>
References: <20260213001408.2454567-2-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213001408.2454567-2-sbogdanov@baylibre.com>

Hi Stoyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stoyan-Bogdanov/hwmon-pmbus-tps25990-Rework-TPS25990-non-standatd-direct-conversion/20260213-081713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260213001408.2454567-2-sbogdanov%40baylibre.com
patch subject: [PATCH v2 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct conversion
config: i386-randconfig-011-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131712.Lruy3UMc-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131712.Lruy3UMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131712.Lruy3UMc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hwmon/pmbus/tps25990.o: in function `tps25990_value_to_raw':
>> drivers/hwmon/pmbus/tps25990.c:86:(.text+0x1e3): undefined reference to `__udivdi3'
   ld: drivers/hwmon/pmbus/tps25990.o: in function `tps25990_raw_to_value':
   drivers/hwmon/pmbus/tps25990.c:68:(.text+0x4d8): undefined reference to `__udivdi3'


vim +86 drivers/hwmon/pmbus/tps25990.c

    74	
    75	static unsigned int tps25990_value_to_raw(struct i2c_client *client, int param, int val)
    76	{
    77		struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
    78		struct local_direct_value *info_local = data->info_local;
    79	
    80		/* Formula : Y = ( m * X + b) * 10^R */
    81		val = (long)val * info_local->m[param] + info_local->b[param];
    82	
    83		if (info_local->R[param] >= 0)
    84			val *= int_pow(10, info_local->R[param]);
    85		else
  > 86			val = DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R[param]));
    87	
    88		return val;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
