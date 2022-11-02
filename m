Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1852C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Nov 2022 20:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbiKBUoM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Nov 2022 16:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbiKBUoK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Nov 2022 16:44:10 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDED56444;
        Wed,  2 Nov 2022 13:44:09 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id l127so4064888oia.8;
        Wed, 02 Nov 2022 13:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+srXLPpnvM0gHZbCy4J9X0oa4bDJGO7dUQqAXx/v8wk=;
        b=RyOCRZdkqBjBzYpWidvFMSI+J5HUWpdm7C5Y7jaxAm7PteVxaJjAyzohgn7IRrdvt9
         i6EOH1wl/c7w+ex9I4AiVZ9bCUbcFtBHdYEzEqxMSfov0BEd1/RdPfrloXS1E9ZSu1KI
         ert5bK3tX81BWFExS8ZPF9gdPH0k9xIdbecxPgpGeRK1wMndr7z6G8a7oxvbRURvjKDz
         FG8f/LCFfS82gX/gD07e451DdhSmWGq42LU0HNL3uMhDByY5ABjAtSMq0CyMqhVYS52/
         txLI6rEYeQQLbuob3t7EMlvYukmH8SQonhevdrTH6bdKPRS4zpct9zSwoH4jqsjpukLn
         VxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+srXLPpnvM0gHZbCy4J9X0oa4bDJGO7dUQqAXx/v8wk=;
        b=ISHRWq9JDbSrGEbPWaIXegw/khJewxTAlLtUnor6boxMGGL7BHr5LuOqQWjzS64vCx
         A7AGmOgD99qudiF500/S46nSJOR78JVfYoSbYcSe14xcs20qzmXcLMZNem0It57izULc
         gOmi7pzfeWCMmkha1f1AuX53NL2vTxbU15jV9beB3e4IBNnAY8P/zPao+8qreB1vWvEm
         2WTHYwzz+CFsLXqqPChTzfVrCz+TGdOQJZVfP0yEKJ7ugGsILdq3gRwUZHxoJUpTDDoC
         kSWv2kiZuyHl+veK4O8MYSbRsUxX9rGlgcehK6AzOwUOBT8evS7RJoyuIHMPolOon67U
         RQmQ==
X-Gm-Message-State: ACrzQf1nBqSvCi1D8/N6zvcGtLo2VgMYiai6TSuxDppQyGMtKJr46CPq
        PKF7b+HEsv5gI9AUAwPpJHw=
X-Google-Smtp-Source: AMsMyM75Oe6AexFaPWORWZMAuxFKsLijb7qt+TssGSnr4GLKjVnBbsZ89E20sMkslLLSj4IoTqzDBg==
X-Received: by 2002:a05:6808:1454:b0:35a:4879:a63e with SMTP id x20-20020a056808145400b0035a4879a63emr1011511oiv.41.1667421849198;
        Wed, 02 Nov 2022 13:44:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k9-20020a056870350900b0013191fdeb9bsm6498157oah.38.2022.11.02.13.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 13:44:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Nov 2022 13:44:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joaquin Aramendia <samsagax@gmail.com>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] Add OneXPlayer mini AMD sensors driver
Message-ID: <20221102204407.GA2089083@roeck-us.net>
References: <20221102150440.208228-1-samsagax@gmail.com>
 <20221102180430.GC2913353@roeck-us.net>
 <CABgtM3jXVTjxEJXmCXG+z_DGaHAkFFVjZBa2bOCbeqFveesWrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgtM3jXVTjxEJXmCXG+z_DGaHAkFFVjZBa2bOCbeqFveesWrA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 02, 2022 at 05:11:00PM -0300, Joaquin Aramendia wrote:
[ ... ]
> > > +
> > > +     switch (type) {
> > > +     case hwmon_fan:
> > > +             switch (attr) {
> > > +             case hwmon_fan_input:
> > > +                     return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
> > > +             default:
> >
> > Missing break;
> 
> Oops. Is not really needed but I'll add them.
> 
Technically you are correct, but we would have static analyzers scream at
us, and it is against kernel coding style. There is a practical reason
for that: Missing break statements are often the result of coding errors.

Guenter
