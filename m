Return-Path: <SRS0=YkMd=A2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06912C433E1
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 00:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDDC620674
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 00:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/GZTKU8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgGOAT6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 20:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgGOAT6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 20:19:58 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1805C061755
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 17:19:57 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id br7so339964ejb.5
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aOvVeqASK69kEreiMeK5FiA/USWg0yEnZWAkRpqA8TI=;
        b=Z/GZTKU8TEBMSm3hhhcn0zIi80gTRqVpcGPbl+ghA5iF3kdXLQIJaPE1/8JhOnJglf
         UZ5bF8+aVoq3K1D0yrF87ANXknygq5cxojIWVIfXWBqcM2troOgrodQiQRx22YQSQpV/
         MEAsZlxbNigTrh5lVTK74tiDAhtKP5xDrcN2cIHoCCOw0jdahIXhV9mPdc81NTix8MS4
         vVrvMhGrhuqppQaEE7+PoqRI7BDJVRIP0spkxjkEk9g3QTAnT1lLlOI9FTPahETxt4kM
         /ADxT1W1uS+zMHMJHiweGbn/DVQ/uDHZHluj+UjPsDQrB10qPi6gdj/UNbqbM7xDhtvH
         ECNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aOvVeqASK69kEreiMeK5FiA/USWg0yEnZWAkRpqA8TI=;
        b=cP+5tu2Ur5CRhtTrx9mG41Rn2jIZ6WE2PadHv/HCnDb+Zd5FCkUsT9+yJref+uaJti
         iBdDs7Ctbz5Kt8fSaUroxTh3uF0LdrWlzaOvYcvcibZmP1eqSlcHz5IImsDb417Jxkrk
         FMGIV0hPN94D2/MwlryRzAf86V06uXZNz+Ll7XXo6ebfLT+4tmI7d0pe8zK74HLMqnMx
         nZXjeCeqx73A76VWLxErOzlxGD/ruf7kcnL0yaqenVo/9lR9r2Zewl0TSOHQfYhqoxra
         RnPhNVbC7m4YJtBXaJJOfo0Jyqd6YUegdp8rC2VnTutr5JELy8NRHbQhUIGMNglnuqvM
         J4uw==
X-Gm-Message-State: AOAM533b2nE9ju83MzYafeRvcEeKDIcinnLGRDlKpFhNMD062ik/5QyX
        pr3EiauP3raNM9BwSV0xdb+emCe+V7Y=
X-Google-Smtp-Source: ABdhPJyxwOogqfYu1TEgGc4/4v2l0U26DyJAbSeIR1Mh/jNClnJZwfS52aWzhyV9LpzgXub2mjYYIw==
X-Received: by 2002:a17:906:2681:: with SMTP id t1mr6710642ejc.350.1594772396368;
        Tue, 14 Jul 2020 17:19:56 -0700 (PDT)
Received: from monster.localdomain ([2a02:8109:113f:e5b8::4])
        by smtp.gmail.com with ESMTPSA id d26sm327029ejw.89.2020.07.14.17.19.55
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 17:19:55 -0700 (PDT)
Date:   Wed, 15 Jul 2020 02:19:54 +0200
From:   Alexey Galakhov <agalakhov@gmail.com>
To:     linux-hwmon@vger.kernel.org
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error
 for NCT6798D
Message-ID: <20200715021954.68a03582.agalakhov@gmail.com>
In-Reply-To: <d2769820-426c-bc4a-bcc2-2720fde4f5bc@roeck-us.net>
References: <20200715011748.3507fc2b.agalakhov@gmail.com>
 <d2769820-426c-bc4a-bcc2-2720fde4f5bc@roeck-us.net>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 14 Jul 2020 16:58:29 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 7/14/20 4:17 PM, Alexey Galakhov wrote:
> > Hi,
> > 
> > I'm facing the same problem. I did some research on my machine.
> > 
> > On Fri, 2020-07-03 at 10:10 -0700, Guenter Roeck wrote:
> >   
> >> There is nothing much if anything we can do about that. The NCT6798D
> >> datasheet reports temperature source 28 as reserved. You could ask
> >> Asus for support, but their usual response is that they don't support
> >> Linux.  
> > 
> > Looks like there are different versions of the datasheet. The one of
> > NCT6796D, Revision 0.6 states that 28 (0x1c or 11100) is "Select PECI  
> 
> We are talking about NCT6798D here.

I have NCT6798D on my machine and I also double-checked the chip marking
on the motherboard. I just looked at the 96's datasheet (not found a
98's one). Even with 98 this configuration seems to be correct. Looks
like at least on some revisions of 98 it is not reserved and usable.
The fan in controlled correctly with this setting.

> I have no idea how to access the "HM Read-Only" registers. The datasheets
> are not exactly verbal about it.

I successfully accessed them. The access procedure is poorly described
but quite simple.

Each of these "HM Read-Only" registers is just a plain I/O port. Just
inb() reads them. Their addresses are sequential. The base address
(address of register 00) is configured similar to the main I/O address
(the one which is usually 0x295). Its MSB is in register 0x64 and its
LSB is in 0x65 of the SuperIO. Like that:

  superio_select(sioreg, NCT6775_LD_HWM);
  hm_ro_base = superio_inb(sioreg, 0x64) << 8;
  hm_ro_base |= superio_inb(sioreg, 0x65);

  // on my machine hm_ro_base == 0x800

  val = inb(hm_io_base + hm_reg);

Hope this helps.

Regards,

Alexey
