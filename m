Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F5EC433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Jan 2021 01:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B60442310A
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Jan 2021 01:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbhANB2i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Jan 2021 20:28:38 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:61994 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbhANB2X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jan 2021 20:28:23 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 10E1MC3D014330;
        Thu, 14 Jan 2021 09:22:12 +0800 (GMT-8)
        (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 Jan
 2021 09:27:13 +0800
Date:   Thu, 14 Jan 2021 01:27:10 +0000
From:   Troy Lee <troy_lee@aspeedtech.com>
To:     kernel test robot <lkp@intel.com>
CC:     "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>
Subject: Re: [PATCH v2 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Message-ID: <20210114012710.GA2151879@aspeedtech.com>
References: <20210113070850.1184506-5-troy_lee@aspeedtech.com>
 <202101131734.BEMXz6Wq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <202101131734.BEMXz6Wq-lkp@intel.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10E1MC3D014330
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Kernel test robot,
The 01/13/2021 17:48, kernel test robot wrote:
> Hi Troy,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on hwmon/hwmon-next]
> [also build test WARNING on joel-aspeed/for-next v5.11-rc3 next-20210113]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Troy-Lee/hwmon-aspeed2600-pwm-tacho-Add-driver-support/20210113-151325
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: sparc-randconfig-r021-20210113 (attached as .config)
> compiler: sparc-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/19a51124badf28349d26657b611da77d5dfba2f1
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Troy-Lee/hwmon-aspeed2600-pwm-tacho-Add-driver-support/20210113-151325
>         git checkout 19a51124badf28349d26657b611da77d5dfba2f1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sparc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/hwmon/aspeed2600-pwm-tacho.c:581:5: warning: no previous prototype for 'aspeed_pwm_tacho_read' [-Wmissing-prototypes]
>      581 | int aspeed_pwm_tacho_read(struct device *dev, enum hwmon_sensor_types type,
>          |     ^~~~~~~~~~~~~~~~~~~~~
> >> drivers/hwmon/aspeed2600-pwm-tacho.c:615:5: warning: no previous prototype for 'aspeed_pwm_tacho_write' [-Wmissing-prototypes]
>      615 | int aspeed_pwm_tacho_write(struct device *dev, enum hwmon_sensor_types type,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
Good catch, I'll fix it in v3 patch set.

> 
> 
> vim +/aspeed_pwm_tacho_read +581 drivers/hwmon/aspeed2600-pwm-tacho.c
> 
>    580	
>  > 581	int aspeed_pwm_tacho_read(struct device *dev, enum hwmon_sensor_types type,
>    582				u32 attr, int channel, long *val)
>    583	{
>    584		struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
>    585		long rpm;
>    586	
>    587		switch (type) {
>    588		case hwmon_pwm:
>    589			switch (attr) {
>    590			case hwmon_pwm_input:
>    591				*val = priv->pwm_channel[channel].falling;
>    592				break;
>    593			default:
>    594				return -EOPNOTSUPP;
>    595			}
>    596			break;
>    597		case hwmon_fan:
>    598			switch (attr) {
>    599			case hwmon_fan_input:
>    600				rpm = aspeed_get_fan_tach_ch_rpm(dev, priv, channel);
>    601				if (rpm < 0)
>    602					return rpm;
>    603				*val = rpm;
>    604				break;
>    605			default:
>    606				return -EOPNOTSUPP;
>    607			}
>    608			break;
>    609		default:
>    610			return -EOPNOTSUPP;
>    611		}
>    612		return 0;
>    613	}
>    614	
>  > 615	int aspeed_pwm_tacho_write(struct device *dev, enum hwmon_sensor_types type,
>    616				u32 attr, int channel, long val)
>    617	{
>    618		switch (type) {
>    619		case hwmon_pwm:
>    620			switch (attr) {
>    621			case hwmon_pwm_input:
>    622				return set_pwm(dev, channel, val);
>    623			default:
>    624				return -EOPNOTSUPP;
>    625			}
>    626			break;
>    627		default:
>    628			return -EOPNOTSUPP;
>    629		}
>    630		return -EOPNOTSUPP;
>    631	}
>    632	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Thanks,
Troy Lee
