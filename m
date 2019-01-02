Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:39480 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbfABPYw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jan 2019 10:24:52 -0500
Date: Wed, 2 Jan 2019 18:23:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@01.org, Kangjie Lu <kjlu@umn.edu>
Cc: kbuild-all@01.org, kjlu@umn.edu, pakki001@umn.edu,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: lm80: fix a missing check of return value
Message-ID: <20190102152359.GC22256@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181221061304.59684-1-kjlu@umn.edu>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Kangjie,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Kangjie-Lu/hwmon-lm80-fix-a-missing-check-of-return-value/20181222-023000
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next

smatch warnings:
drivers/hwmon/lm80.c:408 set_fan_div() warn: inconsistent returns 'mutex:&data->update_lock'.
  Locked on:   line 397
  Unlocked on: line 367

# https://github.com/0day-ci/linux/commit/7612ba0bef1defb6de3290accca07633ccfd3365
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 7612ba0bef1defb6de3290accca07633ccfd3365
vim +408 drivers/hwmon/lm80.c

^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  348  
1160631b1 drivers/hwmon/lm80.c     Guenter Roeck      2012-01-19  349  /*
1160631b1 drivers/hwmon/lm80.c     Guenter Roeck      2012-01-19  350   * Note: we save and restore the fan minimum here, because its value is
1160631b1 drivers/hwmon/lm80.c     Guenter Roeck      2012-01-19  351   * determined in part by the fan divisor.  This follows the principle of
1160631b1 drivers/hwmon/lm80.c     Guenter Roeck      2012-01-19  352   * least surprise; the user doesn't expect the fan minimum to change just
1160631b1 drivers/hwmon/lm80.c     Guenter Roeck      2012-01-19  353   * because the divisor changed.
1160631b1 drivers/hwmon/lm80.c     Guenter Roeck      2012-01-19  354   */
f8181762a drivers/hwmon/lm80.c     Jean Delvare       2008-01-05  355  static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
f8181762a drivers/hwmon/lm80.c     Jean Delvare       2008-01-05  356  	const char *buf, size_t count)
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  357  {
f8181762a drivers/hwmon/lm80.c     Jean Delvare       2008-01-05  358  	int nr = to_sensor_dev_attr(attr)->index;
118c9a61f drivers/hwmon/lm80.c     Guenter Roeck      2014-04-04  359  	struct lm80_data *data = dev_get_drvdata(dev);
118c9a61f drivers/hwmon/lm80.c     Guenter Roeck      2014-04-04  360  	struct i2c_client *client = data->client;
6a9e7c4c0 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-10  361  	unsigned long min, val;
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  362  	u8 reg;
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  363  	int ret;
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  364  
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  365  	ret = kstrtoul(buf, 10, &val);
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  366  	if (ret < 0)
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  367  		return ret;
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  368  
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  369  	/* Save fan_min */
9a61bf630 drivers/hwmon/lm80.c     Ingo Molnar        2006-01-18  370  	mutex_lock(&data->update_lock);
85b3ee07b drivers/hwmon/lm80.c     Guenter Roeck      2014-04-13  371  	min = FAN_FROM_REG(data->fan[f_min][nr],
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  372  			   DIV_FROM_REG(data->fan_div[nr]));
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  373  
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  374  	switch (val) {
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  375  	case 1:
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  376  		data->fan_div[nr] = 0;
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  377  		break;
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  378  	case 2:
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  379  		data->fan_div[nr] = 1;
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  380  		break;
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  381  	case 4:
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  382  		data->fan_div[nr] = 2;
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  383  		break;
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  384  	case 8:
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  385  		data->fan_div[nr] = 3;
66b3b1f75 drivers/hwmon/lm80.c     Frans Meulenbroeks 2012-01-04  386  		break;
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  387  	default:
118c9a61f drivers/hwmon/lm80.c     Guenter Roeck      2014-04-04  388  		dev_err(dev,
b55f37572 drivers/hwmon/lm80.c     Guenter Roeck      2013-01-10  389  			"fan_div value %ld not supported. Choose one of 1, 2, 4 or 8!\n",
b55f37572 drivers/hwmon/lm80.c     Guenter Roeck      2013-01-10  390  			val);
9a61bf630 drivers/hwmon/lm80.c     Ingo Molnar        2006-01-18  391  		mutex_unlock(&data->update_lock);
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  392  		return -EINVAL;
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  393  	}
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  394  
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  395  	ret = lm80_read_value(client, LM80_REG_FANDIV);
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  396  	if (ret < 0)
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  397  		return ret;
                                                                                ^^^^^^^^^^
Need to drop the lock before returning.

7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  398  	reg = (ret & ~(3 << (2 * (nr + 1))))
7612ba0be drivers/hwmon/lm80.c     Kangjie Lu         2018-12-21  399  	      | (data->fan_div[nr] << (2 * (nr + 1)));
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  400  	lm80_write_value(client, LM80_REG_FANDIV, reg);
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  401  
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  402  	/* Restore fan_min */
85b3ee07b drivers/hwmon/lm80.c     Guenter Roeck      2014-04-13  403  	data->fan[f_min][nr] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
85b3ee07b drivers/hwmon/lm80.c     Guenter Roeck      2014-04-13  404  	lm80_write_value(client, LM80_REG_FAN_MIN(nr + 1),
85b3ee07b drivers/hwmon/lm80.c     Guenter Roeck      2014-04-13  405  			 data->fan[f_min][nr]);
9a61bf630 drivers/hwmon/lm80.c     Ingo Molnar        2006-01-18  406  	mutex_unlock(&data->update_lock);
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  407  
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16 @408  	return count;
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  409  }
^1da177e4 drivers/i2c/chips/lm80.c Linus Torvalds     2005-04-16  410  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
