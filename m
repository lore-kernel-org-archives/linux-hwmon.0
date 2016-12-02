Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36316 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932607AbcLBEkS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2016 23:40:18 -0500
Subject: Re: [PATCH v3 1/2] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
To: John Muir <john@jmuir.com>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480645962-55584-1-git-send-email-john@jmuir.com>
 <1480645962-55584-2-git-send-email-john@jmuir.com>
Cc: John Muir <muirj@google.com>, Anatol Pomazau <anatol@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e3a9e859-1080-6dc2-fcf2-3789eb718792@roeck-us.net>
Date: Thu, 1 Dec 2016 20:40:14 -0800
MIME-Version: 1.0
In-Reply-To: <1480645962-55584-2-git-send-email-john@jmuir.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/01/2016 06:32 PM, John Muir wrote:
> Add support for the TI TMP108 temperature sensor with some device
> configuration parameters.
>
> Signed-off-by: John Muir <john@jmuir.com>

Nice job. Applied to -next, with a small fixup - see below.

Thanks!
Guenter

> ---

[ ... ]

> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id tmp108_of_ids[] = {
> +	{ .compatible = "ti,tmp108", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tmp108_of_ids);
> +#endif
> +
> +static struct i2c_driver tmp108_driver = {
> +	.driver.name	= DRIVER_NAME,
> +	.driver.pm	= &tmp108_dev_pm_ops,

Made this
	.driver = {
		.name	= DRIVER_NAME,
		.pm	= &tmp108_dev_pm_ops,
		.of_match_table = of_match_ptr(tmp108_of_ids),
	},

> +	.probe		= tmp108_probe,
> +	.id_table	= tmp108_i2c_ids,
> +};
> +
> +module_i2c_driver(tmp108_driver);
> +
> +MODULE_AUTHOR("John Muir <john@jmuir.com>");
> +MODULE_DESCRIPTION("Texas Instruments TMP108 temperature sensor driver");
> +MODULE_LICENSE("GPL");
>

