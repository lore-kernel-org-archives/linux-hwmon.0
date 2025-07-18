Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC3A1B412A
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Jul 2025 22:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752879137; cv=none; b=C1AiCypbrsJvhLExPcWp3DdIOjvNMqFUzKviCzExK3phBJ+2arCkvjnixJZEKtQO0ZHkIAUVHx3DIp4m+jjTnYuHeHuzFEIFzL6w0AtVapnVBu8banw9OHC0qi1ktlY8GvbLYevOgZNl4ESugjLvtTsirRO7QUqMEd/1qt18gd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752879137; c=relaxed/simple;
	bh=rGICDkwyIeDiM7h6eh6cCN6EyWgB77CPOdybLhs/WdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YysPuMqKSCHkNPDZgV7MWfDQHFa6TwdSFI6bVHN/6wzdAsEUWjHhVImFAeDhasbTvISTbMPsG5CYiS1TNi6Mdo/s77JJ9pwmWY0Nci1ubKgarE+fB4/BAsoH62J2OmuINyjZrRwxMiZxfYwVKyoGuHT4JucbJ6dWHXSwg4gLinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4Nhl43c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4Nhl43c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752879135; x=1784415135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGICDkwyIeDiM7h6eh6cCN6EyWgB77CPOdybLhs/WdA=;
  b=a4Nhl43c9+DrREJE1XTvvgsrQbsnsniWBXlP/R70u70geqRLfnQKxyCs
   fyyvzplnIqaeiq3gP0Dej5wb7a8vwUsyXxs78Q1FnNF0/UqY2pr2+t2VS
   +qJKnCGwQmbtlMNUsHCtw5lPLs7Lm6HuJVTFcpMXT9TznxFtcdHPHA//b
   6ddmg6DamNfVDkT+47ZYNhFQjIO4Ka7EqJ/ljwgHH7LyEeiOofUb8CDNW
   RUUST+/PJiBjTnZ32u+6yrUSDgGLJ5GfpOMQJB5t8lkYtHz5Ogu+IG7Nf
   PZpj4zf0Bac6+yq4cu2jYiUQjRUjwFck6r99bw6qpWrDIw0Zps1o7PM0S
   g==;
X-CSE-ConnectionGUID: dylYo3rxSCq02qfirX8FAg==
X-CSE-MsgGUID: wFD9ykwbShWpByvTt7h4yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54895101"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="54895101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 15:52:07 -0700
X-CSE-ConnectionGUID: d6aA9pmURCyPmQp0cnGpEQ==
X-CSE-MsgGUID: CPkXmN9hQ2i8uFnELOUgVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="159023409"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jul 2025 15:52:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uctvu-000F6n-2Y;
	Fri, 18 Jul 2025 22:52:02 +0000
Date: Sat, 19 Jul 2025 06:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 30/31]
 drivers/hwmon/cros_ec_hwmon.c:49:16: error: variable 'req' has initializer
 but incomplete type
Message-ID: <202507190650.w6es81CY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   3bea98137ca67f6a4458853f7065aa8cf44cacaf
commit: dd083def7b441b0a7ecd430c156090920bbb4f71 [30/31] hwmon: (cros_ec) add PWM control over fans
config: arm-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190650.w6es81CY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190650.w6es81CY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190650.w6es81CY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwmon/cros_ec_hwmon.c: In function 'cros_ec_hwmon_read_pwm_value':
>> drivers/hwmon/cros_ec_hwmon.c:49:16: error: variable 'req' has initializer but incomplete type
      49 |         struct ec_params_pwm_get_fan_duty req = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/cros_ec_hwmon.c:50:18: error: 'struct ec_params_pwm_get_fan_duty' has no member named 'fan_idx'
      50 |                 .fan_idx = index,
         |                  ^~~~~~~
>> drivers/hwmon/cros_ec_hwmon.c:50:28: warning: excess elements in struct initializer
      50 |                 .fan_idx = index,
         |                            ^~~~~
   drivers/hwmon/cros_ec_hwmon.c:50:28: note: (near initialization for 'req')
>> drivers/hwmon/cros_ec_hwmon.c:49:43: error: storage size of 'req' isn't known
      49 |         struct ec_params_pwm_get_fan_duty req = {
         |                                           ^~~
>> drivers/hwmon/cros_ec_hwmon.c:52:45: error: storage size of 'resp' isn't known
      52 |         struct ec_response_pwm_get_fan_duty resp;
         |                                             ^~~~
>> drivers/hwmon/cros_ec_hwmon.c:56:27: error: 'EC_CMD_PWM_GET_FAN_DUTY' undeclared (first use in this function); did you mean 'EC_CMD_PWM_SET_FAN_DUTY'?
      56 |                           EC_CMD_PWM_GET_FAN_DUTY, &req, sizeof(req), &resp, sizeof(resp));
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
         |                           EC_CMD_PWM_SET_FAN_DUTY
   drivers/hwmon/cros_ec_hwmon.c:56:27: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/hwmon/cros_ec_hwmon.c:52:45: warning: unused variable 'resp' [-Wunused-variable]
      52 |         struct ec_response_pwm_get_fan_duty resp;
         |                                             ^~~~
>> drivers/hwmon/cros_ec_hwmon.c:49:43: warning: unused variable 'req' [-Wunused-variable]
      49 |         struct ec_params_pwm_get_fan_duty req = {
         |                                           ^~~
   drivers/hwmon/cros_ec_hwmon.c: In function 'cros_ec_hwmon_read_pwm_enable':
   drivers/hwmon/cros_ec_hwmon.c:67:16: error: variable 'req' has initializer but incomplete type
      67 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/cros_ec_hwmon.c:68:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'cmd'
      68 |                 .cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
         |                  ^~~
>> drivers/hwmon/cros_ec_hwmon.c:68:24: error: 'EC_AUTO_FAN_CONTROL_CMD_GET' undeclared (first use in this function); did you mean 'EC_CHARGE_CONTROL_CMD_GET'?
      68 |                 .cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        EC_CHARGE_CONTROL_CMD_GET
   drivers/hwmon/cros_ec_hwmon.c:68:24: warning: excess elements in struct initializer
   drivers/hwmon/cros_ec_hwmon.c:68:24: note: (near initialization for 'req')
>> drivers/hwmon/cros_ec_hwmon.c:69:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'fan_idx'
      69 |                 .fan_idx = index,
         |                  ^~~~~~~
   drivers/hwmon/cros_ec_hwmon.c:69:28: warning: excess elements in struct initializer
      69 |                 .fan_idx = index,
         |                            ^~~~~
   drivers/hwmon/cros_ec_hwmon.c:69:28: note: (near initialization for 'req')
   drivers/hwmon/cros_ec_hwmon.c:67:43: error: storage size of 'req' isn't known
      67 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                                           ^~~
   drivers/hwmon/cros_ec_hwmon.c:71:45: error: storage size of 'resp' isn't known
      71 |         struct ec_response_auto_fan_control resp;
         |                                             ^~~~
   drivers/hwmon/cros_ec_hwmon.c:71:45: warning: unused variable 'resp' [-Wunused-variable]
   drivers/hwmon/cros_ec_hwmon.c:67:43: warning: unused variable 'req' [-Wunused-variable]
      67 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                                           ^~~
   drivers/hwmon/cros_ec_hwmon.c: In function 'cros_ec_hwmon_write_pwm_enable':
   drivers/hwmon/cros_ec_hwmon.c:215:16: error: variable 'req' has initializer but incomplete type
     215 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/cros_ec_hwmon.c:216:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'fan_idx'
     216 |                 .fan_idx = index,
         |                  ^~~~~~~
   drivers/hwmon/cros_ec_hwmon.c:216:28: warning: excess elements in struct initializer
     216 |                 .fan_idx = index,
         |                            ^~~~~
   drivers/hwmon/cros_ec_hwmon.c:216:28: note: (near initialization for 'req')
   drivers/hwmon/cros_ec_hwmon.c:217:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'cmd'
     217 |                 .cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
         |                  ^~~
>> drivers/hwmon/cros_ec_hwmon.c:217:24: error: 'EC_AUTO_FAN_CONTROL_CMD_SET' undeclared (first use in this function); did you mean 'EC_CHARGE_CONTROL_CMD_SET'?
     217 |                 .cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        EC_CHARGE_CONTROL_CMD_SET
   drivers/hwmon/cros_ec_hwmon.c:217:24: warning: excess elements in struct initializer
   drivers/hwmon/cros_ec_hwmon.c:217:24: note: (near initialization for 'req')
   drivers/hwmon/cros_ec_hwmon.c:215:43: error: storage size of 'req' isn't known
     215 |         struct ec_params_auto_fan_ctrl_v2 req = {
         |                                           ^~~
   drivers/hwmon/cros_ec_hwmon.c:215:43: warning: unused variable 'req' [-Wunused-variable]
   drivers/hwmon/cros_ec_hwmon.c: In function 'cros_ec_hwmon_probe_fan_control_supported':
   drivers/hwmon/cros_ec_hwmon.c:381:50: error: 'EC_CMD_PWM_GET_FAN_DUTY' undeclared (first use in this function); did you mean 'EC_CMD_PWM_SET_FAN_DUTY'?
     381 |         return is_cros_ec_cmd_available(cros_ec, EC_CMD_PWM_GET_FAN_DUTY,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                  EC_CMD_PWM_SET_FAN_DUTY
>> drivers/hwmon/cros_ec_hwmon.c:387:1: warning: control reaches end of non-void function [-Wreturn-type]
     387 | }
         | ^


vim +/req +49 drivers/hwmon/cros_ec_hwmon.c

    46	
    47	static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec, u8 index, u8 *pwm_value)
    48	{
  > 49		struct ec_params_pwm_get_fan_duty req = {
  > 50			.fan_idx = index,
    51		};
  > 52		struct ec_response_pwm_get_fan_duty resp;
    53		int ret;
    54	
    55		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_PWM_GET_FAN_DUTY_CMD_VERSION,
  > 56				  EC_CMD_PWM_GET_FAN_DUTY, &req, sizeof(req), &resp, sizeof(resp));
    57		if (ret < 0)
    58			return ret;
    59	
    60		*pwm_value = (u8)DIV_ROUND_CLOSEST(le32_to_cpu(resp.percent) * 255, 100);
    61		return 0;
    62	}
    63	
    64	static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec, u8 index,
    65						 u8 *control_method)
    66	{
    67		struct ec_params_auto_fan_ctrl_v2 req = {
  > 68			.cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
  > 69			.fan_idx = index,
    70		};
    71		struct ec_response_auto_fan_control resp;
    72		int ret;
    73	
    74		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_THERMAL_AUTO_FAN_CTRL_CMD_VERSION,
    75				  EC_CMD_THERMAL_AUTO_FAN_CTRL, &req, sizeof(req), &resp, sizeof(resp));
    76		if (ret < 0)
    77			return ret;
    78	
    79		*control_method = resp.is_auto ? 2 : 1;
    80		return 0;
    81	}
    82	
    83	static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
    84	{
    85		unsigned int offset;
    86		int ret;
    87	
    88		if (index < EC_TEMP_SENSOR_ENTRIES)
    89			offset = EC_MEMMAP_TEMP_SENSOR + index;
    90		else
    91			offset = EC_MEMMAP_TEMP_SENSOR_B + index - EC_TEMP_SENSOR_ENTRIES;
    92	
    93		ret = cros_ec_cmd_readmem(cros_ec, offset, 1, temp);
    94		if (ret < 0)
    95			return ret;
    96		return 0;
    97	}
    98	
    99	static bool cros_ec_hwmon_is_error_fan(u16 speed)
   100	{
   101		return speed == EC_FAN_SPEED_NOT_PRESENT || speed == EC_FAN_SPEED_STALLED;
   102	}
   103	
   104	static bool cros_ec_hwmon_is_error_temp(u8 temp)
   105	{
   106		return temp == EC_TEMP_SENSOR_NOT_PRESENT     ||
   107		       temp == EC_TEMP_SENSOR_ERROR           ||
   108		       temp == EC_TEMP_SENSOR_NOT_POWERED     ||
   109		       temp == EC_TEMP_SENSOR_NOT_CALIBRATED;
   110	}
   111	
   112	static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
   113	{
   114		return kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
   115	}
   116	
   117	static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
   118				      u32 attr, int channel, long *val)
   119	{
   120		struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
   121		int ret = -EOPNOTSUPP;
   122		u8 control_method;
   123		u8 pwm_value;
   124		u16 speed;
   125		u8 temp;
   126	
   127		if (type == hwmon_fan) {
   128			if (attr == hwmon_fan_input) {
   129				ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
   130				if (ret == 0) {
   131					if (cros_ec_hwmon_is_error_fan(speed))
   132						ret = -ENODATA;
   133					else
   134						*val = speed;
   135				}
   136			} else if (attr == hwmon_fan_fault) {
   137				ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
   138				if (ret == 0)
   139					*val = cros_ec_hwmon_is_error_fan(speed);
   140			}
   141		} else if (type == hwmon_pwm) {
   142			if (attr == hwmon_pwm_enable) {
   143				ret = cros_ec_hwmon_read_pwm_enable(priv->cros_ec, channel,
   144								    &control_method);
   145				if (ret == 0)
   146					*val = control_method;
   147			} else if (attr == hwmon_pwm_input) {
   148				ret = cros_ec_hwmon_read_pwm_value(priv->cros_ec, channel, &pwm_value);
   149				if (ret == 0)
   150					*val = pwm_value;
   151			}
   152		} else if (type == hwmon_temp) {
   153			if (attr == hwmon_temp_input) {
   154				ret = cros_ec_hwmon_read_temp(priv->cros_ec, channel, &temp);
   155				if (ret == 0) {
   156					if (cros_ec_hwmon_is_error_temp(temp))
   157						ret = -ENODATA;
   158					else
   159						*val = cros_ec_hwmon_temp_to_millicelsius(temp);
   160				}
   161			} else if (attr == hwmon_temp_fault) {
   162				ret = cros_ec_hwmon_read_temp(priv->cros_ec, channel, &temp);
   163				if (ret == 0)
   164					*val = cros_ec_hwmon_is_error_temp(temp);
   165			}
   166		}
   167	
   168		return ret;
   169	}
   170	
   171	static int cros_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
   172					     u32 attr, int channel, const char **str)
   173	{
   174		struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
   175	
   176		if (type == hwmon_temp && attr == hwmon_temp_label) {
   177			*str = priv->temp_sensor_names[channel];
   178			return 0;
   179		}
   180	
   181		return -EOPNOTSUPP;
   182	}
   183	
   184	static int cros_ec_hwmon_set_fan_pwm_val(struct cros_ec_device *cros_ec, u8 index, u8 val)
   185	{
   186		struct ec_params_pwm_set_fan_duty_v1 req = {
   187			.fan_idx = index,
   188			.percent = DIV_ROUND_CLOSEST((uint32_t)val * 100, 255),
   189		};
   190		int ret;
   191	
   192		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_PWM_SET_FAN_DUTY_CMD_VERSION,
   193				  EC_CMD_PWM_SET_FAN_DUTY, &req, sizeof(req), NULL, 0);
   194		if (ret < 0)
   195			return ret;
   196		return 0;
   197	}
   198	
   199	static int cros_ec_hwmon_write_pwm_input(struct cros_ec_device *cros_ec, u8 index, u8 val)
   200	{
   201		u8 control_method;
   202		int ret;
   203	
   204		ret = cros_ec_hwmon_read_pwm_enable(cros_ec, index, &control_method);
   205		if (ret)
   206			return ret;
   207		if (control_method != 1)
   208			return -EOPNOTSUPP;
   209	
   210		return cros_ec_hwmon_set_fan_pwm_val(cros_ec, index, val);
   211	}
   212	
   213	static int cros_ec_hwmon_write_pwm_enable(struct cros_ec_device *cros_ec, u8 index, u8 val)
   214	{
   215		struct ec_params_auto_fan_ctrl_v2 req = {
   216			.fan_idx = index,
 > 217			.cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
   218		};
   219		int ret;
   220	
   221		/* No CrOS EC supports no fan speed control */
   222		if (val == 0)
   223			return -EOPNOTSUPP;
   224	
   225		req.set_auto = (val != 1) ? true : false;
   226		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_THERMAL_AUTO_FAN_CTRL_CMD_VERSION,
   227				  EC_CMD_THERMAL_AUTO_FAN_CTRL, &req, sizeof(req), NULL, 0);
   228		if (ret < 0)
   229			return ret;
   230		return 0;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
