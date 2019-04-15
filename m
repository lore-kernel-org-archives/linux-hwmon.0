Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B319CC10F13
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 02:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 756D9206B6
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 02:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2g59pGv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfDOCih (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 22:38:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34129 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfDOCig (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 22:38:36 -0400
Received: by mail-pg1-f195.google.com with SMTP id v12so7838654pgq.1
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Apr 2019 19:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y7szn8Qi5HWl6FU40q7HjsNMO0jms12DmUGlFlhMwis=;
        b=I2g59pGvlL9j8VAfJeLQubF1PAweIBmUEs3abyVwWzYFWRY1SKEQtS+PPLgg0Lr385
         ywK/53HD07FaEs5SaAKvGZDxky3hDhhnxh89phUhwFum1EnQZ4TqTijSoEPfmdrHY155
         dUAXvyGXvB600JiOaN7Sr1pJJxpx9TlXIrQFIOtpTRo/u10lS1GI+jMLY8ro1vwdrVX5
         FMua/uHGP3InKpTzMBeDhFOvenBw0U6NNZVH3tjpVYlQ0rXdTKtWmMvrfGD/y0r37sfR
         QVKQCfmjBXfLJmCj9f+BYyfm2J7gjjENvZ/x4pSuLmdB5WQkdicOINU8JVB+KTYZil3Z
         Bmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y7szn8Qi5HWl6FU40q7HjsNMO0jms12DmUGlFlhMwis=;
        b=GLAfx5HZnz6aYz0QqxEajLKfIsJXnZWuQRybdxs99NI3L1Q1y7PnUkSNHlcAUEDJrr
         8FThkHP+LlTLgZdVVyMI37jA0LFXrVtBxFwkBHTtT8CzgFXocUNqwvCYHbGblsw53JGS
         Rf7/u2C3TdFzbNOrlbBD/+vzi0yD4AtjxkZOFdGoh/qhlWcmhGudyFrnpGAG93wtGj7N
         21kTu1MHnDKTlWLwpBR1b0H/vAqF798uaMPI/NBypaHMXYC1Era1f7BH4hvA+0aEFheW
         +Q4QAzSxjwIdbunLTCfygLtb79UkRaQ1dX6fCWWIEK6IQuoCJds++/aO7gogiAVFT5/w
         4VHg==
X-Gm-Message-State: APjAAAX4bEzLzwXwGnA05phbOj5YPdIbo7yhBnP5+UzV5javUGZ2u03Y
        K5G8PxP+CUJ58EJ9kqWuZizmWaco
X-Google-Smtp-Source: APXvYqweqmhphVXqYHUzLiHy1XV5tm+8B77ycJ1BeD6gzkxZMom1lztcikcCbCLX46RWSeWrvIUI7Q==
X-Received: by 2002:a63:5057:: with SMTP id q23mr68287990pgl.30.1555295915997;
        Sun, 14 Apr 2019 19:38:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y10sm72123793pfm.27.2019.04.14.19.38.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 19:38:35 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Jean Delvare <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <4887ef85022d7ceb26905997c19a874d7d89087f.1555273192.git.krzysztof.adamski@nokia.com>
 <20190414223728.GB18461@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8b641f3c-c9d6-f70c-0f1d-f4287773574a@roeck-us.net>
Date:   Sun, 14 Apr 2019 19:38:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190414223728.GB18461@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/14/19 3:37 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Sun, Apr 14, 2019 at 11:59:38PM +0200, Krzysztof Adamski wrote:
>> PMBUS devices report values in real-world units. Those using direct
>> format require conversion using standarised coefficients and formula.
>> This operation is already done by pmbus_core and the default values for
>> coefficients are configured by chip drivers.
>>
>> However those default values are not allways suitable as they depend on
>> the value of sense register and environment used. For that reason, in
>> order to get values that make sense or just to get best accuracy, in it
>> may be required to tweak coefficient values. The proper values may be
>> measured during device production (to get best accuracy, they might be
>> callibrated for each individual unit) and stored as calibration values
>> in some place (like EEPROM or even a file).
>>
>> To support wide range of possible use cases, lets export those to user
>> space via sysfs attributes so that it can implement its own policies
>> about them. All those attributes are put into separate attribute_group
>> struct so that we can set its name to group all of them in a
>> "coefficients" subdirectory in sysfs.
>>
>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>> ---
>> drivers/hwmon/pmbus/pmbus_core.c | 104 ++++++++++++++++++++++++++++++-
>> 1 file changed, 102 insertions(+), 2 deletions(-)
>>
> 
> [...]
> 
>> +	pmbus_dev_attr_init(&ext_attr->attr, name, (S_IWUSR | S_IRUGO),
> 
> I screwed up and did not fix this also, sorry for that. I'm not sending
> an updated version (yet) as I didn't get your approval for the concept
> itself (though I still hope you will reconsider taking into account my
> latest arguments).
> 

I won't, sorry. As mentioned before, this is a generic problem that needs
to be solved for all hwmon drivers, not just for pmbus devices, and also
not just for pmbus devices using direct mode.

Even worse, this doesn't even work for pmbus devices in general.
PMBus supports commands such as VOUT_SCALE_LOOP and various other
calibration commands such as VOUT_CAL_OFFSET, IOUT_CAL_GAIN and
IOUT_CAL_OFFSET. Your approach doesn't even try to support those
commands; you only look at r/m/b which may suit your needs but are
hardly generic and even misleading since chip programming isn't
adjusted even when that is possible.

Addressing this problem in a generic way will require substantially
more thought than just adding a couple of pmbus direct mode specific
attributes.

Guenter
