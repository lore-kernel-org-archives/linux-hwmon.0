Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB7DC10F03
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 20:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B35B217D9
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 20:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfDWUJt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 16:09:49 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:4475 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725956AbfDWUJt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 16:09:49 -0400
X-IronPort-AV: E=Sophos;i="5.60,386,1549926000"; 
   d="scan'208";a="379895794"
Received: from abo-75-106-68.mrs.modulonet.fr (HELO hadrien) ([85.68.106.75])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Apr 2019 22:09:45 +0200
Date:   Tue, 23 Apr 2019 22:09:45 +0200 (CEST)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Guenter Roeck <linux@roeck-us.net>
cc:     linux-hwmon@vger.kernel.org, kbuild-all@01.org
Subject: [hwmon:hwmon-playground 130/134] drivers/hwmon/max6650.c:632:4-10:
 preceding lock on line 616 (fwd)
Message-ID: <alpine.DEB.2.21.1904232208420.2470@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

It looks like a goto may be wanted on line 632.

julia

---------- Forwarded message ----------
Date: Wed, 24 Apr 2019 03:38:39 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [hwmon:hwmon-playground 130/134] drivers/hwmon/max6650.c:632:4-10:
    preceding lock on line 616

CC: kbuild-all@01.org
CC: linux-hwmon@vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
head:   05d763050bbaa40daa4b60a3912c9311ca5791a5
commit: 77d270a1d4db919db0b02fec1d85ad5a57d556d7 [130/134] hwmon: (max6650) Convert to use devm_hwmon_device_register_with_info
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


>> drivers/hwmon/max6650.c:632:4-10: preceding lock on line 616

# https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=77d270a1d4db919db0b02fec1d85ad5a57d556d7
git remote add hwmon https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
git remote update hwmon
git checkout 77d270a1d4db919db0b02fec1d85ad5a57d556d7
vim +632 drivers/hwmon/max6650.c

77d270a1d Guenter Roeck 2019-04-20  608
77d270a1d Guenter Roeck 2019-04-20  609  static int max6650_write(struct device *dev, enum hwmon_sensor_types type,
77d270a1d Guenter Roeck 2019-04-20  610  			 u32 attr, int channel, long val)
77d270a1d Guenter Roeck 2019-04-20  611  {
77d270a1d Guenter Roeck 2019-04-20  612  	struct max6650_data *data = dev_get_drvdata(dev);
77d270a1d Guenter Roeck 2019-04-20  613  	int ret = 0;
77d270a1d Guenter Roeck 2019-04-20  614  	u8 reg;
77d270a1d Guenter Roeck 2019-04-20  615
77d270a1d Guenter Roeck 2019-04-20 @616  	mutex_lock(&data->update_lock);
77d270a1d Guenter Roeck 2019-04-20  617
77d270a1d Guenter Roeck 2019-04-20  618  	switch (type) {
77d270a1d Guenter Roeck 2019-04-20  619  	case hwmon_pwm:
77d270a1d Guenter Roeck 2019-04-20  620  		switch (attr) {
77d270a1d Guenter Roeck 2019-04-20  621  		case hwmon_pwm_input:
77d270a1d Guenter Roeck 2019-04-20  622  			reg = pwm_to_dac(clamp_val(val, 0, 255),
77d270a1d Guenter Roeck 2019-04-20  623  					 data->config & MAX6650_CFG_V12);
77d270a1d Guenter Roeck 2019-04-20  624  			ret = i2c_smbus_write_byte_data(data->client,
77d270a1d Guenter Roeck 2019-04-20  625  							MAX6650_REG_DAC, reg);
77d270a1d Guenter Roeck 2019-04-20  626  			if (ret)
77d270a1d Guenter Roeck 2019-04-20  627  				break;
77d270a1d Guenter Roeck 2019-04-20  628  			data->dac = reg;
77d270a1d Guenter Roeck 2019-04-20  629  			break;
77d270a1d Guenter Roeck 2019-04-20  630  		case hwmon_pwm_enable:
77d270a1d Guenter Roeck 2019-04-20  631  			if (val < 0 || val >= ARRAY_SIZE(max6650_pwm_modes))
77d270a1d Guenter Roeck 2019-04-20 @632  				return -EINVAL;
77d270a1d Guenter Roeck 2019-04-20  633  			ret = max6650_set_operating_mode(data,
77d270a1d Guenter Roeck 2019-04-20  634  						max6650_pwm_modes[val]);
77d270a1d Guenter Roeck 2019-04-20  635  			break;
77d270a1d Guenter Roeck 2019-04-20  636  		default:
77d270a1d Guenter Roeck 2019-04-20  637  			ret = -EOPNOTSUPP;
77d270a1d Guenter Roeck 2019-04-20  638  			break;
77d270a1d Guenter Roeck 2019-04-20  639  		}
77d270a1d Guenter Roeck 2019-04-20  640  	case hwmon_fan:
77d270a1d Guenter Roeck 2019-04-20  641  		switch (attr) {
77d270a1d Guenter Roeck 2019-04-20  642  		case hwmon_fan_div:
77d270a1d Guenter Roeck 2019-04-20  643  			switch (val) {
77d270a1d Guenter Roeck 2019-04-20  644  			case 1:
77d270a1d Guenter Roeck 2019-04-20  645  				reg = 0;
77d270a1d Guenter Roeck 2019-04-20  646  				break;
77d270a1d Guenter Roeck 2019-04-20  647  			case 2:
77d270a1d Guenter Roeck 2019-04-20  648  				reg = 1;
77d270a1d Guenter Roeck 2019-04-20  649  				break;
77d270a1d Guenter Roeck 2019-04-20  650  			case 4:
77d270a1d Guenter Roeck 2019-04-20  651  				reg = 2;
77d270a1d Guenter Roeck 2019-04-20  652  				break;
77d270a1d Guenter Roeck 2019-04-20  653  			case 8:
77d270a1d Guenter Roeck 2019-04-20  654  				reg = 3;
77d270a1d Guenter Roeck 2019-04-20  655  				break;
77d270a1d Guenter Roeck 2019-04-20  656  			default:
77d270a1d Guenter Roeck 2019-04-20  657  				ret = -EINVAL;
77d270a1d Guenter Roeck 2019-04-20  658  				goto error;
77d270a1d Guenter Roeck 2019-04-20  659  			}
77d270a1d Guenter Roeck 2019-04-20  660  			ret = i2c_smbus_write_byte_data(data->client,
77d270a1d Guenter Roeck 2019-04-20  661  							MAX6650_REG_COUNT, reg);
77d270a1d Guenter Roeck 2019-04-20  662  			if (ret)
77d270a1d Guenter Roeck 2019-04-20  663  				break;
77d270a1d Guenter Roeck 2019-04-20  664  			data->count = reg;
77d270a1d Guenter Roeck 2019-04-20  665  			break;
77d270a1d Guenter Roeck 2019-04-20  666  		case hwmon_fan_target:
77d270a1d Guenter Roeck 2019-04-20  667  			if (val < 0) {
77d270a1d Guenter Roeck 2019-04-20  668  				ret = -EINVAL;
77d270a1d Guenter Roeck 2019-04-20  669  				break;
77d270a1d Guenter Roeck 2019-04-20  670  			}
77d270a1d Guenter Roeck 2019-04-20  671  			ret = max6650_set_target(data, val);
77d270a1d Guenter Roeck 2019-04-20  672  			break;
77d270a1d Guenter Roeck 2019-04-20  673  		default:
77d270a1d Guenter Roeck 2019-04-20  674  			ret = -EOPNOTSUPP;
77d270a1d Guenter Roeck 2019-04-20  675  			break;
77d270a1d Guenter Roeck 2019-04-20  676  		}
77d270a1d Guenter Roeck 2019-04-20  677  		break;
77d270a1d Guenter Roeck 2019-04-20  678  	default:
77d270a1d Guenter Roeck 2019-04-20  679  		ret = -EOPNOTSUPP;
77d270a1d Guenter Roeck 2019-04-20  680  		break;
77d270a1d Guenter Roeck 2019-04-20  681  	}
77d270a1d Guenter Roeck 2019-04-20  682
77d270a1d Guenter Roeck 2019-04-20  683  error:
77d270a1d Guenter Roeck 2019-04-20  684  	mutex_unlock(&data->update_lock);
77d270a1d Guenter Roeck 2019-04-20  685  	return ret;
77d270a1d Guenter Roeck 2019-04-20  686  }
77d270a1d Guenter Roeck 2019-04-20  687

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
