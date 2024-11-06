Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68B818F2F8;
	Wed,  6 Nov 2024 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730863148; cv=none; b=G8/D7xcHRWbXv2PGAMlQZrn4lhBsvy8J09fYfhiFCuKeueIasFu6kq1MGVEXBw8m98o5c3uV2CJAUs1qIV294eEPgj6JzOYT6kdO6Ree8C+Uz04pn5dri0iROwY9E4tOhFYJWQR+sJLuPLEu/estpaW0fnh63n57P971ktMUeW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730863148; c=relaxed/simple;
	bh=o8aQslghnk2+z70tsW+2DklDn7CG8sbivh6qhEJ0ZDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFrcbLrLNbsypCGb6Ge1vMtYfUGR0m6KQa3SXuBqGBDHkIIYGrsijNKqm4mnwY60KVR44dnM5hi1xmvILlmwEuQmhOg0A2uLZxCSwsQig49YPjHn8atjEyKJl+8sRT9rsdRUlgpziH5gAbVe8RxvekBWWeOqfNj1YMVqQNIPDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKFrk0Tw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKFrk0Tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730863147; x=1762399147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8aQslghnk2+z70tsW+2DklDn7CG8sbivh6qhEJ0ZDw=;
  b=iKFrk0TwIVGBVt3HxtOjHyojIfP2bcgm8pVao+89GIoa9749AAHbBYyr
   r9GZlKr0mxJ2UoGIL6ZNqZVHYdAOYX94ZagfZxu4rCdZNrgAq+oIrqSHg
   I7uQf2Lz83hVASmgbAOoFRd4M8OFJGAuLAdhg08HceLxXih5PlzvwAosL
   aR7pCg1epAdU17Z+aCKAlvqWgc6IvxenUpNQBpzYlrphp81+bIu7omhMr
   dZ0MbQFimXCI4Xp3jpFqdw4mWy+WkL5E8g1H2Ibpy036NkZlGgfz710Mz
   Yn0Ggi8wv0FWGt+iDElTyKYN29MEKnYcjFMYMS1JciJYOYTxImKhRZbGZ
   w==;
X-CSE-ConnectionGUID: UUH8h7HqQCOfxb2DEP62Rg==
X-CSE-MsgGUID: DyEiXHKZS3yfG/0lLBK75g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30759607"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30759607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 19:19:06 -0800
X-CSE-ConnectionGUID: C3b9hammQ5K62oSusumzvA==
X-CSE-MsgGUID: xp94QqJRThKSfiZb/sjasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84692741"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2024 19:19:04 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8WZR-000msn-04;
	Wed, 06 Nov 2024 03:19:01 +0000
Date: Wed, 6 Nov 2024 11:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop
 handling
Message-ID: <202411061031.GHHHxm19-lkp@intel.com>
References: <20241105135259.101126-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105135259.101126-2-marex@denx.de>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/hwmon-pwm-fan-Introduce-start-from-dead-stop-handling/20241105-215454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241105135259.101126-2-marex%40denx.de
patch subject: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop handling
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241106/202411061031.GHHHxm19-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061031.GHHHxm19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061031.GHHHxm19-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/hwmon/pwm-fan.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
