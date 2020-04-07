Return-Path: <SRS0=Ozf/=5X=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E39C2BA1A
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Apr 2020 00:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E37120768
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Apr 2020 00:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIGQCW3Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgDGALu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Apr 2020 20:11:50 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38270 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgDGALt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Apr 2020 20:11:49 -0400
Received: by mail-pl1-f193.google.com with SMTP id w3so539365plz.5
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Apr 2020 17:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1ayI1GEhkjPyavn/+gxCORWcZrj4+gso1lZcMAwi/qo=;
        b=mIGQCW3ZXgrxW8PiKuazMdQKHeQenPABw2BJVzW55gffsOghPj1VYRoQktY4Q2lFgd
         9on59DmdIbB5o8QLAoxcB70WW3rQsGmffrq8+E7r5qdFJU7E5LA/lr4H3l7ikaNrEzr+
         3kiR4cmkQYG7z6wFapPgolhdOwCT4b/QDHQNZNOs3HuWhQ63Q4rV/1AKPsWL5G3ByCqS
         zhwYe+jScb67LTiTN/tqa2segv19HFLQk2dZ/ozc3C8Whbfat0GGJnLKEewIfU5eqrCV
         GYqpjqKK0Xg5lS7rcJ+QnnbqgFOLd6flAWumJnloUc5t2ZKr8n/nMXk9h47L/HPUnavT
         uqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1ayI1GEhkjPyavn/+gxCORWcZrj4+gso1lZcMAwi/qo=;
        b=nxqqM6ieXy1NeRXv5PDLAlhi8sD67UyFbQKO78YqcSNA0Kdsk0s4JLeM9Cx+ABy4TM
         6DU8xihzXoCI9px9nckT0Qyd6GC5JSmZXZV1Un4s2jQLESTD3NLA/TPsYKLlNRN7x2l8
         HGxAuXpD67uHjKffE2jxvoUFXkLsElNi+ntxSwaQ3CRnT/L1m4VAoPRLdsbWzi9ehrF1
         v4YyE5DeiPvDHms1OJE78kihONbdDavVp1tSePgrwuPHvoUSrHnPIlFJI+hnn+WaNwRS
         XE3enAMFQgoJiePt/5bwsAIq1Evf2ySE7u6husDaBT02WVLApUC/ulGHqdv8GCQuDi+t
         qFKg==
X-Gm-Message-State: AGi0PuaB65MgTeaDL5Y+BwVOvpo+oOADyolceD3JoGQYjIfqf8NHJWsz
        d6ftPyGYISBq1dqGvEdBhY3u6YgR
X-Google-Smtp-Source: APiQypKD6V7dbmHLY9xCz747oZW3TUIDKEJGdY9kjAsEfC3H8TDVmesHqc1/BOjLFcxNAgW7GnaPLA==
X-Received: by 2002:a17:90a:757:: with SMTP id s23mr2164260pje.166.1586218308812;
        Mon, 06 Apr 2020 17:11:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l23sm680924pjy.22.2020.04.06.17.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 17:11:48 -0700 (PDT)
Subject: Re: [PATCH] hwmon: use drivetemp's true module name in Kconfig
 section
To:     Ann T Ropea <bedhanger@gmx.de>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
References: <20200406235521.185309-1-bedhanger@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <37383faf-e7e5-2784-426a-c7d9cd0be959@roeck-us.net>
Date:   Mon, 6 Apr 2020 17:11:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200406235521.185309-1-bedhanger@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/6/20 4:55 PM, Ann T Ropea wrote:
> The addition of the support for reading the temperature of ATA drives as
> per commit 5b46903d8bf3 ("hwmon: Driver for disk and solid state drives
> with temperature sensors") lists in the respective Kconfig section the
> name of the module to be optionally built as "satatemp".
> 
> However, building the kernel modules with "CONFIG_SENSORS_DRIVETEMP=m",
> does not generate a file named "satatemp.ko".
> 
> Instead, the rest of the original commit uses the term "drivetemp" and
> a file named "drivetemp.ko" ends up in the kernel's modules directory.
> This file has the right ingredients:
> 
> 	$ strings /path/to/drivetemp.ko | grep ^description
> 	description=Hard drive temperature monitor
> 
> and modprobing it produces the expected result:
> 
> 	# drivetemp is not loaded
> 	$ sensors -u drivetemp-scsi-4-0
> 	Specified sensor(s) not found!
> 	$ sudo modprobe drivetemp
> 	$ sensors -u drivetemp-scsi-4-0
> 	drivetemp-scsi-4-0
> 	Adapter: SCSI adapter
> 	temp1:
> 	  temp1_input: 35.000
> 	  temp1_max: 60.000
> 	  temp1_min: 0.000
> 	  temp1_crit: 70.000
> 	  temp1_lcrit: -40.000
> 	  temp1_lowest: 20.000
> 	  temp1_highest: 36.000
> 
> Fix Kconfig by referring to the true name of the module.
> 
> Fixes: 5b46903d8bf3 ("hwmon: Driver for disk and solid state drives with temperature sensors")
> Signed-off-by: Ann T Ropea <bedhanger@gmx.de>

Sorry, leftover from original driver name. Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 05a30832c6ba..4c62f900bf7e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -412,7 +412,7 @@ config SENSORS_DRIVETEMP
>  	  hard disk drives.
> 
>  	  This driver can also be built as a module. If so, the module
> -	  will be called satatemp.
> +	  will be called drivetemp.
> 
>  config SENSORS_DS620
>  	tristate "Dallas Semiconductor DS620"
> --
> 2.24.1
> 

