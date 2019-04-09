Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC61CC10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C2D92084C
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9sOk20M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfDINU7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:20:59 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46670 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbfDINU7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Apr 2019 09:20:59 -0400
Received: by mail-pl1-f196.google.com with SMTP id y6so9389363pll.13
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Apr 2019 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YY1Jk3VDrzoZkOLJat+fXGO0t7mTqgz4Adz6eR+83AE=;
        b=p9sOk20MlID2DFND/wj1HFnKXRdo6Fl9zI5WppassGtoAWe/w1Nd7EBAc0ZgAdUbTC
         pER6Se73MbTEpV6lJo1qDzBscTjHHhn2i6fYMWNivbZ6RllMr6Jz+Ey6Lvz7sh5C4MHg
         cXvkMB503EZ5EK0vynPiFzoeeiNlTEo0LUUnlR4Ejtl1k9tquMBF7UMncAOBxJKIzgkc
         fhIamdJ6kHtPykGCZJfeIRXSBojiI99DVPopOqC/XiUYUANRVP0ep9Cd3nPfZlbcwKUd
         raIrggaGPaGPILynhsneNV5d2V4kXyZzKwN70wJkcfWr5XJty6m7bSpIusPkXfzdn/Mg
         iG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YY1Jk3VDrzoZkOLJat+fXGO0t7mTqgz4Adz6eR+83AE=;
        b=JsfHvkjkZ3NRKYpTvOnaNg+qMvuA3SI/x+S6yAqaEVOeb9IfGjDIKz/HszdbJHytjM
         4H7PpbnU9c4VrB4ss1j7/+AgP4i/0gNwN8tOspFu0pqIUdx9/2DVT8qPF4LnxGJpxo4B
         yHokSRLiGP1DkILANKPcl7Knx7ecvVLRljxxpcTniXplRmKNH2qxMtv094u88zDMVwDD
         IDYJtFxPfjjetzipi1H2YjFxHWVuD/xU2X9XG8piMQxcOzSvcMFIpAq7twFPwd2XnEFE
         IUgvhkOXZCK8bRbRAH8UI1VwcMX1rDPGy8OaTFknHQDWRCu3CObr3CmGmnGv+M4KwLk8
         4KPQ==
X-Gm-Message-State: APjAAAVKV6uj2o0U8YhH3u5bNDHA9WUbHMsNf/SFbBx9PgC5XxdCO4Y7
        hKaQ/fgspKG3fMMDUtjWRoAlZpu6
X-Google-Smtp-Source: APXvYqybd9eewjq/oMYFlAdBUytskY8Ze7OHO+G+nK6LDr86M66JUXJO7Clse7B7MHvtsBDHwZy9CA==
X-Received: by 2002:a17:902:ab87:: with SMTP id f7mr36957464plr.85.1554816058046;
        Tue, 09 Apr 2019 06:20:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l26sm50477543pfb.20.2019.04.09.06.20.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 06:20:57 -0700 (PDT)
Subject: Re: pmbus based power regulator
To:     Michal Simek <michal.simek@xilinx.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <b1a69448-66bd-6760-21c6-239ef2afecdf@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <56d2cd52-8098-9e4d-2ad2-ce7a0ead5283@roeck-us.net>
Date:   Tue, 9 Apr 2019 06:20:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b1a69448-66bd-6760-21c6-239ef2afecdf@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/9/19 5:56 AM, Michal Simek wrote:
> Hi,
> 
> I have one question about hwmon/pmbus. I have tps544b25 on the board. I
> have enabled this chip via DT to get probed. Patch below.
> 
> I can't see any issue with monitoring but I am curious how to enable
> setting up voltage. I expect this should be moved to regulator folder or
> better split done as MFD device.
> 
> I see there wm831x-hwmon and also wm8350-hwmon but nothing with pmbus
> wiring.
> Can you please suggest a way how this should be done?
> 

Hit the wrong button with my earlier email. Please ignore.

The pmbus core code does support for registering regulators. See
drivers/hwmon/pmbus/ltc2978.c for an example. You would have to write a
front-end driver for the TI chip to pass the necessary parameters to the
pmbus core. We could try to add generic regulator support to pmbus.c, but
I hesitate doing that because regulator support is much more critical than
monitoring code and may require chip specific workarounds.

Sure, we could try to move the pmbus core code to mfd and try to split out
regulator and hwmon code from it. That would require moving the core plus
all front-end drivers. It would be a substantial effort with, as far as I
can see, little benefit.

> Thanks,
> Michal
> 
> commit 0aeba3b5a67eee06d3afe67c71e45a47e8e00f8d
> Author:     Michal Simek <michal.simek@xilinx.com>
> AuthorDate: Mon Mar 4 13:51:05 2019 +0100
> Commit:     Michal Simek <michal.simek@xilinx.com>
> CommitDate: Thu Mar 28 15:32:03 2019 +0100
> 
>      hwmon: pmbus: Add DT wiring for ti,tps544b25
> 
>      This should be enough for DT wiring to get generic functionality.
> 
>      Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index 7718e58dbda5..be00cd144a2b 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -220,10 +220,17 @@ static int pmbus_probe(struct i2c_client *client,
> 
>   MODULE_DEVICE_TABLE(i2c, pmbus_id);
> 
> +static const struct of_device_id pmbus_of_match[] = {
> +        {.compatible = "ti,tps544b25"},
> +        {}
> +};
> +MODULE_DEVICE_TABLE(of, pmbus_of_match);
> +
>   /* This is the driver that will be inserted */
>   static struct i2c_driver pmbus_driver = {
>          .driver = {
>                     .name = "pmbus",
> +                  .of_match_table = of_match_ptr(pmbus_of_match),
>                     },
>          .probe = pmbus_probe,
>          .remove = pmbus_do_remove,
> 

tps544b25 is already listed in const struct i2c_device_id pmbus_id,
and the driver should thus instantiate with DT. I don't mind if we add
a complete of_match table to the file, but I don't really see the point
of creating one with just a single entry.

Guenter
