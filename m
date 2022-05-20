Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B780C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 11:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236551AbiETLlq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 07:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236504AbiETLlp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 07:41:45 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B3A29837
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 04:41:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u30so13833846lfm.9
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5jC48Ht+Bcyme4Q7fEnWzFy8YbanLkE++0WXdYNkUu4=;
        b=ZoKgeB5FjwyDJ75wjq4ksZf9hKTd50hwZnEqNvTHYsaD5jWzg7FC8c0LAWWTIzy/NP
         LafKvOr7q4axNuz1/LBQvKY/ZxQAqjYegtJQskJZ8HAXX7wrQOtIrF9oa520cm/lQ2sy
         Pe0uMM0Rf7aY2sx9WnOoLDtK/J4ZsUANi+aUKi0GZNyCsS9x8BYQzckSq2F8OQv440t2
         JVZFP7njEw4vxM6EkIjLd1Mv+D+fxAxCYtalNvj+3NhbCu9ulXuaop1Hhsbizisii8tF
         aZBY+NAjTMy/R0Lmy9IDqRGKDtP8lwxLx4KPH89g7Z4B5oU0tNgL1uadKZW7x1P929oU
         GC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5jC48Ht+Bcyme4Q7fEnWzFy8YbanLkE++0WXdYNkUu4=;
        b=fuZxrkd3erie5b1Ydg+37YjQpe3CoLD6Ccx0QfLAW7OB8jX9ohfqKWA1HaX+dmjorE
         LdP0y3mweEx8A5Zm91mJOZc4b7/eshHFQsoRweAQMaoCpkvKzKUmeDM4slnf0DS5vYY4
         8/9aDnGTkZ30HeeMsuF7ZO76CgiSHtks0a2wzxAVKnYmuUo0i81WXWd8DAPyQPh9jlEF
         fuT2o+PR/rJlEpacYy2AwytX+OQq6lPqbHQe02R45LQbGC89QDcoc8qtBh/VsAivn+Tu
         IJWYcuNKbXfCxzTy9GcCCQENnl5oHCkWcVP+5TQs4VoXKG9StEkF8tF26J9o0FALK/Hd
         cy4g==
X-Gm-Message-State: AOAM5303BkjWJIKMRKbhf8LEcw3w8xDtZOTjnlOK8pMJ/CTpFIGVg+tV
        Z59SNFca9QJITk6uINEtfIQuMw==
X-Google-Smtp-Source: ABdhPJwiNxvzF9ggZuaPT1v3jo3hAgqnvSiiwWt+/3HYd82G69B7oqELDm0x9dVgJhTLOYzdOZ0eYA==
X-Received: by 2002:a05:6512:2146:b0:477:c619:ec2d with SMTP id s6-20020a056512214600b00477c619ec2dmr6044077lfr.179.1653046898235;
        Fri, 20 May 2022 04:41:38 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a9-20020a2e9809000000b0024f3d1daeebsm283070ljj.115.2022.05.20.04.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 04:41:37 -0700 (PDT)
Message-ID: <edfc8e63-74d0-0f4c-20a0-7e6c8d7d9a5a@linaro.org>
Date:   Fri, 20 May 2022 13:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 7/8] hwmon: (lm90) read the channel's label from
 device-tree
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-8-sst@poczta.fm>
 <bb833b7d-d3c1-0f63-019c-439ed0ec9aad@linaro.org>
 <Yod07jXUCEQIYcRj@t480s.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yod07jXUCEQIYcRj@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/05/2022 13:01, Slawomir Stepien wrote:

>>> +static int lm90_probe_channel_from_dt(struct i2c_client *client,
>>> +				      struct device_node *child,
>>> +				      struct lm90_data *data)
>>> +{
>>> +	u32 id;
>>> +	int err;
>>> +	struct device *dev = &client->dev;
>>> +
>>> +	err = of_property_read_u32(child, "reg", &id);
>>> +	if (err) {
>>> +		dev_err(dev, "missing reg property of %pOFn\n", child);
>>> +		return err;
>>> +	}
>>> +
>>> +	if (id >= MAX_CHANNELS) {
>>> +		dev_err(dev, "invalid reg %d in %pOFn\n", id, child);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	err = of_property_read_string(child, "label", &data->channel_label[id]);
>>> +	if (err == -ENODATA || err == -EILSEQ) {
>>> +		dev_err(dev, "invalid label in %pOFn\n", child);
>>
>> You did not make it a required property, so why failing?
> 
> But if you have it in device-tree, then at least inform the user that there is some problem with it.

Hm, true, the missing property would return EINVAL. Sounds good then.
x


Best regards,
Krzysztof
