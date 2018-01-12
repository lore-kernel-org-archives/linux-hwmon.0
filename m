Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35290 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932340AbeALBfk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Jan 2018 20:35:40 -0500
Received: by mail-pf0-f196.google.com with SMTP id t12so3189391pfg.2
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jan 2018 17:35:40 -0800 (PST)
Date: Thu, 11 Jan 2018 17:35:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [hwmon:hwmon-next 23/23] drivers/hwmon/pmbus/ibm-cffps.c:330:
 undefined reference to `devm_of_led_classdev_register'
Message-ID: <20180112013537.GB27166@roeck-us.net>
References: <201801120800.899ckr4L%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201801120800.899ckr4L%fengguang.wu@intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   ef9e1cdf419a37065364edb47bd6dd9aee1bcb7d
> commit: ef9e1cdf419a37065364edb47bd6dd9aee1bcb7d [23/23] hwmon: (pmbus/cffps) Add led class device for power supply fault led
> config: x86_64-randconfig-s4-01120648 (attached as .config)
> compiler: gcc-7 (Debian 7.2.0-12) 7.2.1 20171025
> reproduce:
>         git checkout ef9e1cdf419a37065364edb47bd6dd9aee1bcb7d
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/hwmon/pmbus/ibm-cffps.o: In function `ibm_cffps_create_led_class':
> >> drivers/hwmon/pmbus/ibm-cffps.c:330: undefined reference to `devm_of_led_classdev_register'
> 

Looks like the driver now depends on LEDS_CLASS. This needs to be
added to Kconfig, or you'll need to make ibm_cffps_create_led_class()
conditional on LEDS_CLASS and provide a dummy function if LEDS_CLASS
is not enabled.

Either way is fine with me. Can you send me a patch ?

Guenter

On Fri, Jan 12, 2018 at 08:58:02AM +0800, kbuild test robot wrote:
> vim +330 drivers/hwmon/pmbus/ibm-cffps.c
> 
>    316	
>    317	static void ibm_cffps_create_led_class(struct ibm_cffps *psu)
>    318	{
>    319		int rc;
>    320		struct i2c_client *client = psu->client;
>    321		struct device *dev = &client->dev;
>    322	
>    323		snprintf(psu->led_name, sizeof(psu->led_name), "%s-%02x", client->name,
>    324			 client->addr);
>    325		psu->led.name = psu->led_name;
>    326		psu->led.max_brightness = LED_FULL;
>    327		psu->led.brightness_set = ibm_cffps_led_brightness_set;
>    328		psu->led.blink_set = ibm_cffps_led_blink_set;
>    329	
>  > 330		rc = devm_led_classdev_register(dev, &psu->led);
>    331		if (rc)
>    332			dev_warn(dev, "failed to register led class: %d\n", rc);
>    333	}
>    334	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation


