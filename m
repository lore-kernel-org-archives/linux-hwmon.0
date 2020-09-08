Return-Path: <SRS0=0Rzu=CR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15946C433E2
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 16:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F91206DB
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 16:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJUtasPW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731937AbgIHQgf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Sep 2020 12:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731935AbgIHQg2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Sep 2020 12:36:28 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241A1C061573
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2020 09:36:28 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x69so14079619oia.8
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2020 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NuivVHbkS/GakuHUEhzeNQttKcvnBh/zqO3l2rk5XtY=;
        b=KJUtasPWFI+FJoBsEGvMwtPOf+trhCO1nlWfoF4f/nNjDfOp2BmrtBGkcsJN4WlOlH
         Tmh5JEcPGlZ38xNNVd+aUFtAmQ7+Fv8xnZ5cJk+R7pg5SJEsYQso2MIcpFZsD4TQ3PfZ
         Tf4LTuPOoysy7mxcdaYyVqOTjLT59TNEpIgZUffm4EosVmCxOqWzPihX423ca9fxJjry
         zOZwbkg7uoGvxnZyFesourKXUuptYcECsTfHkzwntx8qmj5AS7qsElMF5G87g/zXhj5Z
         ZBbmwp/kQk06tD5h91sVXBSmHrn3ttzTGu7yEWOPrKdVVXSAXMRo/9u3lqJco9Srivrs
         vZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NuivVHbkS/GakuHUEhzeNQttKcvnBh/zqO3l2rk5XtY=;
        b=ONrnQWVxyMWjQMkt+kX0QsR/ADt6CjfZLqUgcP/T3rcq6JwMFSe0aBTIEPvhCBrvZE
         +BmJsD/eTU/JjAaYrDIR9pRZoNCsrjXKby6Lk1I1tTEuj4LMc3QPRdSKB5KeIsU3Pp7j
         YFzbKBv7bK8cBYivGJ63t256wOn2gfkgMP2sgXo8DCFxGUcRhJcCpOfiIzapNej/eiGE
         9WYiKYWQ20aKTG3y8N3AdQLMZlg6fEtRccBQURu3jeiiH9Z7tai6RdDyRq9At4LZpqZT
         QZ1abYzzh2fCPyX8LlmSCHbSBNeS3TkwiV7PxL8f44HXyQwnf+u+kXk5v4iRZH5jKg8X
         8XXQ==
X-Gm-Message-State: AOAM532O7KK5knirU8eKlbtaZMsL6kzwvgRWVhtLbQfTR8xhgpjCwUd2
        8xypMtOT5H4FGckTFiMl17U=
X-Google-Smtp-Source: ABdhPJwH4iISqRaelUqTah7GTuIAHXiKkhjnb/Z/zYJcPVEUp7y9n76AxfHr/gj6mWgyHIe+ti0B6g==
X-Received: by 2002:aca:42c2:: with SMTP id p185mr3130113oia.55.1599582986999;
        Tue, 08 Sep 2020 09:36:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m8sm3547637otn.66.2020.09.08.09.36.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 09:36:26 -0700 (PDT)
Date:   Tue, 8 Sep 2020 09:36:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Subject: Re: FW: [PATCH 4/6] hwmon: amd_energy: let user enable/disable the
 sw accumulation
Message-ID: <20200908163625.GB169609@roeck-us.net>
References: <20200905143230.195049-1-nchatrad@amd.com>
 <20200905143230.195049-5-nchatrad@amd.com>
 <850781c9-8332-1618-f4f1-1722a8491f2f@roeck-us.net>
 <53f9b993-20e2-92b0-4957-c444b23cb37f@roeck-us.net>
 <DM6PR12MB4388A21B749811BBE1309AA3E8290@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAHfPSqDO3_KgSToQs9GNy3Ag8e4Am8z85qmi2fRSAz=62ztHmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHfPSqDO3_KgSToQs9GNy3Ag8e4Am8z85qmi2fRSAz=62ztHmg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 08, 2020 at 09:51:23PM +0530, Naveen Krishna Ch wrote:
> Hi Guenter
> 
> On Tue, 8 Sep 2020 at 21:42, Chatradhi, Naveen Krishna
> <NaveenKrishna.Chatradhi@amd.com> wrote:
> >
> > [AMD Public Use]
> >
> > [CAUTION: External Email]
> >
> > On 9/5/20 8:17 AM, Guenter Roeck wrote:
> > > On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> > >> Provide an option "accumulator_status" via sysfs to enable/disable
> > >> the software accumulation of energy counters.
> > >>
> > >> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > >
> > > I am quite substantially opposed to this. I'd be willing to accept a
> > > module parameter. However, the code is there, and it is enabled by
> > > default, and it should stay enabled by default.
> Sure, I will change it back.
> 
> > > I don't want to have to deal with people complaining that it suddenly
> > > no longer works.
> Understood.
> > >
> > > Also, there needs to be an explanation for why this is needed.
> > >
> >
> > No, wait, without accumulator this driver has zero value.
> > Users should just not load the driver if they don't want the overhead associated with accumulation.
> 
> The use case we have is to provide an interface to enable/disable
> accumulation by the admins, without having to reboot or install
> something.
> A userspace API is provided which will be used by the applications.
> 

Really, that should not be done. If accumulation is not wanted, the
driver is pointless and should be unloaded (or not be loaded to start
with).

Guenter
