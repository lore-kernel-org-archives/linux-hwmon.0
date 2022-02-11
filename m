Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96820C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 23:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349149AbiBKXx6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Feb 2022 18:53:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345849AbiBKXx5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Feb 2022 18:53:57 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3332D57
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Feb 2022 15:53:55 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s24so11357937oic.6
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Feb 2022 15:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WeL1ywhiGhauKG6tdnFGfKDYK4SUN5/dJ3a/nBTznGU=;
        b=JcSbK95why6AZ4FDPJIuPNyCSPT4Kx4KOVeJzDa1J33RIKJdiCs2VU9kAMbmUgarfX
         8R/SyaN6kwtkW8HkjJjOcQXNeyU+hfr4uaxRBCZxKSYLnwgCmh1/VbcDeANsnbSSc5Oo
         JKPeNAHGX99hBvZgkIiiH4So4zns0rUj0fIKAPCDBTcGhNOk9uaynO/oC+YiL7yhMaGv
         aE8/WvrsVChceEkg3XBdi59D1SsI6zdTQ0h/Z7ZrS2sH7bn6y1keYZWLC1FJXmTocDXL
         rj/3yVgkhRhmn4XvtWQaJNNj7YqwFJROd8HJ5f7Hg/gPlWk1rylPFbWp9y55wr5ToXFV
         OgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WeL1ywhiGhauKG6tdnFGfKDYK4SUN5/dJ3a/nBTznGU=;
        b=bnsSRDhuq+u8v/gh9KF/0ISnw76ViNczzQODt4jLY0SpkE1qvNYNaAoek2N1ajovXD
         US4k6GC9mnqmmsrvdOhMLeQvB+iXDro0k4nNgwPrHqvT8TVIxYXwRaRJQHiQ5/qP+AxZ
         RxK/rPZ4tic4uGw+kmZrjaLx9tU2WKiRACP0x/hhVkoQ8iUSnMCfAXIGvGuZkxAMCICr
         c+yewqowFu4ARDHDH5t+MJiXMWRcodmO/etSEe+bwOyZpRA6ySksO4GWS8mZ4OacAMWg
         b1bEKlqMPYrxlTCdwxwu/kcfu1FUV+L9jiev7YWiKCKCUt9leOSGkl28Amfoqg1HVZMP
         loDQ==
X-Gm-Message-State: AOAM531AXggaCaD7OmNtFEhkIpT/FMWlwDKnAa5GP73JXRZi/KuYFTvo
        Dxjq+GPOteEnRT3h5DjQGXIPay7ro7tLtQ==
X-Google-Smtp-Source: ABdhPJz1UQTh2L0pEaGLBPC3EtlDAaO4Z/lxJW1Mt9k2e595HejqMDs91tMyeVoIcQxcjTRn+IJ0QQ==
X-Received: by 2002:a05:6808:1283:: with SMTP id a3mr1333727oiw.57.1644623635212;
        Fri, 11 Feb 2022 15:53:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ek4sm10890709oab.23.2022.02.11.15.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 15:53:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1e28b6e1-8675-1059-1a79-7148e2a91e83@roeck-us.net>
Date:   Fri, 11 Feb 2022 15:53:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP464
 sensor chip
Content-Language: en-US
To:     Agathe Porte <agathe.porte@nokia.com>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209155308.88938-1-agathe.porte@nokia.com>
 <20220209155308.88938-2-agathe.porte@nokia.com>
 <53861f0c-6447-7a50-39c3-924290a6f9bf@roeck-us.net>
 <fec8df49-5ab1-c55a-b2ad-28f7591cf768@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <fec8df49-5ab1-c55a-b2ad-28f7591cf768@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Agathe,

On 2/11/22 02:11, Agathe Porte wrote:
[ ... ]

>>> +
>>> +static int tmp464_init_client(struct tmp464_data *data)
>>> +{
>>> +    int err;
>>> +    int config, config_orig;
>>> +    struct i2c_client *client = data->client;
>>> +
>>> +    config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
>>> +    if (config < 0) {
>>> +        dev_err(&client->dev,
>>> +            "Could not read configuration register (%d)\n", config);
>>> +        return config;
>>> +    }
>>> +
>>> +    /* Set the conversion rate to 2 Hz */
>>> +    config_orig = config;
>>> +    config &= ~TMP464_CONFIG_CONVERSION_RATE_MASK;
>>> +    config |= (0x05) << TMP464_CONFIG_CONVERSION_RATE_B0;
>>> +
>>> +    /* Start conversions (disable shutdown if necessary) */
>>> +    config_orig = config;
>>> +    config &= ~TMP464_CONFIG_SHUTDOWN;
>>> +
>>> +    if (config != config_orig) {
>>> +        config = i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
>>> +        if (config < 0) {
>>> +            dev_err(&client->dev,
>>> +                "Could not write configuration register (%d)\n", err);
>>> +            return config;
>>> +        }
>>> +    }
>>> +
>>> +    return tmp464_enable_channels(data);
>>> +}
>>> +

Turns out the chip is by default locked, meaning all those configuration writes
fail unless I explicitly unlock the chip. How would you suggest to handle that
situation, and how do you handle it in your application ?

Thanks,
Guenter
