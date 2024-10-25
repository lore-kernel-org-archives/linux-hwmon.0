Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73AD1F80DC;
	Fri, 25 Oct 2024 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867035; cv=none; b=i/5aVBFC0yzrgi+NgfjGXhFpEPAB5m9lyBr3Zd+rIX9d5h6IzuDkOLC6yup5zAqJaCiyezJJyKIvX33Fd0x0Sz6gjPxL7gO3BpW/e2NYPOg4mUr/S8mnKYSbVNZ8k7F1x8eL/ww/WiLN5h/DdxjRZfU0JWCQGuavPyk6B5JkMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867035; c=relaxed/simple;
	bh=gqMDayfIrvLFEM57Oe6CkRsGcgBEOG8dhHuuq7scUkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgvKSiMiDu0YUxi44i8IqmQugZXvfvDrBLvC2g7le6j/vpg2k8prLfIyiUiL4epUbVcEBaDhvlUzlKVEXWwcXvNB5IhqEy7apm7/6UoZ9q1RwOId+kMxcoGaQgRaJhGOkng9MKOjWcn+VwoMKoON1kScExDMNamILFClQ1X/ZLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZCJnZog; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZCJnZog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729867032; x=1761403032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gqMDayfIrvLFEM57Oe6CkRsGcgBEOG8dhHuuq7scUkI=;
  b=QZCJnZogLRuEB0UAdwoKytvmM9ZQ7HmMcZnRGgKAVhJI4hh/v0t+uiG7
   DIIc7WQjjxHR2kFwVhXBGetMhpITXNpFqIHBbTPBhMWGExICc56n66Drj
   szGLR2+MrXHgz4xnNw9QiFBiehQF2kLKG4iYySwDXCYXWlQXBoydukNmi
   k1BqNcZj0h+OhWZ/QclCLWI9bdtSVwiwVs5k2Yf8Y/WLUPaaIVZLAdYl6
   KhzRRX+qED8T2q431OF0al4Yxm+bQwePfBmYVfcPoG6LvjCwyehScvkwR
   Bd8v99PW+EgLF2Tv6xMF49dW6UQbB6ormU1bd97SNq9Nn1+xMp4KW6ds/
   Q==;
X-CSE-ConnectionGUID: UjaVoD0JSZKqpri3NJDY9A==
X-CSE-MsgGUID: x5+6/vtJRGaamT5wC0zTww==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="47021740"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="47021740"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:37:11 -0700
X-CSE-ConnectionGUID: JUaV6GZmQBm9b9HdS7LYfQ==
X-CSE-MsgGUID: EzQEA9EjTVmyV7Vu3PBkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85699441"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 07:37:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4LR4-000YMv-0N;
	Fri, 25 Oct 2024 14:37:06 +0000
Date: Fri, 25 Oct 2024 22:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Grant Peltier <grantpeltier93@gmail.com>, robh@kernel.org,
	linux@roeck-us.net, geert+renesas@glider.be, magnus.damm@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, grant.peltier.jg@renesas.com,
	brandon.howell.jg@renesas.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <202410252204.ut3IIrVm-lkp@intel.com>
References: <7138f3c551ce201ddc9b5e3889ce969d1cd0ac57.1729812789.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7138f3c551ce201ddc9b5e3889ce969d1cd0ac57.1729812789.git.grantpeltier93@gmail.com>

Hi Grant,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Grant-Peltier/hwmon-pmbus-isl68137-add-support-for-voltage-divider-on-Vout/20241025-084244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/7138f3c551ce201ddc9b5e3889ce969d1cd0ac57.1729812789.git.grantpeltier93%40gmail.com
patch subject: [PATCH v4 1/2] hwmon: (pmbus/isl68137) add support for voltage divider on Vout
config: x86_64-randconfig-161-20241025 (https://download.01.org/0day-ci/archive/20241025/202410252204.ut3IIrVm-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252204.ut3IIrVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252204.ut3IIrVm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/isl68137.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/pmbus/isl68137.c:233:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     233 |                 u64 temp = DIV_U64_ROUND_CLOSEST((u64)word *
         |                 ^
   2 warnings generated.


vim +233 drivers/hwmon/pmbus/isl68137.c

   211	
   212	static int raa_dmpvr2_write_word_data(struct i2c_client *client, int page,
   213					      int reg, u16 word)
   214	{
   215		const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
   216		const struct isl68137_data *data = to_isl68137_data(info);
   217		int ret;
   218	
   219		switch (reg) {
   220		case PMBUS_VOUT_MAX:
   221		case PMBUS_VOUT_MARGIN_HIGH:
   222		case PMBUS_VOUT_MARGIN_LOW:
   223		case PMBUS_VOUT_OV_FAULT_LIMIT:
   224		case PMBUS_VOUT_UV_FAULT_LIMIT:
   225		case PMBUS_VOUT_COMMAND:
   226			/*
   227			 * In cases where a voltage divider is attached to the target
   228			 * rail between Vout and the Vsense pin, Vout related PMBus
   229			 * commands should be scaled based on the expected voltage
   230			 * at the Vsense pin.
   231			 * I.e. Vsense = Vout * Rout / Rtotal
   232			 */
 > 233			u64 temp = DIV_U64_ROUND_CLOSEST((u64)word *
   234					data->channel[page].vout_voltage_divider[0],
   235					data->channel[page].vout_voltage_divider[1]);
   236			ret = clamp_val(temp, 0, 0xffff);
   237			break;
   238		default:
   239			ret = -ENODATA;
   240			break;
   241		}
   242		return ret;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
