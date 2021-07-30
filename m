Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFFEC4338F
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Jul 2021 18:17:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8245D60F4A
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Jul 2021 18:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhG3SRp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Jul 2021 14:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhG3SRp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Jul 2021 14:17:45 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40B3C06175F
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Jul 2021 11:17:39 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id v8-20020a0568301bc8b02904d5b4e5ca3aso1235370ota.13
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Jul 2021 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v6TmE2lPTGfS0QIyYYI3fpqB61MJOR0dKowSf0/Ulho=;
        b=fls5fZ48o6hHJWF8GPu2BFYDEiLOJsnpgWaw9mK0kIsD1L/ZV9+dnzVmEiXc2mLIwT
         wHZ0n4kSbkHZRtnAbVjwGG8OnecSvTP3zT8Resfh8Z4HT0z2Ph4ET7uI1MBCn4dalx/e
         2tdu4N2Bpu9fkX9PgBlMabgxjr51UX1kl5o9zZweb9XlWeXjN9LnJBPccSgWEE1hs5v5
         Fe8Rwd2bOwP1CeWEfFDnU4cU0NI1+RZKE9lRStS4R4/WCloWfP9/lJSjULGgb81/mmEA
         urDpgS31zN6LO+cFqvZhmJUnHZdM506b6EWnz8qIFB9V6XYhYE1HeIXXXQ7s/ByftFuj
         ObNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v6TmE2lPTGfS0QIyYYI3fpqB61MJOR0dKowSf0/Ulho=;
        b=OqYyK2nyxzzeLqg0XYyPLg9sRCDi+zJfNvm7v10PkRc7vhuCW0LennjZWXW4/9ko2G
         0QNypBBl7tJOLdQ7r458B1hHUS36dAq1h3o/mRpyLrEQM0PEe738epsIB12qzQsrFXui
         685BChD68k37Ia+upSz9GUlWqswylOJ544yKN8tURbHKRnq/PPHQXDN4HHvO5fmb/pHs
         pNwhi6eI7qFPzS4UNgbTspd85I3637cG5kORetNSsk/F+FqAeNwEw4cdwrsIaL/hR8k9
         ALa2t6ll80qwvT38bZ6J7yy6SUPeMBPdeujKyWouxA9K65DFXa6UwZ/1kwokI0OwivQX
         r+zQ==
X-Gm-Message-State: AOAM533hh2RLKrt1qxqnKTlCJu8VQ53a4hWeMpyX3LXRObQsgJJVkY0e
        2Vgu1pmd94a3kdd+eo2QPFSug6oWfJQ=
X-Google-Smtp-Source: ABdhPJwtpgFCjapkHlsebL944A7/hbU9/AtI/ybgBQL0UeG3jBz6PCRhcMgAnFgQj/Tg/ntWWODUjw==
X-Received: by 2002:a05:6830:215a:: with SMTP id r26mr2899695otd.244.1627669058854;
        Fri, 30 Jul 2021 11:17:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e3sm354756oow.34.2021.07.30.11.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 11:17:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [linux-next:master 3918/4407] drivers/hwmon/sbrmi.c:211:7:
 warning: variable 'ret' is used uninitialized whenever switch case is taken
To:     Akshay Gupta <Akshay.Gupta@amd.com>
Cc:     kbuild-all@lists.01.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <202107302120.M9mjOgXZ-lkp@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <986da3fe-bae4-9532-c732-86731ac9a9e0@roeck-us.net>
Date:   Fri, 30 Jul 2021 11:17:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202107302120.M9mjOgXZ-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/30/21 6:03 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4ccc9e2db7ac33f450a1ff6ce158a71e5a81ded9
> commit: 4f5b70eb322a2ab7efc7a60a572fa72e46c89f16 [3918/4407] hwmon: Add support for SB-RMI power module
> config: x86_64-buildonly-randconfig-r002-20210730 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 4f71f59bf3d9914188a11d0c41bedbb339d36ff5)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4f5b70eb322a2ab7efc7a60a572fa72e46c89f16
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 4f5b70eb322a2ab7efc7a60a572fa72e46c89f16
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/hwmon/sbrmi.c:211:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>             case hwmon_power_cap_max:
>                  ^~~~~~~~~~~~~~~~~~~
>     drivers/hwmon/sbrmi.c:217:6: note: uninitialized use occurs here
>             if (ret < 0)
>                 ^~~
>     drivers/hwmon/sbrmi.c:196:9: note: initialize the variable 'ret' to silence this warning
>             int ret;
>                    ^
>                     = 0
>     1 warning generated.
> 

There is no need to send an updated patch; I fixed this up.

Thanks,
Guenter

> 
> vim +/ret +211 drivers/hwmon/sbrmi.c
> 
>     190	
>     191	static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
>     192			      u32 attr, int channel, long *val)
>     193	{
>     194		struct sbrmi_data *data = dev_get_drvdata(dev);
>     195		struct sbrmi_mailbox_msg msg = { 0 };
>     196		int ret;
>     197	
>     198		if (type != hwmon_power)
>     199			return -EINVAL;
>     200	
>     201		msg.read = true;
>     202		switch (attr) {
>     203		case hwmon_power_input:
>     204			msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
>     205			ret = rmi_mailbox_xfer(data, &msg);
>     206			break;
>     207		case hwmon_power_cap:
>     208			msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
>     209			ret = rmi_mailbox_xfer(data, &msg);
>     210			break;
>   > 211		case hwmon_power_cap_max:
>     212			msg.data_out = data->pwr_limit_max;
>     213			break;
>     214		default:
>     215			return -EINVAL;
>     216		}
>     217		if (ret < 0)
>     218			return ret;
>     219		/* hwmon power attributes are in microWatt */
>     220		*val = (long)msg.data_out * 1000;
>     221		return ret;
>     222	}
>     223	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

