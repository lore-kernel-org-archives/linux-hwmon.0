Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2D7DA6D;
	Sat, 21 Dec 2024 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734757319; cv=none; b=nTfi/kBnJvynme+6X3x/CD6RE90dmraw/bqJ8SecsDRpe5J8t2kt769j+5uKDTZfaqKcdyNXJYR9sF1V4iZpRA7wS+dE56qQJYZv81NVokQJalWY4TwUy7id27bBaGpgwVxm9aM25OJ4LCS/s6nNabuwXFd+NRzOJs/vzdKX4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734757319; c=relaxed/simple;
	bh=+e5G9Vhxklyeb7e8RpX8psgBXg1VFuf0Q5qX8n6rWbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8wh0qtxH4/bYjwVL5FUv1HAMPxLd/s8Y6BZ/9nDYeTZ6ZhxjAwVin48cVw92k66iLfof9q8F4hSkWsSFwbpUxd0rk+BjTaTHlCZXEa8LgXMLOc8RGjm8cSinhVHgxLmIdC8dVjPS6b5RZ1YXPolRPhF/RKhsg4RzBh7/8vuAPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4mxLxly; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4mxLxly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734757317; x=1766293317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+e5G9Vhxklyeb7e8RpX8psgBXg1VFuf0Q5qX8n6rWbk=;
  b=f4mxLxlyhTxJASMUvsxuEqf3kb5IYUbC82jNiTDmnNtooc04A70INcqE
   GhaMF75lmWEZZ6jZaV0uVyQZG/FtGW0VQwaENxbgLILF9KR/e27ooGYDy
   NthLlPGlDKnrHTT4VZ7qNTGcCqhCaqf8gzt7GodeB+AUsqxRQd95A0Jlh
   EJ6WExYCOEvvfqX41/qc9iafDVv8jzNmRiBsgTYvngpGVQyhXb6n2X1Do
   +8Mlh2WqJ8uWxfS2j1OaJthAIq2QQja2O06PhJw1jRltwiiTBXpAVqY/4
   hstKwaHHOD+JCRxSfKyJBRbo5zJna4ypH9Sz9tC/Pck3lBihDx/u9oyRk
   w==;
X-CSE-ConnectionGUID: iFIx4Z5qT/C369jiiE8AMg==
X-CSE-MsgGUID: nshWsu3rRMGwlriDxm1NDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39087371"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="39087371"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 21:01:56 -0800
X-CSE-ConnectionGUID: rn3jpK3MT5uZbVAWSQ1jNA==
X-CSE-MsgGUID: bcG8Dh6fRES5x+i2gqaBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98907630"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 21:01:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOrce-0001vz-0I;
	Sat, 21 Dec 2024 05:01:52 +0000
Date: Sat, 21 Dec 2024 13:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Libetario <Kent.Libetario@analog.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] drivers: hwmon: add driver for max42500
Message-ID: <202412211209.zqypWgoc-lkp@intel.com>
References: <20241220012003.9568-3-Kent.Libetario@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220012003.9568-3-Kent.Libetario@analog.com>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on de076198d1e4934c5fc17aa52d5f1884f469ce1a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Libetario/dt-bindings-hwmon-add-adi-max42500-yaml/20241220-092728
base:   de076198d1e4934c5fc17aa52d5f1884f469ce1a
patch link:    https://lore.kernel.org/r/20241220012003.9568-3-Kent.Libetario%40analog.com
patch subject: [PATCH 2/2] drivers: hwmon: add driver for max42500
config: x86_64-randconfig-r072-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211209.zqypWgoc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211209.zqypWgoc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211209.zqypWgoc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max42500.c:206: warning: Cannot understand  * @brief Read a raw value from a register.
    on line 206 - I thought it was a doc line
>> drivers/hwmon/max42500.c:251: warning: Cannot understand  * @brief Write a raw value to a register.
    on line 251 - I thought it was a doc line
>> drivers/hwmon/max42500.c:278: warning: Cannot understand  * @brief Update a register's value based on a mask.
    on line 278 - I thought it was a doc line
>> drivers/hwmon/max42500.c:298: warning: Cannot understand  * @brief Set nominal voltage for VM1 to VM5.
    on line 298 - I thought it was a doc line
>> drivers/hwmon/max42500.c:331: warning: Cannot understand  * @brief Get the status of the voltage monitor input.
    on line 331 - I thought it was a doc line
>> drivers/hwmon/max42500.c:390: warning: Cannot understand  * @brief Set the overvoltage threshold of VM1 to VM5.
    on line 390 - I thought it was a doc line
>> drivers/hwmon/max42500.c:418: warning: Cannot understand  * @brief Set the overvoltage threshold of VM6 and VM7.
    on line 418 - I thought it was a doc line
>> drivers/hwmon/max42500.c:446: warning: Cannot understand  * @brief Set the undervoltage threshold of VM1 to VM5.
    on line 446 - I thought it was a doc line
>> drivers/hwmon/max42500.c:473: warning: Cannot understand  * @brief Set the undervoltage threshold of VM6 and VM7.
    on line 473 - I thought it was a doc line
>> drivers/hwmon/max42500.c:501: warning: Cannot understand  * @brief Get the FPS clock divider value.
    on line 501 - I thought it was a doc line
>> drivers/hwmon/max42500.c:520: warning: Cannot understand  * @brief Get power-up timestamp for a specified voltage monitor input.
    on line 520 - I thought it was a doc line
>> drivers/hwmon/max42500.c:551: warning: Cannot understand  * @brief Get power-down timestamp for a specified voltage monitor input.
    on line 551 - I thought it was a doc line
>> drivers/hwmon/max42500.c:582: warning: Cannot understand  * @brief Enable/Disable watchdog
    on line 582 - I thought it was a doc line
>> drivers/hwmon/max42500.c:604: warning: Cannot understand  * @brief 8-bit watchdog key computation.
    on line 604 - I thought it was a doc line
>> drivers/hwmon/max42500.c:630: warning: Cannot understand  * @brief Update the watchdog key based on the mode and current value.
    on line 630 - I thought it was a doc line


vim +206 drivers/hwmon/max42500.c

   203	
   204	/************************ Functions Definitions **************************/
   205	/**
 > 206	 * @brief Read a raw value from a register.
   207	 * @return 0 in case of success, error code otherwise.
   208	 */
   209	static int max42500_reg_read(struct max42500_state *st,
   210									u8 reg_addr, u8 *reg_data)
   211	{
   212		int ret;
   213		u8 i2c_data[MAX42500_I2C_RD_FRAME_SIZE] = {0};
   214		u8 bytes_num;
   215		u8 pece_value;
   216	
   217		/* PEC is computed over entire I2C frame from first START condition */
   218		i2c_data[0] = (st->client->addr << 1);
   219		i2c_data[1] = reg_addr;
   220		i2c_data[2] = (st->client->addr << 1) | 0x1;
   221	
   222		/* I2C write target address */
   223		bytes_num = 1;
   224	
   225		ret = regmap_bulk_write(st->regmap, reg_addr, &i2c_data[1], bytes_num);
   226		if (ret)
   227			return ret;
   228	
   229		/* Change byte count if PECE is enabled (1-byte data. 1-byte PEC) */
   230		bytes_num = (st->config->pece) ? 2 : bytes_num;
   231	
   232		ret = regmap_bulk_read(st->regmap, reg_addr, &i2c_data[3], bytes_num);
   233		if (ret)
   234			return ret;
   235	
   236		if (st->config->pece) {
   237			/* Compute CRC over entire I2C frame */
   238			pece_value = crc8(max42500_crc8, i2c_data,
   239								(MAX42500_I2C_RD_FRAME_SIZE - 1), 0);
   240	
   241			if (i2c_data[4] != pece_value)
   242				return -EIO;
   243		}
   244	
   245		*reg_data = i2c_data[3];
   246	
   247		return 0;
   248	}
   249	
   250	/**
 > 251	 * @brief Write a raw value to a register.
   252	 * @return 0 in case of success, negative error code otherwise.
   253	 */
   254	static int max42500_reg_write(struct max42500_state *st,
   255									u8 reg_addr, u8 data)
   256	{
   257		u8 i2c_data[MAX42500_I2C_WR_FRAME_SIZE] = {0};
   258		u8 bytes_num;
   259		u8 pece_value;
   260	
   261		bytes_num = (st->config->pece) ? (MAX42500_I2C_WR_FRAME_SIZE - 1) : 2;
   262		i2c_data[0] = (st->client->addr << 1);
   263		i2c_data[1] = reg_addr;
   264		i2c_data[2] = (u8)(data & 0xFF);
   265	
   266		pece_value = 0;
   267		if (st->config->pece)
   268			pece_value = crc8(max42500_crc8, i2c_data, bytes_num, 0);
   269	
   270		i2c_data[0] = i2c_data[1];
   271		i2c_data[1] = i2c_data[2];
   272		i2c_data[2] = pece_value;
   273	
   274		return regmap_bulk_write(st->regmap, reg_addr, i2c_data, bytes_num);
   275	}
   276	
   277	/**
 > 278	 * @brief Update a register's value based on a mask.
   279	 * @return 0 in case of success, negative error code otherwise.
   280	 */
   281	static int max42500_reg_update(struct max42500_state *st,
   282									u8 reg_addr, u8 mask, u8 data)
   283	{
   284		int ret;
   285		u8 reg_data;
   286	
   287		ret = max42500_reg_read(st, reg_addr, &reg_data);
   288		if (ret)
   289			return ret;
   290	
   291		reg_data &= ~mask;
   292		reg_data |= mask & data;
   293	
   294		return max42500_reg_write(st, reg_addr, reg_data);
   295	}
   296	
   297	/**
 > 298	 * @brief Set nominal voltage for VM1 to VM5.
   299	 * @return 0 in case of success, negative error code otherwise.
   300	 */
   301	static int max42500_set_nominal_voltage(struct max42500_state *st,
   302		enum max42500_vm_input vm_in, u8 voltage)
   303	{
   304		u8 reg_addr;
   305	
   306		switch (vm_in) {
   307		case MAX42500_VM1:
   308		case MAX42500_VM2:
   309		case MAX42500_VM3:
   310		case MAX42500_VM4:
   311			if (voltage < MAX42500_MIN_VNOM ||
   312				voltage > MAX42500_VNOM_MAX_VM1_VM4)
   313				return -EINVAL;
   314			reg_addr = MAX42500_REG_VIN1 + vm_in;
   315			break;
   316		case MAX42500_VM5:
   317			if (voltage < MAX42500_MIN_VNOM ||
   318				voltage > MAX42500_VNOM_MAX_VM5)
   319				return -EINVAL;
   320			reg_addr = MAX42500_REG_VIN5;
   321			break;
   322		default:
   323			return -EINVAL;
   324		}
   325	
   326		st->nominal_volt[vm_in] = voltage;
   327		return max42500_reg_write(st, reg_addr, voltage);
   328	}
   329	
   330	/**
 > 331	 * @brief Get the status of the voltage monitor input.
   332	 * @return 0 in case of success, negative error code otherwise.
   333	 */
   334	static int max42500_get_comp_status(struct max42500_state *st,
   335										u8 vm_in, u8 *status)
   336	{
   337		int ret;
   338		u8 reg_addr;
   339		u8 vm_in_status;
   340	
   341		switch (vm_in % MAX42500_COMP_STAT_MAX) {
   342		case MAX42500_COMP_STAT_OFF:
   343			reg_addr = MAX42500_REG_STATOFF;
   344			break;
   345		case MAX42500_COMP_STAT_UV:
   346			reg_addr = MAX42500_REG_STATUV;
   347			break;
   348		case MAX42500_COMP_STAT_OV:
   349			reg_addr = MAX42500_REG_STATOV;
   350			break;
   351		default:
   352			return -EINVAL;
   353		}
   354	
   355		ret = max42500_reg_read(st, reg_addr, &vm_in_status);
   356		if (ret)
   357			return ret;
   358	
   359		switch (vm_in % MAX42500_VM_MAX) {
   360		case MAX42500_VM1:
   361			*status = (u8)FIELD_GET(BIT(MAX42500_VM1), vm_in_status);
   362			break;
   363		case MAX42500_VM2:
   364			*status = (u8)FIELD_GET(BIT(MAX42500_VM2), vm_in_status);
   365			break;
   366		case MAX42500_VM3:
   367			*status = (u8)FIELD_GET(BIT(MAX42500_VM3), vm_in_status);
   368			break;
   369		case MAX42500_VM4:
   370			*status = (u8)FIELD_GET(BIT(MAX42500_VM4), vm_in_status);
   371			break;
   372		case MAX42500_VM5:
   373			*status = (u8)FIELD_GET(BIT(MAX42500_VM5), vm_in_status);
   374			break;
   375		case MAX42500_VM6:
   376			*status = (u8)FIELD_GET(BIT(MAX42500_VM6), vm_in_status);
   377			break;
   378		case MAX42500_VM7:
   379			*status = (u8)FIELD_GET(BIT(MAX42500_VM7), vm_in_status);
   380			break;
   381		default:
   382			return -EINVAL;
   383		}
   384		st->comp_status[vm_in] = *status;
   385	
   386		return 0;
   387	}
   388	
   389	/**
 > 390	 * @brief Set the overvoltage threshold of VM1 to VM5.
   391	 * @return 0 in case of success, negative error code otherwise.
   392	 */
   393	static int max42500_set_ov_thresh1(struct max42500_state *st,
   394		enum max42500_vm_input vm_in, u8 thresh)
   395	{
   396		if (thresh < MAX42500_MIN_THRESH_VM1_VM5 ||
   397			thresh > MAX42500_MAX_THRESH_VM1_VM5)
   398			return -EINVAL;
   399	
   400		switch (vm_in) {
   401		case MAX42500_VM1:
   402		case MAX42500_VM2:
   403		case MAX42500_VM3:
   404		case MAX42500_VM4:
   405		case MAX42500_VM5:
   406			st->ov_thresh1[vm_in] = thresh;
   407			return max42500_reg_update(st,
   408									MAX42500_REG_OVUV1 + vm_in,
   409									GENMASK(7, 4),
   410									FIELD_PREP(GENMASK(7, 4),
   411									thresh));
   412		default:
   413			return -EINVAL;
   414		}
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
