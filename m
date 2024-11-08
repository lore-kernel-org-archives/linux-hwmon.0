Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4688A1946CD
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Nov 2024 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731067625; cv=none; b=AbUF+0//JWlOzTki5lw3uavpXGeu4f9R/49YxbJvngDpcsNPuqpI9tK0LShiC1w+tUV3Yq6kLZ7r1d4Vzqit4dr8+hHgakCsGSTCTZmDqWLlm0VHnPU4sEV1jHKgMfYddwRSN1nh+X8JaYWKlcJ696XC4+ucaNcK+ciBSJslRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731067625; c=relaxed/simple;
	bh=BPm0h+bV+xsEADH1ZpLdJAmst959FEzmNFAhsDq3Pow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gsZejo2TLu9u1WkfZRlG7omr6SoEQgsuFmtXH6nDeKqZTs2eX3M5tADCxlxhqdPTAtQtpvaV6ce7QWitIPWhlAlu4/zI85J4AzPL6+MS3BxMvakWxb51qDY7/2x+GyMM45TxiCO3gAvwaCucYSCgLZs1kPG/Gl13SyFVSMYUq4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhL1a8E1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhL1a8E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731067625; x=1762603625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPm0h+bV+xsEADH1ZpLdJAmst959FEzmNFAhsDq3Pow=;
  b=HhL1a8E1Lx99eku6/eIE+oYwJxtNpNN883egFS+7Mxb3ZUDozLEP74p9
   A9FUNHZ7xWXWVWYHSZ7eazXE5TYZzP8E8f7dV8SnI5XWahHY6k4xxOiht
   8bNeXJ8U8w5C4EJm8ycvkSlS3hK4jpasTAQBJkAW5DnuKTclj0/9DrKRX
   VSOCjChVARcaHA1KjOrlcFN9BMtMyYTj5mx50OZcVOPwHw5AI/RvUcrRX
   2eQPWfarwbtE52dgGYHZGBZwcOQpr5EVMiUK+PZp7V6Zwcn/OWnIucefr
   TfGFwxZeVkV27V1aBxcN1Q+FHT2pyNrMH1baWUW907aZp6eZTq06J0Fml
   w==;
X-CSE-ConnectionGUID: fH5i2VhnQ+KBHlzXNrs2xg==
X-CSE-MsgGUID: vykfAWeCQjqpaAxfZIIAbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31116623"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31116623"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:07:04 -0800
X-CSE-ConnectionGUID: bJpwDKi9SAedTALfbaUTVQ==
X-CSE-MsgGUID: lzgCYkq+QfKHwvmEe+UKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85679499"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Nov 2024 04:07:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9NlT-000rOw-2A;
	Fri, 08 Nov 2024 12:06:59 +0000
Date: Fri, 8 Nov 2024 20:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: Wenliang Yan <wenliang202407@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 32/37] drivers/hwmon/ina2xx.c:734:8:
 error: duplicate case value: 'hwmon_in_input' and 'hwmon_power_average' both
 equal '1'
Message-ID: <202411082010.YVGQz3Xo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   33c7c88cd30fa65f5479722ba7eea300ebf889a5
commit: 8fb186818c2fe7be4e2f722c1bc1108ec854d416 [32/37] hwmon: (ina226) Add support for SY24655
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241108/202411082010.YVGQz3Xo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082010.YVGQz3Xo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082010.YVGQz3Xo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/ina2xx.c:31:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hwmon/ina2xx.c:31:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hwmon/ina2xx.c:31:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/hwmon/ina2xx.c:31:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/hwmon/ina2xx.c:524:15: warning: unused variable 'regval' [-Wunused-variable]
     524 |         unsigned int regval;
         |                      ^~~~~~
>> drivers/hwmon/ina2xx.c:734:8: error: duplicate case value: 'hwmon_in_input' and 'hwmon_power_average' both equal '1'
     734 |                 case hwmon_power_average:
         |                      ^
   drivers/hwmon/ina2xx.c:722:8: note: previous case defined here
     722 |                 case hwmon_in_input:
         |                      ^
   8 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +734 drivers/hwmon/ina2xx.c

   710	
   711	static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type,
   712					 u32 attr, int channel)
   713	{
   714		const struct ina2xx_data *data = _data;
   715		bool has_alerts = data->config->has_alerts;
   716		bool has_power_average = data->config->has_power_average;
   717		enum ina2xx_ids chip = data->chip;
   718	
   719		switch (type) {
   720		case hwmon_in:
   721			switch (attr) {
   722			case hwmon_in_input:
   723				return 0444;
   724			case hwmon_in_lcrit:
   725			case hwmon_in_crit:
   726				if (has_alerts)
   727					return 0644;
   728				break;
   729			case hwmon_in_lcrit_alarm:
   730			case hwmon_in_crit_alarm:
   731				if (has_alerts)
   732					return 0444;
   733				break;
 > 734			case hwmon_power_average:
   735				if (has_power_average)
   736					return 0444;
   737				break;
   738			default:
   739				break;
   740			}
   741			break;
   742		case hwmon_curr:
   743			switch (attr) {
   744			case hwmon_curr_input:
   745				return 0444;
   746			case hwmon_curr_lcrit:
   747			case hwmon_curr_crit:
   748				if (has_alerts)
   749					return 0644;
   750				break;
   751			case hwmon_curr_lcrit_alarm:
   752			case hwmon_curr_crit_alarm:
   753				if (has_alerts)
   754					return 0444;
   755				break;
   756			default:
   757				break;
   758			}
   759			break;
   760		case hwmon_power:
   761			switch (attr) {
   762			case hwmon_power_input:
   763				return 0444;
   764			case hwmon_power_crit:
   765				if (has_alerts)
   766					return 0644;
   767				break;
   768			case hwmon_power_crit_alarm:
   769				if (has_alerts)
   770					return 0444;
   771				break;
   772			default:
   773				break;
   774			}
   775			break;
   776		case hwmon_chip:
   777			switch (attr) {
   778			case hwmon_chip_update_interval:
   779				if (chip == ina226 || chip == ina260)
   780					return 0644;
   781				break;
   782			default:
   783				break;
   784			}
   785			break;
   786		default:
   787			break;
   788		}
   789		return 0;
   790	}
   791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
