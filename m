Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3328C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 17:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351646AbiEBRqE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 13:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239075AbiEBRqD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 13:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 523502DC8
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651513352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oX2QCt8rCc+oF9sCgtcKZ1Q9e7gcbTc5DzDbSOW56p0=;
        b=H94h5zunRvh1G35cMT4aeOykk6mVSZadh3EmhNXAod364t5toQxl5bnxUcsLbDHIYq4C1P
        /e3e4bR8xJB6/1MFFAD6RUx1Mum013QcgH3waW5bZWfzdwlW6q9ARHgOw/Gu5SWIWz8T/J
        qWfE3DBucDO3BFE71Fq7DXJOoIN33Pw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-fIlAgilfO7iYcx2_Rxu4Lw-1; Mon, 02 May 2022 13:42:31 -0400
X-MC-Unique: fIlAgilfO7iYcx2_Rxu4Lw-1
Received: by mail-qt1-f198.google.com with SMTP id s10-20020a05622a018a00b002f381134e2bso11474544qtw.3
        for <linux-hwmon@vger.kernel.org>; Mon, 02 May 2022 10:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=oX2QCt8rCc+oF9sCgtcKZ1Q9e7gcbTc5DzDbSOW56p0=;
        b=XcIF5KI14USpO8F9XnEnyCrXucnxBuF8t7iccxLwIxSMmSJHdVSdLSFaPBlPXIVQ0b
         0FJoQHVWmmimgm0RMBvpNd4PW5omDQTSGEFBwf4AnRIhX2EN8vlXqlgxqY8NNfzbThV8
         ONGdYhxOkW7P3p/SPkW6SGfMoQnAGEwSTT0FVmfu28eyeSd6PVvfaFVfqc3xKCYcnnEk
         ttwIye7kVqNsQ9euo0RMpZzkPRZOyYViTjEcWELFnRvF9C6OEZvbgeRcPTPQiGPSHXBG
         bAUzN1taDRmLCYNRn+kD4CLNRStNg+1FFn5WNiL28RRVs/5q5qwkVFybnRMitappznRX
         sHiQ==
X-Gm-Message-State: AOAM531Vag4a8h2tvHEz0xe/Ex6zY1ZU9UEz7mbYoLVqLx53Wg72F+rC
        J/6vygV5iLYMzJAGx5pNHl/ZLBhFYigNCsml6p7L3xCkNsYBxUt080+hPVYlIolyhfRbQ1CjeDQ
        8junvd2KydcHu4f3LabMGex8=
X-Received: by 2002:a05:622a:1456:b0:2f2:4ff:39a1 with SMTP id v22-20020a05622a145600b002f204ff39a1mr11395128qtx.164.1651513350892;
        Mon, 02 May 2022 10:42:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVlI+WvWSeI1gCt0yxhCHNFIeT/+R26JugPN+2OgpT4RSLl4o9vy34Ma1ONh6I84/8Qm9tqg==
X-Received: by 2002:a05:622a:1456:b0:2f2:4ff:39a1 with SMTP id v22-20020a05622a145600b002f204ff39a1mr11395121qtx.164.1651513350693;
        Mon, 02 May 2022 10:42:30 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id i2-20020ac871c2000000b002f39b99f66asm4474637qtp.4.2022.05.02.10.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 10:42:29 -0700 (PDT)
Message-ID: <2769588a352e9c3b43a4e09afff100d52a9ba524.camel@redhat.com>
Subject: Re: [External] [PATCH 1/2] platform/x86: thinkpad_acpi: Restore X1
 Carbon 9th Gen dual fan quirk
From:   Lyude Paul <lyude@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Date:   Mon, 02 May 2022 13:42:28 -0400
In-Reply-To: <d3461670-a905-4956-4f4d-d847adf4289b@lenovo.com>
References: <20220429211418.4546-1-lyude@redhat.com>
         <20220429211418.4546-2-lyude@redhat.com>
         <d3461670-a905-4956-4f4d-d847adf4289b@lenovo.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some answers/comments down below

On Fri, 2022-04-29 at 21:25 -0400, Mark Pearson wrote:
> Hi Lyude
> 
> On 4/29/22 17:14, Lyude Paul wrote:
> > The new method of probing dual fan support introduced in:
> > 
> > bf779aaf56ea ("platform/x86: thinkpad_acpi: Add dual fan probe")
> > 
> > While this commit says this works on the X1 Carbon 9th Gen, it actually
> > just results in hiding the second fan on my local machine. Additionally,
> > I'm fairly sure this machine powers on quite often without either of the
> > two fans spinning.
> > 
> > So let's fix this by adding back the dual fan quirk for the X1 Carbon 9th
> > Gen.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: bf779aaf56ea ("platform/x86: thinkpad_acpi: Add dual fan probe")
> > Cc: Mark Pearson <markpearson@lenovo.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> > Cc: Mark Gross <markgross@kernel.org>
> > Cc: ibm-acpi-devel@lists.sourceforge.net
> > Cc: platform-driver-x86@vger.kernel.org
> > ---
> >  drivers/platform/x86/thinkpad_acpi.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c
> > b/drivers/platform/x86/thinkpad_acpi.c
> > index c568fae56db2..9067fd0a945c 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -8699,6 +8699,7 @@ static const struct tpacpi_quirk fan_quirk_table[]
> > __initconst = {
> >         TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),  /* P1 / X1 Extreme
> > (1st gen) */
> >         TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),  /* P1 / X1 Extreme
> > (2nd gen) */
> >         TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),  /* P15 (1st gen) /
> > P15v (1st gen) */
> > +       TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),  /* X1 Carbon (9th
> > gen) */
> >         TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen)
> > */
> >         TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN), /* X1 Tablet (2nd
> > gen) */
> >  };
> I just double checked this on my X1C9 - and it's working correctly. 2nd
> fan is detected correctly.
> 
> I'd rather understand why it's not working on your setup then just
> re-introduce the quirk.

Of course! I figured as much, it's just easy to start conversations with a
revert :P

> 
> What happens on your system when the
>   res = fan2_get_speed(&speed);
> is called? If that is failing it means your 2nd fan isn't responding and
> that's not supposed to happen. Could you let me know if you get an error
> code, if it happens every boot, etc
> I assume when the function is called later it works successfully?

It definitely seems to happen every boot, not sure about the error code it
returns. I will check and get you this info asap

> 
> Also please confirm which BIOS and EC version you have.

BIOS version N32ET75W (1.51) release date 12/02/2021, embedded controller is
0.1.32


> 
> Thanks
> Mark
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

