Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123EF2F7AA1;
	Mon,  8 Sep 2025 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757326450; cv=none; b=EE8yO8CwRvuSzisOW3ysxG9urCl1DYn7t3J1VHHorB5zbPyriZa/OJVkuTnXsjD8LFW6IKu8ABy0pPFYDM2Oa7XF25xhMC4KZS8K6fKU9yxUEFJm6Y3jMw/9yB4d9KC2P5vW+DFUJ/pRkbZe5/UGZC8XM4ExeMGgXjw/p3X2ByI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757326450; c=relaxed/simple;
	bh=0YY7e/32dXEkSSVESMDNbdVPPQSWuCvseI1hr8wtJKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jucyLtSOoR+JX/0J+kgu8HLt/6gKWyYUxKEn5SnDH9NT1Nwt9ErGwuXGecaJCTz0PY0D7x2PlHaiF19N/+lDlLLH/Zv1hX7e0Hsw1k7JJYofVzU8YBvXYfWB7WasXAxY9jrpNk7nCv5jZgoOdLdO1EWRdoMQ6igQFsiHG1Qqfbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ua0Rt0Wm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ua0Rt0Wm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757326448; x=1788862448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YY7e/32dXEkSSVESMDNbdVPPQSWuCvseI1hr8wtJKo=;
  b=Ua0Rt0WmV57cSU5GAY4MX48JXsPWTsWqRjHzW7naCw3SoO69bUSwtdDE
   IZGx2gG5VxO7/fX9MCcRiGVypwkK1s2mnlk858b213qTlBgEIg9dpgWD8
   YukF7QDuctD3Q6ooRJwoiHsaermWe/cxZ9vytWLiEzpnmQS/Gp2X4Ifqs
   5JZDxxwN+IJAQrMZEoAE+l7Mu+HFNxtL81EJOV8AtCBRQy/vtNJQegTzl
   s2cyCNiXiBHtiPyy1R1s9oD8n2VDFAB9dHYbwiGEUJUwhA1pHDk/vCPF0
   8ByWqOB5G/G+BYxRqDDvOgX+xYpgUV6zmEL5LUluLeketxsvdFZAqurPM
   Q==;
X-CSE-ConnectionGUID: QcVF/apjROu7LkGOR4Y8oQ==
X-CSE-MsgGUID: viWpK2pTQI+4BMqIuT0MmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="85022871"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="85022871"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:14:07 -0700
X-CSE-ConnectionGUID: BG47S6WQTaOJAiTDvVHChg==
X-CSE-MsgGUID: vnLjUiq9TZSIfl2hsgn3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172674010"
Received: from unknown (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2025 03:14:06 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvYsu-0004T7-03;
	Mon, 08 Sep 2025 10:14:04 +0000
Date: Mon, 8 Sep 2025 12:13:58 +0200
From: kernel test robot <lkp@intel.com>
To: Wensheng Wang <wenswang@yeah.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, linux-doc@vger.kernel.org
Subject: [groeck-staging:hwmon-next 58/59] htmldocs:
 Documentation/hwmon/mp29502.rst:4: WARNING: Title underline too short.
Message-ID: <202509081238.RD6btbzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   c387594bb99b5ae1263c3524034c846ea0c74861
commit: 86d595f66febd7079e1688e605751d80126119dd [58/59] hwmon: add MP29502 driver
reproduce: (https://download.01.org/0day-ci/archive/20250908/202509081238.RD6btbzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081238.RD6btbzT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid_bpf.h
   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid.h
   WARNING: No kernel-doc for file ./include/linux/hid.h
>> Documentation/hwmon/mp29502.rst:4: WARNING: Title underline too short.


vim +4 Documentation/hwmon/mp29502.rst

     2	
     3	Kernel driver mp29502
   > 4	====================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
