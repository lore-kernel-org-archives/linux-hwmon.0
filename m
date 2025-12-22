Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9499A295DB8;
	Mon, 22 Dec 2025 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401642; cv=none; b=gJJk269ouL00I//iuwJ7y9xKbgu0g/D8m/kkBxCMHSsP/dJEefbYcZVHlUQEXLHCPHdJHXF6/Y2hklfK+VkXrFv3yi8vouct2Cx1fowU7HIlmMTXVgx0NJUbk/WiTyjsJpksED05agz8YEYc6lUDBd9nKHnq6h2iB1w+mHlV2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401642; c=relaxed/simple;
	bh=tcW5l6VrXXlOTEIFgckRUbeTyCmj9GRWXn6I47nzyKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7Gh9Q2L3usUy8tJChdREXa7zNg50q7C1lCDIErFkNiUBJsHQjU4WIRiIq3hGZ31KZqQ6Syr7u8UfHRunFi/niHncuNM303lW0N2u0dc+TZ2ikaTjIalfnhRMUWYDxhP3hduuaPjPwEmZ21JMeBdtClx8FcOK+8oOSICFk3CfbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrFodArR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrFodArR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766401640; x=1797937640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tcW5l6VrXXlOTEIFgckRUbeTyCmj9GRWXn6I47nzyKo=;
  b=hrFodArRPaADVaaym4WPSSgeXZQSIgnEFCFTwkOW4b9z+wf0c7t5fnYg
   ILDQnXJQhot/q8Vz6G2TcvpsTv3XE0q88QomOalaPP9c56RjqV7bVTd23
   FqqD7uu53zzLurVrXVTmU16CTOvKMdD31NKk5u/HzZhZh8mVbECRyZvsI
   6jzX84wCfaSgf9tOcFxUePU+J/Bwkh24RRwcsC5lD2k9AJOfGMbk7qVmj
   fVhYOj3Cl5Hc7nDJPU1GCGqPIXxnPca0f0wEcpLrjR5x+XhrbRA6tZQg/
   2Xi74GnCfrbZ7BVuJpH8zyKgO5Rj2fY8d6HIx7OeaYIFeSYWGvCr79aDt
   Q==;
X-CSE-ConnectionGUID: N0k2N43BT3WiwAgGrf7dCA==
X-CSE-MsgGUID: ZCVyJi+iTBC6PEKXS518iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72104238"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="72104238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 03:07:19 -0800
X-CSE-ConnectionGUID: zkF2HHeZRzmMTDJvSs5Aaw==
X-CSE-MsgGUID: 420zfMw8RuKvuXZHShpT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199254850"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 22 Dec 2025 03:07:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXdkx-000000005RI-0RrC;
	Mon, 22 Dec 2025 11:07:15 +0000
Date: Mon, 22 Dec 2025 12:06:51 +0100
From: kernel test robot <lkp@intel.com>
To: Charles Hsu <hsu.yungteng@gmail.com>, Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: pmbus: add support for STEF48H28
Message-ID: <202512221250.KCb0UUiG-lkp@intel.com>
References: <20251216083712.260140-2-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216083712.260140-2-hsu.yungteng@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Hsu/hwmon-pmbus-add-support-for-STEF48H28/20251216-164903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20251216083712.260140-2-hsu.yungteng%40gmail.com
patch subject: [PATCH 2/2] hwmon: pmbus: add support for STEF48H28
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221250.KCb0UUiG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221250.KCb0UUiG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid_bpf.h
   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid.h
   WARNING: No kernel-doc for file ./include/linux/hid.h
>> Documentation/hwmon/stef48h28.rst:4: WARNING: Title underline too short.


vim +4 Documentation/hwmon/stef48h28.rst

     2	
     3	Kernel driver stef48h28
   > 4	======================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
