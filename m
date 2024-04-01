Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7711183
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Apr 2024 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711965478; cv=none; b=hWRxGNWx8xCIHFoQMGC6ERtRG9CUjCJVajknhFA/QMkKhleVlI4qG3C3/1bzyJttuGMDDQTHObtB0IIhZX/naHzoV6R8Bw3Yp6XtGmcX40AYaBUq2zq8DR11uI3Z78RN+avHE08drhwKuCH5tJeFVDRCVAavufZv16k8hcLH6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711965478; c=relaxed/simple;
	bh=OwZ/u54Vcc/I38bMykZdqgACtIQaSu/xO2tyGnN1Mtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fijEQuTMPLAoTVQK4CJ5WF1jT+7U06QjqMKtacWv84lgYqL174vsN16sL9wu4jxf3oAWRIuwAI07ahtSWCkkphBqhYtnBMRqpgF3O1Tqh94UBDoNhYBHYQitAiy6ugRyPr1S4XEJo8P01lP6pJMgbusWqht9jGa55S8PfrbmtRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXiZuMqB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXiZuMqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711965477; x=1743501477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OwZ/u54Vcc/I38bMykZdqgACtIQaSu/xO2tyGnN1Mtc=;
  b=aXiZuMqBF3Z2HUMhDXLmcAqfybeJDt56A+B332pxMAk9mvsI30Lp8/TM
   O8dCwKwIR8xNME7J9q9B/jFM+V5l6Jh214m03770Ph7O4IwkxV4yaYLoo
   2bYuNsU/TZIN761Lm1xqbssFKelO6GkwJo5KWf1Iv+sMBQu3kMHbmu94n
   nL+ORwKeM6iXAb5TZ/VnnPfKZsPcUTGiM48nHgIdpqz6K+e1ZJEL23ofb
   etViSh910u68PqbJ8TOcE7cGw44Y2q66m/6/Gkln+VBlwCbvr3yduHmVT
   FziP5tLYu+gkPPDlEoHCR5q7D1IOhyc4xs0tkL1fx8PqmNl/uK7LqoF1+
   w==;
X-CSE-ConnectionGUID: jRdMhSiORF6tf09vDNah5g==
X-CSE-MsgGUID: PeaVeowmRyeBA20h+BB7qQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10909399"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="10909399"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 02:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="18058658"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2024 02:57:55 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrEQK-0000ED-10;
	Mon, 01 Apr 2024 09:57:52 +0000
Date: Mon, 1 Apr 2024 17:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ken Raeburn <raeburn@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Matthew Sakai <msakai@redhat.com>
Subject: [groeck-staging:testing 2/11] drivers/md/dm-vdo/murmurhash3.c:21:31:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202404011734.OlyXtb2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   ad98b547d596561b6bdc5c2fdf8aa1a620c9e6fa
commit: af76a97d146976298a6fbd154dd39b6e9e321b73 [2/11] dm vdo: use kernel byteswapping routines instead of GCC ones
config: alpha-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240401/202404011734.OlyXtb2L-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404011734.OlyXtb2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404011734.OlyXtb2L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-vdo/murmurhash3.c:21:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le64 const [usertype] *p @@     got unsigned long long const [usertype] * @@
   drivers/md/dm-vdo/murmurhash3.c:21:31: sparse:     expected restricted __le64 const [usertype] *p
   drivers/md/dm-vdo/murmurhash3.c:21:31: sparse:     got unsigned long long const [usertype] *
>> drivers/md/dm-vdo/murmurhash3.c:21:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le64 const [usertype] *p @@     got unsigned long long const [usertype] * @@
   drivers/md/dm-vdo/murmurhash3.c:21:31: sparse:     expected restricted __le64 const [usertype] *p
   drivers/md/dm-vdo/murmurhash3.c:21:31: sparse:     got unsigned long long const [usertype] *
>> drivers/md/dm-vdo/murmurhash3.c:26:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/md/dm-vdo/murmurhash3.c:26:14: sparse:     expected unsigned long long [usertype]
   drivers/md/dm-vdo/murmurhash3.c:26:14: sparse:     got restricted __le64 [usertype]
>> drivers/md/dm-vdo/murmurhash3.c:26:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/md/dm-vdo/murmurhash3.c:26:14: sparse:     expected unsigned long long [usertype]
   drivers/md/dm-vdo/murmurhash3.c:26:14: sparse:     got restricted __le64 [usertype]

vim +21 drivers/md/dm-vdo/murmurhash3.c

    17	
    18	#define ROTL64(x, y) rotl64(x, y)
    19	static __always_inline u64 getblock64(const u64 *p, int i)
    20	{
  > 21		return le64_to_cpup(&p[i]);
    22	}
    23	
    24	static __always_inline void putblock64(u64 *p, int i, u64 value)
    25	{
  > 26		p[i] = cpu_to_le64(value);
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
