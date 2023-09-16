Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B13CD37BF
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 17:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjIPRE0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Sep 2023 13:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjIPRER (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Sep 2023 13:04:17 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F021CE6
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 10:04:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-274939681b5so1413796a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694883852; x=1695488652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkdTNcsTJaX7bSzqCBZ7fbA4vJc0EY1jxfluiUgiJV8=;
        b=RV4m79xhQKTYwc4BsXPbw1X9qgRBIGIGXfJGGwEs0Afs4gPmkw0nkRAzZrpaOqBlLA
         /sxtOETCrz85JKgRcOx9L0EwZp3iGlXzcRx2R1Y/DYzSfgagJnwR+WNP/mJoB8GMw+y9
         POFezUcwyfiP1QIc/Y365PquQac+tXt+Q0ChYQzcq+20zE5ky+m2GZw0TYRpWVR5dUmJ
         GMPQVM7LUsJTVT6wVzCaj4utKYfqQAnvbrWfQ9XZJHXugNdUhhdYLr4Y4vmJpp1jvto/
         UxDjQ2hz7xTiJkXjNzw/zCjDDchEbxBzwJ5ZioN5pPdMZnvgFAUD4sR9/mSRgVPFTH3H
         mimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694883852; x=1695488652;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkdTNcsTJaX7bSzqCBZ7fbA4vJc0EY1jxfluiUgiJV8=;
        b=EP0zK9rwJrjqyrR9x9/x28ZrqPCDH2iYPDQYf4UL98VvLJ7unoxxPVFjLOiXAb1eyo
         zSDaZNR0GP/5JYUOLYTecVKhWO6G1dYViPAswHMCusFo0mKbIOggF/6TZtENpPEeDDU8
         gHfIQzKrRaLSxfIi8rrmlu4E0zWwsV7vYx3+BEeweWuFdYrG34HGebnpDAIp9oiH8pr2
         MSihBwrJghLMQPgwk4uLGtVeOs1TH1Irw5IEPOoKbwzgWBYqwSBLnck+0ataFDaVvfBA
         Cc890nMOiwDjx2fzk8CHO6JVc7OUrt2a1NEnv0cl/vzfswktGGWCvLNKTj+FLoZuhkfj
         ElHA==
X-Gm-Message-State: AOJu0YxdU6IK58/rS4nm/AGxu/5LgJ5DYaAVzs2p+3dBJkIith3XGl+M
        0c0cCD/GNPai9eS7r3phNgw=
X-Google-Smtp-Source: AGHT+IHdaep+MG9+HhaH7up7Gk0+GW8hBEsye1YeKqtp7XlHuVlfbHCJXuz06z9zWePuX0L6xoC+Dw==
X-Received: by 2002:a17:90a:fc85:b0:274:2906:656a with SMTP id ci5-20020a17090afc8500b002742906656amr3990944pjb.5.1694883851978;
        Sat, 16 Sep 2023 10:04:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mv10-20020a17090b198a00b00274c541ac9esm1224577pjb.48.2023.09.16.10.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 10:04:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net>
Date:   Sat, 16 Sep 2023 10:04:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>,
        Doug Smythies <dsmythies@telus.net>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
 <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: hwmon: (nct6775) Regression Bisected
In-Reply-To: <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/23 09:43, Ahmad Khalifa wrote:
> Thanks for the detailed report, Doug.
> Would you be able to test out a fix please?
> 
> It's a basic guard line as _alarm attributes are assumed to be there when a sensor exists, but the device doesn't have an alarm for in5 (VIN8
> on the device)
> 
> If you could also confirm that your /sys/class/hwmon/hwmon?/in5_alarm
> file is there and showing 0, that would be great.
> 
> 
> ---
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 02a7124..5470aff 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -1753,6 +1753,9 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
>                  return PTR_ERR(data);
> 
>          nr = data->ALARM_BITS[sattr->index];
> +       if (nr < 0)
> +               return sprintf(buf, "0\n");
> +
>          return sprintf(buf, "%u\n",
>                         (unsigned int)((data->alarms >> nr) & 0x01));
>   }
> ---
> 
> More details - if the above patch fixes the issue...
> 
> The update of nct6798/nct6799 for additional TEMP sensors required
> separating them from the previous set of devices.
> 
> Both devices are very similar.
> Both do not have an alarm bit for VIN8 (index 5) where the
> shift-out-of-bounds check trips.
> 
>  >> nct6775_core: doug: nr: 21  ; index 5
> 
> Previously in5_alarm was pointing at bit 21 (which is bit 5 in reg
> 0x45b) which is reserved and *probably* always 0. With the update, 6798
> was pointed at the same ALARM_BITS as 6799 as the TEMP bits are
> different from other devices.
> 
> This is correct and it doesn't need to point back at the old BITS again.
> However, now I realise that in*_alarm attributes can't be switched off
> separately from their sensor - in5_* are all there except ALARM.
> 
> Seems the shift-out-of-bounds check was there prior to this change.
> I'm not exactly sure why this didn't come up in my testing on 6.5.0.
> 
> This is the only occurrence of non-existent ALARM in the middle of other
> sensors, so a simple guard check seems to be the reasonable thing here
> even though it may get evaluated more times than it should.
> 
> If it's confirmed to work, I can submit a formal patch later.
> 

The proper fix should really be in nct6775_in_is_visible(),
which should drop the attribute if there is no alarm bit for it,
similar to, for example, nct6775_fan_is_visible().
Something like

	int nr = index % 5;     /* attribute index */

	if (nr == 1 && data->ALARM_BITS[in] == -1)
                 return 0;

I think there is a also problem with beep attribute handling,
but that is a different bug unrelated to this one.

Guenter

