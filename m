Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CED8C4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Nov 2022 15:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbiKLPK0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Nov 2022 10:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiKLPKZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Nov 2022 10:10:25 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438F4C76F
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 07:10:22 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id u7so5265005qvn.13
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 07:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OowX/AOQpc622+BQv+Tb04nmejcqVSFiYgtKEOrML7M=;
        b=ABeafyN1sAtecN/d4OK/jtuF69WLks8yQnW3qTS4MW9FzHiX6teesja9uzuZNUFvCj
         NK33FkBXu2mxekxEAMxagWkEzWyPaUL1VitDZ7iOrhBC3kCTdw6sRppvkbdgqzifgyus
         LvlrfByayfFWBP4rI5coj0scsh8aOUpoYF4F5lK/ApZf+EjnScryM13KUAQJyUDf2wBp
         2Pc/E5ZCnRfEOLp55PQhP5ovMl4JdDEVaPt1KNX4eRUb9aN7joWBSN01gkDIkM+T69q6
         n8zZe80+bjjR78TOAPDA4JEzAwphAfi47AYoy490uFemDOd1gbINimi/e3BJI2+0xCkh
         JGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OowX/AOQpc622+BQv+Tb04nmejcqVSFiYgtKEOrML7M=;
        b=DjEdrox7Nb/bBQJXBWa6KR3YO2nQ/dDEBZFIBSjZL/YudLssCycHk1Fxdf6xpaPYfQ
         cU93pPXbChyuYBsRKUyvpBq/TiS2bYM99RdYBCN5kdzvySLvVkBT3u4N8a7p2itln3Xc
         mZP1ytn1cgcwfAlTxeYO+BXck9bDM56Xx/rbZ/HgqQrMQyC9c93YaciKDjH7GpG5pcN6
         i3Bf2Y5C2KOvCZxRkVDJVpORsoQwbrcKs7hp+mDfpzETgRmBbFe2YnKvyjymlreHeBN6
         VIpS2s3I8V0QJtWrcD521OUcBvej76gEUeaFNG5fbfKMXxaXs4FxXJBCj5t6AYAAEpHc
         sZIw==
X-Gm-Message-State: ANoB5pkRa4voEtKm6en78lJrZPbxS+igB83CqL7DEY5Ocj54IVc4xGJq
        e5Ic8XOE/7MerW9eSoVK7k7i5j7MiKY=
X-Google-Smtp-Source: AA0mqf5tYCeKX9ECEPL9uJxlJ7RNLwrE3QrdifdPWJx2WxdySl1HgBhU6HItpO7zntauaOvICVod4Q==
X-Received: by 2002:ad4:50ab:0:b0:4bb:5b85:5591 with SMTP id d11-20020ad450ab000000b004bb5b855591mr6155626qvq.59.1668265821318;
        Sat, 12 Nov 2022 07:10:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a16ad00b006fb112f512csm3192862qkj.74.2022.11.12.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:10:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 12 Nov 2022 07:10:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH 3/3] hwmon (coretemp): Add support for dynamic ttarget
Message-ID: <20221112151018.GA512473@roeck-us.net>
References: <20221108075051.5139-1-rui.zhang@intel.com>
 <20221108075051.5139-4-rui.zhang@intel.com>
 <20221111213402.GA1059716@roeck-us.net>
 <59a59d1d69c2647ff2cd62d72d6613660db29d7d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59a59d1d69c2647ff2cd62d72d6613660db29d7d.camel@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 12, 2022 at 04:37:50PM +0800, Zhang Rui wrote:
> Hi, Guenter,
> 
> Thanks for reviewing the patches.
> I will address the comments in next version. And also some comments
> below.
> 
> On Fri, 2022-11-11 at 13:34 -0800, Guenter Roeck wrote:
> > >  
> > >  /* Keep track of how many zone pointers we allocated in init() */
> > >  static int max_zones __read_mostly;
> > > @@ -150,8 +150,17 @@ static ssize_t show_ttarget(struct device
> > > *dev,
> > >  {
> > >  	struct sensor_device_attribute *attr =
> > > to_sensor_dev_attr(devattr);
> > >  	struct platform_data *pdata = dev_get_drvdata(dev);
> > > +	struct temp_data *tdata = pdata->core_data[attr->index];
> > > +	int ttarget;
> > > +
> > > +	mutex_lock(&tdata->update_lock);
> > 
> > Is that mutex really necessary ? I don't immediately see the need
> > for it.
> 
> I just followed the same pattern as show_crit_alarm().
> I checked the history and it was introduced by commit 723f573433b2
> ("hwmon: (coretemp) Fixup target cpu for package when cpu is
> offlined"), to make sure the msr is not running on an offlined cpu.
> 
Good point. I am not sure if it matters at that point if the code
uses the old or the new CPU, but I guess it is safer.

Thanks for the clarification,

Guenter

> > > +
> > > +	/*
> > > +	 * ttarget is valid only if tjmax can be retrieved from
> > > +	 * MSR_IA32_TEMPERATURE_TARGET
> > > +	 */
> > > +	if (tdata->tjmax)
> > > +		return -ENODEV;
> > > +
> > > +	if (c->x86_model <= 0xe || c->x86_model == 0x1c)
> > > +		return -ENODEV;
> > > +
> > 
> > Does it really make sense to re-check this each time the target
> > temperature
> > is read ?
> 
> You're right. We can keep this as it was, when deciding whether to
> create this sysfs attr or not. Then the check in get_ttarget() can be
> removed.
> 
> thanks,
> rui
> 
