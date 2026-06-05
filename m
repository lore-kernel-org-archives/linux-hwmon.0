Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD3413245;
	Fri,  5 Jun 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642455; cv=none; b=P8y0M+jWBcUyU71hPriy68NzywdYo02xxBPRO+7X3q6dU+Z6NKBAcF7e7KVTP/yEVU5dRVR2Vs3bVj/Z2QVXKsuOVqXfNgNil7KB5M2+vyrH5ZZID2WGRm5x0avFHy0EeJmcKHZEwXn+6hTq35MfuDqUII8Ikpzc0P6H+sXzpEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642455; c=relaxed/simple;
	bh=Bfhxyeh0I+nLYaM2G8L9iOBrMI/5fCXfZhtYUW4UmJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRLAOcsYGOKBZHE2+4zcXWzFBqOAFHOZYvPLv7sWZzICwYG4u1KXUl1OjEaTbzvq0HotSCPu6I+5EqbrIVM4i4Jc3KYsPV0oZHzZ4p0gCS8sIINEkwAslJ2O9P9UaErUEUm8r2mnmHNre+CkxsiuXi5Fi3fRgHAtze1d+anlDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGkmUauh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGkmUauh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780642455; x=1812178455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfhxyeh0I+nLYaM2G8L9iOBrMI/5fCXfZhtYUW4UmJY=;
  b=jGkmUauhpQllDyd4WzK+AsTEOcZoUXdOAKQFYjpE5kk5EAdE1HVpqfBy
   r9pDMlUNkr9ih9uYvzfrPQFYa7N3cdhMUMN/vm88zZDzrLZtg8hx2OowR
   fdTrs7klng3ecvsfzNauJZ7z6NFnlWVluixzblvjL5kyiWHrH4A+NlPV6
   apGR2+UyV6HVdBS/wURk9a0Y2rv4hHxUjlO8v/+Gxnbtu+ZV0opQeik5H
   909bOPPiUOkzb5qYfvdhLzEHcINFx8UO3Sl7yfoH3B/R8hOZrIHKIGIz7
   mVCx6PQBUTjsVKudRzhqIfJSea3bVoasJaKPRQfsOkXwle6YelHJ1YX42
   g==;
X-CSE-ConnectionGUID: Eniqpp1aQhCKaaz/J41XOA==
X-CSE-MsgGUID: vIH7jGkJQueSVo867jDpuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81474441"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81474441"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:54:14 -0700
X-CSE-ConnectionGUID: igsVH0E/Q920RoFFPu5r2g==
X-CSE-MsgGUID: Mv2TdVCjQlahbFrWexy6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238412207"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2026 23:54:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVORU-000000002Uv-18Ka;
	Fri, 05 Jun 2026 06:54:08 +0000
Date: Fri, 5 Jun 2026 08:54:01 +0200
From: kernel test robot <lkp@intel.com>
To: Adam Young <admiyo@os.amperecomputing.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v01] mailbox/pcc.c:  add query channel function
Message-ID: <202606050825.2uv1FZrY-lkp@intel.com>
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604203749.168752-1-admiyo@os.amperecomputing.com>

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jassibrar-mailbox/for-next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge soc/for-next linus/master v6.16-rc1 next-20260604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Young/mailbox-pcc-c-add-query-channel-function/20260605-044323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20260604203749.168752-1-admiyo%40os.amperecomputing.com
patch subject: [PATCH v01] mailbox/pcc.c:  add query channel function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260605/202606050825.2uv1FZrY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050825.2uv1FZrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050825.2uv1FZrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
