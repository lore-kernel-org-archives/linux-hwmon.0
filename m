Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF26AC04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 21:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbiIYVYO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 17:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiIYVYN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 17:24:13 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9920D1D0C5
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 14:24:12 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x1so4581988plv.5
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 14:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=MMWAGISwKYcK7CbxXeA6Zgm+tpa2r64uP+lIPjb/cuA=;
        b=RWv/M9Yi9ugRPjOHCsoimuAe0fbQpKMusjaCwBbTSpx6B24wH+RUaoCDANjjDn1ixa
         n/xRqysR3rpRgsrX+3EwCtMpug/UWsm6F67LK06z2ZZxoYLFuh/rVCcNr71Ip8kEHxHm
         AEUj7Wdwe2Mdd2n1U80a5M8hMt7sJkROfjnPYVqaOC8rDhX25ZcQL7mYV683Xs/P4BOo
         mVY1BOndGqgtgScmt1RN83okVsoQyJ63A25uLnEcKElrUy5R/wEslJWBnphG0kt99HUD
         Rq/wJjP6/hxCb8QugfbHz9pouJ1pRZb22NTKmnJp5DJiTtspjFX/7DlpLproX4tLHF2B
         1SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=MMWAGISwKYcK7CbxXeA6Zgm+tpa2r64uP+lIPjb/cuA=;
        b=g7+9BjtUKh5gUZYJoThJKOLWxAfuN/dtvU4Bi5orclBjqXUXpKNlSwe/J3TwNK9Inc
         dE27TR1ayGGYb8OyEstUlhiY7iWoh1hD+UA7M7ay0mzjXsB6q6A372+8iIeIzlLQuX19
         oSNRkd/Uggm/h9otLifrFE7AaV75035JVaKMAYSKk8kFvGaMKwZIuWfnh5nHejJNEoYj
         nvay5LjRzvzgJfYgKMnbDop2bZyg920K2nGPVj1squgqOfS+Ey2srlNQgpO6j4Ry2L1j
         Qr6PscJzf7veB3QnqJhzY/NSW97OR5uolhp2XNS79zaU7/d1h7oYZi8qyPCAfIbw3ADU
         CCnw==
X-Gm-Message-State: ACrzQf244FE/mutVQ7hQ4FRtd6EpDBEQm5/dG5uQpwaB0+ptypZNJXwd
        SPQMIJBPKCjTufnh/0LEDaazYhwtDZe4DA==
X-Google-Smtp-Source: AMsMyM4YPcmS+hEQBVed1mb9F/Qog+j7ErJUEu3c2/3dTkmlNyRfAGyJOEAT6o1wlqOhkqEIwk/CIA==
X-Received: by 2002:a17:903:130f:b0:178:b6fd:7eb3 with SMTP id iy15-20020a170903130f00b00178b6fd7eb3mr18945737plb.82.1664141052038;
        Sun, 25 Sep 2022 14:24:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 7-20020a621507000000b0053e80515df8sm10363393pfv.202.2022.09.25.14.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 14:24:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <deb4aa06-ef81-bc02-b68d-a012a77c8293@roeck-us.net>
Date:   Sun, 25 Sep 2022 14:24:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [groeck-staging:hwmon-next 45/81]
 drivers/hwmon/pmbus/tps546d24.c:50:34: warning: 'tps546d24_of_match' defined
 but not used
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>, Duke Du <dukedu83@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org
References: <202209260442.8JoEiMPw-lkp@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <202209260442.8JoEiMPw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/25/22 14:03, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   cbc6a25e35c03c8185549669c94103c70e44932e
> commit: 009aeddecef3fd3514171af0d53b6ee8606f9c94 [45/81] hwmon: (pmbus) Add driver for the TEXAS TPS546D24 Buck Converter.
> config: i386-randconfig-r036-20220926
> compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
> reproduce (this is a W=1 build):
>          # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=009aeddecef3fd3514171af0d53b6ee8606f9c94
>          git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>          git fetch --no-tags groeck-staging hwmon-next
>          git checkout 009aeddecef3fd3514171af0d53b6ee8606f9c94
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hwmon/pmbus/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/hwmon/pmbus/tps546d24.c:50:34: warning: 'tps546d24_of_match' defined but not used [-Wunused-const-variable=]
>        50 | static const struct of_device_id tps546d24_of_match[] = {
>           |                                  ^~~~~~~~~~~~~~~~~~
> 
> 

Fixed in hwmon-next.

Thanks,
Guenter

> vim +/tps546d24_of_match +50 drivers/hwmon/pmbus/tps546d24.c
> 
>      49	
>    > 50	static const struct of_device_id tps546d24_of_match[] = {
>      51		{.compatible = "ti,tps546d24"},
>      52		{}
>      53	};
>      54	MODULE_DEVICE_TABLE(of, tps546d24_of_match);
>      55	
> 

