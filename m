Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DFDC10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39E712084F
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdwPLiXm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfDINFe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:05:34 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45474 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfDINFe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Apr 2019 09:05:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id e24so9663639pfi.12
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Apr 2019 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PRh0kNm8jVwGEWAXO/VF0Yj/JAQLdnbtL0Ps+5xoduk=;
        b=cdwPLiXm9Ww89qpAltMbT7r5mbr3ePlkQij9TFjgr+q4Jf7j8yK+AxhKrLEiJXBrgd
         C0gI1vxoj7/BZmVa7T2JINkqXgc08RTwIsWRitjBJuQRvgIFWVET5Bk1aQmA5vgcawzK
         JoaZ4oJjrawbGCbhBk4x1JWLJC9SGP5rZ8Y9YPQBHC2C1gY7pQ2X/3CKYnAoQ/wFGw71
         yACZG2ik5qxnYjd6dh16fmEJYdjuLkLryU9638aZDpAtEP2bq5H8eiAodcscbx9Pfk/j
         vjpwEojT7HapxtKHZGcFcu3IGxnJRb0/owL+IJ0kpGZr+kYcprmHH6kFkuTwPeNxEfcX
         EOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PRh0kNm8jVwGEWAXO/VF0Yj/JAQLdnbtL0Ps+5xoduk=;
        b=OsQL6EtVE9EoyzYDTJjw8fckxZkKN2wbf6Qt9tT7efzudgb/uSS+tIH3K3CdoLFFtm
         oSnrmTk7tUpuLHCBIAaLC/AWOGuPHvdMRzQa6wePJbDs8jQVkseWUaK/lbrBfZyN1zIB
         jQ1SiY87FATYNCqi9PLGN7vN0SyH3fAZp3DFByUkPsq6DZq5Dd+SCGzA4wQDHHbhzNaA
         nIFJoVYyXejAxBtfcALw6WxA2PasU2oeVn9BVu6ALVpnWfQqxFQRidNeun3qer5JyMAV
         27XFTWLQdfA7Y3Bg6hb+rhmBbzBMqPK420iZ2wqavunkLzDIyOcWu7YJ9DinabtlUkYk
         m3wA==
X-Gm-Message-State: APjAAAU2pPsMS46eZH/0HmLcZGkbsDDfwfHCVszlK+y8Y9bYBs/s+oi6
        XzI/iWN2gxZHfxd23wAqcXjty6Mv
X-Google-Smtp-Source: APXvYqySkGBWsoHKSqD6AprcnbaLKG1chrJEFpRiZswCxBYXwF1kOnIRdCnQ4wUuFaqxSU/BHdwhqw==
X-Received: by 2002:a62:6807:: with SMTP id d7mr35753209pfc.75.1554815133815;
        Tue, 09 Apr 2019 06:05:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23sm46360892pfd.11.2019.04.09.06.05.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 06:05:32 -0700 (PDT)
Subject: Re: pmbus based power regulator
To:     Michal Simek <michal.simek@xilinx.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <b1a69448-66bd-6760-21c6-239ef2afecdf@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4d186966-887b-74d8-a00d-e1e4ec10ecd6@roeck-us.net>
Date:   Tue, 9 Apr 2019 06:05:31 -0700
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

