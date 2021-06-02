Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF91FC4708F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 18:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81C4F61263
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 18:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhFBSoW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Jun 2021 14:44:22 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:36854 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSoV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jun 2021 14:44:21 -0400
Received: by mail-ed1-f42.google.com with SMTP id w21so4003328edv.3
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Jun 2021 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aA6t+RFH6h9m3cbYD0eRjMB82kwRGZB4a6SuZXwckcY=;
        b=MBzaTrxXB7Liekl/ShYJO4WDEuiJ7MU/8pDShyR4P1nUffZotjM2KjCZoKLchBdQS5
         lu2PrRmJpXPBaNtR+muW0SRlPKpgO8lY0ou0ohZZMRPhyb6d4lH28V4LiX4wWZnrhMWZ
         LGkDBdT3IZ6Babzz3520GiKlizN+T1OdmNDPOXRM9yDobwZ1Pm46GbliBzgwimYADgF2
         arlrN5XrJ6dL7ep3Be/BuQ3yUmJ99aTOvtRx646DNx943eyU8+Vc5KWf8T9hOIPoi+Z+
         bI/ICuQ9q9J7NHJ3dfecGRInTNub/IisZqPHJEBsMWxMXzkJ5IxWY0h/tiMe4wL5pSzp
         7Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aA6t+RFH6h9m3cbYD0eRjMB82kwRGZB4a6SuZXwckcY=;
        b=Lld1eoBCWTC98CKVzj/xgiKsSWOrbL6OeKC+aJx7/Ivz6OGUZwLDge7TzoR+Tek6kr
         izaqHlWuGh7FiseKP4hSsBq3Bpd9IGa4kLR3LgdtI9HLzD1LVKz/Z9GjzXOtVWJF2wRy
         Q/Cce1/re4v2h7LDF0Kh0NDdw51GU84zB+j5W+3jEC17z5HN2V0JbYj/v87FNQIiphKh
         UKaOIDtGx/r/SsK3f9vqviZ688YKA9k7WjmFWAH8laJFUo9ls5RYrdVuyvOfWepK2rnn
         S+R1erfxWPLob14Q+n2LcBDn+0mYQMF5xanABZWGBeP/dOnkvOFlJTV9PhypkMF6NWr5
         yNYw==
X-Gm-Message-State: AOAM531buCR91R041m1+2GnFhfgQrR4z1/96riSlAezTzF+H4TvxZsEk
        OqM61Ia3wGo4zLrGJxp1yy/8oHwtaYh4x+qGwx7K9wd1jxd5Yw==
X-Google-Smtp-Source: ABdhPJwkxd6w0X9znF/p7wVaLPhMx+ywGiSGVIf++Ik66e55IkWpssaoidvBn0b5v0GQRLcq1lIgoJ/b8rQdWezVq7A=
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr40925195edt.246.1622659297618;
 Wed, 02 Jun 2021 11:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <9681d2a6-c820-c5a0-2cc1-e0b7fc808dae@linux.vnet.ibm.com> <ca1268bd-8134-352f-bfc1-665abfa7f42c@linux.vnet.ibm.com>
In-Reply-To: <ca1268bd-8134-352f-bfc1-665abfa7f42c@linux.vnet.ibm.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Wed, 2 Jun 2021 11:41:26 -0700
Message-ID: <CABXOdTegoRVC_3Ks8sTnbhZaGmGXLu_w47Dx5BydLLkGX8Au3A@mail.gmail.com>
Subject: Re: Regarding Pressure sensors for atmospheric, station, and
 barometric pressures.
To:     Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Guenter Roeck <groeck@chromium.org>,
        linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
        Milton Miller II <miltonm@us.ibm.com>,
        Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Bruce,

On Wed, Jun 2, 2021 at 11:14 AM Bruce Mitchell
<bruce.mitchell@linux.vnet.ibm.com> wrote:
>
> Hello Guenter,
>
> I've been asked to expand the To list to include you and hwmon.
>
> In reference to:
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-iio
>
> There is this section:
>
> What:           /sys/bus/iio/devices/iio:deviceX/in_pressureY_raw
> What:           /sys/bus/iio/devices/iio:deviceX/in_pressure_raw
> KernelVersion:  3.8
> Contact:        linux-iio@vger.kernel.org
> Description:
>                 Raw pressure measurement from channel Y. Units after
>                 application of scale and offset are kilopascal.
>
> What:           /sys/bus/iio/devices/iio:deviceX/in_pressureY_input
> What:           /sys/bus/iio/devices/iio:deviceX/in_pressure_input
> KernelVersion:  3.8
> Contact:        linux-iio@vger.kernel.org
> Description:
>                 Scaled pressure measurement from channel Y, in kilopascal.
>
> What:           /sys/bus/iio/devices/iio:deviceX/in_humidityrelative_raw
> KernelVersion:  3.14
> Contact:        linux-iio@vger.kernel.org
> Description:
>                 Raw humidity measurement of air. Units after application of
>                 scale and offset are milli percent.
>
> What:           /sys/bus/iio/devices/iio:deviceX/in_humidityrelative_input
> KernelVersion:  3.14
> Contact:        linux-iio@vger.kernel.org
> Description:
>                 Scaled humidity measurement in milli percent.
>
> Nowhere do I find the unit kilopascal used in atmospheric pressure.
> To stick with International System of Units and its Prefixes
> https://en.wikipedia.org/wiki/International_System_of_Units#Prefixes
>
> The standard unit for used in atmospheric pressure measurements or
> readings is the hectopascal (hPa), in meteorology, for atmospheric
> pressure, the modern equivalent of the traditional millibar.
>
> What would it take to make this change to the standard for
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-iio ?
>

The short answer is "you don't". The ABI states that pressure is reported in
kilopascal, not in hectopascal. We can't change the ABI because existing
user space code depends on it. Changing it would be equivalent to changing
the ABI for, say, temperature from degrees C to degrees F, or Kelvin.

Quite frankly I don't see your problem. 1 kilopascal = 10 hectopascal. Take
the reported number and multiply by 10. What am I missing ?

Obviously I _am_ missing the entire discussion so far, so my response may
be  completely off track. If so, my apologies for the noise.

Thanks,
Guenter
