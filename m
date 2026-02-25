Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D73D9055;
	Wed, 25 Feb 2026 16:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036302; cv=none; b=qaZS4LaknQ6rwdOVXucHaYZ/PPzq3npZX+FIA041nhgFZ3i4R+9S2IjHFuYhBRvuZhvxPbmBGW/EfA6bbkQfaSz0uBPFLbODxeChSwf846Wp6tT4PRUwc+RL7R7aab0bxWBz5pjKW2nX+sM1rvYVJWNZGIHMYJ6fM+iDW43sgiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036302; c=relaxed/simple;
	bh=NnhkcmePz80fFvcVowBQbXkES2j19XqdlnX903LMSC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roYDx02AiHgpSUN1wmIxbhACqR+6fWtg/9KAcNz8xX3EKfPLA/E39eUS3mrQES4ayhlDILlQEoyBzsSJ/2billYp9XzMkBFOhHz+4s5bKvwO5w9yr0Cyx+bGex1oSCOzzdUASxrsmCQlbLYWmKUHs9wYZYKFzJ2Q4kw0b/QDdVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKBDOzV1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKBDOzV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036296; x=1803572296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NnhkcmePz80fFvcVowBQbXkES2j19XqdlnX903LMSC0=;
  b=jKBDOzV143rrsPq7mkOwn0p5EbGgAvm/cXS/IYfIKBtomXVbPsBkfQkR
   B+MpGdLchgxHpiyVo9/o1GKkNni8dVXFgGGnXMbqTR73RqH5jsnhqlCwy
   bwgmE/VbzuSohj1gnD+SCeI8dRNXShSGg6kRMNr9F08q8U77HBTH+2+WO
   s4YNegimJw8kMJYmgwnOYtZgU54N4JkfmVPDJdu2IDr3S8BKfKvF/JeTb
   T6nbYh4XEAz/rdRXxhGY/jol7Q7u7VY3alApb1T0fI3QJGff3JWJOOH2g
   P0tefj3AUkvA65zNsmsjRJzxLmQrlRg+yyXPnMW6JdcEDwSewiF8YX4db
   Q==;
X-CSE-ConnectionGUID: sbKoqaKHQkiSf+NpGDe5Og==
X-CSE-MsgGUID: plMjIiEEQUa5qCdBi7NyPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76915989"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="76915989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:18:15 -0800
X-CSE-ConnectionGUID: uqDIq8GsTdi3pqE2Yy22kg==
X-CSE-MsgGUID: rzfMMkmzTa6XLdFar8/ftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="220414710"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2026 08:18:13 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvHaP-000000006OH-3M6w;
	Wed, 25 Feb 2026 16:18:10 +0000
Date: Thu, 26 Feb 2026 00:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: Wenliang Yan <wenliang202407@163.com>, linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] hwmon: (ina3221) Modify the 'ina3221_read_value'
 function
Message-ID: <202602260043.Og6ibhl8-lkp@intel.com>
References: <20260225090324.112145-7-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225090324.112145-7-wenliang202407@163.com>

Hi Wenliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v7.0-rc1 next-20260224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenliang-Yan/dt-bindings-hwmon-ti-ina3221-Add-SQ52210/20260225-171447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260225090324.112145-7-wenliang202407%40163.com
patch subject: [PATCH v6 6/8] hwmon: (ina3221) Modify the 'ina3221_read_value' function
config: csky-randconfig-r051-20260225 (https://download.01.org/0day-ci/archive/20260226/202602260043.Og6ibhl8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260043.Og6ibhl8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwmon/ina3221.c:354:2-3: Unneeded semicolon

vim +354 drivers/hwmon/ina3221.c

   289	
   290	static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
   291				      int *val)
   292	{
   293		unsigned int regval;
   294		int ret;
   295	
   296		ret = regmap_read(ina->regmap, reg, &regval);
   297		if (ret)
   298			return ret;
   299	
   300		/*
   301		 * Shunt Voltage Sum register has 14-bit value with 1-bit shift
   302		 * Current registers have 15-bit value
   303		 * Power registers have 16-bit value
   304		 * ALERT_LIMIT registers have 16-bit value with 3-bit shift
   305		 * Other Shunt Voltage registers have 12 bits with 3-bit shift
   306		 */
   307		switch (reg) {
   308		case INA3221_SHUNT_SUM:
   309		case INA3221_CRIT_SUM:
   310			*val = sign_extend32(regval >> 1, 14);
   311			break;
   312		case SQ52210_CURRENT1:
   313		case SQ52210_CURRENT2:
   314		case SQ52210_CURRENT3:
   315			*val = sign_extend32(regval, 15);
   316			break;
   317		case SQ52210_POWER1:
   318		case SQ52210_POWER2:
   319		case SQ52210_POWER3:
   320			*val = regval;
   321			break;
   322		case INA3221_BUS1:
   323		case INA3221_BUS2:
   324		case INA3221_BUS3:
   325		case INA3221_SHUNT1:
   326		case INA3221_SHUNT2:
   327		case INA3221_SHUNT3:
   328		case INA3221_WARN1:
   329		case INA3221_WARN2:
   330		case INA3221_WARN3:
   331		case INA3221_CRIT1:
   332		case INA3221_CRIT2:
   333		case INA3221_CRIT3:
   334			*val = sign_extend32(regval >> 3, 12);
   335			break;
   336		case SQ52210_ALERT_LIMIT1:
   337		case SQ52210_ALERT_LIMIT2:
   338		case SQ52210_ALERT_LIMIT3:
   339			/*
   340			 * This register is a 16-bit register with the lower 3 bits fixed at 0.
   341			 * When used to store bus and shunt alert values, shifting is required.
   342			 * However, for POL (Power Over Limit), it functions as a 16-bit unsigned
   343			 * register where the lower 3 bits being fixed at 0 will result in some
   344			 * loss of precision.
   345			 */
   346			if (ina->alert_type_select & SQ52210_ALERT_ALL_POL_MASK)
   347				*val = regval;
   348			else
   349				*val = sign_extend32(regval >> 3, 12);
   350			break;
   351		default:
   352			*val = 0;
   353			return -EOPNOTSUPP;
 > 354		};
   355		return 0;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
