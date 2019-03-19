Return-Path: <SRS0=Q+NP=RW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDEFC43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 13:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B746B2133D
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Mar 2019 13:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=vincit.fi header.i=@vincit.fi header.b="E6ZOpBaR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfCSNjE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:39:04 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38667 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfCSNjE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Mar 2019 09:39:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id x13so17336422ljj.5
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Mar 2019 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jk6t3o2y7da8jlh9j7mvpw39KiCT7yHhoqG11zdXaMY=;
        b=E6ZOpBaRcBJZe7sVzJvozwF8XXoBOl91Rvg3ou/7+xuSzbjfOF5EEUM4NAsFUHB4pZ
         X1+nIECASgSB3Vm3Sl9lbuOsGSzf3PAMv3E3KIZ7JJnXvtav34i8Bl9YhW9OOapYyvOd
         LaKVcOufAv+BvYllDISpMtzCO0nmIbcB/q9Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jk6t3o2y7da8jlh9j7mvpw39KiCT7yHhoqG11zdXaMY=;
        b=uFjD0qBMTpzkmLU2KOWR8/Y4D4B7Zea5sd9mYQU2drWNG7UK/V0IKWkAgGqFT092vQ
         Dib68IEgN1Vl8tioVD51zhkaXzC01T/2sT3d0GKomtu8HHc8eYpYfeix+aZjUC5uzMds
         c7V8WssfVQYJXmRh1HKXOxxJG375QB9CV9peV4EB1DtAStG1dgwwfM4n0DSl08m2vFHR
         V99wB8NECbqs8m5C18HlnNcLgxdqTyfwWTVzSLULbZblyrk4h/hS6F6U8c7I+dCXsud3
         TCEVVj79BUF001K4AaAUuzOyOe24ft7fv5ajjBD2Q3yls6yV04Dig1mO/3jkDCeaiVsF
         zxMA==
X-Gm-Message-State: APjAAAXJTc2v43fJKpHQIjf4UMXIu2quaK6r9hksxGAsybM3EygaQwEN
        0zBgJxmt3X0ZOzU1whXVRF73vmGqgl4=
X-Google-Smtp-Source: APXvYqykFGiWboJ+HkVQjsrHAPZ94/jt5ewghy+XooZ8Zz5Zfut+VOC1Mn03td+mcTES/5W1CHeGvg==
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr7904001ljj.128.1553002742172;
        Tue, 19 Mar 2019 06:39:02 -0700 (PDT)
Received: from samu-ThinkPad-T480s (gw.vincit.cloud. [195.60.252.249])
        by smtp.gmail.com with ESMTPSA id l14sm1504375lfk.92.2019.03.19.06.39.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 06:39:01 -0700 (PDT)
Date:   Tue, 19 Mar 2019 15:38:59 +0200
From:   Samu Nuutamo <samu.nuutamo@vincit.fi>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Support Opensource <support.opensource@diasemi.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (da9052) Synchronize access with mfd
Message-ID: <20190319133859.GA24119@samu-ThinkPad-T480s>
References: <20190318142953.GA23692@samu-ThinkPad-T480s>
 <aea933dc-6109-12d9-a2c2-e367dd4e99d0@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aea933dc-6109-12d9-a2c2-e367dd4e99d0@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 18, 2019 at 07:51:55AM -0700, Guenter Roeck wrote:
> On 3/18/19 7:29 AM, Samu Nuutamo wrote:
> > When tsi-as-adc is configured it is possible for in7[0123]_input read to
> 
> in{70,71,72,73}_input ?
> 

Yes, and by that I meant the files inside /sys/class/hwmon/hwmon0. The 
race can be triggered by reading both tsi and adc values (in70-73, 
in4-6) concurrently, while verifying that the values are as expected. 

Using a simple test script that read the values continuously I got 
incorrect readings once every few minutes.


> > return an incorrect value if a concurrent read to in[456]_input is
> > performed. This is likely caused by a concurrent manipulation of the mux
> > channel without proper locking as hwmon and mfd use different locks for
> > synchronization.
> > 
> > Switch hwmon to use the same lock as mfd when accessing the TSI channel.
> > 
> > Fixes: 4f16cab19a3d5 ("hwmon: da9052: Add support for TSI channel")
> > Signed-off-by: Samu Nuutamo <samu.nuutamo@vincit.fi>
> > ---
> >   drivers/hwmon/da9052-hwmon.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
> > index 8ec5bf4ce392..af136a638065 100644
> > --- a/drivers/hwmon/da9052-hwmon.c
> > +++ b/drivers/hwmon/da9052-hwmon.c
> > @@ -249,9 +249,9 @@ static ssize_t da9052_tsi_show(struct device *dev,
> >   	int channel = to_sensor_dev_attr(devattr)->index;
> >   	int ret;
> > -	mutex_lock(&hwmon->hwmon_lock);
> > +	mutex_lock(&hwmon->da9052->auxadc_lock);
> 
> This is, at best, a kludge.
> 
> The hwmon driver doesn't own struct da9052 and should not really access any of its
> structure members. The problem suggests that __da9052_read_tsi() should have
> been implemented in the mfd core, similar to da9052_adc_manual_read().
> 

Not sure if I have resources to do a proper fix at this point.

- Samu
