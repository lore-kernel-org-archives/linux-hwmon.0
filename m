Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:27424 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751052AbcF3Fjm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 30 Jun 2016 01:39:42 -0400
Date: Thu, 30 Jun 2016 13:38:49 +0800
From: kbuild test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kbuild-all@01.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 4/4] hwmon: (lm75) Convert to use regmap
Message-ID: <201606301332.lBDLAatr%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <1467258221-3742-4-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

[auto build test ERROR on hwmon/hwmon-next]
[also build test ERROR on v4.7-rc5 next-20160629]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Guenter-Roeck/hwmon-lm75-Handle-cleanup-with-devm_add_action/20160630-114916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: m32r-m32104ut_defconfig (attached as .config)
compiler: m32r-linux-gcc (GCC) 4.9.0
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=m32r 

All error/warnings (new ones prefixed by >>):

>> drivers/hwmon/lm75.c:198:21: error: variable 'lm75_regmap_config' has initializer but incomplete type
    static const struct regmap_config lm75_regmap_config = {
                        ^
>> drivers/hwmon/lm75.c:199:2: error: unknown field 'reg_bits' specified in initializer
     .reg_bits = 8,
     ^
>> drivers/hwmon/lm75.c:199:2: warning: excess elements in struct initializer
   drivers/hwmon/lm75.c:199:2: warning: (near initialization for 'lm75_regmap_config')
>> drivers/hwmon/lm75.c:200:2: error: unknown field 'val_bits' specified in initializer
     .val_bits = 16,
     ^
   drivers/hwmon/lm75.c:200:2: warning: excess elements in struct initializer
   drivers/hwmon/lm75.c:200:2: warning: (near initialization for 'lm75_regmap_config')
>> drivers/hwmon/lm75.c:201:2: error: unknown field 'max_register' specified in initializer
     .max_register = LM75_REG_MAX,
     ^
   drivers/hwmon/lm75.c:201:2: warning: excess elements in struct initializer
   drivers/hwmon/lm75.c:201:2: warning: (near initialization for 'lm75_regmap_config')
>> drivers/hwmon/lm75.c:202:2: error: unknown field 'writeable_reg' specified in initializer
     .writeable_reg = lm75_is_writeable_reg,
     ^
   drivers/hwmon/lm75.c:202:2: warning: excess elements in struct initializer
   drivers/hwmon/lm75.c:202:2: warning: (near initialization for 'lm75_regmap_config')
>> drivers/hwmon/lm75.c:203:2: error: unknown field 'volatile_reg' specified in initializer
     .volatile_reg = lm75_is_volatile_reg,
     ^
   drivers/hwmon/lm75.c:203:2: warning: excess elements in struct initializer
   drivers/hwmon/lm75.c:203:2: warning: (near initialization for 'lm75_regmap_config')
>> drivers/hwmon/lm75.c:204:2: error: unknown field 'val_format_endian' specified in initializer
     .val_format_endian = REGMAP_ENDIAN_BIG,
     ^
>> drivers/hwmon/lm75.c:204:23: error: 'REGMAP_ENDIAN_BIG' undeclared here (not in a function)
     .val_format_endian = REGMAP_ENDIAN_BIG,
                          ^
   drivers/hwmon/lm75.c:204:2: warning: excess elements in struct initializer
     .val_format_endian = REGMAP_ENDIAN_BIG,
     ^
   drivers/hwmon/lm75.c:204:2: warning: (near initialization for 'lm75_regmap_config')
>> drivers/hwmon/lm75.c:205:2: error: unknown field 'cache_type' specified in initializer
     .cache_type = REGCACHE_RBTREE,
     ^
   drivers/hwmon/lm75.c:205:2: warning: excess elements in struct initializer
   drivers/hwmon/lm75.c:205:2: warning: (near initialization for 'lm75_regmap_config')
>> drivers/hwmon/lm75.c:206:2: error: unknown field 'use_single_rw' specified in initializer
     .use_single_rw = true,
     ^
   drivers/hwmon/lm75.c:206:2: warning: excess elements in struct initializer
   drivers/hwmon/lm75.c:206:2: warning: (near initialization for 'lm75_regmap_config')
   drivers/hwmon/lm75.c: In function 'lm75_probe':
>> drivers/hwmon/lm75.c:238:2: error: implicit declaration of function 'devm_regmap_init_i2c' [-Werror=implicit-function-declaration]
     data->regmap = devm_regmap_init_i2c(client, &lm75_regmap_config);
     ^
>> drivers/hwmon/lm75.c:238:15: warning: assignment makes pointer from integer without a cast
     data->regmap = devm_regmap_init_i2c(client, &lm75_regmap_config);
                  ^
   cc1: some warnings being treated as errors

vim +/lm75_regmap_config +198 drivers/hwmon/lm75.c

   192	
   193	static bool lm75_is_volatile_reg(struct device *dev, unsigned int reg)
   194	{
   195		return reg == LM75_REG_TEMP;
   196	}
   197	
 > 198	static const struct regmap_config lm75_regmap_config = {
 > 199		.reg_bits = 8,
 > 200		.val_bits = 16,
 > 201		.max_register = LM75_REG_MAX,
 > 202		.writeable_reg = lm75_is_writeable_reg,
 > 203		.volatile_reg = lm75_is_volatile_reg,
 > 204		.val_format_endian = REGMAP_ENDIAN_BIG,
 > 205		.cache_type = REGCACHE_RBTREE,
 > 206		.use_single_rw = true,
   207	};
   208	
   209	static void lm75_remove(void *data)
   210	{
   211		struct lm75_data *lm75 = data;
   212		struct i2c_client *client = lm75->client;
   213	
   214		i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
   215	}
   216	
   217	static int
   218	lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
   219	{
   220		struct device *dev = &client->dev;
   221		struct device *hwmon_dev;
   222		struct lm75_data *data;
   223		int status;
   224		u8 set_mask, clr_mask;
   225		int new;
   226		enum lm75_type kind = id->driver_data;
   227	
   228		if (!i2c_check_functionality(client->adapter,
   229				I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
   230			return -EIO;
   231	
   232		data = devm_kzalloc(dev, sizeof(struct lm75_data), GFP_KERNEL);
   233		if (!data)
   234			return -ENOMEM;
   235	
   236		data->client = client;
   237	
 > 238		data->regmap = devm_regmap_init_i2c(client, &lm75_regmap_config);
   239		if (IS_ERR(data->regmap))
   240			return PTR_ERR(data->regmap);
   241	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--IJpNTDwzlM2Ie8A6
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
m9n+HxhsMP0XqgAA

--IJpNTDwzlM2Ie8A6--
