Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B75C2BA18
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 18:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbjIPSJb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Sep 2023 14:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjIPSJN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Sep 2023 14:09:13 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E67CDE
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 11:09:08 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-794e0e8b588so116057239f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694887748; x=1695492548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rE7HlYa0u6Ln9iPQoXdpClIIiyt8SDoF8j2m5GXUw/Q=;
        b=SthUeXliwuR0WqnFufHyacUcaTTyzJcCoNfG6O47r1fOUW9RPceax9wd24pZzTrWSP
         W/V3mZ38VAyxVE1U22y9gaG3RX7sdQaDnft4xj8ZfBf8LUE+fQPeOoG1SN8j3RUW9JIj
         ISclLb7eSERpgsW9wX8nmgYxwajC2JR/B1ikmaN6s+Q/0vruQb+ig/gxtuvf4XpoePhf
         mAzziYjIrn2DM5bc/yStvLp08nSy91fMAnKXdpoacm795Ku3qFC3n2RqklUagpZ8mSF+
         rI2DLP7lEnlLWTdWI35e62saONHVurPuPc/D2YcolvrhLpDtVOGbaYOSRegF++z/6DHu
         rT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694887748; x=1695492548;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rE7HlYa0u6Ln9iPQoXdpClIIiyt8SDoF8j2m5GXUw/Q=;
        b=Axu/6ToErf0pQ25ZI2OD7UxwRhsUOpaSASG4y3+PzYfU+tgglN0tyWXQICXIHb4zoS
         vRHk0ya5ChQIfMRhHR3FiApmzFWJpjUddeY+x95HNYzGfgL0SUks6Y4YHQsZjDo+7E7h
         o11C7wJXiom5DXQbE0KeG3Am9mkUbq6hqwZM9ttMKMTshnZ/eQzPLE0BY+I/Vd9uzfu/
         1YjCYjQYzH6deaq8vUxZfabXH2rz3scH1Si1cnz/PVPveyxuxRcr5BBfTsA+ocBnvdLB
         rO6wLmOnUu1+hzt5QoSJ99A0ve17Ha4cn6AUretidv4AZNKVyG5ARgAbs3vf/EmusDTE
         LA7A==
X-Gm-Message-State: AOJu0YydOgvfz4KKaXIISQ0ZSiNaa4pWuOt9Y98ptwicQ06Hj4ZoxD57
        3vgZA7GvH/3S9iSHTIrayo1iQEXd8Xo=
X-Google-Smtp-Source: AGHT+IHvTK9TSfg3bfiCP5HDfAeg7Ff/nznK1e2O4d7UYZAOqtdwYiksm7XA70wEHsbTZWTOSK68og==
X-Received: by 2002:a05:6e02:1314:b0:34c:e84b:4c5c with SMTP id g20-20020a056e02131400b0034ce84b4c5cmr6032348ilr.27.1694887747661;
        Sat, 16 Sep 2023 11:09:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 15-20020a92130f000000b0034ab1828179sm1903348ilt.14.2023.09.16.11.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 11:09:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4272e48d-97c0-c605-ed19-070dae40781e@roeck-us.net>
Date:   Sat, 16 Sep 2023 11:09:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: hwmon: (nct6775) Regression Bisected
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>,
        Doug Smythies <dsmythies@telus.net>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
 <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
 <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net>
Content-Language: en-US
In-Reply-To: <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/23 10:04, Guenter Roeck wrote:
[ ... ]
> 
> The proper fix should really be in nct6775_in_is_visible(),
> which should drop the attribute if there is no alarm bit for it,
> similar to, for example, nct6775_fan_is_visible().
> Something like
> 
>      int nr = index % 5;     /* attribute index */
> 
>      if (nr == 1 && data->ALARM_BITS[in] == -1)
>                  return 0;
> 
> I think there is a also problem with beep attribute handling,
> but that is a different bug unrelated to this one.
> 

I think beep attributes are ok after all. All voltages have them,
and nct6775_fan_is_visible() already checks for beep bits.

Guenter

