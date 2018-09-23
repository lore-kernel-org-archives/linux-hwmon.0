Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39168 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbeIWWhr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 18:37:47 -0400
Received: by mail-pl1-f194.google.com with SMTP id w14-v6so8058570plp.6
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Sep 2018 09:39:45 -0700 (PDT)
Subject: Re: [hwmon:watchdog-next 21/22] drivers//watchdog/rza_wdt.c:197:14:
 warning: cast from pointer to integer of different size
To: Chris Brandt <chris.brandt@renesas.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-hwmon@vger.kernel.org
References: <201809232330.s8owRsKI%fengguang.wu@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c48e6440-e2ad-b3d2-00a9-b26ccacfb36d@roeck-us.net>
Date: Sun, 23 Sep 2018 09:39:42 -0700
MIME-Version: 1.0
In-Reply-To: <201809232330.s8owRsKI%fengguang.wu@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Chris,

On 09/23/2018 08:16 AM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
> head:   419c9ad9c6d4f211ee83d49e2ce6a876cbb1800f
> commit: c24a7cc9df8f17f0726daf9efc6aa290972009e9 [21/22] watchdog: rza_wdt: Support longer timeouts
> config: sparc64-allmodconfig (attached as .config)
> compiler: sparc64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout c24a7cc9df8f17f0726daf9efc6aa290972009e9
>          # save the attached .config to linux build tree
>          GCC_VERSION=7.2.0 make.cross ARCH=sparc64
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers//watchdog/rza_wdt.c: In function 'rza_wdt_probe':
>>> drivers//watchdog/rza_wdt.c:197:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>       priv->cks = (unsigned int)of_device_get_match_data(&pdev->dev);
>                   ^
> 
> vim +197 drivers//watchdog/rza_wdt.c
> 
>     166	
>     167	static int rza_wdt_probe(struct platform_device *pdev)
>     168	{
>     169		struct rza_wdt *priv;
>     170		struct resource *res;
>     171		unsigned long rate;
>     172		int ret;
>     173	
>     174		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>     175		if (!priv)
>     176			return -ENOMEM;
>     177	
>     178		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>     179		priv->base = devm_ioremap_resource(&pdev->dev, res);
>     180		if (IS_ERR(priv->base))
>     181			return PTR_ERR(priv->base);
>     182	
>     183		priv->clk = devm_clk_get(&pdev->dev, NULL);
>     184		if (IS_ERR(priv->clk))
>     185			return PTR_ERR(priv->clk);
>     186	
>     187		rate = clk_get_rate(priv->clk);
>     188		if (rate < 16384) {
>     189			dev_err(&pdev->dev, "invalid clock rate (%ld)\n", rate);
>     190			return -ENOENT;
>     191		}
>     192	
>     193		priv->wdev.info = &rza_wdt_ident,
>     194		priv->wdev.ops = &rza_wdt_ops,
>     195		priv->wdev.parent = &pdev->dev;
>     196	
>   > 197		priv->cks = (unsigned int)of_device_get_match_data(&pdev->dev);

Please resubmit with this fixed. Something like
			priv->cks = (unsigned int)(uintptr_t)of_device_get_match_data(&pdev->dev);
should do it.

Thanks,
Guenter
