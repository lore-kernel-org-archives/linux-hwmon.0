Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8917AC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 693916101D
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236637AbhJLOqc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLOqa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:46:30 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C62CC061570;
        Tue, 12 Oct 2021 07:44:28 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id z11so29379559oih.1;
        Tue, 12 Oct 2021 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9/iIZPSLxMWDFPWE4UcVTRmLPVNWNWoXNz3B2fxKuGU=;
        b=LtvnceVCNTzdot3yb9ylvBm2NFIFBOZu4o9Q8VNOYWN2E3TKQyh2kAkv8sGoou3owH
         caakymqEsCRueNqPrDRDeXuDB8co/tPp/RShcvoRseRYH5GPNu/hvd3fkHbwUmIePuQN
         auL/o+ZBxRIP43EuNcNwCmREwiXZc9rx3xsWgpKOLRqBF9CEX1YPtuge/sKELAJoUkYc
         OLBaFYB1Jr3etEwyJ+fmTgw+kNgkmiI7zAXq8xJ4li4zyR6ApjIXNU+PmxCpyBzyWLn9
         jt+mWThOxEPzCC9pQJmqh5HmKEJsWXT2C/WQYM/GsESX5V0aZiF4NknoZsdbJmHVdFxG
         2mNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9/iIZPSLxMWDFPWE4UcVTRmLPVNWNWoXNz3B2fxKuGU=;
        b=LV82bvBJG3SsuAxdwvtJULk5HuP+SLSvCW3KGfO9L8g1J3OPhM6Dv7+UoaAmcf1a+q
         Gq4yCIh+bxAgZH90zTCZw11eiZnz8IQXnaCgm7e8dohG7nS6rBzEmdpuTq1y/r0YVwi+
         VFgVZfwQxWQrGoCj3lz+AnLgzqhbYZI/tPWuYPpFTH/fftqNitAQfUJZNH9udj2gW3iJ
         oF5f2K5nhgf5/CujPbUognZ+5vCibenmTivYausy+XMX5IW2oazbIEjpVw4t4F9+YwQH
         qGyezZODXNX/XZKOComR5WsW+MrDFfb5BWZnSSVXU/GlATwc2rzf50cVpuhv1kPUNVvO
         ojDg==
X-Gm-Message-State: AOAM53241fppQTtkEJFS/0mhZgvwBAslCKmZjmYrXvZrfYRjMbEXwSLZ
        OhVAdwOZYubvSDouAk1NEkZC6cxNTi4=
X-Google-Smtp-Source: ABdhPJxB6uycq4rkWw1TQKiWoVq4KUZm5CtSN7+tMK8gkj9ZSDKPJcIEdjlmkwYqK4mzsHXTMyfK0A==
X-Received: by 2002:aca:5c55:: with SMTP id q82mr3885558oib.104.1634049867511;
        Tue, 12 Oct 2021 07:44:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d7sm2378926otl.19.2021.10.12.07.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 07:44:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 09/10] hwmon: (tmp421) ignore non-channel related DT
 nodes
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <8835efd6cc7ce6791056b7fbce92a16f72d63598.1634029538.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1a45d1fe-f387-333b-bf73-dfe2b3faadf4@roeck-us.net>
Date:   Tue, 12 Oct 2021 07:44:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8835efd6cc7ce6791056b7fbce92a16f72d63598.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/12/21 2:30 AM, Krzysztof Adamski wrote:
> In case the DT contains some nodes not describing the input channels,
> ignore them instead of exiting with error.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/tmp421.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 133eca1f2650..d44112fe2a14 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -411,6 +411,9 @@ static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *d
>   	int err;
>   
>   	for_each_child_of_node(np, child) {
> +		if (strcmp(child->name, "channel"))
> +			continue;
> +
>   		err = tmp421_probe_child_from_dt(client, child, data);
>   		if (err)
>   			return err;
> 

