Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:44026 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751776AbdJPNFQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Oct 2017 09:05:16 -0400
Received: by mail-pf0-f195.google.com with SMTP id a8so15326930pfc.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Oct 2017 06:05:16 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (gpio-fan) Fix null pointer dereference at probe
To: Miquel Raynal <miquel.raynal@free-electrons.com>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Antoine Tenart <antoine.tenart@free-electrons.com>,
        Gregory Clement <gregory.clement@free-electrons.com>,
        Nadav Haklai <nadavh@marvell.com>
References: <20171016121210.25556-1-miquel.raynal@free-electrons.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6cd97c71-a698-9190-c297-b72608de33f9@roeck-us.net>
Date: Mon, 16 Oct 2017 06:05:13 -0700
MIME-Version: 1.0
In-Reply-To: <20171016121210.25556-1-miquel.raynal@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/16/2017 05:12 AM, Miquel Raynal wrote:
> A previous commit changed the argument list of gpio_fan_get_of_data(),
> removing the "struct *dev" argument and retrieving it instead from the
> gpio_fan_data structure. The "dev" entry of gpio_fan_data was then
> dereferenced to access the of_node field, leading to a kernel panic
> during the probe as the "dev" entry of the gpio_fan_data structure was
> not filled yet.
> 
> Fix this by setting fan_data->dev before calling gpio_fan_get_of_data().
> 
> Fixes: 5859d8d30737 ("hwmon: (gpio-fan) Get rid of platform data struct")
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>   drivers/hwmon/gpio-fan.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 43b697380987..5c9a52599cf6 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -510,11 +510,11 @@ static int gpio_fan_probe(struct platform_device *pdev)
>   	if (!fan_data)
>   		return -ENOMEM;
>   
> +	fan_data->dev = dev;
>   	err = gpio_fan_get_of_data(fan_data);
>   	if (err)
>   		return err;
>   
> -	fan_data->dev = dev;
>   	platform_set_drvdata(pdev, fan_data);
>   	mutex_init(&fan_data->lock);
>   
> 

