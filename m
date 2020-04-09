Return-Path: <SRS0=sjJb=5Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A271DC2BA2B
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C98B2082D
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLmA8hz2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgDIPQt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Apr 2020 11:16:49 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36798 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbgDIPQt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Apr 2020 11:16:49 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2so3940642plo.3
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2020 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b5ZrxjMQSSf8XlZ5BhjfNHRnLTCuQwT/HeimnJaOkpw=;
        b=JLmA8hz2GzH9QTCtG2pKhM5xzoE/DAYbxSevnSh4CoOffs2IsgY1ELch3gbo/YKRcn
         MTi5hQln3zDiuXqpvobUCAAT2mkrUU5hUdWMVEhpNSg1A8dPoCmwWydfncUOYZD4GprP
         SsydJfXfOZDXDF39KuL4bG2ppM4T3wogpeDXU4u54Qs3Ag7f6wbKqeYC1ZA6uQ3ve9jf
         rpmQHizDxQb5cDe+Ddi0UWFjoeqW5fSFoonQ2YLgcpL4jC5pvPwONEAVbipuiA2OE3XO
         W8CxzE9LCq9Xn7BR2QSYnIPLlsIAixfneu9Hs/D5fgGv2jKQzIFkSRy1nGOnMb4Q5aH/
         +USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=b5ZrxjMQSSf8XlZ5BhjfNHRnLTCuQwT/HeimnJaOkpw=;
        b=sZBquAiaGzXpqmwnxSGPkupe5K0EcA0Kn2rxJM5c0ZgYCW/zeX0yFBFMGhvPWLAvaq
         e514LSZ7DzUHRLykL52/UUXDuB3CMdB66mKImJLXALjNmRll4JT+4RkCvedxv0Fwm7Tn
         QZ8qBsWQkp2/Pro0VUMu4yMIqp8G8Bj+Bxx3QivB6JCelB0T/uqqacJd0GZySwFBXg5w
         3qkwBw+n5p20OYGS22cso2qtlbrWiKqQplggMwiIU4G6Z327eN/6aJzPbK69ovgNZEU5
         CPLNgMsrYS/K8MWZTmW7HMoZz9UNn+TnSWOlnXsKesqsXu1Hr5MtBtMODI1OeJfjJrMj
         TH4w==
X-Gm-Message-State: AGi0PuaqbDQQutCU0xtkAiPnXF7ACOlafutps3XYU8xMu5WVpmSpHs4V
        sfyplgO/imYEsmq7rBDWjqgtrskK
X-Google-Smtp-Source: APiQypIEoYUzly6zzOMbDa8anxSjWkDWnSE6oyRY5c29id1wbGRssiFXc7TQapeWpas34jF43NiH9Q==
X-Received: by 2002:a17:90a:f0c6:: with SMTP id fa6mr12161694pjb.5.1586445407923;
        Thu, 09 Apr 2020 08:16:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t123sm2116193pfd.48.2020.04.09.08.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 08:16:47 -0700 (PDT)
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     monstr@monstr.eu, Michal Simek <michal.simek@xilinx.com>,
        Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
 <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
 <20200330194859.GA12459@roeck-us.net>
 <b4322641-5918-40c4-a887-dcfa20db1733@xilinx.com>
 <7a10a855-53a2-0743-be7d-86f6030626ca@seznam.cz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <087f0821-bcd5-0f85-3e02-2b95721d1c2d@roeck-us.net>
Date:   Thu, 9 Apr 2020 08:16:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7a10a855-53a2-0743-be7d-86f6030626ca@seznam.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Michal,

On 4/9/20 7:29 AM, Michal Simek wrote:
[ ... ]
> 
> Just to let you know issue is with i2c driver. Here is my output for the
> record.
> 
Thanks a lot for the update.

> irps5401-i2c-3-43
> Adapter: i2c-0-mux (chan_id 2)
> vin1:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
> vin2:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
> vin3:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
> vin4:             N/A

This is interesting; it means that the rail is not active (?) or
not supported, or maybe even that the driver has a bug. The second
chip reports a value here, so I guess the rail is inactive.
If possible, it would be desirable to detect this during probe
and not try to report values for this rail. It would be great if
you can find the time to figure out what is going on.

Thanks,
Guenter
