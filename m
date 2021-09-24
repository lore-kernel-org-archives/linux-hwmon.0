Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17AFC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B248360F4C
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343661AbhIXLsO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 07:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343655AbhIXLsM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 07:48:12 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CF7C061762;
        Fri, 24 Sep 2021 04:46:38 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so7064768otb.1;
        Fri, 24 Sep 2021 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=80msV/Edvg+Jq9sFA1F7d5+Z/+fwkJ06i7IcyEkTjdg=;
        b=nFIT7dFVxjmitw9uHhVIJISVd5URB/wvAOVwkwrbhMyeTKhzi2HOu2oVPcr3D+LWI8
         j6xhLZmeZp2bmxFwgteKPBx339gk7hUSAgr05sWtSp2JD4ROjup7mCWb7l50CeLGNFwR
         f9qfkzBgPJh5PPwkkXBeuY6SFA55kQxAhUXiU9mcVjWbRbh+u3qZFoswVc8/NmnHdyDF
         A1+ovvRYvBmsOmJofoOz17qEc4lnfJ7E1SuXDH68QfJXVcYVgCVTvYQOZyDaPS+bVkHW
         zSTQcUoY+t2WBn1dZPu0kYeOH4Am36z5vfbSPkNvJ2iiYsVYSsxflThbOCky3koZJNUK
         yf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=80msV/Edvg+Jq9sFA1F7d5+Z/+fwkJ06i7IcyEkTjdg=;
        b=I1Jmp9yrHLuSD9eRZH5qKhqtomXOq7w2RbPY+Q+NjPdOX3F4di8uMCEvVKjzc4sCe2
         NYHRQkM23fejW+qvQbXmbT5/PCFqi2D1Pk22ftlo22Rw4ngvIdmsX7/XxwivzYh8S7YQ
         Rfx2COA8EilaWkotApn/aw0k7OrRMq+SdzgSIaMUBw8UnkYeXdEzI1BvtleWOXGYddCd
         1I2EW81z47ThB0Ua721s4tEZzhj9ZaJE7dCngEVUKCojwBgxcpQur5zPO6V+frRY9R94
         56gWBsa64XEc8QNYS59006sR+3R8HJ4lz2FQKFWZhapEpa3Un5g+1elBZvwkRAxKJBrP
         Zzkg==
X-Gm-Message-State: AOAM532iorrOBfmLvbbYUCVZ4luUt0Adab/AyQ22jSZ8l34pr0rA5vZG
        kiKr7y5JBY6E2ieMN5X9QB0=
X-Google-Smtp-Source: ABdhPJw+UA4dl1KZ+7o5gko+J3voO7uR9hh/28/iZ4KkrQZRyRQjCRPl4E18H8E3S3DX+xgni65OlA==
X-Received: by 2002:a9d:71d4:: with SMTP id z20mr3619268otj.29.1632483998339;
        Fri, 24 Sep 2021 04:46:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b4sm936582ooi.17.2021.09.24.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 04:46:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 24 Sep 2021 04:46:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org, Oskar Senft <osk@google.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <20210924114636.GB2694238@roeck-us.net>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org>
 <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
 <20210921205247.GA2363535@roeck-us.net>
 <CAL_Jsq+NXuF+F7OE3vyEbTUj6sxyMHVWHXbCuPPoFaKjpyZREQ@mail.gmail.com>
 <20210924002951.GA3027924@roeck-us.net>
 <YU2D7L7QMgCJZUeb@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YU2D7L7QMgCJZUeb@localhost.localdomain>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 24, 2021 at 09:53:16AM +0200, Krzysztof Adamski wrote:
> Dnia Thu, Sep 23, 2021 at 05:29:51PM -0700, Guenter Roeck napisał(a):
> > > If each kind of sensor is a different number space (e.g. 0-2), then
> > > how you have it with 2 levels of nodes is appropriate. If you only
> > > have one set of channel or input numbers, then they should all have
> > > the same parent node. So is it current sensors 0,1,2 and temperature
> > > sensors 0,1,2, or just input channels 0,1,2,3,4,5?
> > > 
> > 
> > Each sensor type has its own number space.
> > 
> 
> But many sensors will have only one type of channels - like several
> temperature sensors and nothing else. Like several temperature channels
> on a temperature sensor, or several fans on a fan controller.
> 
> In such cases, we already define them with 1-level structure, like:
> - npcm750-pwm-fan
> - aspeed-pwm-tacho
> - ina3221
> 
> In many cases the channels are "shared" - we have 3 voltage, 3 current and 3
> power sensors but in fact they are not separate sensors but 3 channels
> each able to measure 3 different things and they may share some common
> properties in each channel (so current, voltage and power may be
> calculated bases on the same shunt resistor or correction factor). An
> example being adi,ltc2992.  In those cases it doesn't make sense to have
> two levels as how would you describe the shared parent? Call it generic
> "channels"?
> 
> So maybe it makes sense to have 2 levels for complex devices that can
> measure several independent entities or for devices which do not have a
> clear concept of enumerated "channels" or "inputs", but we could skip it
> for most others? After all, what is the benefit of having this
> additional level if all we have is something like:
> 
> temperature-sensors {
>     temperature1 {
> 	};
> 
> 	temperature2 {
> 	};
> 
> 	temperature3 {
> 	};
> };

I see your point. I think it would make sense to only use the two-level
approach for devices with more than one type of sensors.

Thanks,
Guenter

> 
> For most devices having an "index" or "reg" makes much more sense so:
> temperature@1, or channel@1 feels like a more natural way to describe
> them.
> 
> In any case, I'm quite confused right now on what would be the
> conclusion of this discussion. How would you like the DT for TMP421 to
> look like, after all?
> 
> As a side note, should the description of the tmp421 bindings be in
> tmp421.yaml file (as it is in current patchset), or should it be
> actually called "ti,tmp421.yaml"?
> 
> Krzysztof
