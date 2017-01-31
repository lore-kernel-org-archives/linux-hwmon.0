Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36464 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751240AbdAaMBV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2017 07:01:21 -0500
Subject: Re: [bug report] hwmon: (core) New hwmon registration API
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20170131104918.GA10541@mwanda>
Cc: linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6e7e52af-a3c4-a08f-9052-f8944bc27023@roeck-us.net>
Date: Tue, 31 Jan 2017 04:01:19 -0800
MIME-Version: 1.0
In-Reply-To: <20170131104918.GA10541@mwanda>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/31/2017 02:49 AM, Dan Carpenter wrote:
> Hello Guenter Roeck,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch d560168b5d0f: "hwmon: (core) New hwmon registration API"
> from Aug 26, 2015, leads to the following Smatch complaint:
>
> drivers/hwmon/hwmon.c:624 __hwmon_device_register()
> 	 error: we previously assumed 'dev' could be null (see line 602)
>
> drivers/hwmon/hwmon.c
>    601		hdev->parent = dev;
>    602		hdev->of_node = dev ? dev->of_node : NULL;
>                                 ^^^
> I gotta be honest, I have no idea why my scripts say this is a new
> warning when it's 2 years old.  This check feels like it could be
> deleted and perhaps that's why it didn't complain up to now.  It tries
> to ignore extra harmless checks.
>

Nevertheless it is a good warning. hwmon_thermal_add_sensor() calls devm_kzalloc()
with dev as argument.

Guenter

>    603		hwdev->chip = chip;
>    604		dev_set_drvdata(hdev, drvdata);
>    605		dev_set_name(hdev, HWMON_ID_FORMAT, id);
>    606		err = device_register(hdev);
>    607		if (err)
>    608			goto free_hwmon;
>    609	
>    610		if (chip && chip->ops->read &&
>    611		    chip->info[0]->type == hwmon_chip &&
>    612		    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
>    613			const struct hwmon_channel_info **info = chip->info;
>    614	
>    615			for (i = 1; info[i]; i++) {
>    616				if (info[i]->type != hwmon_temp)
>    617					continue;
>    618	
>    619				for (j = 0; info[i]->config[j]; j++) {
>    620					if (!chip->ops->is_visible(drvdata, hwmon_temp,
>    621								   hwmon_temp_input, j))
>    622						continue;
>    623					if (info[i]->config[j] & HWMON_T_INPUT)
>    624						hwmon_thermal_add_sensor(dev, hwdev, j);
>                                                                          ^^^
> Dereference.
>
>    625				}
>    626			}
>
> regards,
> dan carpenter
>

