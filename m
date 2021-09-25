Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37692C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Sep 2021 13:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C6E360FDC
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Sep 2021 13:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245520AbhIYN2J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Sep 2021 09:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245152AbhIYN2I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Sep 2021 09:28:08 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E25DC061570;
        Sat, 25 Sep 2021 06:26:34 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so17195402otx.3;
        Sat, 25 Sep 2021 06:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=STTjPalLMSFj3NA/5gOM9KdNmz0Dz40jIybWNHN+/bw=;
        b=lOxKJqDfUdV0WsX3+8wvaCAFUE47ayzzJwbg5+IrifMCs3/8C+DC4U5TlMOwR3Zsx8
         yr5BeBCJSkJW48sPP3n9uiVHSF9MmhPDzUs/HTb+gmDFHa8lxU5zQFw8Ity8I2sNtHCD
         //c4YPGasPK0K9aJQ0mhMx65abq5fj3RXLgbR3qUY+4DdIWE73SeqDkNNuFi1OZQKBU+
         J2sD8gtAOFfTZJuvmYq0Wa5GAxSPVIy1Ho/zL4T2/MqdoOjY45OKfo/SbDuCX3jKhX7X
         p0K+WGGh46//aag5GpfyQqj7IwTumIG+U+whgFMBZtrFIuDbL4JdZJf0kWTHalWl7m9z
         vJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=STTjPalLMSFj3NA/5gOM9KdNmz0Dz40jIybWNHN+/bw=;
        b=kbt7fxoWy/rKzwRRCrKr+TkHFKq06oaKIuhZuCZPZQGQ9gpHGOcRbYj8C556V+lHlR
         T1hTM5oa2MeKaQLO2tNgswrFfWimM/UjhmrE85Arv50p+0e5wwPPcb512n4PngiOXA70
         Y+C7fLLnUwtEYzdm5KwEMpov08KolbD+PUcORwc/Ox6SgKB4uCcnvAr6VXMItyZnGW+3
         FCFGaqTQ0lWs9z7Y74KS/c1p1BZ/C5D6Rj110UVFzKkDk+3oz9TdYRE9yGKjma5Lf2SV
         lKZy2xELB25w+5oMWe7I/e5/3vlN9n/obZydf96NQeNAQDbpuiIxGSJjZPqQ3HOQEkUV
         Xzag==
X-Gm-Message-State: AOAM531RYEU+qeZM4nqzdbAvU7/eHmdG2mfONmf4MkiioVCuK5oX7O0E
        f/8nEzYvWUB67Boqus5tJKY=
X-Google-Smtp-Source: ABdhPJxDrBcaso65rh78LJTdfjN9NFdu+O7clOUQJ0MFDZPJrD1CaNheJJ/xxuaVjFfUwMMkuNBlWA==
X-Received: by 2002:a05:6830:2486:: with SMTP id u6mr8817325ots.93.1632576393377;
        Sat, 25 Sep 2021 06:26:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a9sm2780241otk.3.2021.09.25.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 06:26:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 25 Sep 2021 06:26:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Oskar Senft <osk@google.com>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Rob Herring <robh@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <20210925132631.GB1240690@roeck-us.net>
References: <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
 <20210921205247.GA2363535@roeck-us.net>
 <CAL_Jsq+NXuF+F7OE3vyEbTUj6sxyMHVWHXbCuPPoFaKjpyZREQ@mail.gmail.com>
 <20210924002951.GA3027924@roeck-us.net>
 <YU2D7L7QMgCJZUeb@localhost.localdomain>
 <20210924114636.GB2694238@roeck-us.net>
 <CABoTLcQYHZbsgzXN7XXKQdDn8S-YsuE+ks9WShAEKcBJojEfcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoTLcQYHZbsgzXN7XXKQdDn8S-YsuE+ks9WShAEKcBJojEfcQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 24, 2021 at 11:37:00AM -0400, Oskar Senft wrote:
> > > In many cases the channels are "shared" - we have 3 voltage, 3 current and 3
> > > power sensors but in fact they are not separate sensors but 3 channels
> > > each able to measure 3 different things and they may share some common
> > > properties in each channel (so current, voltage and power may be
> > > calculated bases on the same shunt resistor or correction factor). An
> > > example being adi,ltc2992.  In those cases it doesn't make sense to have
> > > two levels as how would you describe the shared parent? Call it generic
> > > "channels"?
> 
> So in that case (e.g. for the nct7802, see [1]) do we want just
> 1-level, maybe like this:
> 
> nct7802@28 {
>     compatible = "nuvoton,nct7802";
>     reg = <0x28>;
> 
>     sensor@1 { /* RTD1 */
>          reg = <0x1>;
>          status = "okay";
>          mode = "thermistor"; /* Any of "thermistor", "thermal-diode",
> "voltage" */
>     };
> 
>     sensor@2 { /* RTD2 */
>          reg = <0x2>;
>          status = "okay";
>          mode = "thermal-diode"; /* Any of "thermistor",
> "thermal-diode", "voltage" */
>     };
> 
>     sensor@3 { /* RTD3 */
>          reg = <0x3>;
>          status = "okay";
>          mode = "voltage"; /* Any of "thermistor", "voltage" */
>     };
> 
>     sensor@4 { /* LTD */
>         reg = <0x4>; /* using the same number as in sysfs */

Numbering in sysfs is not relevant here; the index should always start with 0.

>         status = "okay";
>         /* No mode configuration for LTD */
>     };
> };
> 
> In this example, RTD1, RTD2 and LTD would be temperature sensors and
> RTD3 would be a voltage sensor.
> 
> Would that make more sense? Is the use of strings acceptable?
> 
I don't think so. I am quite sure that rtd3 is still a temperature,
and I am not sure if other sensor types on that chip may need dt
configuration.

I have limited internet acces for the next week or so; I'll look
into this further after I am back.

Guenter

> Thanks
> Oskar.
> 
> [1] https://lore.kernel.org/all/20210921004627.2786132-1-osk@google.com/
