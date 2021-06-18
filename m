Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53034C48BE8
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 12:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 256D7613EE
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 12:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhFRMPN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 08:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbhFRMPM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 08:15:12 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7F8C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 05:13:02 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id b24-20020a4a34180000b029024b199e7d4dso2070388ooa.4
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OHYJSNVbMhbRBUIOT4UuAJr1GgOwuN2GhLA4BlNxPfA=;
        b=ogCBBAqcobmkOmWUJYb2/JgV94in0Ti08xYFpxs6ArT5r4r5wV6aIszwMH5nmg/7ru
         9fXX7oDkerxJWF8dOa2s2TiF94mdXBzDTwcr5DeS0jCOt8z2udm9oFLYbkt17mjCz3we
         sVtRof/yd2dJX/diz+jbNK7pXJPgwFRctYBiQ1SFOXGAo7Tb0cThP6r8n1UojuMvGukm
         S+D8Adh6Qss0UWG0DxInjF+mhDQDYGK3GeDFzU/adTaFMLFPYdkkIaMxxHN5iw8dqB/w
         fnKYfunmz2TrVhqo+VxAXaEJt2PQ0VUN8ChT6nHCAmJM1AQteFkpBOehWRzhcQqr7uyW
         2sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=OHYJSNVbMhbRBUIOT4UuAJr1GgOwuN2GhLA4BlNxPfA=;
        b=GRrms5yhD0XkRs6dRmCYU2ZHUHE8d/wUjLeb67ZzyU5ZZS+vLb2bF3zerQnsM/sErm
         a+Yn02nF/HnctO3vZVJGxQ7ODdxVxv4LZkEjME5brUPk5Jh9qgvqnmOkCJJbwKz83F4F
         lmq1WRWRLOmyAsr1vn0pT5RW/aY4FpMQTwWHxKK2iFFF/RJaYfvJWRpoLjIt8S5gUZ3f
         16yYWUj2MuMmqljqd4V4WUIdSCV62/ygvo9BxPHtj3j2g891lQsxu5Ojstc+0r18r9B0
         E79u0FQ7CYLK5793zdi/H+MBvgUBW+uEGDVtJ+/vFYYixxdNqtI4Ai+Aj5AF+64ihCoo
         ap1g==
X-Gm-Message-State: AOAM531Ird41rig5JDtnIMe+KMtbZIhP6OKzMnZ1pGzmDMU6SiSsxk6/
        DbVTTx5S2dXcTGTcnGSugMI=
X-Google-Smtp-Source: ABdhPJzo8xe07sv5GkgXrw/15DBQ0V7NV8whI8qb5Yon/9YdElxpRI+SlvJGYanql/BzH2tHYo+4dw==
X-Received: by 2002:a4a:9863:: with SMTP id z32mr8701950ooi.37.1624018382282;
        Fri, 18 Jun 2021 05:13:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x199sm1726662oif.5.2021.06.18.05.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:13:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Jun 2021 05:13:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        linux-hwmon@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: Re: corsair-cpro and hidraw
Message-ID: <20210618121300.GB1202484@roeck-us.net>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
 <4451002.svKJrzdh7d@marius>
 <20210618084737.200f8575@monster.powergraphx.local>
 <27527118.vr9HtJ8RzA@marius>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27527118.vr9HtJ8RzA@marius>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 18, 2021 at 09:06:02AM +0200, Marius Zachmann wrote:
> On 18.06.21 at 08:47:37 CEST, Wilken Gottwalt wrote
> > On Fri, 18 Jun 2021 08:18:23 +0200
> > Marius Zachmann <mail@mariuszachmann.de> wrote:
> > 
> > > On 18.06.21 at 07:45:00 CEST, Wilken Gottwalt wrote
> > > > On Fri, 18 Jun 2021 05:56:29 +0600
> > > > Aleksandr Mezin <mezin.alexander@gmail.com> wrote:
> > > > 
> > > > > I've looked through corsair-psu sources, and I think filtering in
> > > > > raw_event won't be enough.
> > > > > 
> > > > > For example, in corsairpsu_request, there are 2 commands, and they
> > > > > should be executed consecutively:
> > > > > 1) corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
> > > > > 2) corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
> > > > > 
> > > > > If the userspace will squeeze another PSU_CMD_SELECT_RAIL between (1)
> > > > > and (2), the driver will get data for a wrong rail (and with the
> > > > > current code won't even notice it).
> > > > > 
> > > > > So unless there is a way to "lock" hidraw (and it seems that there
> > > > > isn't - looking at the code, hidraw calls the low-level hid driver
> > > > > directly, as far as I understand), it won't work correctly.
> > > > > 
> > > > > And if a driver can't work correctly with hidraw enabled - maybe it
> > > > > shouldn't enable hidraw? So that the user can 1) notice that something
> > > > > is wrong 2) blacklist or unbind the driver (or userspace tools that
> > > > > use hidraw can unbind automatically). Otherwise everything seems to be
> > > > > silently broken.
> > > > > 
> > > > > On the other hand, maybe races between the kernel driver and userspace
> > > > > tools are unlikely, because the driver doesn't talk to the device
> > > > > continuously - only when sysfs reads happen.
> > > > 
> > > > I never noticed any issues of that kind. I actually did quite a lot of
> > > > userspace testing. A result of this a userspace tool you can find here:
> > > > https://github.com/wgottwalt/corsair-psu/tree/main/tools/rmi-hxi-query
> > > > 
> > > > Though, if you find a way to trigger such a race condition I have no
> > > > problem to remove the hidraw part.
> > > > 
> > > > greetings
> > > > Will
> > > 
> > > It is possible. Making a userspace tool with just a loop of read/writes
> > > will get you wrong readings in the driver sometimes.
> > 
> > Hmm, did you read the comments in the driver? I warn about writing nonsense
> > values to the micro-controller because you can make it stall. If I let you
> > access the device by hidraw I assume you know what you are doing. You
> > actually can damage your PSU by this, something I also warn about. I even
> > mention that I may remove the hidraw feature in future versions.
> 
> Sorry for the confusion. I did not test with corsair-psu. (Do not have
> the hardware) I tested with corsair-cpro. Reading temps with userspace and
> reading fan speed with the driver simultaneously.
> But you are right. This is also not, what a userspace tool should do this
> fast and if it doesn't, races are really unlikely.
> 

Same there: Make userspace and kernel mutually exclusive if parallel access
is shown to be problematic. "Mutually exclusive" means disable userspace
access completely while the driver is loaded, not some cross-subsystem
mutex.

Guenter
