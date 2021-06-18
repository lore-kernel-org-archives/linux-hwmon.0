Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E6CC48BE8
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 12:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA124613EC
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 12:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbhFRMMT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 08:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhFRMMT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 08:12:19 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F392C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 05:10:09 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id h9so10337887oih.4
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jun 2021 05:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lTiWCoskeneDyg14DtBOjLMAAii+SLA4YT176En3YeA=;
        b=OfZu7cll8m3NhkUEPTVIK+i8uHizZK4Yw5QbG9h9sC4J3KgPUrHVnY5K3RkPGi2aq8
         NiRo5TT+fi42JWMqR+HKVNIWiHPKml+S2QcSUTebRzNm9mMrKrdXSUuH/IuztnzXgG7O
         KEJA5irK6SguBSxtsFk+a8NoSqCT4zxX8Y72JLt4m8lZBrqQhhyOIISkLIApxh1Ck7A9
         cOIf2HbWL5RxsltSbGmE5XOLTqlS7k1xKvs5/hgnjr2CuQqqycthnNfmGwN1IdjUgxK7
         +5HF7j+aTfxtcAGSpS9b9G9gIpD/bNFJ8nKGP89MTHPYT6b8y8rcR+KEuoIU8VoVyPpi
         ez6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lTiWCoskeneDyg14DtBOjLMAAii+SLA4YT176En3YeA=;
        b=Rxo1KGguoNA+B8EKPgJjRQJXsYrO8SAfZGHp6KTa7dNTNHMnNGcE89/tUGPd/XKB+Z
         F6fq4ZaN+KcjRu5mTAGK4E9g9gm9E+fOQ8xBnz/GjAmhHW67EDcLfDx/jQwwftkaFGRP
         RDDoIRGdNT+ko3QX31i7HsfwJvwIaiDlxTdrZeqrXXfZvkwV+UnOWzL6m4StFJwKIHrz
         oU0pPS76dK9EBX41fzqnHetVB9FrDW3rDTmJ/8nPitGbvvwub5SAxwEykqm4yBAkb05a
         mKE7u1esXwVBTQZCyyQ1R/AFlPmO3ySjeTOlx4hda9xMq+DravcAf4PWkMrFQG2YbONL
         wlUQ==
X-Gm-Message-State: AOAM532Yf6+XT8/PVs/nDxzBGtoIJ8q2RnfbUIDoSgT5vrgl/BBwYDB2
        sfVTwtFBlDYQAo/tBYjfHb4=
X-Google-Smtp-Source: ABdhPJxHlMIyebF779Pmf+EQUYUDCCCRQswFwHcrANwURX65AtbiPAM+3y/xQdZ/eWzXmPhz24iOkA==
X-Received: by 2002:aca:1b13:: with SMTP id b19mr2755526oib.77.1624018208676;
        Fri, 18 Jun 2021 05:10:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z6sm45508otk.23.2021.06.18.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:10:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Jun 2021 05:10:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc:     Marius Zachmann <mail@mariuszachmann.de>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        linux-hwmon@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: Re: corsair-cpro and hidraw
Message-ID: <20210618121006.GA1202484@roeck-us.net>
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
 <CADnvcf+W0fLJ8Yh-=dktVR63TXECNKtk5BvUfCBxazkLTw1N6g@mail.gmail.com>
 <20210618074500.7215532b@monster.powergraphx.local>
 <4451002.svKJrzdh7d@marius>
 <20210618084737.200f8575@monster.powergraphx.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618084737.200f8575@monster.powergraphx.local>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 18, 2021 at 06:47:37AM +0000, Wilken Gottwalt wrote:
> On Fri, 18 Jun 2021 08:18:23 +0200
> Marius Zachmann <mail@mariuszachmann.de> wrote:
> 
> > On 18.06.21 at 07:45:00 CEST, Wilken Gottwalt wrote
> > > On Fri, 18 Jun 2021 05:56:29 +0600
> > > Aleksandr Mezin <mezin.alexander@gmail.com> wrote:
> > > 
> > > > I've looked through corsair-psu sources, and I think filtering in
> > > > raw_event won't be enough.
> > > > 
> > > > For example, in corsairpsu_request, there are 2 commands, and they
> > > > should be executed consecutively:
> > > > 1) corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
> > > > 2) corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
> > > > 
> > > > If the userspace will squeeze another PSU_CMD_SELECT_RAIL between (1)
> > > > and (2), the driver will get data for a wrong rail (and with the
> > > > current code won't even notice it).
> > > > 
> > > > So unless there is a way to "lock" hidraw (and it seems that there
> > > > isn't - looking at the code, hidraw calls the low-level hid driver
> > > > directly, as far as I understand), it won't work correctly.
> > > > 
> > > > And if a driver can't work correctly with hidraw enabled - maybe it
> > > > shouldn't enable hidraw? So that the user can 1) notice that something
> > > > is wrong 2) blacklist or unbind the driver (or userspace tools that
> > > > use hidraw can unbind automatically). Otherwise everything seems to be
> > > > silently broken.
> > > > 
> > > > On the other hand, maybe races between the kernel driver and userspace
> > > > tools are unlikely, because the driver doesn't talk to the device
> > > > continuously - only when sysfs reads happen.
> > > 
> > > I never noticed any issues of that kind. I actually did quite a lot of
> > > userspace testing. A result of this a userspace tool you can find here:
> > > https://github.com/wgottwalt/corsair-psu/tree/main/tools/rmi-hxi-query
> > > 
> > > Though, if you find a way to trigger such a race condition I have no
> > > problem to remove the hidraw part.
> > > 
> > > greetings
> > > Will
> > 
> > It is possible. Making a userspace tool with just a loop of read/writes
> > will get you wrong readings in the driver sometimes.
> 
> Hmm, did you read the comments in the driver? I warn about writing nonsense
> values to the micro-controller because you can make it stall. If I let you
> access the device by hidraw I assume you know what you are doing. You
> actually can damage your PSU by this, something I also warn about. I even
> mention that I may remove the hidraw feature in future versions.
> 
> > Removing hidraw from the drivers is not a solution, because there are
> > many userspace tools for these devices and it should be an expected use case
> > to have them running at the same time (eg OpenRGB for rgb)
> 
> corsair-psu is a hwmon driver, not a gadget driver. This driver does not
> have to provide hidraw, only hwmon api access. The hidraw is just a nice
> to have feature. And like my query tool shows, you actually don't need the
> driver to query it from userspace. The first prototypes of the driver did
> locking in the hidraw part which sometimes resulted in lockups. I will
> not increase complexity for a nice-to-have feature. So the only option is,
> I remove the feature if it causes trouble.
> 
> Guenter, what do you think?
> 

Don't change something that isn't broken. Again, if a user wants to use
userspace tools to access PSU data, that user should only use userspace
tools. If there is a real problem with parallel accesses from userspace
and the kernel, maybe we can configure the driver such that it blocks
userspace access while the driver is loaded. Everything else seems
overkill (such the idea of mutexes covering multiple subsystems, if I
understand that correctly). Anyone who wants to use userspace tools
can then just disable or unload the kernel driver.

Guenter
