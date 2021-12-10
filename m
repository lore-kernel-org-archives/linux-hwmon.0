Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B436FC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 16:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237071AbhLJQcP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 11:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235932AbhLJQcO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 11:32:14 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E91C061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 08:28:39 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so10065196oto.13
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 08:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HFcM99/GwkTCKLYkCuaGe7jUVnNxVdWdjtW25VtFa0Q=;
        b=oNQRwouz1zCgIByTUFJidMNfGQ4oJoirGu7mGm27gq5Jmpof5GGOZ6IJuUisMfLLC4
         KVe26rm5mwe1Gf7Kq9Znn3Y27/vRCNdLDP31qkXoKaewAWsSsM2ewBdrailRbTDgR3Am
         ygUpr9tZM46dpvhHKNGGV4K3c0Z6hNoqvg5TofLGvpIx1KUHRIc036XLgn3GXU1bz1B6
         wgNIYlwKx6bFzjnPdFYvct+PxN4+KaJ7cFKDBWHJ2nipUKY9Cqe4aJ1I2TPGmrYIZ28j
         2WjJCiyi6SpKMt4+rEOwrphheQ6yRN/TaAhqLNjuILIHPDQ58n+47mluHy8HQbiKlHlP
         ycnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HFcM99/GwkTCKLYkCuaGe7jUVnNxVdWdjtW25VtFa0Q=;
        b=xN1bqkw6ULUIOPXgQJV6SnMc3HhTPr/qdy/a0PMwM++zf8sY9h7X64P0TiZNmiwpKB
         vWNV/qvjDGl/OUbKxznOgazKj9IW0aUXoVNRvI4UbMv49+Te82PkyquiMqAa8M/ETV+k
         xl5jn5aCT3o9/OafPrPiw6rcR2Mvw6iFTbKfbDaVr1eli/+H1x1z4+/nlGaVhOA59TFW
         2+Mup9k1ayfsB7f+f9DD71MDeZ55js23ZhnkEnNxapNn9wqDdNcbfSCYz4xM61Gi5P5E
         rnLkFsGmLmNTi2oCOXtV2N11714HqtdlrguGwYzM/Qjpv8N6FslLjiSkcCpfEz8ivHEU
         BLlw==
X-Gm-Message-State: AOAM532aiDG5VT9GiQKrunf1UJft7ljs06r+Je50T9yCr/LDc+oBHDQt
        YnoURZxwY3MYN5dNvoulnkV6jN9bwuc=
X-Google-Smtp-Source: ABdhPJzvQoCBP3Hj+/xeL581cU6m61W6UPBaZIQ8nJZUmmeNOb9riOnsRkf5S1zW2j6/dlrb1gUhXQ==
X-Received: by 2002:a9d:4543:: with SMTP id p3mr11940333oti.99.1639153718601;
        Fri, 10 Dec 2021 08:28:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r5sm757676oiw.20.2021.12.10.08.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 08:28:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <202112091052.ZSHK1XkV-lkp@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [groeck-staging:watchdog-next 12/32]
 drivers/watchdog/s3c2410_wdt.c:663 s3c2410wdt_probe() warn: passing zero to
 'PTR_ERR'
Message-ID: <63196d4b-88e6-60ac-d665-9c2169492fcb@roeck-us.net>
Date:   Fri, 10 Dec 2021 08:28:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <202112091052.ZSHK1XkV-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/10/21 3:43 AM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
> head:   59a29872ed5c746bba5898ed8e77c3e33d3aa9b6
> commit: 5c0145c7f9262dfd7085239eca95b15967c539fe [12/32] watchdog: s3c2410: Support separate source clock
> config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/archive/20211209/202112091052.ZSHK1XkV-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.2.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/watchdog/s3c2410_wdt.c:663 s3c2410wdt_probe() warn: passing zero to 'PTR_ERR'
> 
> vim +/PTR_ERR +663 drivers/watchdog/s3c2410_wdt.c
> 
> 2d991a164a6185 drivers/watchdog/s3c2410_wdt.c      Bill Pemberton           2012-11-19  601  static int s3c2410wdt_probe(struct platform_device *pdev)
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  602  {
> 08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski      2017-03-13  603  	struct device *dev = &pdev->dev;
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  604  	struct s3c2410_wdt *wdt;
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  605  	struct resource *wdt_irq;
> 46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks                2007-06-14  606  	unsigned int wtcon;
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  607  	int ret;
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  608
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  609  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  610  	if (!wdt)
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  611  		return -ENOMEM;
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  612
> 08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski      2017-03-13  613  	wdt->dev = dev;
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  614  	spin_lock_init(&wdt->lock);
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  615  	wdt->wdt_device = s3c2410_wdd;
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  616
> e3a60ead2c9b81 drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski      2017-02-24  617  	wdt->drv_data = s3c2410_get_wdt_drv_data(pdev);
> cffc9a60ebac3b drivers/watchdog/s3c2410_wdt.c      Doug Anderson            2013-12-06  618  	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  619  		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  620  						"samsung,syscon-phandle");
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  621  		if (IS_ERR(wdt->pmureg)) {
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  622  			dev_err(dev, "syscon regmap lookup failed.\n");
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  623  			return PTR_ERR(wdt->pmureg);
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  624  		}
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  625  	}
> 4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  626
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  627  	wdt_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  628  	if (wdt_irq == NULL) {
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  629  		dev_err(dev, "no irq resource specified\n");
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  630  		ret = -ENOENT;
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  631  		goto err;
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  632  	}
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  633
> 78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  634  	/* get the memory region for the watchdog timer */
> 0f0a6a285ec0c7 drivers/watchdog/s3c2410_wdt.c      Guenter Roeck            2019-04-02  635  	wdt->reg_base = devm_platform_ioremap_resource(pdev, 0);
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  636  	if (IS_ERR(wdt->reg_base)) {
> af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  637  		ret = PTR_ERR(wdt->reg_base);
> 04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han               2013-01-10  638  		goto err;
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  639  	}
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  640
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  641  	wdt->bus_clk = devm_clk_get(dev, "watchdog");
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  642  	if (IS_ERR(wdt->bus_clk)) {
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  643  		dev_err(dev, "failed to find bus clock\n");
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  644  		ret = PTR_ERR(wdt->bus_clk);
> 04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han               2013-01-10  645  		goto err;
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  646  	}
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  647
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  648  	ret = clk_prepare_enable(wdt->bus_clk);
> 01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat             2014-03-04  649  	if (ret < 0) {
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  650  		dev_err(dev, "failed to enable bus clock\n");
> 01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat             2014-03-04  651  		return ret;
> 01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat             2014-03-04  652  	}
> ^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  653
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  654  	/*
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  655  	 * "watchdog_src" clock is optional; if it's not present -- just skip it
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  656  	 * and use "watchdog" clock as both bus and source clock.
> 
> That's not the right way to understand "optional".
> 
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  657  	 */
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  658  	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  659  	if (!IS_ERR(wdt->src_clk)) {
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  660  		ret = clk_prepare_enable(wdt->src_clk);
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  661  		if (ret < 0) {
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  662  			dev_err(dev, "failed to enable source clock\n");
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07 @663  			ret = PTR_ERR(wdt->src_clk);
> 
> Delete this assignment.  "ret" is already the correct error code.
> 
Most definitely, that is correct.

> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  664  			goto err_bus_clk;
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  665  		}
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  666  	} else {
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  667  		wdt->src_clk = NULL;
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  668  	}
> 
> "Optional" doesn't mean the kernel can ignore errors.  It means it's up
> to the user.  If the user doesn't want an optional feature, then
> devm_clk_get() will return NULL.  Otherwise errors need to be reported


> to the user.  Imagine if this code returns -EPROBE_DEFER for example.
> In other words the way to implement this is:
> 
> 	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
> 	if (IS_ERR(wdt->src_clk)) {
> 		dev_err(dev, "failed to get watchdog clock\n");
> 		ret = PTR_ERR(wdt->src_clk);
> 		goto err_bus_clk;
> 	}
> 
> 	ret = clk_prepare_enable(wdt->src_clk);
> 	if (ret) {
> 		dev_err(dev, "failed to enable source clock\n");
> 		goto err_bus_clk;
> 	}
> 
> Maybe there is an argument for continuing if PTR_ERR(wdt->src_clk) == -EINVAL,
> but I don't know the code well enough to say for sure?  Normally, when
> the kernel has an error then we should just return the error code and
> let the user fix their system or disable the feature.
> 

I am not sure if devm_clk_get() ever returns NULL. The code should probably
use devm_clk_get_optional(), which explicitly does return NULL if the clock
is not there.

	wdt->src_clk = devm_clk_get_optional(dev, "watchdog_src");
	if (IS_ERR(wdt->src_clk)) {
		err = PTR_ERR(wdt->src_clk);
		goto err_bus_clk;
	}
	...

It should probably also use dev_err_probe() for other error handling messages
in the probe function to avoid spurious error messages if a function returns
-EPROBE_DEFER.

Thanks,
Guenter

> regards,
> dan carpenter
> 
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  669
> 882dec1ff125e9 drivers/watchdog/s3c2410_wdt.c      Javier Martinez Canillas 2016-03-01  670  	wdt->wdt_device.min_timeout = 1;
> 5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  671  	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
> 882dec1ff125e9 drivers/watchdog/s3c2410_wdt.c      Javier Martinez Canillas 2016-03-01  672
> 

