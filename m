Return-Path: <SRS0=9wTL=53=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5944C2BA19
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 05:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93C0E20936
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 05:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTGTWyhl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgDKFQI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Apr 2020 01:16:08 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52086 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgDKFQI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Apr 2020 01:16:08 -0400
Received: by mail-pj1-f66.google.com with SMTP id e16so1229641pjp.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2020 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bU58jgAX12f/oNK2hOo9aRXMvItn8c3IQu3JTWWunRI=;
        b=hTGTWyhl8EBGsEoepbBauIooydPMpV/vO7fW0LDzk9OnNeNMPO+DC22QiiXS7iV/y/
         qwWUAL4Gv4KCxzuMG1cHPXDWdFcjUOjpC77nUueC0tptLE57QXKZcFeq8rDSFOwmjBO2
         1VGUFlzT88MZASJY0CWBfNFDo6LHUw+hQluND6IqMDjugWaybo1T7Iye+2sPqYRBnu4I
         R6zvgVIcaWlbUu8x5juZ1tGwSDjlDfOaWNOWeF0IF1Sn+Z9H4jGQ37kYG2xC0BLDPze8
         luvCo6FRmsVitjchX5UpJ9cCD6o9mSPrG625nKxEV50GbUPIRxTfFK92bPlT1gZvoq+a
         JQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bU58jgAX12f/oNK2hOo9aRXMvItn8c3IQu3JTWWunRI=;
        b=D+MtGob9GcWGsZQwH22cEmi+h/srgJnR8ZjAMgOkT+XSA9t/lG7w91ZafkrvGjEgLI
         ChBV9+9MEOPWcwGrrhHceewpCeUkErlltoCw1pBq+E/Eg40NYwoNqnVUX/5foh51tjHh
         6y3MzDV2oNl8XnoIdkq7l8M1Nwv35DRAl37K6v/JOjUp68+B4aKNDW1sk6uHI9WWVE2v
         LRzJ8sFcZlu2VVA4DgH/S9SdwdxCsFdIsDeld2ewNlbpYvD80v8iYDNOmLEgCnMHNnmh
         JwBU8dzYgEZnXssBiEKBs0wRoQ4ocl0EWVTMjL21eBNJa/8V5Klzz4T21WJUMngBsrAZ
         Pg+g==
X-Gm-Message-State: AGi0PuYO2ATQO7nitDVMtVDZhwmetZs8L3TErHAjHyYyiqJA7KiGlMc3
        0Un9q0XYenBifvxD7sfe7jz08Gsp
X-Google-Smtp-Source: APiQypK/1AgjAdar/FtMPRtC46h0xHTJn5U+zFY6XzYK5DMokBfkbStex9JlxyYv7edVlLqCscb3lA==
X-Received: by 2002:a17:90a:c290:: with SMTP id f16mr8661999pjt.183.1586582166796;
        Fri, 10 Apr 2020 22:16:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9sm3248153pjt.45.2020.04.10.22.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 22:16:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] hwmon: Add amd_energy driver to report energy
 counters
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200409153939.38730-1-nchatrad@amd.com>
 <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
 <CAHfPSqC-1f7gSTM1X_dhjyMjcZC0SCANbukpauASGX_pAwwZbg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <212d9b7a-d987-e21b-e59f-cc2eeab3a0af@roeck-us.net>
Date:   Fri, 10 Apr 2020 22:16:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHfPSqC-1f7gSTM1X_dhjyMjcZC0SCANbukpauASGX_pAwwZbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/10/20 9:49 PM, Naveen Krishna Ch wrote:
> Hi,
> 
> Thank you for taking time to review and provide feedback.
> If you can kindly address a few questions, i would start addressing
> your comments and submit another version.
> 

[ ... ]

>>> +
>>> +static ssize_t amd_core_u64_show(struct device *dev,
>>> +             struct device_attribute *dev_attr, char *buffer)
>>> +{
>>> +     unsigned long long value;
>>> +     struct sensor_data *sensor;
>>> +     int ret = 0;
>>> +
>>> +     sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
>>> +     ret = rdmsrl_safe_on_cpu(sensor->cpu_nr, ENERGY_CORE_MSR, &value);
>>> +     if (ret)
>>> +             return -EAGAIN;
>>> +
>>> +     return snprintf(buffer, 24, "%llu\n", value);
>>
>> It seems to me this reports raw values. This is unacceptable. Values need
>> to be scaled to match the ABI. Energy is reported in microJoule.
> I was of the opinion that driver provides the raw values and user-space (can use
> float/double)  will be able to scale the value, which would involve
> calculation of
> "1/2^ESU * RAW value"
> 

Please see Documentation/hwmon/sysfs-interface.rst. Sure, there is
/etc/sensors3.conf, but that only applies if the kernel driver can not
provide scaled values. This is not the case here.

FWIW, I implemented prototype code for this some time ago as
extension of the k10temp driver, and the arithmetic wasn't that
difficult.

Guenter
