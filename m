Return-path: <jgunthorpe@obsidianresearch.com>
Date: Tue, 25 Oct 2016 20:54:28 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] lm87: Use hwmon to create the sysfs groups
Message-ID: <20161026025428.GB4929@obsidianresearch.com>
References: <20161025232621.GB20339@obsidianresearch.com>
 <db1b73af-8560-0739-a873-16774eed2a12@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db1b73af-8560-0739-a873-16774eed2a12@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Oct 25, 2016 at 06:50:01PM -0700, Guenter Roeck wrote:
> >+
> >+	const struct attribute_group *attr_groups[5];
> 
> There can be up to 5 active groups total, so this array needs to have
> 6 entries (it needs to be NULL_terminated).

Agh right, I forgot about that. I will send a v2

> > {
> > 	struct lm87_data *data = i2c_get_clientdata(client);
> >
> >-	hwmon_device_unregister(data->hwmon_dev);
> >-	lm87_remove_files(client);
> >-
> > 	lm87_write_value(client, LM87_REG_CONFIG, data->config);
> 
> Strictly speaking this is now racy: The sysfs attributes still exist here,
> meaning the chip can still be accessed. Consider using devm_add_action();
> then you can drop the remove function entirely, and simplify error cleanup
> in the probe function.

I guess, but that is very obscure. If you unload the driver while
monitoring it with sysfs and the boot firmware left the chip in the
low power state then a sysfs right might race and return garbage..

I can switch it to use hwmon_device_register_with_groups and put the
hwmon_device_unregister back - I'm not sure wrapping the write in devm
would be a simplification..

Thanks,
Jason
