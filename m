Return-Path: <SRS0=bLAx=V5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D7CC19759
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Aug 2019 16:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 750FC20838
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Aug 2019 16:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9pusqko"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731978AbfHAQj6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Aug 2019 12:39:58 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35924 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfHAQj6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Aug 2019 12:39:58 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so34502063pgm.3
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2019 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F/PUksvtpXcpg+39YDQghGGyZ+oHKyS5aAKWQTwtM8w=;
        b=f9pusqko+V2Vu6CV1Xtn+706+uWzlOIEhf/2eSa5JZHoHi4NakN5PlsC7juNdRdyGk
         itfukgrim6K2Ze0Lldgq2iwkCmMM8JsRHA5ez0LvOOoeF89vSQXGZHKw+wEDGuDvm0o/
         xlpglfL6jVhyY3yxpb2VpkseAaRJE2UCu4j1OX40FbV+5gBRHlFySS4lITFIZVbf9vkk
         KLD0L2DeWzOeV+XpnMHvFZxRy2yy0q7yYaFiy9azSsofDsL+CgKJ/r8gd4HQQETYJhlK
         9o2AL/k6YCi0WB935jtw9zgwjruoE9mlzP+EsL2cGPcPwZOJ9nJSQU+JPfWY8thWJYre
         GtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=F/PUksvtpXcpg+39YDQghGGyZ+oHKyS5aAKWQTwtM8w=;
        b=fPBideTOqPeBBAc6xyn0zlVDOue08tjwg6BU+7EtVAG8XUGV0F90Xu4rjUbr8PImTa
         MWGsSjvb9MJGFaurGL0CGkuMcm0WQUOeeIUXJ4J7aj3Sc1n//obtuNvR9yk7gwjMXH8T
         Wz8oQRF8gXZLRFw+3G9rT5rt6mk40cTsLyNPCZRNSxu3iyjlftzuMLRothpjfPzgvKdz
         2YXXW5dfA83vmeUsPPnmtKSnGMgLxpLKy1Z/PuhxLZEDNrjPx/lInZz9keyYgfPEFbKg
         //LjclQz7kHDIIxTr8BopS9EBAoj4KdLEmSBzpuX1rexOqHNEONRw2PHaqFYc4yPgTQ6
         fj5A==
X-Gm-Message-State: APjAAAVbSYg8DZzgRJFVHlqXbafInhaaSH8mUdv5jDfhBXpGXrbEKgJn
        kwQPMsaZqAovVUkxApZYVSuXqiDO
X-Google-Smtp-Source: APXvYqw4qmk1KFt9TFnl+Owy/JXdET0fd77PTtxoCUfq4JHuawxWRk3KfMShnO/wB4945KeYoImWtA==
X-Received: by 2002:a63:520f:: with SMTP id g15mr115718381pgb.28.1564677597352;
        Thu, 01 Aug 2019 09:39:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k14sm2638727pgb.78.2019.08.01.09.39.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 09:39:56 -0700 (PDT)
Date:   Thu, 1 Aug 2019 09:39:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iker Perez <iker.perez@codethink.co.uk>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm75) Fixup tmp75b clr_mask
Message-ID: <20190801163955.GA17675@roeck-us.net>
References: <20190801075324.4638-1-iker.perez@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801075324.4638-1-iker.perez@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 01, 2019 at 08:53:24AM +0100, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> The configuration register of the tmp75b sensor is 16bit long, however
> the first byte is reserved, so there is not no need to take care of it.
> 
> Because the order of the bytes is little endian and it is only wanted to
> write one byte, the desired bits must be shifted in a 8 bit range.
> 
> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm75.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 3fb9c0a2d6d0..ce5ec403ec73 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -343,7 +343,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		data->sample_time = MSEC_PER_SEC / 2;
>  		break;
>  	case tmp75b:  /* not one-shot mode, Conversion rate 37Hz */
> -		clr_mask |= 1 << 15 | 0x3 << 13;
> +		clr_mask |= 1 << 7 | 0x3 << 5;
>  		data->resolution = 12;
>  		data->sample_time = MSEC_PER_SEC / 37;
>  		break;
