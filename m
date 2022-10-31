Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52747FA3742
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 13:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiJaNIF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 09:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiJaNIE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 09:08:04 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5A5264F;
        Mon, 31 Oct 2022 06:07:59 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id g10so12702382oif.10;
        Mon, 31 Oct 2022 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7+zhmhrWt+z6+8BUqzwq+wjZ9aZH+3dPptpflgAZl0=;
        b=EHvNfR8gyy5RjKlJH0zp/ZgjH2m6mIXO7Do/9Rr3+8G5aQGM2TNlD+jGH+yoZmQvQK
         gRU16ffmCLpcwg+ZUVD7AlrS0z/9zv0VPqmLtd5Zv9rnq92JjlKRHidAccdwM4jJj1WK
         lLZMPZWYJPxPzs+I6cERc1jJqXzIN1+lc+ibFSQzL6DkYv+lioHXChUPQkpgdPKKDoFj
         EYRGF+Mzh1KxXRLVMLv8d+kUsOc4z4cOFOW1JPW7AUCnLSGcvCfH2wgKZ7qDty+53RcW
         FeeyHalkVDPF6lD4YpX3nj7vBNhCstjG7hi0kaAN0dXyLJxRmwGEvjo9WqQItxi+8+Fc
         k/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7+zhmhrWt+z6+8BUqzwq+wjZ9aZH+3dPptpflgAZl0=;
        b=rBmBNCUpOAWL7MmuTGKnGzQgEftgprovZ0g9g2J50/JNeNIc78vhVz1OeqB7/gvUEE
         U2qFCoEPBx5kaKWoQJPBkwHg3oHp/2vqOhId9VzbPfLwN1Xi9+f2vkeSKb+x+Y5SDdCL
         1VYGylyMka2w1YPah8IiynI4MS0aMgJyQKEaswipOVZo60u8Pk/dC++2mMC2Kpo9ZXJx
         /vDTkYY5dQ38ABHaYH5+XSu6inGOzx2yKlU2uOrn7rpmolZDrGazjjTrcuEyyseeds+3
         hCMj4GwUaEK1lWBtG/uMUqMhO1DvxnFjlzZO+2yOdNP5dDfjrbU/0LPZ7Rm4jHdkDrDY
         N5vg==
X-Gm-Message-State: ACrzQf2M7T37OvP30uhFs0SXasRjiajEyFynLVNzkoH+NALm1HCvhJuJ
        L/jHMh3SKVEfTQnDtswryXo=
X-Google-Smtp-Source: AMsMyM751ZY+bNFhD5aMGrQZmY/PCfbtjFW/FGkzWCQoYSsh/kXpDNvhoplUmXjYIf6DX4F1Oqn2PA==
X-Received: by 2002:a05:6808:3008:b0:350:fad2:458d with SMTP id ay8-20020a056808300800b00350fad2458dmr14428948oib.93.1667221678812;
        Mon, 31 Oct 2022 06:07:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h14-20020a4adcce000000b00499527def25sm2300176oou.47.2022.10.31.06.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 06:07:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 31 Oct 2022 06:07:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joaquin Aramendia <samsagax@gmail.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Add OneXPlayer mini AMD board driver
Message-ID: <20221031130756.GA400664@roeck-us.net>
References: <20221029225051.1171795-1-samsagax@gmail.com>
 <506a6e7f-4566-2dcf-37f3-0f41f4ce983b@roeck-us.net>
 <CABgtM3jk4wuEMA1NL+WTySowokRD3XqzdSAUbkQCuLreSrvaJg@mail.gmail.com>
 <c6c16bc6-d86b-84ca-e49a-0788f9c80006@roeck-us.net>
 <CABgtM3g9_-hpDfdb=kDqOerQAj+kn3pEbOcvmG_Lve3ETAXFfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgtM3g9_-hpDfdb=kDqOerQAj+kn3pEbOcvmG_Lve3ETAXFfA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 31, 2022 at 08:45:35AM -0300, Joaquin Aramendia wrote:
> Hello again and thanks for the review. I submitted the patch again and
> needs some polish before it can be accepted. I had one question left:
> 
> El dom, 30 oct 2022 a la(s) 00:24, Guenter Roeck (linux@roeck-us.net) escribió:
> >
> > >>> +/* Callbacks for hwmon interface */
> > >>> +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
> > >>> +                                     enum hwmon_sensor_types type, u32 attr, int channel)
> > >>> +{
> > >>> +     switch (type) {
> > >>> +             case hwmon_fan:
> > >>> +                     return S_IRUGO;
> > >>> +             case hwmon_pwm:
> > >>> +                     return S_IRUGO | S_IWUSR;
> > >>
> > >> Please use 0444 and 0644 directly. Checkpatch will tell.
> > >
> > > Oh. I did as the documentation suggested. I must confess I didn't run
> > > checkpatch, will don in the next submission.
> > >
> >
> > That is long ago. Octal values are and have been preferred for
> > several years.
> 
> I've read this form here[1]. Should I send a patch to the
> Documentation to reflect the preference?
> 
Sure, patches are always welcome.

Guenter
