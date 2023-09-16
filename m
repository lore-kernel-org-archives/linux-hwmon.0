Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C0CCD37B1
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 03:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbjIPDMz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Sep 2023 23:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjIPDMe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Sep 2023 23:12:34 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD491BDC
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Sep 2023 20:12:29 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-794c7d95ba5so105774939f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Sep 2023 20:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694833948; x=1695438748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RLqZ+ZUI+0JP6Tt8AWk9eb2h0av5ZzSqYqzfoyEPy64=;
        b=louY9E5cHsVKUwIFAR/tl/Io9+hsKqbYQ7Tyt6zBZs+II+W/WT6Yy05grXrLtKVwE9
         sUP3vZQC9+OacHNkkrUs1rEjJB9QnnXVpFWg5XjnQctMyde7hR1hEGCO4rxGc6VtS4Gc
         v4mB20xxTARfxHgEEzsOSfU+86SIrbfGLX/uxXsGzIPsYAs1ZrCntXc1eOCzGcOSsl5y
         Ispf2fLGKkJq4BDnCZZ7eqRfaCHbdZR4xyDh5YUAoV1LZCkDKsdn7tUhcXE4SsNEDGLr
         M/j6IfIRIcXcsF3rUFu9D5frFBxfaZUuDSHFZzl12TWR7dUB3RzTBhGnTT9JOmwOW/4a
         0khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694833948; x=1695438748;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLqZ+ZUI+0JP6Tt8AWk9eb2h0av5ZzSqYqzfoyEPy64=;
        b=Q5bl0at8cr1CDfVkGm13d+LY0A4kcFUKZdpo+2JVc5GkxXqeFQ01QeW+J3cv8/iXkD
         I2+w76qFoWuJKqGrhP+WonvzJ7x4aJNWNJnbDJpHwf1SbDMkl/Yj1S+/jeMvrPOaH5B7
         2aUVxvd6TzTzmVEBqUWuWg7GQbdI4Jn4eAhOAKewxkr3nkkXIV3lLb7etClTXWTru+lH
         ZIY/Lz1sQbsvaLJ8MI0NqVkhE5SGryKOhP/JnFu/es/hMu7bhWuEjlxw7UKtcHfxi6d9
         5uKCqr8815NgCR1o3gjQoUnm5ljqqeC3b1CuOjp3/rD5+xgVMf+IwH7BkbOFj/wrqraL
         PMrQ==
X-Gm-Message-State: AOJu0YyORyhVxHahhXytyk4qX9LQnVEOtCUl2PxJ/uzPRN97PNeuNx0d
        TtjeOM5+oL8fLVwnPtenxmIpOLG+flM=
X-Google-Smtp-Source: AGHT+IGcG4tp3ZISc9Ghxr/HCTsqzwmWCnANf3hynjA+Z2nccjhtGuKh8/2MiEF9wfoUZbN4ZjPyeg==
X-Received: by 2002:a05:6e02:1050:b0:34c:d0d6:5137 with SMTP id p16-20020a056e02105000b0034cd0d65137mr4034130ilj.8.1694833948523;
        Fri, 15 Sep 2023 20:12:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r5-20020a92c505000000b0034f37a27bb4sm1491795ilg.72.2023.09.15.20.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 20:12:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4fcd2434-afad-9469-0953-5b93ed7d3934@roeck-us.net>
Date:   Fri, 15 Sep 2023 20:12:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
To:     Doug Smythies <dsmythies@telus.net>,
        'Ahmad Khalifa' <ahmad@khalifa.ws>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
In-Reply-To: <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/15/23 08:00, Guenter Roeck wrote:
> Hi,
> 
> On 9/15/23 07:28, Doug Smythies wrote:
>> Kernel 6.6-rc1 has an error during boot. The guilty commit is:
>> b7f1f7b2523a6a4382f12fe953380b847b80e09d
>> hwmon: (nct6775) Additional TEMP registers for nct6799
>>
>> There seems to be confusion between the indexes into
>> the NCT6799_ALARM_BITS array or the
>> NCT6779_ALARM_BITS array. I do not understand the code
>> and do not know if it is the indexing that is reversed or the
>> wrong table is being used.
>>
> 
> Thanks a lot for the report. Ahmad, can you look into this ?
> If it can't be fixed quickly we'll have to revert the offending patch.
> 

I'll wait until around mid next week and then revert the offending patch
if we don't have a solution by then.

Sorry for the trouble.

Thanks,
Guenter

