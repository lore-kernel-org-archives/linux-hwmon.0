Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3B5C07E9D
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Sep 2022 08:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbiIZIcj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234350AbiIZIci (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2022 04:32:38 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB003AB0E
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 01:32:37 -0700 (PDT)
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MbbZN4HFkz687Dc;
        Mon, 26 Sep 2022 16:31:24 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 10:32:35 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 09:32:35 +0100
Date:   Mon, 26 Sep 2022 09:32:33 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jonathan Cameron <jic23@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "Hans de Goede" <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Nuno =?UTF-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
        Roland Stigge <stigge@antcom.de>,
        =?UTF-8?Q?Zolt?= =?UTF-8?Q?=C3=A1n_K=C5=91v=C3=A1g=C3=B3?= 
        <dirty.ice.hu@gmail.com>, "Ninad Malwade" <nmalwade@nvidia.com>
Subject: Re: [PATCH 05/18] hwmon: (gpio-fan) Switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Message-ID: <20220926093233.00005c4d@huawei.com>
In-Reply-To: <20220925184954.GA2856297@roeck-us.net>
References: <20220925172759.3573439-1-jic23@kernel.org>
        <20220925172759.3573439-6-jic23@kernel.org>
        <20220925184954.GA2856297@roeck-us.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 25 Sep 2022 11:49:54 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Sun, Sep 25, 2022 at 06:27:46PM +0100, Jonathan Cameron wrote:
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > These newer PM macros allow the compiler to see what code it can remove
> > if !CONFIG_PM_SLEEP. This allows the removal of messy #ifdef barriers whilst
> > achieving the same result.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>  
> 
> This patch resulted in build errors.
> 
> Building m68k:allmodconfig ... failed
> --------------
> Error log:
> drivers/hwmon/gpio-fan.c: In function 'gpio_fan_suspend':
> drivers/hwmon/gpio-fan.c:565:27: error: 'struct gpio_fan_data' has no member named 'resume_speed'
> 
> There was an #ifdef CONFIG_PM_SLEEP in struct gpio_fan_data which had
> to be dropped. I took care of that.

Thanks!  I clearly missed some tests I should have done.
Sorry about that.

Jonathan


> 
> Guenter
> 
> > ---
> >  drivers/hwmon/gpio-fan.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> > index fbf3f5a4ecb6..b05aedd20b4f 100644
> > --- a/drivers/hwmon/gpio-fan.c
> > +++ b/drivers/hwmon/gpio-fan.c
> > @@ -557,7 +557,6 @@ static void gpio_fan_shutdown(struct platform_device *pdev)
> >  		set_fan_speed(fan_data, 0);
> >  }
> >  
> > -#ifdef CONFIG_PM_SLEEP
> >  static int gpio_fan_suspend(struct device *dev)
> >  {
> >  	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
> > @@ -580,18 +579,14 @@ static int gpio_fan_resume(struct device *dev)
> >  	return 0;
> >  }
> >  
> > -static SIMPLE_DEV_PM_OPS(gpio_fan_pm, gpio_fan_suspend, gpio_fan_resume);
> > -#define GPIO_FAN_PM	(&gpio_fan_pm)
> > -#else
> > -#define GPIO_FAN_PM	NULL
> > -#endif
> > +static DEFINE_SIMPLE_DEV_PM_OPS(gpio_fan_pm, gpio_fan_suspend, gpio_fan_resume);
> >  
> >  static struct platform_driver gpio_fan_driver = {
> >  	.probe		= gpio_fan_probe,
> >  	.shutdown	= gpio_fan_shutdown,
> >  	.driver	= {
> >  		.name	= "gpio-fan",
> > -		.pm	= GPIO_FAN_PM,
> > +		.pm	= pm_sleep_ptr(&gpio_fan_pm),
> >  		.of_match_table = of_match_ptr(of_gpio_fan_match),
> >  	},
> >  };  

