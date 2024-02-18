Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E137FA
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Feb 2024 00:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708217556; cv=none; b=kBEu+bkGeWlBOeYjgpm4RXKqaUprK20GItJVv7qj19lOWkIxDcaiirgqxnplYMpKkkleZeVICWF5iycBmULLpy/LYlulnmHWRQksuW07zdNFF1FDDnTLp8VTOziRlM744SBiafskacXH5TOnCPjX08605B7Ukv9IP70CkmQ7o6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708217556; c=relaxed/simple;
	bh=zdFcdCj+TwpczU/+BCK0hcNMAQR8yLua1Dc0NXU70dU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QolLfaDqiaPv8VezpY2mxjsq+t769Xqtwt58tXYaX+LSV6Y4vl8xMjrhR6IyrSxRbPMDV1V6I9v7AKvY/fGJxo++lwUowCxkExTsFlwL+4KTwK7StaENAzbFEO0EsnGe7Ws6sbXC14elD2KhPSZgYVsS1z0gQYELVNhRbvkc0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTwp6w+s; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTwp6w+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708217553; x=1739753553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zdFcdCj+TwpczU/+BCK0hcNMAQR8yLua1Dc0NXU70dU=;
  b=cTwp6w+s3gVRaHgeEIN9nEzIf4Fm0rW+AoZ/nbi9b41NCDtPRKcCCbf4
   r3ZHAO2IY4X3xqj6QqYtBtU58Xk9VzR/K156NM5Jlw6Sx09csLvH/D/mV
   0jWzSaR0hHPkS9Dw0Sa5WZjkFwyJohD+KYCLQBHICdKSsM1QembUsTkKy
   VnHH2QF+1MaDUVLsA/A1Ex/G3mqAJFU/nwRwFEPg203FuRiUJ1fZTLZPJ
   xyPerX4NYrORfW26YVKUXnNx/zINMfIbo3kmj9z5zTYYXyrVdbndJ3P+m
   Peaty/uXtyO/nEp0/k7NEIOyjBmG8l5yx3MjM02mhVIgDLh9+eSNpqUVi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2462854"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2462854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 16:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="8851544"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2024 16:52:32 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbVPx-0002du-1h;
	Sun, 18 Feb 2024 00:52:29 +0000
Date: Sun, 18 Feb 2024 08:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 10/11] lib/checksum_kunit.c:235:18: warning:
 'expected_csum_ipv6_magic_corner' defined but not used
Message-ID: <202402180814.YyJcQzem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   87a37f01e744b2203a6d053322632f680f30fade
commit: 068e2e1754d7c9e92e07c8332b2b64673b4989cc [10/11] lib: checksum: Add some corner cases to csum_ipv6_magic tests
config: i386-buildonly-randconfig-006-20240218 (https://download.01.org/0day-ci/archive/20240218/202402180814.YyJcQzem-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180814.YyJcQzem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180814.YyJcQzem-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/checksum_kunit.c:235:18: warning: 'expected_csum_ipv6_magic_corner' defined but not used [-Wunused-const-variable=]
     235 | static const u16 expected_csum_ipv6_magic_corner[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/checksum_kunit.c:219:18: warning: 'expected_csum_ipv6_magic' defined but not used [-Wunused-const-variable=]
     219 | static const u16 expected_csum_ipv6_magic[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/expected_csum_ipv6_magic_corner +235 lib/checksum_kunit.c

   234	
 > 235	static const u16 expected_csum_ipv6_magic_corner[] = {
   236		0xff00,	/* all 0xff	*/
   237		0x0000,	/* proto==0	*/
   238		0xfffe,	/* proto==1	*/
   239		0xff00,	/* len==0	*/
   240		0xfeff,	/* len==1	*/
   241		0xff00,	/* csum==0	*/
   242		0xfeff,	/* csum==1	*/
   243	};
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
