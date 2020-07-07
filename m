Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6D5C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 12:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 297992075B
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 12:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ASZqj2SM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgGGMlh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jul 2020 08:41:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32398 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726911AbgGGMlg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jul 2020 08:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594125695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xciiD80zP1orEDkuFQaVx94y/jH2lWnyaNnhRi7uAHU=;
        b=ASZqj2SMP6w+W4QYGtBhc6KpmiHqnW0l2BjM1QtKKYvuAG3s/jjv5xGVJ6301QjQpk733T
        ZqKCRn5MLeDU/7ewsySRcNTD0AoNCSIf7vOAcQmJn4SyZQ7EJC7R3pjFZ4+4zGIYd6rs0A
        DTXntuOMg+2UGzH/FQLyb50IhQhGHEk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-8Zq7-wNROJ6GlcgWrb-32Q-1; Tue, 07 Jul 2020 08:41:33 -0400
X-MC-Unique: 8Zq7-wNROJ6GlcgWrb-32Q-1
Received: by mail-qk1-f200.google.com with SMTP id s5so9668934qkj.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xciiD80zP1orEDkuFQaVx94y/jH2lWnyaNnhRi7uAHU=;
        b=FbgX3LaN67yZveMy+7f5U/8sEAj1Q/VPb6dawSGVxIUSHMmrUBWjyWv5irWKqcMvA8
         XMoDfSdN2Uu4RWV3eeTfXhkKX3AKS0n79hLFuLub3ZcI01Hj4porgmkZ/du/lTLxqVCE
         XusWiYZfOCsVaX1mhKhemO6OQaCOpFF4hoBzxI9qrNIrTeWH0hhkq1LPETfaE/y/dNYZ
         XQvixGDrn+nI2uEoHssv0K1yKxvG0fjds3/FCdkLvsTKPUONZTfHk23NdqpRHZTOFtRX
         gJxUiL6fFP6LhpW2LQpiC16rJCLD3u8sqw24AuhwwT4odLcj29++ItPL1fRJvnFw5QQ1
         vT+A==
X-Gm-Message-State: AOAM530CKXrxHymdGG7dXAaAxG+RIPi4k6AxeJwcKH6+DJQpbBZO2TGw
        OSlDn/mzLzVEmV5mJ1oJ1QitXUB/5zssWfTWftn3SK94fLqABUkO6eGYfG2cds8WI2gsIqAP2C1
        Ciep+dR+YPYPmOR7D4WuGSIUaQcoTTLypmI6wJI8=
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr37883665qki.230.1594125693360;
        Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP6smbupZKAwsH82c9IuyMHurFxxfFL3lg3HgS+Yna+vRveJg4MbajXPTdHz1BfmCS75o3pP1vmieESGrBAqY=
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr37883645qki.230.1594125693077;
 Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200626055936.4441-1-mail@mariuszachmann.de> <20200630021642.GA155878@roeck-us.net>
 <nycvar.YFH.7.76.2007071220210.15962@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2007071220210.15962@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 7 Jul 2020 14:41:22 +0200
Message-ID: <CAO-hwJJmPNiFm=e82J3Q577n7phm8R32mHe5gu+uHNcgJH6cYw@mail.gmail.com>
Subject: Re: [PATCH v7] hwmon: add Corsair Commander Pro driver
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 7, 2020 at 12:20 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Mon, 29 Jun 2020, Guenter Roeck wrote:
>
> > On Fri, Jun 26, 2020 at 07:59:36AM +0200, Marius Zachmann wrote:
> > > This is v7 of a driver for the Corsair Commander Pro.
> > > It provides sysfs attributes for:
> > > - Reading fan speed
> > > - Reading temp sensors
> > > - Reading voltage values
> > > - Writing pwm and reading last written pwm
> > > - Reading fan and temp connection status
> > >
> > > It is an usb driver, so it needs to be ignored by usbhid.
> > > The Corsair Commander Pro is a fan controller and provides
> > > no means for user interaction.
> > > The two device numbers are there, because there is a slightly
> > > different version of the same device. (Only difference
> > > seem to be in some presets.)
> > >
> > > This is based on the staging/hwmon tree.
> > >
> > > Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> >
> > For my reference:
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Waiting for Ack from HID maintainer.
>
> Acked-by: Jiri Kosina <jkosina@suse.cz>

Sorry I missed this too:

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

for the HID hunk too.

Cheers,
Benjamin

>
> for the drivers/hid/hid-quirks.c hunk. Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

