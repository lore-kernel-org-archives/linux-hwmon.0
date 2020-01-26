Return-Path: <SRS0=j+xW=3P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84DAC2D0DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Jan 2020 18:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8487120702
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Jan 2020 18:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgAZSvJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Jan 2020 13:51:09 -0500
Received: from mga02.intel.com ([134.134.136.20]:7095 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgAZSvJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Jan 2020 13:51:09 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jan 2020 10:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,366,1574150400"; 
   d="gz'50?scan'50,208,50";a="401154883"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2020 10:50:40 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ivmzY-000EGd-7K; Mon, 27 Jan 2020 02:50:40 +0800
Date:   Mon, 27 Jan 2020 02:49:47 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-playground 37/44]
 drivers/hwmon/pmbus/max20730.c:168:21: error: initialization of 'int
 (*)(struct i2c_client *, int,  int,  int)' from incompatible pointer type
 'int (*)(struct i2c_client *, int,  int)'
Message-ID: <202001270245.yk9gEaY9%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="xcndlwlzbkostgpt"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--xcndlwlzbkostgpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
head:   e8dc30cf9ae936e93319687fa88ed45c55797807
commit: 81a9e2ca8e40ffd25ae444bdd943dba8d3454ffe [37/44] hwmon: (pmbus) Add 'phase' parameter where needed for multi-phase support
config: nds32-randconfig-a001-20200126 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 81a9e2ca8e40ffd25ae444bdd943dba8d3454ffe
        # save the attached .config to linux build tree
        GCC_VERSION=9.2.0 make.cross ARCH=nds32 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/max20730.c:168:21: error: initialization of 'int (*)(struct i2c_client *, int,  int,  int)' from incompatible pointer type 'int (*)(struct i2c_client *, int,  int)' [-Werror=incompatible-pointer-types]
     168 |   .read_word_data = max20730_read_word_data,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/max20730.c:168:21: note: (near initialization for 'max20730_info[0].read_word_data')
   drivers/hwmon/pmbus/max20730.c:206:21: error: initialization of 'int (*)(struct i2c_client *, int,  int,  int)' from incompatible pointer type 'int (*)(struct i2c_client *, int,  int)' [-Werror=incompatible-pointer-types]
     206 |   .read_word_data = max20730_read_word_data,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/max20730.c:206:21: note: (near initialization for 'max20730_info[1].read_word_data')
   drivers/hwmon/pmbus/max20730.c:234:21: error: initialization of 'int (*)(struct i2c_client *, int,  int,  int)' from incompatible pointer type 'int (*)(struct i2c_client *, int,  int)' [-Werror=incompatible-pointer-types]
     234 |   .read_word_data = max20730_read_word_data,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/max20730.c:234:21: note: (near initialization for 'max20730_info[2].read_word_data')
   cc1: some warnings being treated as errors

vim +168 drivers/hwmon/pmbus/max20730.c

cce209581a61d0 Guenter Roeck 2019-12-05  164  
cce209581a61d0 Guenter Roeck 2019-12-05  165  static const struct pmbus_driver_info max20730_info[] = {
cce209581a61d0 Guenter Roeck 2019-12-05  166  	[max20730] = {
cce209581a61d0 Guenter Roeck 2019-12-05  167  		.pages = 1,
cce209581a61d0 Guenter Roeck 2019-12-05 @168  		.read_word_data = max20730_read_word_data,
cce209581a61d0 Guenter Roeck 2019-12-05  169  		.write_word_data = max20730_write_word_data,
cce209581a61d0 Guenter Roeck 2019-12-05  170  
cce209581a61d0 Guenter Roeck 2019-12-05  171  		/* Source : Maxim AN6042 */
cce209581a61d0 Guenter Roeck 2019-12-05  172  		.format[PSC_TEMPERATURE] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  173  		.m[PSC_TEMPERATURE] = 21,
cce209581a61d0 Guenter Roeck 2019-12-05  174  		.b[PSC_TEMPERATURE] = 5887,
cce209581a61d0 Guenter Roeck 2019-12-05  175  		.R[PSC_TEMPERATURE] = -1,
cce209581a61d0 Guenter Roeck 2019-12-05  176  
cce209581a61d0 Guenter Roeck 2019-12-05  177  		.format[PSC_VOLTAGE_IN] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  178  		.m[PSC_VOLTAGE_IN] = 3609,
cce209581a61d0 Guenter Roeck 2019-12-05  179  		.b[PSC_VOLTAGE_IN] = 0,
cce209581a61d0 Guenter Roeck 2019-12-05  180  		.R[PSC_VOLTAGE_IN] = -2,
cce209581a61d0 Guenter Roeck 2019-12-05  181  
cce209581a61d0 Guenter Roeck 2019-12-05  182  		/*
cce209581a61d0 Guenter Roeck 2019-12-05  183  		 * Values in the datasheet are adjusted for temperature and
cce209581a61d0 Guenter Roeck 2019-12-05  184  		 * for the relationship between Vin and Vout.
cce209581a61d0 Guenter Roeck 2019-12-05  185  		 * Unfortunately, the data sheet suggests that Vout measurement
cce209581a61d0 Guenter Roeck 2019-12-05  186  		 * may be scaled with a resistor array. This is indeed the case
cce209581a61d0 Guenter Roeck 2019-12-05  187  		 * at least on the evaulation boards. As a result, any in-driver
cce209581a61d0 Guenter Roeck 2019-12-05  188  		 * adjustments would either be wrong or require elaborate means
cce209581a61d0 Guenter Roeck 2019-12-05  189  		 * to configure the scaling. Instead of doing that, just report
cce209581a61d0 Guenter Roeck 2019-12-05  190  		 * raw values and let userspace handle adjustments.
cce209581a61d0 Guenter Roeck 2019-12-05  191  		 */
cce209581a61d0 Guenter Roeck 2019-12-05  192  		.format[PSC_CURRENT_OUT] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  193  		.m[PSC_CURRENT_OUT] = 153,
cce209581a61d0 Guenter Roeck 2019-12-05  194  		.b[PSC_CURRENT_OUT] = 4976,
cce209581a61d0 Guenter Roeck 2019-12-05  195  		.R[PSC_CURRENT_OUT] = -1,
cce209581a61d0 Guenter Roeck 2019-12-05  196  
cce209581a61d0 Guenter Roeck 2019-12-05  197  		.format[PSC_VOLTAGE_OUT] = linear,
cce209581a61d0 Guenter Roeck 2019-12-05  198  
cce209581a61d0 Guenter Roeck 2019-12-05  199  		.func[0] = PMBUS_HAVE_VIN |
cce209581a61d0 Guenter Roeck 2019-12-05  200  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
cce209581a61d0 Guenter Roeck 2019-12-05  201  			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
cce209581a61d0 Guenter Roeck 2019-12-05  202  			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
cce209581a61d0 Guenter Roeck 2019-12-05  203  	},
cce209581a61d0 Guenter Roeck 2019-12-05  204  	[max20734] = {
cce209581a61d0 Guenter Roeck 2019-12-05  205  		.pages = 1,
cce209581a61d0 Guenter Roeck 2019-12-05  206  		.read_word_data = max20730_read_word_data,
cce209581a61d0 Guenter Roeck 2019-12-05  207  		.write_word_data = max20730_write_word_data,
cce209581a61d0 Guenter Roeck 2019-12-05  208  
cce209581a61d0 Guenter Roeck 2019-12-05  209  		/* Source : Maxim AN6209 */
cce209581a61d0 Guenter Roeck 2019-12-05  210  		.format[PSC_TEMPERATURE] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  211  		.m[PSC_TEMPERATURE] = 21,
cce209581a61d0 Guenter Roeck 2019-12-05  212  		.b[PSC_TEMPERATURE] = 5887,
cce209581a61d0 Guenter Roeck 2019-12-05  213  		.R[PSC_TEMPERATURE] = -1,
cce209581a61d0 Guenter Roeck 2019-12-05  214  
cce209581a61d0 Guenter Roeck 2019-12-05  215  		.format[PSC_VOLTAGE_IN] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  216  		.m[PSC_VOLTAGE_IN] = 3592,
cce209581a61d0 Guenter Roeck 2019-12-05  217  		.b[PSC_VOLTAGE_IN] = 0,
cce209581a61d0 Guenter Roeck 2019-12-05  218  		.R[PSC_VOLTAGE_IN] = -2,
cce209581a61d0 Guenter Roeck 2019-12-05  219  
cce209581a61d0 Guenter Roeck 2019-12-05  220  		.format[PSC_CURRENT_OUT] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  221  		.m[PSC_CURRENT_OUT] = 111,
cce209581a61d0 Guenter Roeck 2019-12-05  222  		.b[PSC_CURRENT_OUT] = 3461,
cce209581a61d0 Guenter Roeck 2019-12-05  223  		.R[PSC_CURRENT_OUT] = -1,
cce209581a61d0 Guenter Roeck 2019-12-05  224  
cce209581a61d0 Guenter Roeck 2019-12-05  225  		.format[PSC_VOLTAGE_OUT] = linear,
cce209581a61d0 Guenter Roeck 2019-12-05  226  
cce209581a61d0 Guenter Roeck 2019-12-05  227  		.func[0] = PMBUS_HAVE_VIN |
cce209581a61d0 Guenter Roeck 2019-12-05  228  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
cce209581a61d0 Guenter Roeck 2019-12-05  229  			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
cce209581a61d0 Guenter Roeck 2019-12-05  230  			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
cce209581a61d0 Guenter Roeck 2019-12-05  231  	},
cce209581a61d0 Guenter Roeck 2019-12-05  232  	[max20743] = {
cce209581a61d0 Guenter Roeck 2019-12-05  233  		.pages = 1,
cce209581a61d0 Guenter Roeck 2019-12-05  234  		.read_word_data = max20730_read_word_data,
cce209581a61d0 Guenter Roeck 2019-12-05  235  		.write_word_data = max20730_write_word_data,
cce209581a61d0 Guenter Roeck 2019-12-05  236  
cce209581a61d0 Guenter Roeck 2019-12-05  237  		/* Source : Maxim AN6042 */
cce209581a61d0 Guenter Roeck 2019-12-05  238  		.format[PSC_TEMPERATURE] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  239  		.m[PSC_TEMPERATURE] = 21,
cce209581a61d0 Guenter Roeck 2019-12-05  240  		.b[PSC_TEMPERATURE] = 5887,
cce209581a61d0 Guenter Roeck 2019-12-05  241  		.R[PSC_TEMPERATURE] = -1,
cce209581a61d0 Guenter Roeck 2019-12-05  242  
cce209581a61d0 Guenter Roeck 2019-12-05  243  		.format[PSC_VOLTAGE_IN] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  244  		.m[PSC_VOLTAGE_IN] = 3597,
cce209581a61d0 Guenter Roeck 2019-12-05  245  		.b[PSC_VOLTAGE_IN] = 0,
cce209581a61d0 Guenter Roeck 2019-12-05  246  		.R[PSC_VOLTAGE_IN] = -2,
cce209581a61d0 Guenter Roeck 2019-12-05  247  
cce209581a61d0 Guenter Roeck 2019-12-05  248  		.format[PSC_CURRENT_OUT] = direct,
cce209581a61d0 Guenter Roeck 2019-12-05  249  		.m[PSC_CURRENT_OUT] = 95,
cce209581a61d0 Guenter Roeck 2019-12-05  250  		.b[PSC_CURRENT_OUT] = 5014,
cce209581a61d0 Guenter Roeck 2019-12-05  251  		.R[PSC_CURRENT_OUT] = -1,
cce209581a61d0 Guenter Roeck 2019-12-05  252  
cce209581a61d0 Guenter Roeck 2019-12-05  253  		.format[PSC_VOLTAGE_OUT] = linear,
cce209581a61d0 Guenter Roeck 2019-12-05  254  
cce209581a61d0 Guenter Roeck 2019-12-05  255  		.func[0] = PMBUS_HAVE_VIN |
cce209581a61d0 Guenter Roeck 2019-12-05  256  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
cce209581a61d0 Guenter Roeck 2019-12-05  257  			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
cce209581a61d0 Guenter Roeck 2019-12-05  258  			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
cce209581a61d0 Guenter Roeck 2019-12-05  259  	},
cce209581a61d0 Guenter Roeck 2019-12-05  260  };
cce209581a61d0 Guenter Roeck 2019-12-05  261  

:::::: The code at line 168 was first introduced by commit
:::::: cce209581a61d01f2b7309bed68d22fd8af34ee4 hwmon: (pmbus) Driver for MAX20730, MAX20734, and MAX20743

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--xcndlwlzbkostgpt
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Q4zx/v8B2jDmdM9iAQA=

--xcndlwlzbkostgpt--
