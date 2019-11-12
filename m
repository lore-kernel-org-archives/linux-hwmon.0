Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0677AC43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE07020656
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYmjpmT/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKLPAh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 10:00:37 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45692 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfKLPAh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 10:00:37 -0500
Received: by mail-lj1-f194.google.com with SMTP id n21so18164596ljg.12
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2019 07:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iM9vIrvF71SlXNaCy32ws36CT30vUrEEvwG8JDY3Y90=;
        b=VYmjpmT/pEQRTMR71BkEIT7ffs2Zo5YGAccCqw+vOS959rUluA4SXPHnEXvZdk1Bdg
         kUewqPBiCIT5N+XrvT3YRvmHDvIq5h1DfQoJErQ9fBrFABRhyxgYRJ40TZN2y4CcpSZj
         wp/4Mwp53aCkIvwgFP6EoaVZIGHV8pgLuk4jTWfW+5nf7j6KtTrqm8jph8QrQa9tDxIR
         RiiDZisqEipP045CFDy9SB9YvmLcOh2QPumBwy7NewtBt+8QblF1XlQUIq3ShD6N535n
         Anmub6kmnFfSValjXpTuZgwM42dBirfIvR6R/QSzfGLvAYlM2DOXzytphcDZKz5FaDTN
         KReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iM9vIrvF71SlXNaCy32ws36CT30vUrEEvwG8JDY3Y90=;
        b=ij383+2gipzT+P/VFwpBFZG+1qB28L434IiV/sUEeJryl2TrO4ofyuwdJMyPubeUKD
         xhyfawBPZEw+F9rTeang30u1Fhv1aZQBdu96yMLR8PkFOi6Ni4bWwLpSrvZzciAQhjic
         FNBhlqiuG5KQPCQ5NcPaxDh66MOGVyHh1qoPmAT9ehtLOZVpEvcc7uasZ7o8e0pr1kYk
         HnK6RjMCjehnnyzKyhYKpYDtNTu6U9RVLL9z+jLsNu+hoWgqQ5tNsGqSls/TyAZq5d7y
         8b9ua4EKla7tY4JanpTwZuIQiSuTHMzTGLEi+yRMGtkwakg3EflG9pU8DHny0GByTV1W
         M+8A==
X-Gm-Message-State: APjAAAXkcFz/QIJr6FNljRPkQCnZCeEJX8u4342fTB+MetDBTcxZl8Z+
        MYIRkLUEoMRmwsZfIgBpiAg7xp8zmi1jm9I8vqRAk6DF
X-Google-Smtp-Source: APXvYqz4PlNcFY3pbT0OqPixLSr/FY4Ak0mQ9u+xpjL8eub1QWuRXmm2MHQv87xs9UUwEbi+68rddQ61w5y6frhBnu8=
X-Received: by 2002:a2e:9842:: with SMTP id e2mr20504769ljj.93.1573570833778;
 Tue, 12 Nov 2019 07:00:33 -0800 (PST)
MIME-Version: 1.0
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <20191111165306.GA19814@lst.de> <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com>
 <20191112142127.GA11580@lst.de>
In-Reply-To: <20191112142127.GA11580@lst.de>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 13 Nov 2019 00:00:22 +0900
Message-ID: <CAC5umygX=uBQsWV8O=9NL3HeVNo_iMcq7BE-vA-wpQtyU5iV3Q@mail.gmail.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2019=E5=B9=B411=E6=9C=8812=E6=97=A5(=E7=81=AB) 23:21 Christoph Hellwig <hch=
@lst.de>:
>
> On Tue, Nov 12, 2019 at 11:19:46PM +0900, Akinobu Mita wrote:
> > OK. I'll add two macros.
> >
> > #define MILLICELSIUS_TO_KELVIN(t) ((t) / 1000 + 273)
> > #define KELVIN_TO_MILLICELSIUS(t) (((t) - 273) * 1000)
>
> Can you add them to linux/thermal.h that already has similar
> helpers?

Should we add a new linux/temperature.h so that any other drivers or
subsystems (including thermal.h and hwmon.h) can use these macros?
