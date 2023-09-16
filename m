Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA4AC2BA1A
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 20:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbjIPU1T (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Sep 2023 16:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbjIPU1M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Sep 2023 16:27:12 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A889CE1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 13:27:04 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68fbbb953cfso2874084b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694896024; x=1695500824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I+92zkZT8Ox45aYPx0Mv5hlypM/9SddON9eJIIalXFg=;
        b=do81kiVKjdZEy7VTj/l+TkJ5gZ6ejcbgeWW5bLvayODxZdTCT0Dfy8Z4ebZns2Mlrt
         nvJyXAEUzBnKhZglZvKkLWWxmf3Ircmq9+5RbUmbUFtEQGoZpUKzJowL/tUKshFt5HsD
         MwfwwMpeTeIiKsk5+HBV5LhRFhaK4O89JDFbTJdZcSxAKiJQu2J91prqPu7yt4TWuDgo
         IBvonMUTq49vchICJb/of5Ls4yRIyIt0GrBp71J6aGGzASwfKk13W2HRF3jf6fmya4v7
         hzqc1s2OMN1P8jICf+6GgNmBStlhftHigjMqFUDHYwTk2k+vmSCNIYWtqkMAjAEwLOOF
         wr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694896024; x=1695500824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+92zkZT8Ox45aYPx0Mv5hlypM/9SddON9eJIIalXFg=;
        b=adZw/5rlm9okXJGbH2bRLdanmmu7S7PW8l5aQx00gKN8KQIJeYCD32htON5DerBnu1
         YWiOlvce307dQ+l/7lioPpFlTre9C24ICek2/o5f59fqjJjH++k2HrqwvozaG/H/JUJv
         kxMKYZstnS7bnAVkturJ/ZK3XqauCq5Xc2N4+WKUjYkEmkoraIRxt87xp+1DR4EJ5Lm2
         ekg+gU5TaGSvoLLy2JDW1LJXFZHtmCiqecpSOaBEukhcEuYA6K6noAArgeeZ4ZP/m+Xe
         /6iIp2gxDh+IYB8SemgOVVVdm3vJefzVg3yBgKJJelofAe30jtBnojgz2J6grOrkF8OT
         0WZA==
X-Gm-Message-State: AOJu0Yy2rj2cc4DaaDWXTZ6GQ+HZ5ipbg8rv3zkxT7lPSgYKG/E644QB
        nuVkEFWWmFxx1SCdc3MDveV419ZI96M=
X-Google-Smtp-Source: AGHT+IFbzWIUE7HZHXSLZVg/DqAHZIQT5LzpUNLsYtics6a1AbJ4sILYP5sgoKeL89y6ROXA652dgg==
X-Received: by 2002:a05:6a00:23c4:b0:68f:a661:d037 with SMTP id g4-20020a056a0023c400b0068fa661d037mr7056468pfc.3.1694896023782;
        Sat, 16 Sep 2023 13:27:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n24-20020a62e518000000b00689f5940061sm5017480pff.17.2023.09.16.13.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 13:27:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2bd7130c-9542-9233-0cfb-448b3c8d6fc2@roeck-us.net>
Date:   Sat, 16 Sep 2023 13:27:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-US
To:     Doug Smythies <dsmythies@telus.net>,
        'Ahmad Khalifa' <ahmad@khalifa.ws>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
 <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
 <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net>
 <f8f05448-a4b2-d094-47a0-34bd3be7ae20@khalifa.ws>
 <74740d32-acda-cd89-ab11-270ce8393c12@roeck-us.net>
 <003001d9e8d4$32a86db0$97f94910$@telus.net>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <003001d9e8d4$32a86db0$97f94910$@telus.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/23 12:30, Doug Smythies wrote:
> On 2023.09.16 11:11 Guenter wrote:
>> On 9/16/23 10:45, Ahmad Khalifa wrote:
>>> On 16/09/2023 18:04, Guenter Roeck wrote:
>>>
>>>> The proper fix should really be in nct6775_in_is_visible(),
>>>> which should drop the attribute if there is no alarm bit for it,
>>>> similar to, for example, nct6775_fan_is_visible().
>>>> Something like
>>>>
>>>>       int nr = index % 5;     /* attribute index */
>>>>
>>>>       if (nr == 1 && data->ALARM_BITS[in] == -1)
>>>>                   return 0;
>>>
>>> Perfect, that's what I looked for but couldn't figure it out in
>>> a rush. If it's confirmed, I'll convert the fix so it hides the
>>> attribute instead.
>>>
>>
>> I'd suggest to just send a patch. We can always update it with v2
>> if a revision is needed.
> 
> Hi,
> 
> And thanks for your quick attention on this.
> 
> If I understand all the emails correctly, the above supersedes
> the previous patch suggestion.
> 
> I tested it with kernel 6.6-rc1, and it fixes the issue.
> 

Excellent, thanks a lot for testing!

Guenter

> doug@s19:~/kernel/linux$ git diff
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 02a71244fc3b..ead5d83f1594 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -1753,6 +1753,9 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
>                  return PTR_ERR(data);
> 
>          nr = data->ALARM_BITS[sattr->index];
> +
> +       pr_info("doug: nr: %d  ; index %d\n", nr, sattr->index);
> +
>          return sprintf(buf, "%u\n",
>                         (unsigned int)((data->alarms >> nr) & 0x01));
>   }
> @@ -1910,6 +1913,10 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
>          struct device *dev = kobj_to_dev(kobj);
>          struct nct6775_data *data = dev_get_drvdata(dev);
>          int in = index / 5;     /* voltage index */
> +       int nr = index % 5;     /* attribute index */
> +
> +       if (nr == 1 && data->ALARM_BITS[in] == -1)
> +               return 0;
> 
>          if (!(data->have_in & BIT(in)))
>                  return 0;
> 
> You can see I left my pr_info statement in, and got:
> 
> Sep 16 12:16:17 s19 kernel: [    3.091829] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> ...
> Sep 16 12:16:17 s19 kernel: [    3.744414] nct6775_core: doug: nr: 0  ; index 0
> Sep 16 12:16:17 s19 kernel: [    3.744442] nct6775_core: doug: nr: 1  ; index 1
> Sep 16 12:16:17 s19 kernel: [    3.744466] nct6775_core: doug: nr: 2  ; index 2
> Sep 16 12:16:17 s19 kernel: [    3.744490] nct6775_core: doug: nr: 3  ; index 3
> Sep 16 12:16:17 s19 kernel: [    3.744514] nct6775_core: doug: nr: 8  ; index 4
> Sep 16 12:16:17 s19 kernel: [    3.744555] nct6775_core: doug: nr: 20  ; index 6
> Sep 16 12:16:17 s19 kernel: [    3.744578] nct6775_core: doug: nr: 16  ; index 7
> Sep 16 12:16:17 s19 kernel: [    3.744601] nct6775_core: doug: nr: 17  ; index 8
> Sep 16 12:16:17 s19 kernel: [    3.744625] nct6775_core: doug: nr: 24  ; index 9
> Sep 16 12:16:17 s19 kernel: [    3.744649] nct6775_core: doug: nr: 25  ; index 10
> Sep 16 12:16:17 s19 kernel: [    3.744672] nct6775_core: doug: nr: 26  ; index 11
> Sep 16 12:16:17 s19 kernel: [    3.744695] nct6775_core: doug: nr: 27  ; index 12
> Sep 16 12:16:17 s19 kernel: [    3.744718] nct6775_core: doug: nr: 28  ; index 13
> Sep 16 12:16:17 s19 kernel: [    3.744741] nct6775_core: doug: nr: 29  ; index 14
> Sep 16 12:16:17 s19 kernel: [    3.744769] nct6775_core: doug: nr: 6  ; index 24
> Sep 16 12:16:17 s19 kernel: [    3.744787] nct6775_core: doug: nr: 7  ; index 25
> Sep 16 12:16:17 s19 kernel: [    3.744805] nct6775_core: doug: nr: 11  ; index 26
> Sep 16 12:16:17 s19 kernel: [    3.744822] nct6775_core: doug: nr: 10  ; index 27
> Sep 16 12:16:17 s19 kernel: [    3.744846] nct6775_core: doug: nr: 23  ; index 28
> Sep 16 12:16:17 s19 kernel: [    3.744866] nct6775_core: doug: nr: 33  ; index 29
> Sep 16 12:16:17 s19 kernel: [    3.752903] nct6775_core: doug: nr: 12  ; index 48
> Sep 16 12:16:17 s19 kernel: [    3.752913] nct6775_core: doug: nr: 9  ; index 49
> ...
> 
> ... Doug
> 
> 

