Return-Path: <SRS0=nYzv=X2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2B7C352AA
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 22:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F123421924
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 22:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljBozDbc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfJAWSU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Oct 2019 18:18:20 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:36799 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbfJAWSU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Oct 2019 18:18:20 -0400
Received: by mail-pl1-f169.google.com with SMTP id j11so2920642plk.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Oct 2019 15:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mpam3rMccIMr21hMQZxbxL/fPP4/AkV4UFGoBGsj8yA=;
        b=ljBozDbc9xnLWlYZsij+E5I1GGpZy0m7twxi/SMEwbqbNesV2pcaIwLDVjzN1+jOVb
         Esre6zn4RB91Utoehzp2FmBOcyIao6zFV8RlKFVyOXz2/RZU1k2F/Xqg18UdmSzygtxs
         HvK4tIjw+VmZYt/qY7dfcJAE95L1W09U46Uh9h7ns3F4PdoYXgOTQMaHe42yaQfc3XHe
         9dbaKqgtztGEmI/mwszqvbSxA+u7eHT7pE2sgo47VywXPgO8HNH76od8Lme3W633wtVt
         AasrL4zol7IB3c29khTYYRx+ucuyu/RowMvQDPIOgWspyPyHCo1kW5HJNjr6RsxHjb77
         IClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mpam3rMccIMr21hMQZxbxL/fPP4/AkV4UFGoBGsj8yA=;
        b=LwhMu331Va/U4kKuXppnZ/TWKG2thU1O2MyrvaAYafuzsyfQhHQZBBu2DNHaFg4Wyz
         jH3n2RQ7xCyTk+wFmV5K4AL6P3Zvcr8kmjCwEjUPQ8tG4cPpkh4zAwH53HUdHEcSg/ac
         qmlyPVNQ26RJv7LbkkFKT8sNucPlVR/hO9D7clHm1t89DluwCkg2XjuTPcWiPV0jT+ds
         IC8zoeNqrkTai6LqiwRfIjg78lpDg6UUSXlwYbL7cBZagkgD+bnvxwn/ry4T0kQKNvGB
         0F+tGt2YUdzpozYkqtCSTnMhyGYH3zWQlftPV3ECu2iHLoz/DAxCL1CddwuANPPXpW2Z
         CD8Q==
X-Gm-Message-State: APjAAAVNtz7rwqOWYGS4TtRSf3MQoOR02VqgKdRVVO/Lyr7AR/Amt/e8
        VrYikdBe1gkxLvHFBwy6Lb0=
X-Google-Smtp-Source: APXvYqy5DCvvwB073YfX0QISU22I5qPNKli86RrIsTPYMxJgz2QS3v7f+CpayVt1Xob97219Fdjt2w==
X-Received: by 2002:a17:902:bd08:: with SMTP id p8mr41157pls.339.1569968298855;
        Tue, 01 Oct 2019 15:18:18 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id m12sm3628257pjl.22.2019.10.01.15.18.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 15:18:18 -0700 (PDT)
Date:   Tue, 1 Oct 2019 15:17:36 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: ABI for these two registers?
Message-ID: <20191001221735.GA27958@Asurada-Nvidia.nvidia.com>
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
 <20190912183218.GA5065@roeck-us.net>
 <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
 <20190912220947.GA8072@roeck-us.net>
 <20190912224528.GA24937@Asurada-Nvidia.nvidia.com>
 <20190913001237.GA31111@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913001237.GA31111@Asurada-Nvidia.nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Guenter,

It's been nearly three weeks. Would it be possible for you to
provide some advice on my latest questions? I'd like to write
code and submit changes once ABI is confirmed...

Thank you!

On Thu, Sep 12, 2019 at 05:12:38PM -0700, Nicolin Chen wrote:

> > > > > > Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
> > > > > > (At page 32, chapter 8.6.2.14 and 8.6.2.15)
> > > > > > 
> > > > > > I have two registers that I need to expose to user space:
> > > > > > 	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers
> > > > > > 
> > > > > > Right now in[123]_input of INA3221 are for voltage channels
> > > > > > while in[456]_input are for Shunt voltage channels.
> > > > > > 
> > > > > > So can I just use in7_input and in7_crit for them?
> > > > > > 
> > > > > Doesn't Shunt-Voltage-Limit apply to in[456]_input ?
> > > > > If so, the limit should be attached to those.
> > > > 
> > > > The initial patch of ina3221 driver applied Shunt-Voltage-Limits,
> > > > being named as "Critical Alert Limit Registers" in the datasheet,
> > > > to curr[123]_crit, corresponding to curr[123] and in[456]_input.
> > > > 
> > > > And this Shunt-Voltage-Limit-Sum is more related to the reading
> > > > from Shunt-Voltage-Sum, which we just agreed it to be in7_input.
> > > > 
> > > You didn't say Shunt-Voltage-Limit-Sum earlier. You said
> > 
> > Ah....right...it's my fault. Sorry.
> > 
> > > Shunt-Voltage-Limit. I would agree that Shunt-Voltage-Limit-Sum is
> > > associated with Shunt-Voltage-Sum, but, again, that is not what you
> > > said earlier. Confused :-(
> > 
> > So, those two should be in7_input and in7_crit?
> 
> And a couple of more questions upon it:
> 
> 1) There are 3 control bits for the summation of this
>    shunt-voltage-sum register to enable corresponding
>    input channels. But in7_enable only allows users to
>    en/disable all three channels at the same time. So
>    how should I attach three enable bits using ABI?
>    Or should I create a device-specific sysfs node?
> 
> 2) We have a requirement of providing current-sum and
>    current-limit-sum nodes, for use cases where those
>    enabled channels use same value shunt resistors.
>    It's similar to provide curr[1-3]_crit by dividing
>    shunt[123]_resistor from in[456]_input. So could I
>    deploy curr4_input and curr4_crit nodes for this
>    requirement?
