Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD423368299;
	Fri,  5 Jun 2026 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670393; cv=none; b=h9uBj7otwSdKHfotJh70vJhKDLFz1mUd7yKS137DLDmnVZlr9ehp7/lz72UdgWtIH7mzqlehib3BpV/PAkrX8unC6b3VZLpv4KyBwL6xNsacbvMdqqzk6bzrrEuPkE02JWkhBTx/AR9LQRi3HwOwvyDiyZFjbgjOluh3s4Ak3RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670393; c=relaxed/simple;
	bh=tGGVYQWaG2DkpvWm3JrwEukHfVKBSZrMyMDbAqGqXa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLdnLQHNRBxnFI7Xgx94GbpdHLnMFNDe1cOqdaIf1n8FFm+zInjRDzCxvVpc5YOeGKb093GtTobz7wgCtZNBKQbiMnqnmFxyRuUg5HiL18Nk63nqBcskarKnLK5Y1hxdgSGe83nZMfl/l2Ri4I1p65EO6SsWoDv9MX60tqaUYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYdLEsKM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYdLEsKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780670392; x=1812206392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGGVYQWaG2DkpvWm3JrwEukHfVKBSZrMyMDbAqGqXa0=;
  b=MYdLEsKMAqbTa4aKqEHxpM/oR79ik/0dM1Z/3IX8uDUhR1xIdTTyXvM9
   ktHX4THYksJCerxzIg8iITVZC7fdxrhFV0OF+JXJrtJoI0AQ+PHQKO0S4
   jf9r3XbLLj9r6+OKWRa+jUp3QWaN1b1jVFpbMTfFTFTxqlbJ2TZWWTSeM
   +zOZixWA0NOTJx/+DSPZQ2/1ONzCFH5VMXaAK2j1+EV1CH2ncynBxePfW
   JtKvajmQfI1RQv4ybk7sTxqOBFxr8MP12ERy3nZif7ua0/8vPqqPHkeKp
   9tI47IfqfELK9r5/uCD/iPMSqHvLroi5tKw3mTayoXSZgLKmZNOPfUeK1
   Q==;
X-CSE-ConnectionGUID: Xp+yHLk4S++88eR1ua9Jdw==
X-CSE-MsgGUID: And7iO9ASHa5DIYRr/+VJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81564161"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81564161"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:39:51 -0700
X-CSE-ConnectionGUID: 91cfdvQtTb6Sjw2BUk+p+A==
X-CSE-MsgGUID: Ko5gEoa1TfK7dQiOOQDf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238505062"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2026 07:39:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVi4-00000000G82-1jKW;
	Fri, 05 Jun 2026 14:39:44 +0000
Date: Fri, 5 Jun 2026 22:39:35 +0800
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
Message-ID: <202606052232.LAlOTWJr-lkp@intel.com>
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
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge soc/for-next linus/master v7.1-rc6 next-20260603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Young/mailbox-pcc-c-add-query-channel-function/20260605-044323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20260604203749.168752-1-admiyo%40os.amperecomputing.com
patch subject: [PATCH v01] mailbox/pcc.c:  add query channel function
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260605/202606052232.LAlOTWJr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052232.LAlOTWJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052232.LAlOTWJr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
