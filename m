Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94030EB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 15:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjGSPtG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 11:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjGSPtG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 11:49:06 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F22197
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689781745; x=1721317745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHyJ1a9oyIwsjdZMcgIFXV3xT2HFfJmU6pYoo5BsWLQ=;
  b=JrSuhNO9KDSeZTrOi8of7PJnjfxi6PKmtxxbOPRjMZ0JYQxCl7nCPe7c
   DJISQEeqpfF2la/zXcBBOwrcvdSI1aXsVjjwspkqdz46dZ1gk8007QECR
   NxYHPjIWMBCXBQoMAN2i+2oT6ncvFMbMPnWr6UV6y30hhjLDK8xEViHva
   H6UYriDWqJswUdfW0R1NP15TZx6UWwN3IfT1EUaNonUZ25EPkc/5eq1n0
   mCko/7ZcqNIpXhZ8uIufuwdF+IJRD0E5GiTha2lvgtDspQf1CE+2+iA7c
   jCUWFWNkN45N9bLM7rc403jKTOrdncyWAhUzSZr1qX/71o+UuIK4cOmIr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430269780"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430269780"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 08:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="970670164"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="970670164"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2023 08:49:02 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qM9QA-000550-2r;
        Wed, 19 Jul 2023 15:49:00 +0000
Date:   Wed, 19 Jul 2023 23:48:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [groeck-staging:hwmon-next 20/26]
 drivers/hwmon/pmbus/mp2975.c:708:19: warning: cast to smaller integer type
 'enum chips' from 'const void *'
Message-ID: <202307192338.wM4zBtXS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   72f5d19d9dc4c90107105e13c530854eea1aac15
commit: 6e990f130ea09ec77150e2bd0f5c8795cd739e4b [20/26] hwmon: (pmbus/mp2975) Prepare for MP2973 and MP2971
config: arm64-randconfig-r014-20230718 (https://download.01.org/0day-ci/archive/20230719/202307192338.wM4zBtXS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192338.wM4zBtXS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192338.wM4zBtXS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mp2975.c:708:19: warning: cast to smaller integer type 'enum chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   data->chip_id = (enum chips)of_device_get_match_data(&client->dev);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +708 drivers/hwmon/pmbus/mp2975.c

   695	
   696	static int mp2975_probe(struct i2c_client *client)
   697	{
   698		struct pmbus_driver_info *info;
   699		struct mp2975_data *data;
   700		int ret;
   701	
   702		data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
   703				    GFP_KERNEL);
   704		if (!data)
   705			return -ENOMEM;
   706	
   707		if (client->dev.of_node)
 > 708			data->chip_id = (enum chips)of_device_get_match_data(&client->dev);
   709		else
   710			data->chip_id = i2c_match_id(mp2975_id, client)->driver_data;
   711	
   712		memcpy(&data->info, &mp2975_info, sizeof(*info));
   713		info = &data->info;
   714	
   715		/* Identify multiphase configuration for rail 2. */
   716		ret = mp2975_identify_multiphase_rail2(client);
   717		if (ret < 0)
   718			return ret;
   719	
   720		if (ret) {
   721			/* Two rails are connected. */
   722			data->info.pages = MP2975_PAGE_NUM;
   723			data->info.phases[1] = ret;
   724			data->info.func[1] = MP2975_RAIL2_FUNC;
   725		}
   726	
   727		/* Identify multiphase configuration. */
   728		ret = mp2975_identify_multiphase(client, data, info);
   729		if (ret)
   730			return ret;
   731	
   732		/* Identify VID setting per rail. */
   733		ret = mp2975_identify_rails_vid(client, data, info);
   734		if (ret < 0)
   735			return ret;
   736	
   737		/* Obtain current sense gain of power stage. */
   738		ret = mp2975_current_sense_gain_get(client, data);
   739		if (ret)
   740			return ret;
   741	
   742		/* Obtain voltage reference values. */
   743		ret = mp2975_vref_get(client, data, info);
   744		if (ret)
   745			return ret;
   746	
   747		/* Obtain vout over-voltage scales. */
   748		ret = mp2975_vout_ov_scale_get(client, data, info);
   749		if (ret < 0)
   750			return ret;
   751	
   752		/* Obtain offsets, maximum and format for vout. */
   753		ret = mp2975_vout_per_rail_config_get(client, data, info);
   754		if (ret)
   755			return ret;
   756	
   757		return pmbus_do_probe(client, info);
   758	}
   759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
