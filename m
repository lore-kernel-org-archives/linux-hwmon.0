Return-Path: <SRS0=j+xW=3P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86542C2D0DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Jan 2020 16:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C9322071A
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Jan 2020 16:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgAZQrS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Jan 2020 11:47:18 -0500
Received: from mga14.intel.com ([192.55.52.115]:2126 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgAZQrS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Jan 2020 11:47:18 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jan 2020 08:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,366,1574150400"; 
   d="gz'50?scan'50,208,50";a="375953929"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2020 08:47:15 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ivl46-0006UO-SK; Mon, 27 Jan 2020 00:47:14 +0800
Date:   Mon, 27 Jan 2020 00:46:37 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-playground 38/44]
 drivers/hwmon/pmbus/pmbus_core.c:159:2: note: in expansion of macro 'if'
Message-ID: <202001270035.dG6OCZRa%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jjayssztlzgatkxz"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--jjayssztlzgatkxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
head:   e8dc30cf9ae936e93319687fa88ed45c55797807
commit: e9036c751c0918fdac1a927e8b52d5fb4e4d926a [38/44] hwmon: (pmbus) Implement multi-phase support
config: arm-randconfig-a001-20200126 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e9036c751c0918fdac1a927e8b52d5fb4e4d926a
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11:0,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/hwmon/pmbus/pmbus_core.c:9:
   drivers/hwmon/pmbus/pmbus_core.c: In function 'pmbus_set_page':
   drivers/hwmon/pmbus/pmbus_core.c:160:10: error: 'struct pmbus_data' has no member named 'pages'
         data->pages > 1 & page != data->currpage) {
             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers/hwmon/pmbus/pmbus_core.c:159:2: note: in expansion of macro 'if'
     if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
     ^~
   drivers/hwmon/pmbus/pmbus_core.c:160:10: error: 'struct pmbus_data' has no member named 'pages'
         data->pages > 1 & page != data->currpage) {
             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
>> drivers/hwmon/pmbus/pmbus_core.c:159:2: note: in expansion of macro 'if'
     if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
     ^~
   drivers/hwmon/pmbus/pmbus_core.c:160:10: error: 'struct pmbus_data' has no member named 'pages'
         data->pages > 1 & page != data->currpage) {
             ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/pmbus_core.c:159:2: note: in expansion of macro 'if'
     if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
     ^~
   drivers/hwmon/pmbus/pmbus_core.c:174:10: error: 'struct pmbus_data' has no member named 'phases'
     if (data->phases && data->currphase != phase &&
             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
   drivers/hwmon/pmbus/pmbus_core.c:174:2: note: in expansion of macro 'if'
     if (data->phases && data->currphase != phase &&
     ^~
   drivers/hwmon/pmbus/pmbus_core.c:174:10: error: 'struct pmbus_data' has no member named 'phases'
     if (data->phases && data->currphase != phase &&
             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
   drivers/hwmon/pmbus/pmbus_core.c:174:2: note: in expansion of macro 'if'
     if (data->phases && data->currphase != phase &&
     ^~
   drivers/hwmon/pmbus/pmbus_core.c:174:10: error: 'struct pmbus_data' has no member named 'phases'
     if (data->phases && data->currphase != phase &&
             ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:174:2: note: in expansion of macro 'if'
     if (data->phases && data->currphase != phase &&
     ^~

vim +/if +159 drivers/hwmon/pmbus/pmbus_core.c

   > 9	#include <linux/debugfs.h>
    10	#include <linux/kernel.h>
    11	#include <linux/math64.h>
    12	#include <linux/module.h>
    13	#include <linux/init.h>
    14	#include <linux/err.h>
    15	#include <linux/slab.h>
    16	#include <linux/i2c.h>
    17	#include <linux/hwmon.h>
    18	#include <linux/hwmon-sysfs.h>
    19	#include <linux/jiffies.h>
    20	#include <linux/pmbus.h>
    21	#include <linux/regulator/driver.h>
    22	#include <linux/regulator/machine.h>
    23	#include "pmbus.h"
    24	
    25	/*
    26	 * Number of additional attribute pointers to allocate
    27	 * with each call to krealloc
    28	 */
    29	#define PMBUS_ATTR_ALLOC_SIZE	32
    30	
    31	/*
    32	 * Index into status register array, per status register group
    33	 */
    34	#define PB_STATUS_BASE		0
    35	#define PB_STATUS_VOUT_BASE	(PB_STATUS_BASE + PMBUS_PAGES)
    36	#define PB_STATUS_IOUT_BASE	(PB_STATUS_VOUT_BASE + PMBUS_PAGES)
    37	#define PB_STATUS_FAN_BASE	(PB_STATUS_IOUT_BASE + PMBUS_PAGES)
    38	#define PB_STATUS_FAN34_BASE	(PB_STATUS_FAN_BASE + PMBUS_PAGES)
    39	#define PB_STATUS_TEMP_BASE	(PB_STATUS_FAN34_BASE + PMBUS_PAGES)
    40	#define PB_STATUS_INPUT_BASE	(PB_STATUS_TEMP_BASE + PMBUS_PAGES)
    41	#define PB_STATUS_VMON_BASE	(PB_STATUS_INPUT_BASE + 1)
    42	
    43	#define PB_NUM_STATUS_REG	(PB_STATUS_VMON_BASE + 1)
    44	
    45	#define PMBUS_NAME_SIZE		24
    46	
    47	struct pmbus_sensor {
    48		struct pmbus_sensor *next;
    49		char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
    50		struct device_attribute attribute;
    51		u8 page;		/* page number */
    52		u8 phase;		/* phase number, 0xff for all phases */
    53		u16 reg;		/* register */
    54		enum pmbus_sensor_classes class;	/* sensor class */
    55		bool update;		/* runtime sensor update needed */
    56		bool convert;		/* Whether or not to apply linear/vid/direct */
    57		int data;		/* Sensor data.
    58					   Negative if there was a read error */
    59	};
    60	#define to_pmbus_sensor(_attr) \
    61		container_of(_attr, struct pmbus_sensor, attribute)
    62	
    63	struct pmbus_boolean {
    64		char name[PMBUS_NAME_SIZE];	/* sysfs boolean name */
    65		struct sensor_device_attribute attribute;
    66		struct pmbus_sensor *s1;
    67		struct pmbus_sensor *s2;
    68	};
    69	#define to_pmbus_boolean(_attr) \
    70		container_of(_attr, struct pmbus_boolean, attribute)
    71	
    72	struct pmbus_label {
    73		char name[PMBUS_NAME_SIZE];	/* sysfs label name */
    74		struct device_attribute attribute;
    75		char label[PMBUS_NAME_SIZE];	/* label */
    76	};
    77	#define to_pmbus_label(_attr) \
    78		container_of(_attr, struct pmbus_label, attribute)
    79	
    80	struct pmbus_data {
    81		struct device *dev;
    82		struct device *hwmon_dev;
    83	
    84		u32 flags;		/* from platform data */
    85	
    86		int exponent[PMBUS_PAGES];
    87					/* linear mode: exponent for output voltages */
    88	
    89		const struct pmbus_driver_info *info;
    90	
    91		int max_attributes;
    92		int num_attributes;
    93		struct attribute_group group;
    94		const struct attribute_group **groups;
    95		struct dentry *debugfs;		/* debugfs device directory */
    96	
    97		struct pmbus_sensor *sensors;
    98	
    99		struct mutex update_lock;
   100		bool valid;
   101		unsigned long last_updated;	/* in jiffies */
   102	
   103		/*
   104		 * A single status register covers multiple attributes,
   105		 * so we keep them all together.
   106		 */
   107		u16 status[PB_NUM_STATUS_REG];
   108	
   109		bool has_status_word;		/* device uses STATUS_WORD register */
   110		int (*read_status)(struct i2c_client *client, int page);
   111	
   112		u8 currpage;
   113		u8 currphase;	/* current phase, 0xff for all */
   114	};
   115	
   116	struct pmbus_debugfs_entry {
   117		struct i2c_client *client;
   118		u8 page;
   119		u8 reg;
   120	};
   121	
   122	static const int pmbus_fan_rpm_mask[] = {
   123		PB_FAN_1_RPM,
   124		PB_FAN_2_RPM,
   125		PB_FAN_1_RPM,
   126		PB_FAN_2_RPM,
   127	};
   128	
   129	static const int pmbus_fan_config_registers[] = {
   130		PMBUS_FAN_CONFIG_12,
   131		PMBUS_FAN_CONFIG_12,
   132		PMBUS_FAN_CONFIG_34,
   133		PMBUS_FAN_CONFIG_34
   134	};
   135	
   136	static const int pmbus_fan_command_registers[] = {
   137		PMBUS_FAN_COMMAND_1,
   138		PMBUS_FAN_COMMAND_2,
   139		PMBUS_FAN_COMMAND_3,
   140		PMBUS_FAN_COMMAND_4,
   141	};
   142	
   143	void pmbus_clear_cache(struct i2c_client *client)
   144	{
   145		struct pmbus_data *data = i2c_get_clientdata(client);
   146	
   147		data->valid = false;
   148	}
   149	EXPORT_SYMBOL_GPL(pmbus_clear_cache);
   150	
   151	int pmbus_set_page(struct i2c_client *client, int page, int phase)
   152	{
   153		struct pmbus_data *data = i2c_get_clientdata(client);
   154		int rv;
   155	
   156		if (page < 0)
   157			return 0;
   158	
 > 159		if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
   160		    data->pages > 1 & page != data->currpage) {
   161			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
   162			if (rv < 0)
   163				return rv;
   164	
   165			rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
   166			if (rv < 0)
   167				return rv;
   168	
   169			if (rv != page)
   170				return -EIO;
   171		}
   172		data->currpage = page;
   173	
   174		if (data->phases && data->currphase != phase &&
   175		    !(data->info->pfunc[phase] & PMBUS_PHASE_VIRTUAL)) {
   176			rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
   177						       phase);
   178			if (rv)
   179				return rv;
   180		}
   181		data->currphase = phase;
   182	
   183		return 0;
   184	}
   185	EXPORT_SYMBOL_GPL(pmbus_set_page);
   186	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--jjayssztlzgatkxz
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
4t8szp5Tk2Avvmj8D64wuLLW7wEA

--jjayssztlzgatkxz--
