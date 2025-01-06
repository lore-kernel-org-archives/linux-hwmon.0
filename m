Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A44C1D6193;
	Mon,  6 Jan 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156757; cv=none; b=VQii8JOvSeHREfsI0YnVwzhQMfgX98Muvq0jLa8AeWDOw4v1LgA0exli2iKjkujUawTxlOzjj1qdWhIG6rP/8K331Qj18TdaH59yyou4x3xAg/e8gUk6uJW/1/8kN1xHV7MTOFz1fYN6RUzojBbBPXNbBLhe6DR56KpP+8aSzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156757; c=relaxed/simple;
	bh=ZQU+ovsD55f64DF1zOadfrUNcIGee3cjAidEI96IOp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKCZlsOTl0fiLjZqec7mOSOtGbPf2GOeI+qWVlIDVOIBncapbaRg9igak192T/amNGYauk1n91d9FsOo2fHOxGc5mLAo01KGhiz7i4Y0+czbS8jHss28ly/dujeW+IgryAy2xT+8gbXavJucGOuVGqtAhC9t2GkCTYVGihPmWgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEX/BOsG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEX/BOsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736156754; x=1767692754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZQU+ovsD55f64DF1zOadfrUNcIGee3cjAidEI96IOp0=;
  b=KEX/BOsGgVg0iKJ5HPqVq15YJDhWRAJnsa0c9U4vMs+ZGtxws/aO1qrp
   H1XzXNNZzisG7gqKdyNS16Bkg4i4UUxQUBZJlv3DSGENtssKqW/MHpcfD
   +FYOZmdKpjYVQx61tKatWUT/iKLE25QEaQAGrgKjxaXdjo8rL6+XGRcLL
   YOC0CoEJVEZwpdAZEb+rJYsuyf3xur+ZsMsKNujdUj3aFqNFeh+zdFqSW
   JKCmdp2KL7O3johaPpOwlESYuuX0YIHSqRD36af/xOfCKYYQNUYC0cRrL
   DAD+OGG/WizlmRetq6h3qmazyOuUbFspkR4PN+6JdrwqcV33SffSFspJ2
   g==;
X-CSE-ConnectionGUID: v/dKm1aTSxGpWbSd11yLag==
X-CSE-MsgGUID: sAvJkz/uTim49mCuL3qcQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35537144"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="35537144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 01:45:53 -0800
X-CSE-ConnectionGUID: 0fzl6LKNQaOw5xaSmu4jfA==
X-CSE-MsgGUID: eEhcNsKlTfudbQR8gqUD3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102292716"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 01:45:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUjgB-000CT1-2H;
	Mon, 06 Jan 2025 09:45:47 +0000
Date: Mon, 6 Jan 2025 17:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
Message-ID: <202501061734.nPNdRKqO-lkp@intel.com>
References: <20250106071337.3017926-3-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106071337.3017926-3-Leo-Yang@quantatw.com>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc6 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yang/dt-bindings-Add-INA233-device/20250106-151934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250106071337.3017926-3-Leo-Yang%40quantatw.com
patch subject: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
reproduce: (https://download.01.org/0day-ci/archive/20250106/202501061734.nPNdRKqO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061734.nPNdRKqO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/ina233.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
