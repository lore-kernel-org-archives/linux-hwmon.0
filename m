Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBACC7EE2E
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Jun 2023 21:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjFJVMM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Jun 2023 17:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjFJVML (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Jun 2023 17:12:11 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9A7B8
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jun 2023 14:12:10 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b026657a6fso19363375ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jun 2023 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686431530; x=1689023530;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DbO/NzVZkdqPQIehdfbJMazHlfVPjiAsiixPp/tu3Ng=;
        b=GGzBZi6rLRHN6TTepunmOTPbdn/XqRFhTNjq1QAfEFWjNvmqLQMDMEDjebgb3U4JRD
         mXFxMRXPSsxZrS09Tf1NGUBPwM6x19N17C07a71quufQVbDUmf3l7rZXF3+jZOp+US+Y
         YdVIaCT2vk8K6JAML0jODxNCvVF4Qvjhn1WRzr5Ant4UKmXToEiY4wWT9h9dOv5K7HHX
         EAYl+MWPM5XcCtPL8EZde0vo/YZ0eTK08JRKPsyv7CU3H1F+CzBtPvJJAmKftwfUlGWc
         EPbXJF+n/iVKX05aL4dbEbP8NEKb7R/iE+awGy+UkAum+4gxY/LxMFOmZwwTwwwJYBYo
         9Z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686431530; x=1689023530;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbO/NzVZkdqPQIehdfbJMazHlfVPjiAsiixPp/tu3Ng=;
        b=kKIPdHryr0p/AO3Uc6Cfk3678JhJ67O7XbVfjG+8KvFEjInkqAT+ubbVTv665Z7ymp
         1qUw6EGmjK1MtKZt5iJDzYqbIa9+1lWDpQwUG4bC2jeqhdzKOq8J5XvWyvKkArFzXjQB
         SWtMutl3QeuiBueX97x00RYR6sIJmVhm+S2vVVV8ysUZ380k0XzIVSxPDbUzfWjFlFLu
         wyoG7vBnYhoO4sQLbbA+nSbv6tsnd8ftdO8Vz4NIK0PlGDysXgdlFA5b6ug36NVG2C62
         r1i6z0Jxb80qwioJVht4v8TpUqQnqR2ua6eqvZRO9ch9Sud6Apnhsk1P+9Uo2hK9gJGe
         ZdCw==
X-Gm-Message-State: AC+VfDwymXdvl6GwtGp57wucfQaCoKUKo22Z9jMQpV+0KDJRr/SZw3aU
        typS2fBM2ZMqUZQ9T3RqKYCtACLrrXw=
X-Google-Smtp-Source: ACHHUZ4u9WAOkZ4Opmh2fyJcW3wpE5fooP/1tCzxz7lW2FXEF4/T7A4s7QiDY/2zaMYpb5Ub1zwu/g==
X-Received: by 2002:a17:902:8505:b0:1b0:2b0e:d3ef with SMTP id bj5-20020a170902850500b001b02b0ed3efmr2304158plb.55.1686431529990;
        Sat, 10 Jun 2023 14:12:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id iw10-20020a170903044a00b001ac4e316b51sm1034902plb.109.2023.06.10.14.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 14:12:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b20232f4-9c08-1384-05b8-9fce6a920fbb@roeck-us.net>
Date:   Sat, 10 Jun 2023 14:12:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Enable AMD3255 Proc to show negative temperature
Content-Language: en-US
To:     "Kannan, Baski" <Baski.Kannan@amd.com>
References: <20230610205357.5658-1-Baski.Kannan@amd.com>
 <797319c5-9b03-704d-2e32-fadcec924019@roeck-us.net>
 <CY5PR12MB6432BF5EE9EAA15750FE4D778456A@CY5PR12MB6432.namprd12.prod.outlook.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CY5PR12MB6432BF5EE9EAA15750FE4D778456A@CY5PR12MB6432.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/10/23 14:05, Kannan, Baski wrote:
> [AMD Official Use Only - General]
> 
> Hmm.. Somehow the commit message was not included in the signoff email.
> Checking now.
> Sorry for the spam.
> 

That is not the only change you were asked to make. Commit description, version,
change log, unnecessary (), direct use of boolean instead of comparing it
against false, unnecessary {}, missing space between ( and { is just what
comes into mind immediately.

Oh, and also:

The subject needs to be "hwmon: (k10temp) Enable AMD3255 Processor to show
negative temperature" or similar.

Guenter

> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Saturday, June 10, 2023 3:59 PM
> To: Kannan, Baski <Baski.Kannan@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; Moger, Babu <Babu.Moger@amd.com>; clemens@ladisch.de; jdelvare@suse.com; linux-hwmon@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Kannan, Baski <Baski.Kannan@amd.com>
> Subject: Re: [PATCH] Enable AMD3255 Proc to show negative temperature
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 6/10/23 13:53, Baskaran Kannan wrote:
>> From: Baskaran Kannan <bakannan@amd.com>
>>
>> Signed-off-by: Baskaran Kannan <Baski.Kannan@amd.com>
> 
> Please resubmit and either make the changes you were asked to make, or explain why you did not follow them.
> 
> Guenter

