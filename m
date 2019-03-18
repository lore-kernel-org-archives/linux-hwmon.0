Return-Path: <SRS0=f3EG=RV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C95EC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C1BE20872
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6BPZWL2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfCROv7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Mar 2019 10:51:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41389 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbfCROv7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Mar 2019 10:51:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id k11so11545414pgb.8
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Mar 2019 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pclFtcRs7YKDVSvfXg81t8IDObK8j6FI0NyUOd5p228=;
        b=l6BPZWL2JdVQeU6tRWYvdzKifS32/RKydGOn4YFB9WufgV3tll5vwk4URd5uOHZcEd
         u3WHEmBdit18st6fA1WGwMjdKNoTUFLUqk3C9MmLkHGOftyz0ag+pZeHnE+6W1alFf8D
         57fdW5D7WnzkAELwC/fqC1VM5oR93PQd4CmW/ddlFy9ww1/UewPIiBtmuNYUkpC3wEPr
         nGDSrZKhZLh0z81iLGpEqPSeiZnRnGgJNumHdmz76pPVx2Yqex4+S6MXBiOcDzkeRWax
         Xzz6B2LTjeIyIP1qAUYCXL+ZXYR2DS8XLy//NWZfr0EvFpGvPxc1YO7vZQH2sPfJ4rba
         HysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pclFtcRs7YKDVSvfXg81t8IDObK8j6FI0NyUOd5p228=;
        b=WkLQJ6T1XEvQo0ZNUpcnr4t6HtbVK/JNbfzR82sRzWbKDiDE6s2hMQBJD7vk4yhUi1
         KbRMy4Ue2qd/+VtYSRXfuc6DXw8iAlbZep/AVVc2Lh614MI5l+68isg+P00YobOP8I9R
         8k5vSpjVC2lY1bj7BEK+igS6e6tRewWSUM7M2uiSnUzqiSeU1mIKu5K8U4N5CqHhudBm
         LeM8ifV5AlbxDfh7Hmsp4sXWJV3P7oHfwxSplUTI9DN28oTKp40Y3v01f/arMFGbhFia
         2SY+pQ5nl4KDQfvw4toDTcVdRzGnO+cY5WfSSZNKLwF/6HEKYttw8gcUuSMYH/ClN+p6
         Nf7g==
X-Gm-Message-State: APjAAAXC5oKIcrca0GplDIpMI5GbHP59bpIcsNrKq9LmHGQmtU6AKahX
        bM6WUWmFS4YxxxwxstxYy1o=
X-Google-Smtp-Source: APXvYqyZEuP+4qRRHomwJsJlsqFSj/U7rv2re5iGcIEYTe6n95mN4iGoxejP2VnLLfZEMNbiAgmdkg==
X-Received: by 2002:a62:5c87:: with SMTP id q129mr19135312pfb.180.1552920718247;
        Mon, 18 Mar 2019 07:51:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h15sm11641583pgd.12.2019.03.18.07.51.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2019 07:51:57 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (da9052) Synchronize access with mfd
To:     Samu Nuutamo <samu.nuutamo@vincit.fi>, linux-hwmon@vger.kernel.org
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Jean Delvare <jdelvare@suse.com>
References: <20190318142953.GA23692@samu-ThinkPad-T480s>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <aea933dc-6109-12d9-a2c2-e367dd4e99d0@roeck-us.net>
Date:   Mon, 18 Mar 2019 07:51:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190318142953.GA23692@samu-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/18/19 7:29 AM, Samu Nuutamo wrote:
> When tsi-as-adc is configured it is possible for in7[0123]_input read to

in{70,71,72,73}_input ?

> return an incorrect value if a concurrent read to in[456]_input is
> performed. This is likely caused by a concurrent manipulation of the mux
> channel without proper locking as hwmon and mfd use different locks for
> synchronization.
> 
> Switch hwmon to use the same lock as mfd when accessing the TSI channel.
> 
> Fixes: 4f16cab19a3d5 ("hwmon: da9052: Add support for TSI channel")
> Signed-off-by: Samu Nuutamo <samu.nuutamo@vincit.fi>
> ---
>   drivers/hwmon/da9052-hwmon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
> index 8ec5bf4ce392..af136a638065 100644
> --- a/drivers/hwmon/da9052-hwmon.c
> +++ b/drivers/hwmon/da9052-hwmon.c
> @@ -249,9 +249,9 @@ static ssize_t da9052_tsi_show(struct device *dev,
>   	int channel = to_sensor_dev_attr(devattr)->index;
>   	int ret;
>   
> -	mutex_lock(&hwmon->hwmon_lock);
> +	mutex_lock(&hwmon->da9052->auxadc_lock);

This is, at best, a kludge.

The hwmon driver doesn't own struct da9052 and should not really access any of its
structure members. The problem suggests that __da9052_read_tsi() should have
been implemented in the mfd core, similar to da9052_adc_manual_read().

Guenter

>   	ret = __da9052_read_tsi(dev, channel);
> -	mutex_unlock(&hwmon->hwmon_lock);
> +	mutex_unlock(&hwmon->da9052->auxadc_lock);
>   
>   	if (ret < 0)
>   		return ret;
> 

