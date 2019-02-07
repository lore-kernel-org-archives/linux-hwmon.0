Return-Path: <SRS0=CTyS=QO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB1BC282C2
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Feb 2019 12:40:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE13B2190C
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Feb 2019 12:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGJ62PwQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfBGMkT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Feb 2019 07:40:19 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35355 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfBGMkT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Feb 2019 07:40:19 -0500
Received: by mail-wr1-f68.google.com with SMTP id z18so10625708wrh.2
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Feb 2019 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UtYCRPhql5OL1Qp6icAEsli6oXVTYp+eZlOJj4Ykn44=;
        b=FGJ62PwQxALmzOJpVUfl+4pwJbs+0tlK6nqjEhaGJ363ovbcuhMXWYEUONTnk/yFu7
         V1ZWe0osJPgcTOAMcfMiYH/H2ipUxD+RMAvMHTYrgg954qspiRaxswJNZ8C/k2ri+Q2p
         rfqHbpHlNvu0YiJRi0HkI8GSFdK8tdAr2ZcvY118H4E75awjZtAhIJ0EQyPsTvdI8tYm
         CeVfqA3tiUhaAKmErrFDBp1rp3Yul1WpZNH4Ppn4zA3pO9BS8kwPqh5W65U2630N+Od9
         ou6m68Xv5UiDv+VztsdeGyUoYk00j29qj3C0vhVKaRhWCk8Qqw7tvMYjjq9f3JWXdDvW
         rn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UtYCRPhql5OL1Qp6icAEsli6oXVTYp+eZlOJj4Ykn44=;
        b=nWaaVH3ynoqRrckng7T+kTH05butQEmnB62svhnh17fJIRhgKS90AfUqzpWBnrzxlL
         T1LF5Bz/VBT6o195JsbUQQgtnMkJcAg03JbqacsHN0NQVXY4sv6nyI4/Igx3yWwg3N8j
         N1koZ9F4vgDeR9RPc4AhmZW78NooNR5nzfVIR54p8lVUNn1hlMBLaIOk7dGYxLTrfFG3
         5biusShsAKoKE4rfL1nk4OdX6aamqF0gEpURtt521iP2WAhgkiIPdtWjR1ChrqZD7AFE
         nyH7e9TXDsKu5WGClcyf4lb2XPujQ+aJsehqvX4Ga5f3lFaiuslbEXIBsOGCdMLTJTmG
         ssvw==
X-Gm-Message-State: AHQUAuYk6FSAuqaFBZ+5DyPOhUBQq5plQADv1lgA98DHFd1YseSC/sMM
        1L1XN6rYifSSwbbOJ8wPXOpuQBlV
X-Google-Smtp-Source: AHgI3IbjEQF9bhCN0MNHV82OMdETabkUFsoqzZb/eVCuM+yv7tojigcUdmKER45GwReQlHMN1hA+pg==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr3608777wrs.70.1549543217382;
        Thu, 07 Feb 2019 04:40:17 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id f22sm13703334wmj.26.2019.02.07.04.40.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 04:40:16 -0800 (PST)
Date:   Thu, 7 Feb 2019 13:40:10 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Michele Sorcinelli <michelesr@autistici.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] dell-smm-hwmon.c: Additional temperature sensors
Message-ID: <20190207124010.zfqyn2vzgwkatima@pali>
References: <20181207202927.14168-1-michelesr@autistici.org>
 <20181208005603.11721-1-michelesr@autistici.org>
 <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
 <20181210105823.xq3mnrlfgdx63etl@pali>
 <127d6adc-6002-ad28-14bd-1ca475d421c5@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <127d6adc-6002-ad28-14bd-1ca475d421c5@autistici.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Do you have definite response from Dell support that they are not going
to fix it? Then it is pity :-(

On Thursday 07 February 2019 12:16:06 Michele Sorcinelli wrote:
> As far as I know Dell won't help with fixing the SMM layer, they probably
> changed something starting with firmware version 1.3.0 and they don't
> wanna release information about it.
> 
> https://www.hwinfo.com/forum/Thread-Dell-XPS-15-9570-temperatures-not-named-anymore
> 
> I wonder if something can be done to force the discovery of the sensors in the driver,
> maybe adding a module option to use i8k_get_temp() as probe method as a workaround,
> or maybe just forcing that method for this specific model?
> 
> Let me know your thoughts.
> 
> Thanks,
> Michele.
> 
> On 12/10/18 10:58 AM, Pali Rohár wrote:
> > On Friday 07 December 2018 20:24:49 Guenter Roeck wrote:
> > > Anyway, I would like to get some feedback if this can cause regressions
> > > on systems which don't support that many sensors and maybe report something
> > > completely different if one tries to read the high-numbered sensors.
> > > I seem to recall that there was a reason for checking the type and not just
> > > trying to read sensor values.
> > 
> > There can be also different problem for sensors which are turned off.
> > E.g. on notebooks with switchable graphic cards which have included
> > temperature sensors. When graphic card is turned off, then SMM returns
> > error when asking for temperature value (for obvious reason). But
> > temperature type still returns correct value "this is GPU sensors".
> > 
> > So we cannot replace temp_type check by temp_value check. It introduce
> > race condition between "starting GPU" and initializing dell-smm hwmon.
> > Now linux kernel has support for dynamic turning ON/OFF switchable GPU,
> > so we need to care about these race conditions too.
> > 

-- 
Pali Rohár
pali.rohar@gmail.com
