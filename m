Return-Path: <dan.carpenter@oracle.com>
Return-path: <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 14:37:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@01.org, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: kbuild-all@01.org, jdelvare@suse.com, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: (core) Inherit power properties to hdev
Message-ID: <20181018113743.lafgvpc43bickkln@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017012426.26958-2-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Nicolin,

I love your patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Nicolin-Chen/hwmon-ina3221-Implement-PM-runtime-to-save-power/20181018-010754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next

smatch warnings:
drivers/hwmon/hwmon.c:631 __hwmon_device_register() warn: variable dereferenced before check 'dev' (see line 628)

# https://github.com/0day-ci/linux/commit/aa912316f2d30d4e699ac2f11b6197a4da011274
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout aa912316f2d30d4e699ac2f11b6197a4da011274
vim +/dev +631 drivers/hwmon/hwmon.c

d560168b Guenter Roeck    2015-08-26  562  
d560168b Guenter Roeck    2015-08-26  563  static struct device *
d560168b Guenter Roeck    2015-08-26  564  __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
d560168b Guenter Roeck    2015-08-26  565  			const struct hwmon_chip_info *chip,
bab2243c Guenter Roeck    2013-07-06  566  			const struct attribute_group **groups)
1236441f Mark M. Hoffman  2005-07-15  567  {
bab2243c Guenter Roeck    2013-07-06  568  	struct hwmon_device *hwdev;
d560168b Guenter Roeck    2015-08-26  569  	struct device *hdev;
d560168b Guenter Roeck    2015-08-26  570  	int i, j, err, id;
ded2b666 Mark M. Hoffman  2006-03-05  571  
74d3b641 Guenter Roeck    2017-01-27  572  	/* Complain about invalid characters in hwmon name attribute */
648cd48c Guenter Roeck    2014-02-28  573  	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
74d3b641 Guenter Roeck    2017-01-27  574  		dev_warn(dev,
74d3b641 Guenter Roeck    2017-01-27  575  			 "hwmon: '%s' is not a valid name attribute, please fix\n",
74d3b641 Guenter Roeck    2017-01-27  576  			 name);
648cd48c Guenter Roeck    2014-02-28  577  
4ca5f468 Jonathan Cameron 2011-10-31  578  	id = ida_simple_get(&hwmon_ida, 0, 0, GFP_KERNEL);
4ca5f468 Jonathan Cameron 2011-10-31  579  	if (id < 0)
4ca5f468 Jonathan Cameron 2011-10-31  580  		return ERR_PTR(id);
1236441f Mark M. Hoffman  2005-07-15  581  
bab2243c Guenter Roeck    2013-07-06  582  	hwdev = kzalloc(sizeof(*hwdev), GFP_KERNEL);
bab2243c Guenter Roeck    2013-07-06  583  	if (hwdev == NULL) {
bab2243c Guenter Roeck    2013-07-06  584  		err = -ENOMEM;
bab2243c Guenter Roeck    2013-07-06  585  		goto ida_remove;
bab2243c Guenter Roeck    2013-07-06  586  	}
1236441f Mark M. Hoffman  2005-07-15  587  
d560168b Guenter Roeck    2015-08-26  588  	hdev = &hwdev->dev;
d560168b Guenter Roeck    2015-08-26  589  
239552f4 Guenter Roeck    2016-10-16  590  	if (chip) {
d560168b Guenter Roeck    2015-08-26  591  		struct attribute **attrs;
b2a4cc3a Guenter Roeck    2016-10-16  592  		int ngroups = 2; /* terminating NULL plus &hwdev->groups */
d560168b Guenter Roeck    2015-08-26  593  
d560168b Guenter Roeck    2015-08-26  594  		if (groups)
d560168b Guenter Roeck    2015-08-26  595  			for (i = 0; groups[i]; i++)
d560168b Guenter Roeck    2015-08-26  596  				ngroups++;
d560168b Guenter Roeck    2015-08-26  597  
d560168b Guenter Roeck    2015-08-26  598  		hwdev->groups = devm_kcalloc(dev, ngroups, sizeof(*groups),
d560168b Guenter Roeck    2015-08-26  599  					     GFP_KERNEL);
38d8ed65 Colin Ian King   2016-10-23  600  		if (!hwdev->groups) {
38d8ed65 Colin Ian King   2016-10-23  601  			err = -ENOMEM;
38d8ed65 Colin Ian King   2016-10-23  602  			goto free_hwmon;
38d8ed65 Colin Ian King   2016-10-23  603  		}
d560168b Guenter Roeck    2015-08-26  604  
d560168b Guenter Roeck    2015-08-26  605  		attrs = __hwmon_create_attrs(dev, drvdata, chip);
d560168b Guenter Roeck    2015-08-26  606  		if (IS_ERR(attrs)) {
d560168b Guenter Roeck    2015-08-26  607  			err = PTR_ERR(attrs);
d560168b Guenter Roeck    2015-08-26  608  			goto free_hwmon;
d560168b Guenter Roeck    2015-08-26  609  		}
d560168b Guenter Roeck    2015-08-26  610  
d560168b Guenter Roeck    2015-08-26  611  		hwdev->group.attrs = attrs;
d560168b Guenter Roeck    2015-08-26  612  		ngroups = 0;
d560168b Guenter Roeck    2015-08-26  613  		hwdev->groups[ngroups++] = &hwdev->group;
d560168b Guenter Roeck    2015-08-26  614  
d560168b Guenter Roeck    2015-08-26  615  		if (groups) {
d560168b Guenter Roeck    2015-08-26  616  			for (i = 0; groups[i]; i++)
d560168b Guenter Roeck    2015-08-26  617  				hwdev->groups[ngroups++] = groups[i];
d560168b Guenter Roeck    2015-08-26  618  		}
d560168b Guenter Roeck    2015-08-26  619  
d560168b Guenter Roeck    2015-08-26  620  		hdev->groups = hwdev->groups;
d560168b Guenter Roeck    2015-08-26  621  	} else {
d560168b Guenter Roeck    2015-08-26  622  		hdev->groups = groups;
d560168b Guenter Roeck    2015-08-26  623  	}
d560168b Guenter Roeck    2015-08-26  624  
bab2243c Guenter Roeck    2013-07-06  625  	hwdev->name = name;
d560168b Guenter Roeck    2015-08-26  626  	hdev->class = &hwmon_class;
d560168b Guenter Roeck    2015-08-26  627  	hdev->parent = dev;
aa912316 Nicolin Chen     2018-10-16 @628  	hdev->driver = dev->driver;
                                                               ^^^^^^^^^^^
aa912316 Nicolin Chen     2018-10-16  629  	hdev->power = dev->power;
                                                              ^^^^^^^^^^
aa912316 Nicolin Chen     2018-10-16  630  	hdev->pm_domain = dev->pm_domain;
                                                                  ^^^^^^^^^^^^^^
The patch adds unchecked dereferences.

d560168b Guenter Roeck    2015-08-26 @631  	hdev->of_node = dev ? dev->of_node : NULL;
                                                                ^^^
The old code checks for NULL.

d560168b Guenter Roeck    2015-08-26  632  	hwdev->chip = chip;
d560168b Guenter Roeck    2015-08-26  633  	dev_set_drvdata(hdev, drvdata);
d560168b Guenter Roeck    2015-08-26  634  	dev_set_name(hdev, HWMON_ID_FORMAT, id);
d560168b Guenter Roeck    2015-08-26  635  	err = device_register(hdev);
bab2243c Guenter Roeck    2013-07-06  636  	if (err)
d560168b Guenter Roeck    2015-08-26  637  		goto free_hwmon;
d560168b Guenter Roeck    2015-08-26  638  
319fe159 Guenter Roeck    2017-01-31  639  	if (dev && chip && chip->ops->read &&
d560168b Guenter Roeck    2015-08-26  640  	    chip->info[0]->type == hwmon_chip &&
d560168b Guenter Roeck    2015-08-26  641  	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
d560168b Guenter Roeck    2015-08-26  642  		const struct hwmon_channel_info **info = chip->info;
d560168b Guenter Roeck    2015-08-26  643  
d560168b Guenter Roeck    2015-08-26  644  		for (i = 1; info[i]; i++) {
d560168b Guenter Roeck    2015-08-26  645  			if (info[i]->type != hwmon_temp)
d560168b Guenter Roeck    2015-08-26  646  				continue;
d560168b Guenter Roeck    2015-08-26  647  
d560168b Guenter Roeck    2015-08-26  648  			for (j = 0; info[i]->config[j]; j++) {
d560168b Guenter Roeck    2015-08-26  649  				if (!chip->ops->is_visible(drvdata, hwmon_temp,
d560168b Guenter Roeck    2015-08-26  650  							   hwmon_temp_input, j))
d560168b Guenter Roeck    2015-08-26  651  					continue;
47c332de Linus Walleij    2017-12-05  652  				if (info[i]->config[j] & HWMON_T_INPUT) {
47c332de Linus Walleij    2017-12-05  653  					err = hwmon_thermal_add_sensor(dev,
47c332de Linus Walleij    2017-12-05  654  								hwdev, j);
47c332de Linus Walleij    2017-12-05  655  					if (err)
47c332de Linus Walleij    2017-12-05  656  						goto free_device;
47c332de Linus Walleij    2017-12-05  657  				}
d560168b Guenter Roeck    2015-08-26  658  			}
d560168b Guenter Roeck    2015-08-26  659  		}
d560168b Guenter Roeck    2015-08-26  660  	}
bab2243c Guenter Roeck    2013-07-06  661  
d560168b Guenter Roeck    2015-08-26  662  	return hdev;
bab2243c Guenter Roeck    2013-07-06  663  
47c332de Linus Walleij    2017-12-05  664  free_device:
47c332de Linus Walleij    2017-12-05  665  	device_unregister(hdev);
d560168b Guenter Roeck    2015-08-26  666  free_hwmon:
bab2243c Guenter Roeck    2013-07-06  667  	kfree(hwdev);
bab2243c Guenter Roeck    2013-07-06  668  ida_remove:
4ca5f468 Jonathan Cameron 2011-10-31  669  	ida_simple_remove(&hwmon_ida, id);
bab2243c Guenter Roeck    2013-07-06  670  	return ERR_PTR(err);
bab2243c Guenter Roeck    2013-07-06  671  }
d560168b Guenter Roeck    2015-08-26  672  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
