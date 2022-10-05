Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55491C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Oct 2022 22:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiJEWoF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Oct 2022 18:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiJEWoE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Oct 2022 18:44:04 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B314684E65
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Oct 2022 15:44:03 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 67so326066pfz.12
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Oct 2022 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJCzW6uCxDTrRhnpREfkfCpOvWhfBdbWkQ52xCFzMfw=;
        b=Gg3TD/MUqRDoXDJt77DBJRRzHGOs0GTrq1odLMjHZ+J35AsqMPU9CHRYcb8mQu0s7J
         N7ycDnXeRTXMvbATpH6E42GW0+nXCLiyV9Sop+JjJNoqBD6qooCZSOsEDpUwn55sGKiL
         cY+RfU9zTAI6ivz2SCTzFlnLmEuSQgwD4lFCrptNo2lAP3ergUCYNp3tOaIjFrWjZPRb
         qhITLOS2iNNzNY8KLMB3k8Zi6u4mJ4ssCakY0K007ZC39E2RKEb8hGhoqVrarbWoDiLI
         CjK6dyfPsUP23f/QtIrkNAY25ddDydNxyYn+ByFKHt7+J1A49bClg/9MoGgAGDpuTE9t
         gESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJCzW6uCxDTrRhnpREfkfCpOvWhfBdbWkQ52xCFzMfw=;
        b=WrzcQFQVHzkR6p7wrRq8AblRPHZwviyRW2hsU3YpmBHbta5AtHpaWSUWV3JeH1c5fe
         1zx85z3U5MBqIBInqyyMvg2PWzEKR4BRy/6QkEARLsesPuu7ooLjyVwtQ78ZerGQgwkG
         RxDe/J6twAjje3a/8CIbhLKe1Hbzc70IFjitYOw/CpK1kfAtjCMA2jiRaIlwnr8ZyOwm
         xMSSC7jjyQbTdIR+T7TvTIYZQMuJmz3rdxeD2oV5DsJi+TxjdGzP0PI/3i0aJ0gwwc9O
         3yVK9cCltKClSWP/78wQMyORqu/JS2vR53rQ9ch7aBWa/Vvblxk//6cWdDxTDhq0ADLg
         wj8w==
X-Gm-Message-State: ACrzQf3KIFEjSY8RyoUyHcefgAnB+8kSGEOfAfkDH3kUd64oaJRr5QgA
        AsRSIm5MBtLzwDPIWv4XV3zWkg/lkR5NXg==
X-Google-Smtp-Source: AMsMyM4CQGVxXg7xGAGa/GepM1NQZkEWTapCpu45n979/z+485Ay5fF22PtDlwvxtSp7rxrHEMAD4Q==
X-Received: by 2002:a05:6a00:124e:b0:561:b241:f47f with SMTP id u14-20020a056a00124e00b00561b241f47fmr2020527pfi.72.1665009843252;
        Wed, 05 Oct 2022 15:44:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090a1bca00b0020a848f29a1sm1574268pjr.57.2022.10.05.15.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 15:44:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5cdba0a5-9eee-7896-85c9-d89b0671f6dd@roeck-us.net>
Date:   Wed, 5 Oct 2022 15:44:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Nick Neumann <nick@pcpartpicker.com>, linux-hwmon@vger.kernel.org
References: <CADqNVTr55B6cCmRhm9dbwUrDzKK8Gsa2cPr34f3Wkdsrzs77XQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Trying to understand hwmon drivers - where is code that reads
 hwmon_chip_attributes?
In-Reply-To: <CADqNVTr55B6cCmRhm9dbwUrDzKK8Gsa2cPr34f3Wkdsrzs77XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/5/22 14:55, Nick Neumann wrote:
> Apologies for the newbie question. I'm trying to follow the hwmon code
> and see how hwmon_chip_attributes are read and used. (Namely, I'm
> interested in hwmon_chip_update_interval, and what the default update
> interval is if no interval is specified.)
> 
> I can find lots of different drivers that provide
> hwmon_chip_update_interval, but I'm looking for the code that actually
> uses its value, if that makes sense. I've been slowly trying to follow
> it through and am guessing it may be in the general device driver
> infrastructure, but haven't yet been able to follow it to the code
> that actually uses hwmon_chip_update_interval or the other chip
> attributes.
> 
> Any pointers to code or docs that would help? Thanks!

I am not sure I understand your question. Every driver supporting
hwmon_chip_update_interval (that is, the "update_interval" sysfs attribute)
will also use it, typically to set some chip configuration option.

There is no generic default value for this attribute. The default value,
if the attribute is supported, is chip specific.

Guenter
