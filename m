Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F89C47083
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 16:44:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 374D8619BF
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 16:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFBQpu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhFBQpt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jun 2021 12:45:49 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A639C061574
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Jun 2021 09:43:57 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id k11so1373752qkk.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Jun 2021 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=STaqi4LMFdeUy1OU0yxHa/C5p0olAXSBUotCP7bQmvI=;
        b=a3jLR+z97Y5pOaMA6v7rNkFl9+suxe3V2jmEpuF804LMCRDZWLsUaZBAp5c2p7++NX
         79fK+UsybFGOps8fhRT5MWkVjL6q5EgfYsclayR41/Yy2t3FwDIIBtJXK9jS+T8xw7RB
         Wt1jY37GfcZXcjFqyY46cSBhWxnPoEvMjWb+UWibjyhQ3DE1Jy+M3mvy3tSfUexqrVBH
         gS2wq5N3Uy7JSZ3uPbturcA52WotllsIFzr52FGGOyaSA1jiNOOwmXdtpgw2MvH47ZMQ
         ePcuWwTnomR34jAIgFudWoe3uQW4/ec5WSZ58JlfM5ozaxJhe4zGGp1vulkjLS3tRO1g
         tnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=STaqi4LMFdeUy1OU0yxHa/C5p0olAXSBUotCP7bQmvI=;
        b=NJUKXpoinRxMz0SeTg1aya+YvZnJn9fxoOuKRLPmSnpojJXOcoy/LEGTW9/SHoGntm
         QpUH7DMegfBjoURYIpCZF8z4JZvmjhqsphPctSDPACVDELwB9Giu6ZLsEfx4yVUXI63P
         NeVvjzyTP8wZG+0ilFM/lSn9q5uMAgcO8YVoVxZqSlT6BDMotJuJtiNaLEZQuuo76Q15
         iR0SAnkCQ2zLCQDd/mKDexBKWL/LPdBvA891LNGRXbyPqjl/jsghV+QhZImCpPx+isnG
         gtaEFH+Ph2qHa0IjISy9t8kHBDSMoSwb7R0aP8sN4TNEyX08tOLtFmen/Au1SkUnmLQr
         792g==
X-Gm-Message-State: AOAM53393PC8cy5aDX26QkCdku96cSVE1QO/mtBMmkLnz9Ke8dNZVWRK
        y4hEHKe3m1+SskSV0xLiYIg6+aON5XY=
X-Google-Smtp-Source: ABdhPJwdoOXFEyB1/zGO4wJVIKbB+RRXJ9j41c1MCPwesd/0a0aIQ+V/cu+uHU/E4UyztNinTJPVFw==
X-Received: by 2002:a37:2cc6:: with SMTP id s189mr28492870qkh.409.1622652236422;
        Wed, 02 Jun 2021 09:43:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m14sm149826qti.12.2021.06.02.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:43:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 09:43:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        kubernat@cesnet.cz
Subject: Re: [PATCH 4/7] hwmon: (max31790) Add support for fanX_enable
 attributes
Message-ID: <20210602164353.GA2908914@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
 <20210526154022.3223012-5-linux@roeck-us.net>
 <e073d9e2-d7d1-40fb-9717-971833cb25ca@cesnet.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e073d9e2-d7d1-40fb-9717-971833cb25ca@cesnet.cz>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 02, 2021 at 03:04:35PM +0200, Jan Kundrát wrote:
> On středa 26. května 2021 17:40:19 CEST, Guenter Roeck wrote:
> > Since pwmX_enable is now fixed and only handles pwm support instead
> > of also enabling/disabling fan tachometers, we need an explicit means
> > to do that.
> > 
> > For fan channels 7..12, display the enable status if the channel
> > is configured for fan speed reporting. The displayed status matches
> > the value of the companion channel but is read-only.
> 
> This phrasing is confusing to me. That's once again that "configured to"
> which in this context doesn't refer to the kernel, but to an initial config
> of the chip. I suggest the following:
> 
> Fan channels 7..12 are only available when the chip has been configured with
> PWM output N-6 disabled. This configuration is outside of scope of the
> kernel. The displayed status matches the value of the companion channel but
> is read-only.
> 
> > +fan[1-12]_enable   RW  0=disable fan speed monitoring, 1=enable fan
> > speed monitoring
> > +                       The value is RO for companion channels (7-12).
> > For those
> > +                       channels, the value matches the value of the
> > primary channel.
> 
> I realize that it probably doesn't belong to this patch because it affects
> the other fan_* files, but the docs would be improved by something like:
> 
> Tachometer inputs monitor fan tachometer logic outputs for precise (+/-1%)
> monitoring and control of fan RPM as well as detection of fan failure.
> Six pins are dedicated tachometer inputs. Any of the six PWM outputs can
> -also be configured to serve as tachometer inputs.
> +also be reconfigured to serve as tachometer inputs by the firmware. The
> +kernel will respect the initial configuration of the chip.
> 

"Precise (+/-1%)" sounds like chip advertising, which I'd rather avoid.

> Want an extra patch on top of this series?
> 
> > +	case hwmon_fan_enable:
> > +		config = data->fan_config[channel];
> > +		if (val == 0) {
> > +			/* Disabling TACH_INPUT_EN has no effect in RPM_MODE */
> > +			if (!(config & MAX31790_FAN_CFG_RPM_MODE))
> > +				config &= ~MAX31790_FAN_CFG_TACH_INPUT_EN;
> 
> This means that a "nonsensical" write from userspace will be silently
> ignored, doesn't it? I think it should return an error instead.
> 
Trade-off between confusing users and trying to match the ABI with somewhat
odd chip capabilities. The above isn't exactly specified; it is the result
of trial and error (and a reason why the configuration register must be
treated as volatile when using regmap).

One can argue one way or another. For now I'd rather keep the code as is
because I am away from the evaluation board for the next few weeks and
won't be able to test any functional changes until I am back.
Given the complexity of the chip and its sometimes odd behavior I'll want
to be able to do that kind of testing. Is this important for you ? If so,
we can move forward with patches 1-3 of the series and leave this and
subsequent patches for later.

Thanks,
Guenter
