Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB9AC54EED
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 20:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjAXUHA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjAXUG7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 15:06:59 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE7746D45
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 12:06:56 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id v17so14376043oie.5
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 12:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X5Rdxv3dUtkpcAuwC2JPQ183sBfTTytJbvKcOUiEczI=;
        b=Ue6HXiPhbglWizk8LUZLp7I6jfBdUOkLN6vO8xZW/bp7ixDPzH1epgRArOJ+y8oC4Q
         8Ge8OBcyjKa/t+Za3bY7G6aE2CWIe05A6cRuZ8ERlrpxza1+ZvTj3KU7Y1tov+XLYmRN
         SszvovV8dcXw3nwMPgwMLdaRYO7IZw0jAh4I50EahE+8uPEaU4rovaw0ZawBKnNOS5vV
         kMluhuIC+FRf261CTvF2KCd1xZi+4sqnv0M1dnCQ+pPa5pwatchzz6ZWxhiS7g+s3See
         0RcfOXqm2tcSNdb7hCSgxvAEf9R1tngV8dSHayGuUlHLf7L1rZBfSukVG0LkPA+0X+f/
         /RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5Rdxv3dUtkpcAuwC2JPQ183sBfTTytJbvKcOUiEczI=;
        b=641R4SOaM64PSWpUiz8DdM6qMTHGBYu0DfzzPVPm6LCeB4HQZ93ojQgofw1MTUzbs4
         VuZ0uF+XxW78yfv8gaNFS1fOY23m0Wv88EnUpVHbhEFGmtPtfSM+8qqNnracngpSryDE
         m5F+RpT/Yf9AeDZt6aBjY/PN2eKkKz5pt73GVp2AK9usQ+tlQHkSBhgEojsTZY/92IAf
         TFSG+JVkqJFuMp2rLmy/uFwPdy0VRyVbIlZhrbsWqaID0lXzq5xiTZxcEJMbCBqUpFsK
         Y3XJRrcgcVwhWU3zcmw5jUDooHuW5lYxv5Li19XUdlXCo33giMPsbgmdLbvDQeuQxHXL
         1TUg==
X-Gm-Message-State: AFqh2kqIKdhSeTFDWvkLjzyPcfg5RIEvRXyaL8KwgF/BNKGwjYTsZU6y
        INehDGsi8LOOrgZQnaysY9aBzDh4vfw=
X-Google-Smtp-Source: AMrXdXskCKjsBOH5TDAGV2KHHUj6J8ztPIHMyGxzj9RWoDgnZ2v65lPSdgC7Wjy2g+6is++o9rMRag==
X-Received: by 2002:a54:4816:0:b0:361:25e8:c6d8 with SMTP id j22-20020a544816000000b0036125e8c6d8mr15304100oij.34.1674590815372;
        Tue, 24 Jan 2023 12:06:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r7-20020aca5d07000000b0035a9003b8edsm1409290oib.40.2023.01.24.12.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 12:06:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3abca406-5758-3e3a-a303-b0791e956034@roeck-us.net>
Date:   Tue, 24 Jan 2023 12:06:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [groeck-staging:hwmon-next 41/41]
 drivers/hwmon/mc34vr500.c:228:36: warning: conversion from 'long unsigned
 int' to 'unsigned int' changes value from '18446744073709551569' to
 '4294967249'
Content-Language: en-US
To:     Mario Kicherer <dev@kicherer.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <202301250221.kOJxNanJ-lkp@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <202301250221.kOJxNanJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/24/23 10:25, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   513d7b190ab3715103357afd8e2ddf4b5e986ff3
> commit: 513d7b190ab3715103357afd8e2ddf4b5e986ff3 [41/41] hwmon: add initial NXP MC34VR500 PMIC monitoring support
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230125/202301250221.kOJxNanJ-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=513d7b190ab3715103357afd8e2ddf4b5e986ff3
>          git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>          git fetch --no-tags groeck-staging hwmon-next
>          git checkout 513d7b190ab3715103357afd8e2ddf4b5e986ff3
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/hwmon/mc34vr500.c: In function 'mc34vr500_probe':
>>> drivers/hwmon/mc34vr500.c:228:36: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551569' to '4294967249' [-Woverflow]
>       228 |                                    ~(LOWVINS_BIT | THERM110S_BIT |
>           |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       229 |                                    THERM120S_BIT | THERM130S_BIT));
>           |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
Mario - no need to resend. I silenced it.

Guenter

> vim +228 drivers/hwmon/mc34vr500.c
> 
>     163	
>     164	static int mc34vr500_probe(struct i2c_client *client)
>     165	{
>     166		struct device *dev = &client->dev;
>     167		struct mc34vr500_data *data;
>     168		struct device *hwmon_dev;
>     169		int ret;
>     170		unsigned int reg, revid, fabid;
>     171		struct regmap *regmap;
>     172	
>     173		regmap = devm_regmap_init_i2c(client, &mc34vr500_regmap_config);
>     174		if (IS_ERR(regmap))
>     175			return PTR_ERR(regmap);
>     176	
>     177		data = devm_kzalloc(dev, sizeof(struct mc34vr500_data), GFP_KERNEL);
>     178		if (!data)
>     179			return -ENOMEM;
>     180	
>     181		data->regmap = regmap;
>     182	
>     183		ret = regmap_read(regmap, MC34VR500_DEVICEID, &reg);
>     184		if (ret < 0)
>     185			return ret;
>     186	
>     187		if (reg != MC34VR500_DEVICEID_VALUE)
>     188			return -ENODEV;
>     189	
>     190		ret = regmap_read(regmap, MC34VR500_SILICONREVID, &revid);
>     191		if (ret < 0)
>     192			return ret;
>     193	
>     194		ret = regmap_read(regmap, MC34VR500_FABID, &fabid);
>     195		if (ret < 0)
>     196			return ret;
>     197	
>     198		dev_dbg(dev, "mc34vr500: revid 0x%x fabid 0x%x\n", revid, fabid);
>     199	
>     200		hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>     201								 data,
>     202								 &mc34vr500_chip_info,
>     203								 NULL);
>     204		if (IS_ERR(hwmon_dev))
>     205			return PTR_ERR(hwmon_dev);
>     206	
>     207		data->hwmon_dev = hwmon_dev;
>     208	
>     209		if (client->irq) {
>     210			ret = devm_request_threaded_irq(dev, client->irq, NULL,
>     211							mc34vr500_process_interrupt,
>     212							IRQF_TRIGGER_RISING |
>     213							IRQF_ONESHOT |
>     214							IRQF_SHARED,
>     215							dev_name(dev), data);
>     216			if (ret)
>     217				return ret;
>     218	
>     219			/* write 1 to clear interrupts */
>     220			ret = regmap_write(regmap, MC34VR500_INTSTAT0, LOWVINS_BIT |
>     221					   THERM110S_BIT | THERM120S_BIT |
>     222					   THERM130S_BIT);
>     223			if (ret)
>     224				return ret;
>     225	
>     226			/* unmask interrupts */
>     227			ret = regmap_write(regmap, MC34VR500_INTMASK0,
>   > 228					   ~(LOWVINS_BIT | THERM110S_BIT |
>     229					   THERM120S_BIT | THERM130S_BIT));
>     230			if (ret)
>     231				return ret;
>     232		}
>     233	
>     234		return 0;
>     235	}
>     236	
> 

