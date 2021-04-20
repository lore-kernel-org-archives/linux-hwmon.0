Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E27BC433B4
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 13:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D50B6113C
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 13:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhDTNol (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Apr 2021 09:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbhDTNok (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Apr 2021 09:44:40 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BCCC06174A
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Apr 2021 06:44:08 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id u80so5392919oia.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Apr 2021 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iSZd/Gitq2QLIlQyQ9F+SGQ0ge27gUJm+Zgn1X3bF+Y=;
        b=V+lRwXejblrdfVPn2kxoiiNWMc4hce7FYRS/2KQ81U7BeQ3HxZ+dSb7yQdWR1YNvQt
         iUQlVxaI+3O0TJa0zpp1h7KvTk3jT4Ia8e1qYgfGgyiBDghXYSCNBpqIaYAqhsZZ51Kz
         Cjsp3Uu4+Ptcf/2eYNdTmBq/RCl8JzLLKZ6YUc2XDVpapSTGk8fe07dgGKS+RpvXWaHm
         fs4Fjb4DLxgoMqOhXogwfWan7sEjCqwLNh33SQG0nsTDKJ5hu9CheZ7qGKLJmLv+n/MQ
         vcbsFM/juPHLD/tTs4ck6zxtlgRGp2Qaur4V/Xp3TXhqN+RHPt9g+ZTv+2vS0ydXKQbl
         OJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iSZd/Gitq2QLIlQyQ9F+SGQ0ge27gUJm+Zgn1X3bF+Y=;
        b=cJ2dHBEqNkHz7YNgTFGBDYlD9xfMVoNo6Tgc6y9SCPFnchiIHaQhCFlFTbxMQKUf+2
         +aJ2zERhXo6ItE5NfVCrNc648eexSp3XozDBA6youn7poPK6VqYguZAdfIx3XkYfFG+z
         x/ECgsPBJYPgow/0lNrffypxugAVRQpY9U78ukjTudXKz3A4pfrideQebr4ELklXSBWL
         ecX2/W1uPxE/d4pg7f9YmX2wtq9zBFHr/hbS2ByLZoVIWAmzM/kzcHBn35iOI5oP2Ryj
         932eMe/qiCfO8+LLu7eh2EDXZHqioCi8i4XTWPLU+aIRgbifJHVKto4twLwTPAwqGXg8
         HsfA==
X-Gm-Message-State: AOAM533oRZBEQN9C0R02wlMBpYol1rThWJzXIHclmq9LP4ev3Sz1vK6c
        C6BkI08dqqpYMh5mTqznw0c1VTDbyhM=
X-Google-Smtp-Source: ABdhPJzUsamGjPLCNyaaf9+HH2WjOQk03NORqPyzBncf27c7HArh+dvrKh+RKLNAWXOi6yQtVtYApg==
X-Received: by 2002:a05:6808:1405:: with SMTP id w5mr3219639oiv.48.1618926247541;
        Tue, 20 Apr 2021 06:44:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a134sm1059142oii.29.2021.04.20.06.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 06:44:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: Question: Driver support for SHT4X temperature and humidity
 sensor
To:     Navin Sankar <navinsankar28@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
References: <CAPYOJtUuoWN33hLc+2u78tbp1y5svkfwtSnH-UZdbpV+cV78yw@mail.gmail.com>
 <a9dacd1c-0e88-408b-03f6-396c5a30db23@roeck-us.net>
 <CAPYOJtV_5OqmwU=MXq7atmFL85Jg=p0ekvOFfN9yiaKroUXjmQ@mail.gmail.com>
 <cdc5c98b-c8dc-48d8-4029-a8b3ed406cb4@roeck-us.net>
 <CAPYOJtWXKMZXys07sQcefYOzk93_awdQDbjbZf5CXp3F2vsCEw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bfc23e90-b2f9-6315-1871-ab1530ffcfde@roeck-us.net>
Date:   Tue, 20 Apr 2021 06:44:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPYOJtWXKMZXys07sQcefYOzk93_awdQDbjbZf5CXp3F2vsCEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/20/21 6:15 AM, Navin Sankar wrote:
> I thought this way, by looking at temp & humidity drivers in iio.
>  Sorry for the noise. Since I am new to kernel contribution.
> 

Normally it is a question of use cases. If the sensor is
typically used for hardware monitoring of the system
it is built into, it belongs into hwmon. If it is typically
used for other purposes, it should reside in iio.

Guenter

> Thanks & Regards,
> Navin Sankar N V.
> 
> On Tue, Apr 20, 2021 at 4:18 PM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 4/20/21 12:14 AM, Navin Sankar wrote:
>     > On Tue, Apr 20, 2021 at 11:57 AM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net> <mailto:linux@roeck-us.net <mailto:linux@roeck-us.net>>> wrote:
>     >
>     >     On 4/19/21 9:43 PM, Navin Sankar wrote:
>     >     > Dear Maintainer,
>     >     >
>     >     >     I am trying to add driver support for sensirion based temperature & humidity sensor sht4x.
>     >     >
>     >     > I am bit confused, where to add support for this driver. Either in iio subsys or hwmon subsys?
>     >     >
>     >
>     >     The sht[23] sensor drivers are in hwmon, so I'd normally suggest
>     >     a hwmon driver.
>     >
>     >     Having said that: What is the cause of your confusion ?
>     >
>     >     Guenter
>     >
>     >
>     > Thank you for the clarification.
>     >
>     > I thought the convention is to use iio for new temperature and humidity sensor.
>     >
> 
>     I didn't know that; that decision was made without consulting hardware
>     monitoring maintainers. Can you point me to the relevant exchanges or
>     documentation ?
> 
>     Thanks,
>     Guenter
> 

