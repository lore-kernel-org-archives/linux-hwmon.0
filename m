Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9CDAD5A;
	Sat, 28 Mar 2026 04:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774670705; cv=none; b=AiIk2sWz4kZPmSNArikPC21JcOWIQk/WgBMk2DPmrisbLIunXyyXw8IaLwLAECyga3d1mK+UhEM0Whj7dvevAV9o2xrKaYAO+NTerdvCfkivV8WfvGFoaB6dgscxroM23G8AFJLXXt5aguu7DbQGLSHzPAmSUuKQGYtWkPFGYkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774670705; c=relaxed/simple;
	bh=ZFBQycGpxzzdqHpVTnabqKdmcJsp0fSvyKkhtWNASnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ771dYzJWIfCdnOvZNg4OS7Cm8HmbcpVhu2AX8mz9kcElpny20RfGNEz42REAIhf8axW+UZ2SklgZbruaCPgAUelNzCtGx6rzy1qI4l3tNWAhqDeFT1Uhyd1AET0+ZNVtaBRYnl5skFpBAmIk35hXzDPnhSL9gyddnNJkuWWZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IN3PmDzA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IN3PmDzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774670702; x=1806206702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFBQycGpxzzdqHpVTnabqKdmcJsp0fSvyKkhtWNASnk=;
  b=IN3PmDzAIqbcxSUUM0xmIfv+N4mZ/bQUnWAfZmovyid97jmsjNyN1fbz
   4+T2oHafYK1YvNAhLN6ENdOCNpuD0kFznZQ+3WU1H3ejFFQA1LCDZblc8
   teh3LThLNJiJS5tvbr0eT+GqLfmJf9XRBoaxP3lL90cng0m5DTuT79GFs
   GUcz7thyRDGIY4P/98yWZ694dZdYgSTlsn8w5yQPQXSBtYrTidnrFiqp+
   sVPbJUepLgLelVAmtHdzYV1cBu6395IOQYGDVVsOd8rQBKjdr2FRdaqJq
   Y1mEZhi6vIXRtrkTje1rsBYgBI2mL9UYH0PxGr5yAm6T7Sd+biuWI8YuA
   w==;
X-CSE-ConnectionGUID: UoNkR4AHR2CdmBZcaigHnw==
X-CSE-MsgGUID: gf6q+bEURVOAPIdP0XaWXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75808276"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75808276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:05:01 -0700
X-CSE-ConnectionGUID: IUkaOSMcThS9qgS78Smt3A==
X-CSE-MsgGUID: rW9Jbf3nSQuz4KspCphBlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="222620305"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2026 21:04:59 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Kuv-000000007cH-3ZnN;
	Sat, 28 Mar 2026 04:04:57 +0000
Date: Sat, 28 Mar 2026 05:04:27 +0100
From: kernel test robot <lkp@intel.com>
To: Sergio Melas <sergiomelas@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: Re: [PATCH v9] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
Message-ID: <202603280442.Hy9eh7Xz-lkp@intel.com>
References: <20260327010004.188449-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327010004.188449-1-sergiomelas@gmail.com>

Hi Sergio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas/hwmon-yogafan-Add-support-for-Lenovo-Yoga-Legion-fan-monitoring/20260327-201758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260327010004.188449-1-sergiomelas%40gmail.com
patch subject: [PATCH v9] hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280442.Hy9eh7Xz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280442.Hy9eh7Xz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/yogafan.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
   Documentation/hwmon/yogafan.rst:35: ERROR: Unexpected indentation. [docutils]
   Documentation/hwmon/yogafan.rst:41: ERROR: Unexpected indentation. [docutils]
   Documentation/hwmon/yogafan.rst:81: WARNING: Title underline too short.


vim +2 Documentation/hwmon/yogafan.rst

   > 2	===============================================================================================
     3	Kernel driver yogafan
     4	===============================================================================================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
