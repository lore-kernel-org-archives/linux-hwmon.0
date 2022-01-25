Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4181DC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jan 2022 21:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbiAYVMv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jan 2022 16:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbiAYVMt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jan 2022 16:12:49 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2184AC06173B
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jan 2022 13:12:49 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id r82-20020a1c4455000000b0034e043aaac7so2069428wma.5
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jan 2022 13:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pcgUi6MLwpm5LaJYbYypC2PLq+aKRHlOGARZ2GhPVUM=;
        b=Zsc/vR+XB8LrrWOL/kpeQfQwsDw0TB81GJBUrhQkIAk4LrpZimbO/pZOGW3PqoK77T
         biE1ja5NwVMP5BEXg/2YQ83LZssALFrYeFsAK7vw3dsWw1qLWmKfdCnHD6PL1CmUTz6W
         XTlhAUq9zboFIc0tdtVJt749oLgFbil5mxOgPHMb14RVTCfeF5pac/3mDugA+0JMWbuP
         iJ/VPBr0T5O4S01wnxuPMNmcgs09p1DIUMbxqfSFyncrvgk333BRbdEks0agO0TpIjez
         qFsHk/y6b8txhfJ4cFPIvrFkJr6KA2xJ5WKTuO7z2+atWsYLEsENnrFRNJFv0kgkf6Gl
         iZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcgUi6MLwpm5LaJYbYypC2PLq+aKRHlOGARZ2GhPVUM=;
        b=XPZjO5u9epau1SbO3SzyX+Etsyjpvn2IXsJc2iYJJXrp4LylPRwfcZyNfMNpR45fLB
         2BnsvvQRK/iGN0HcTdXvFzlGkiC18Khdg7c/YropXaR+08xmFP6WvzCIp058esg3uSOU
         kOWPupmaiyQja/b791UkhLXmJcfPmtIjqnA9nCKGs2PYKA34CcHPvk8wOnNnHAznB17L
         nzoXK0Y447NnUtWvfnSbrRdBUFRuo37k064MPpSevYbCBzfPOjmDKy/plNu/49dtRcT2
         y1vqqELbcWMxWFeUQXURroUpoDdrcv+MZxyWV7bTiHbaQ+2q3EyN3/xT9Ad8c+cm7BOz
         YenA==
X-Gm-Message-State: AOAM532jgHfsdnHLBd20CawkAtBR6S7wThRxxsDA7NUY54RYB3D3MVxi
        to26C97WQ00HyBniu/pj6Ra5Swu9Xi0=
X-Google-Smtp-Source: ABdhPJygeDbsxs9zJyRrlOIHIpafdBvDR9ga26kE7epKJFnhSefm+c8Fqh5+EMbSsBeA0hpBog30Wg==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr4607835wmj.31.1643145167460;
        Tue, 25 Jan 2022 13:12:47 -0800 (PST)
Received: from netbook-debian (97-51-179-94.pool.ukrtel.net. [94.179.51.97])
        by smtp.gmail.com with ESMTPSA id r2sm26866789wrz.99.2022.01.25.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 13:12:47 -0800 (PST)
Date:   Tue, 25 Jan 2022 23:12:42 +0200
From:   Denis Pauk <pauk.denis@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Bernhard Seibold <mail@bernhard-seibold.de>,
        =?UTF-8?B?UGF3ZcWC?= Marciniak <pmarciniak@lodz.home.pl>
Subject: Re: [PATCH] hwmon: (nct6775) Fix crash in clear_caseopen
Message-ID: <20220125231242.03a89702@netbook-debian>
In-Reply-To: <605b9a61-50b1-df01-1907-f0fa14a38773@roeck-us.net>
References: <20220124023248.475734-1-linux@roeck-us.net>
        <20220125002157.0d6823d1@netbook-debian>
        <605b9a61-50b1-df01-1907-f0fa14a38773@roeck-us.net>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 24 Jan 2022 14:32:26 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On 1/24/22 14:21, Denis Pauk wrote:
> > On Sun, 23 Jan 2022 18:32:48 -0800
> > Guenter Roeck <linux@roeck-us.net> wrote:
> >  =20
> >> Pawe=C5=82 Marciniak reports the following crash, observed when cleari=
ng
> >> the chassis intrusion alarm.
> >>
> >> BUG: kernel NULL pointer dereference, address: 0000000000000028
> >> PGD 0 P4D 0
> >> Oops: 0000 [#1] PREEMPT SMP PTI
> >> CPU: 3 PID: 4815 Comm: bash Tainted: G S
> >> 5.16.2-200.fc35.x86_64 #1 Hardware name: To Be Filled By O.E.M. To
> >> Be Filled By O.E.M./Z97 Extreme4, BIOS P2.60A 05/03/2018 RIP:
> >> 0010:clear_caseopen+0x5a/0x120 [nct6775] Code: 68 70 e8 e9 32 b1 e3
> >> 85 c0 0f 85 d2 00 00 00 48 83 7c 24 ... RSP: 0018:ffffabcb02803dd8
> >> EFLAGS: 00010246 RAX: 0000000000000000 RBX: 0000000000000002 RCX:
> >> 0000000000000000 RDX: ffff8e8808192880 RSI: 0000000000000000 RDI:
> >> ffff8e87c7509a68 RBP: 0000000000000000 R08: 0000000000000001 R09:
> >> 000000000000000a R10: 000000000000000a R11: f000000000000000 R12:
> >> 000000000000001f R13: ffff8e87c7509828 R14: ffff8e87c7509a68 R15:
> >> ffff8e88494527a0 FS:  00007f4db9151740(0000)
> >> GS:ffff8e8ebfec0000(0000) knlGS:0000000000000000 CS:  0010 DS: 0000
> >> ES: 0000 CR0: 0000000080050033 CR2: 0000000000000028 CR3:
> >> 0000000166b66001 CR4: 00000000001706e0 Call Trace:
> >>   <TASK>
> >>   kernfs_fop_write_iter+0x11c/0x1b0
> >>   new_sync_write+0x10b/0x180
> >>   vfs_write+0x209/0x2a0
> >>   ksys_write+0x4f/0xc0
> >>   do_syscall_64+0x3b/0x90
> >>   entry_SYSCALL_64_after_hwframe+0x44/0xae
> >>
> >> The problem is that the device passed to clear_caseopen() is the
> >> hwmon device, not the platform device, and the platform data is
> >> not set in the hwmon device. Store the pointer to sio_data in
> >> struct nct6775_data and get if from there if needed.
> >>
> >> Fixes: 2e7b9886968b ("hwmon: (nct6775) Use superio_*() function
> >> pointers in sio_data.") Cc: Denis Pauk <pauk.denis@gmail.com>
> >> Cc: Bernhard Seibold <mail@bernhard-seibold.de>
> >> Reported-by: Pawe=C5=82 Marciniak <pmarciniak@lodz.home.pl>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> ---
> >>   drivers/hwmon/nct6775.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> >> index fd3f91cb01c6..098d12b9ecda 100644
> >> --- a/drivers/hwmon/nct6775.c
> >> +++ b/drivers/hwmon/nct6775.c
> >> @@ -1175,7 +1175,7 @@ static inline u8 in_to_reg(u32 val, u8 nr)
> >>  =20
> >>   struct nct6775_data {
> >>   	int addr;	/* IO base of hw monitor block */
> >> -	int sioreg;	/* SIO register address */
> >> +	struct nct6775_sio_data *sio_data;
> >>   	enum kinds kind; =20
> > What do you think about remove kind field also from struct
> > nct6775_data? Code has copy of this field inside of the struct
> > nct6775_sio_data. =20
>=20
> I thought about it, but it would add a level of indirection to
> each access, and it is used for each register access (through
> is_word_sized). That would make the change pretty expensive
> in terms of runtime cost.
>=20

I see, thank you.

> Guenter
>=20
> >>   	const char *name;
> >>  =20
> >> @@ -3559,7 +3559,7 @@ clear_caseopen(struct device *dev, struct
> >> device_attribute *attr, const char *buf, size_t count)
> >>   {
> >>   	struct nct6775_data *data =3D dev_get_drvdata(dev);
> >> -	struct nct6775_sio_data *sio_data =3D dev_get_platdata(dev);
> >> +	struct nct6775_sio_data *sio_data =3D data->sio_data;
> >>   	int nr =3D to_sensor_dev_attr(attr)->index -
> >> INTRUSION_ALARM_BASE; unsigned long val;
> >>   	u8 reg;
> >> @@ -3967,7 +3967,7 @@ static int nct6775_probe(struct
> >> platform_device *pdev) return -ENOMEM;
> >>  =20
> >>   	data->kind =3D sio_data->kind;
> >> -	data->sioreg =3D sio_data->sioreg;
> >> +	data->sio_data =3D sio_data;
> >>  =20
> >>   	if (sio_data->access =3D=3D access_direct) {
> >>   		data->addr =3D res->start; =20
> >=20
> > Tested-by: Denis Pauk <pauk.denis@gmail.com>
> >=20
> > Best regards,
> >               Denis. =20
>=20



Best regards,
             Denis.
