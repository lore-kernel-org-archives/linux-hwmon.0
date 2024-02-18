Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DE6BB4D
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Feb 2024 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708266248; cv=none; b=GcEsumhmCB+Wu3u8wanxwti8FHiojPN+exB8d9NKzE/yofstCoTa0DIAkASjiHnLxH/qsYgTSiUXjVIWZrY7ACLu3dCjnZCuNEEW9D2Ao5dTWxrzgFgZd0K6aVyilCHMyRS0cpyaQJZ+/9TRpSZwByH/La3uhSHyYkIAHV0HOhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708266248; c=relaxed/simple;
	bh=kcOZXGj5Fk2i6Oi4lKt+KAV9vWDBIDdlElD/HWHSzUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8FNtv9BVSOapuScXOnRjsLQ419M0SxOh/ozwcPqJBokjqk+3aFVglje8aFjG3OG7x6Zmmfq9IEDb8ezbgoPUqsXLWghwk1w3HPVr3SkFZta66CHJY1k7Nlv5LXXkNwo+Mkw59K2jwvpfXRPoj/i8W7M9p5x7WZ6LMyIK/yGfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cU5dqNid; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cU5dqNid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708266246; x=1739802246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcOZXGj5Fk2i6Oi4lKt+KAV9vWDBIDdlElD/HWHSzUE=;
  b=cU5dqNidqQxxIWT9Bfuww+4/VjTWoCdscmu6i0q5JvS7FlEHDiAxGDhj
   ajr6v+ezz9pr/vbcxFMyOvlHAqeg7EXmMFgvrGSzjPyjUOU/yFIk5glxp
   9nlB9iIWbuX2+Q5n3POKbUbH+FvOD0kwJ8Q+5GRCAZs/MjtPO6UlP5Ayx
   38GSj/qU4nAabKYLNrz3HQmaV4Zy/c4LSXyXv8HulYCzYgoscffQgod5P
   FGiQ4nFuzzTFaoog8/a66yFhikPnVja1FzSFl4dZd7X5oA8B9YlgaBbFv
   pOAkZVQhdgFOqQufG6FfgE5agQgpOnZqJ/ONtL7N+b22kQhDuhLwUk5hn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="13745857"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="13745857"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 06:24:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="8941378"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2024 06:24:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbi5J-00034Y-2i;
	Sun, 18 Feb 2024 14:24:01 +0000
Date: Sun, 18 Feb 2024 22:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 10/11] lib/checksum_kunit.c:512:53: sparse:
 sparse: incorrect type in argument 5 (different base types)
Message-ID: <202402182220.PBilO7Xm-lkp@intel.com>
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
config: x86_64-randconfig-121-20240218 (https://download.01.org/0day-ci/archive/20240218/202402182220.PBilO7Xm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402182220.PBilO7Xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402182220.PBilO7Xm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/checksum_kunit.c:512:53: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   lib/checksum_kunit.c:512:53: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:512:53: sparse:     got unsigned int
   lib/checksum_kunit.c:517:50: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   lib/checksum_kunit.c:517:50: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:517:50: sparse:     got unsigned int
   lib/checksum_kunit.c:522:50: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   lib/checksum_kunit.c:522:50: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:522:50: sparse:     got unsigned int
   lib/checksum_kunit.c:527:48: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   lib/checksum_kunit.c:527:48: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:527:48: sparse:     got unsigned int
   lib/checksum_kunit.c:532:48: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   lib/checksum_kunit.c:532:48: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:532:48: sparse:     got unsigned int
>> lib/checksum_kunit.c:542:53: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got restricted __be32 [usertype] @@
   lib/checksum_kunit.c:542:53: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:542:53: sparse:     got restricted __be32 [usertype]

vim +512 lib/checksum_kunit.c

   480	
   481	static void test_csum_ipv6_magic(struct kunit *test)
   482	{
   483	#if defined(CONFIG_NET)
   484		struct csum_ipv6_magic_data {
   485			const struct in6_addr saddr;
   486			const struct in6_addr daddr;
   487			__be32 len;
   488			__wsum csum;
   489			unsigned char proto;
   490			unsigned char pad[3];
   491		} *data;
   492		__sum16 csum_result, expected;
   493		int ipv6_num_tests = ((MAX_LEN - sizeof(struct csum_ipv6_magic_data)) / WORD_ALIGNMENT);
   494	
   495		for (int i = 0; i < ipv6_num_tests; i++) {
   496			int index = i * WORD_ALIGNMENT;
   497	
   498			data = kmalloc(sizeof(struct csum_ipv6_magic_data), GFP_KERNEL);
   499	
   500			memcpy(data, random_buf + index, sizeof(struct csum_ipv6_magic_data));
   501	
   502			csum_result = csum_ipv6_magic(&data->saddr, &data->daddr,
   503						      ntohl(data->len), data->proto,
   504						      data->csum);
   505			expected = (__force __sum16)htons(expected_csum_ipv6_magic[i]);
   506			CHECK_EQ(csum_result, expected);
   507		}
   508	
   509		/* test corner cases */
   510		memset(tmp_buf, 0xff, sizeof(struct in6_addr));
   511		csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf, (struct in6_addr *)tmp_buf,
 > 512					      0xffff, 0xff, 0xffffffff);
   513		expected = (__force __sum16)htons(expected_csum_ipv6_magic_corner[0]);
   514		CHECK_EQ(csum_result, expected);
   515	
   516		csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf, (struct in6_addr *)tmp_buf,
   517					      0xffff, 0, 0xffffffff);
   518		expected = (__force __sum16)htons(expected_csum_ipv6_magic_corner[1]);
   519		CHECK_EQ(csum_result, expected);
   520	
   521		csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf, (struct in6_addr *)tmp_buf,
   522					      0xffff, 1, 0xffffffff);
   523		expected = (__force __sum16)htons(expected_csum_ipv6_magic_corner[2]);
   524		CHECK_EQ(csum_result, expected);
   525	
   526		csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf, (struct in6_addr *)tmp_buf,
   527					      0, 0xff, 0xffffffff);
   528		expected = (__force __sum16)htons(expected_csum_ipv6_magic_corner[3]);
   529		CHECK_EQ(csum_result, expected);
   530	
   531		csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf, (struct in6_addr *)tmp_buf,
   532					      1, 0xff, 0xffffffff);
   533		expected = (__force __sum16)htons(expected_csum_ipv6_magic_corner[4]);
   534		CHECK_EQ(csum_result, expected);
   535	
   536		csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf, (struct in6_addr *)tmp_buf,
   537					      0xffff, 0xff, 0);
   538		expected = (__force __sum16)htons(expected_csum_ipv6_magic_corner[5]);
   539		CHECK_EQ(csum_result, expected);
   540	
   541		csum_result = csum_ipv6_magic((struct in6_addr *)tmp_buf, (struct in6_addr *)tmp_buf,
 > 542					      0xffff, 0xff, htonl(1));
   543		expected = (__force __sum16)htons(expected_csum_ipv6_magic_corner[6]);
   544		CHECK_EQ(csum_result, expected);
   545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
