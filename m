Return-Path: <SRS0=n6ZT=SY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666D8C10F11
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Apr 2019 18:31:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 296AF20896
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Apr 2019 18:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU5MhbOd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbfDVSb1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Apr 2019 14:31:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34735 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbfDVSb1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Apr 2019 14:31:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id v12so6245428pgq.1
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2019 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Nio6S+m4Dmt9F7SkeBbo4hL+ijrMaNW2h9h3jCE10w=;
        b=XU5MhbOdswQeOVon4wqDPXyy+OWarRzQ5VDfFvGqvOhbklZ1k+l/vnxRBuMHUBeZDz
         ZspIXfr/m1ntUq/KKgjhYMHrH67qYE/4gTrFSSFKdCQIPyVQlMSinVqVgb2WxInlm+0E
         IUE3CVifhX1GEZi1O4KrfWN4vpIkSwEp3bTr2RjWa3Ic74RuALCCVlKL8u1JeDPB8Qjz
         JlZc697LnBAYjkORHEitLj1jH1Fsl/QstkRWH3gAOzD4d/Dl9yPbbtK18Y2scjDMIKRI
         1S5W/jgXMgMrVgz62VV3MUAa7ePFn4lExfauM3sCzyMvjR9/TEXbpnm+aXWOAGXDyH8e
         kh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2Nio6S+m4Dmt9F7SkeBbo4hL+ijrMaNW2h9h3jCE10w=;
        b=guX6/QXaQq9xvg9oBVLtBMAygAIz+BXFbZWFWstxwiR3kTzjj8vjAI4esqsq0W1VKE
         9YfRxxviY0gq3wr2Xbuzc+YfkE4rQ0IS8V5ZqeGVLpOPX9GM9tHJ+6P96n2W7+XMQUzX
         p4vxMxWIycGJzE0YlbF1LiM0DID9MVnz6RDCHJofRIWH/RzvJFfITJip2pfQJpWHeuBd
         WjMHt0wKBXGV/rT0vokK6hwgLFrrC0rNQeduQxWchhDuQdNPiYgyr8mO5m6AfnpT32tm
         gapV7YYAGPd9LgTvVOosd8kQzn1WppoGIF29MfmYxv4azKTa/IQlsrI+Bq7Jn8kjStyh
         VOtw==
X-Gm-Message-State: APjAAAV98WNbcEfMcHlm9l69EIER9M0xA/xObj3NbjFHdKepiXIwYhp1
        zabMsqusS+OAPOQYRLQMnbRRJmj3
X-Google-Smtp-Source: APXvYqzRpq2caJhe4pnalRwwk0Jimi+Gzi9KFPNaICQe9NLXws4J8WRCa5jZa5XXnFPgJzQ7BnnIzw==
X-Received: by 2002:a63:c605:: with SMTP id w5mr19828135pgg.355.1555957886268;
        Mon, 22 Apr 2019 11:31:26 -0700 (PDT)
Received: from [10.67.49.15] ([192.19.223.250])
        by smtp.googlemail.com with ESMTPSA id p2sm39482865pfi.73.2019.04.22.11.31.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Apr 2019 11:31:25 -0700 (PDT)
Subject: Re: SCMI sensor reads unit scaling
To:     Guenter Roeck <linux@roeck-us.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-hwmon@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <9207bc01-e0c6-ef73-6a24-6deda7b789c5@gmail.com>
 <7d23066b-fd45-1784-3c2a-7e44eeae63bf@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <2e6a6141-762f-7618-60b9-84fa1190813d@gmail.com>
Date:   Mon, 22 Apr 2019 11:31:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7d23066b-fd45-1784-3c2a-7e44eeae63bf@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/20/19 10:31 AM, Guenter Roeck wrote:
> On 4/20/19 9:43 AM, Florian Fainelli wrote:
>> Hi Sudeep, Guenter,
>>
>> The current SCMI hwmon support does not seem to make use of the sensor
>> scale/unit as defined in the sensor replies (or the update scale for
>> that matter).
>>
>> I came up with the patch below which gets the job done, but I am worried
>> about possibly breaking people's SCMI deployments and sensors reading
>> because they may have intentionally or not already decided to return a
>> value which is scaled the way Linux's hwmon expect it, and may, or may
>> not have populated a valid unit number in the sensor reply.
>>
>> Ideally we should probably do two conversions:
>>
>> - from within scmi_sensor_reading_get(), scale the value as indicated by
>> the reply
>> - from within scmi_hwmon_read(), take that scaled value and apply the
>> necessary conversion expected by Linux's HWMON conventions (e.g.:
>> reporting voltage as mV values)
>>
>> What do you think?
>>
> 
> Reported values have to follow HWMON conventions. If not, this is a bug
> and needs to get fixed. The argument about not changing the userspace ABI
> does not apply to bugs.

Upon re-reading the SCMI specification, what is not clear to me is
whether you have the liberty to:

- target the Linux HWMON sensor units as specified by
Documentation/hwmon/sysfs-interface by e.g.: putting a millidegree
Celsius value in the SCMI reply and an power of 10 multiplier value of 0
(which would be treated as not doing any scaling)

- must provide the raw value as provided by the sensor as well as
indicate the scale, e.g.: millidegree celsius and specifying a scale of -3

Sudeep can you clarify how you would approach making use (or not) of the
power of 10 multiplier as defined by the SCMI specification?

Thanks!
-- 
Florian
