Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F2AA34
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Feb 2024 01:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708220677; cv=none; b=VlE4BO3atHTBkPePbC8L3pJxsfWu2D9Hrs8X7dJTm+B5z4aV1GpRPLiJVA9TaSDWadJhBlPML60UnWvk5FS6r6eGasi5iFqnzrqeeIdC6OAmcplVysy9fvXlqBAG4RUrMHhQc+mrTvbQt+gV1WfzgcMW3929yKGIK8YvLQ2lc/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708220677; c=relaxed/simple;
	bh=tf2r4AzwXUPAE0xvuqJfwuseKVLcLIL4fJEvDtaUSB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlXlpvDYnDXojx8LQoShuKHHs+ErDCJAO/CVwIkANOaCQ9iLtrE0yHi9wVOQOe5HN4aVY2+IjQUpIgoRbdSFfEOPJIizX9p3dqql2+K+9WGZoTRv5RMgG1OYy30zXYKkAhnGu9+nsBUaVov5RYDVO/ubOLYJRvYkHj/G4leWKyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nE2alJ69; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nE2alJ69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708220675; x=1739756675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tf2r4AzwXUPAE0xvuqJfwuseKVLcLIL4fJEvDtaUSB0=;
  b=nE2alJ69Lv1q5rXscNECaVn2yNdRgjmW+OJs4cX1oQxwFzqGFN8uQW6v
   jPLeE4J471GYplimqXd4k1mV5M/lm+3Oijaxtskn3qYOyRG1QQ2q8iudl
   SLHYU2h275+JBPj8EHJuoI6vsvN7WAteBfJHoFg+qb76mJTVyL6X93erj
   42GPpd/HwHqbunvrqyPq71qhRcop26OOxY2a/HyYEoDAE4w2MnKpz59vr
   pEWwWMcW8ww+OGNDWej4+ioJpBHCCL1yJpX1jHEJuHRGT/xJiaG8O+O9n
   E6xwmAzkxv1pUoy5nbIf5QpLYSm76o+162Xx6tHz/CesdKHcN6AlovFkv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="6126680"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="6126680"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 17:44:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4465005"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Feb 2024 17:44:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbWEI-0002gQ-2W;
	Sun, 18 Feb 2024 01:44:30 +0000
Date: Sun, 18 Feb 2024 09:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 10/11] lib/checksum_kunit.c:235:18: warning:
 unused variable 'expected_csum_ipv6_magic_corner'
Message-ID: <202402180953.upWqUKdc-lkp@intel.com>
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
config: arm-randconfig-001-20240218 (https://download.01.org/0day-ci/archive/20240218/202402180953.upWqUKdc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180953.upWqUKdc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180953.upWqUKdc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/checksum_kunit.c:219:18: warning: unused variable 'expected_csum_ipv6_magic' [-Wunused-const-variable]
     219 | static const u16 expected_csum_ipv6_magic[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> lib/checksum_kunit.c:235:18: warning: unused variable 'expected_csum_ipv6_magic_corner' [-Wunused-const-variable]
     235 | static const u16 expected_csum_ipv6_magic_corner[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


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
