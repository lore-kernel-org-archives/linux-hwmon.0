Return-Path: <SRS0=nCRF=AQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E707BC433DF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 15:47:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F0520747
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 15:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="QrO8YZ+G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgGEPrj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jul 2020 11:47:39 -0400
Received: from mout.gmx.net ([212.227.15.18]:57223 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726975AbgGEPrj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 5 Jul 2020 11:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1593964039;
        bh=kn1716bUWCplNijn7miEtUizF5aNDERRFpJuUu1w9Js=;
        h=X-UI-Sender-Class:Subject:From:To:Date:In-Reply-To:References;
        b=QrO8YZ+GExnqJkxVv6/thbeiOjLa16fQlu/+Z2ZW601DfLRM+Y1sxsEL0xzdS7R6c
         7YqsLbmPvDFTdf3PYTz+jRnzFHL3mgVTDNFPJm+Qbs4TvtSIeEgqvyCf49tApgZ6Vh
         JzVR4mnI97zeDwTKZKiW9kSwbnoeokSWg54RGV4c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.2] ([84.190.131.209]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95e9-1kxDaS06Fz-0164Y1; Sun, 05
 Jul 2020 17:47:19 +0200
Message-ID: <6c318b3658b94abd09bb39086b00420e65f71da6.camel@gmx.de>
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error
 for NCT6798D
From:   Stefan Dietrich <roots@gmx.de>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Date:   Sun, 05 Jul 2020 17:47:18 +0200
In-Reply-To: <d54732db-255c-54be-ab43-997369e0da87@roeck-us.net>
References: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
         <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
         <48f415c34f4ca3f5239650711daaf1e11342da8e.camel@gmx.de>
         <d54732db-255c-54be-ab43-997369e0da87@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+/EeFLSHsYWdwtiSAXlSmlGwLCw3Rkb/GpiearyiRWnGOQ02Ckc
 8qHAksWMWUwtyL8ItZlAI0rEeMHLqyOWpf84sG0ORW1HFcGG28oW9A1VXVbfAtXTvn31kKP
 vdd5hFSgltCpI+dDsNfTJaiLsO74qXzl8EIaYUnjcAJtKuqAN7x1AFKELaBGtoKh1fjbxLr
 7fFoFGaP5OnLFett/7UMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K5saLqtxPXw=:SzMau5/19PJjxcsQfjWBsd
 4OtoGir14SDfFnbViRN5C9pJzZV3n2+ruMc1m5vPqTJsfOHqNjIh2QsZSUTaA8RUERx0tcvk1
 F0wt1vBQ2aDCdt7B7VNPEpXQ3lPyTaTTE6oGTnRy2kC6E7luJSnFQ0qtllBDaUTR9kbjimphq
 yruqPuuTuooS8rQie1Q38aqdR9+Vi6M5D6MggaSgYnXb0Qin9Pu6fV5As2Q/Z59gXQxj2J+7z
 +Dm3AnGd7y7IMJlAUfBk1lgW5X2s05LcML9WnqqDYd0OcQLVEXViNvSwiNo7b57VuPHfpEXx7
 6U3q+c2SIzNLos04uzBpzQBZ2KHgZXHTr6iAUR1jiO7VvhcWt0BAAXeGeHvpJ+dc3KmEfBwyv
 rwG4jumgC8x2rPh8MpQbXd8JEMtt1RNQ+iQ4Y/orVtT7z+Zs9tl/1D6Q9I8r90dAm9w9sVCWZ
 CLip8lidceprcgKOlZ62U2+rjhPMTfbArjHZeJTseqYlchkcyUY6dBBvkvnspRIoVUyiLCDd4
 7GL/WEbKeJ4HRdQDIje/qtGx70FV2SCgJq9Wlnr/bqdmczkVvWy0aNIEo2NWcFOXPr/KIUsQh
 uwGfSAUwyoCURpOyCZyczDMx2xQpwf1yuZsb4+dxS9DZPJc9WY3Y/9WY51H0tBqXo6IOr5BtK
 asQyr7Zw8Mecce5F4Quc7yI7nI8bf6Qr7u9PkxumboeNz4F1s9aR+hMDmUhxMVTIMCsupaI7R
 qPXjhUDnS0eBLLboo2Ap85QWXBkSWZy8jnlwMz0OzTBGLD1OTGEsGigRDB+YiSFgCS9+XUoRg
 ugHQ6OUgR0Y56SBkl6US1cv38GysiJwNwAV5BQ10OzoU5guMM4TWDhmSTEbMW3sp4V+KiRpfN
 T6byMgIz1iX7w3SvwXFMwJV9ULaQPUkZa80pTVRTBgudC4xRj9eXRy6bNC3vF3ToImGEZTr7g
 XtO8nAkdPk9HrbQhAGpDqs2N9vA846A02A2AHntGk7JviDqvKqCqwxZC3Vlhe5+0C6rl+EvUu
 YnCQnRIvt4vPdkBh1weDdhIrPXK+yvD1IXLDHdLKHKSp//CG0bZrAAe4Gk3MQVdLGgNCJJ75q
 kdM+0831w6Ky7gUNTvWgfJw5IKxPvWApG4WabrwJtmE6LlqdormxCow3rLEp0Vt4YtnjtU10x
 BKTyGXnfsjsF8Zz9/mPXec5uiTKY+WJb80m3VtXSmrNKUdD8m6epfcd4e267ADOuAfoP8=
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 2020-07-05 at 07:21 -0700, Guenter Roeck wrote:
> On 7/5/20 6:19 AM, Stefan Dietrich wrote:
> > On Fri, 2020-07-03 at 10:10 -0700, Guenter Roeck wrote:
> > > On 7/3/20 9:03 AM, Stefan Dietrich wrote:
> > > > Hi all,
> > > >
> > > > with my Asus Formula XII Z490 and 5.7.0-7.1-liquorix-amd64 I'm
> > > > getting
> > > > the following error messages during boot:
> > > >
> > > > nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> > > > nct6775 nct6775.656: Invalid temperature source 28 at index 0,
> > > > source
> > > > register 0x100, temp register 0x73
> > > > nct6775 nct6775.656: Invalid temperature source 28 at index 1,
> > > > source
> > > > register 0x200, temp register 0x75
> > > > nct6775 nct6775.656: Invalid temperature source 28 at index 2,
> > > > source
> > > > register 0x300, temp register 0x77
> > > > nct6775 nct6775.656: Invalid temperature source 28 at index 3,
> > > > source
> > > > register 0x800, temp register 0x79
> > > > nct6775 nct6775.656: Invalid temperature source 28 at index 4,
> > > > source
> > > > register 0x900, temp register 0x7b
> > > > nct6775 nct6775.656: Invalid temperature source 28 at index 5,
> > > > source
> > > > register 0xa00, temp register 0x7d
> > > >
> > >
> > > There is nothing much if anything we can do about that. The
> > > NCT6798D
> > > datasheet reports temperature source 28 as reserved.
> >
> > Thanks for the quick reply. Would you briefly outline why this
> > makes it
> > inaccessible for the NCT6776 driver? Is there a pool of registers
> > that
> > I might probe for values that could be related to the desired
> > temperature values, even if they need to be scaled?
> >
>
> Reserved means invalid for use. We don't know what happens if we
> would
> let the driver use those values. That has nothing to do with scaling.
>
> If you like, feel free to modify the driver to accept temperature
> source
> 28 for NCT6798D and report the results. That should give us an idea
> if
> the datasheet is at fault or the board BIOS.

Ok, thanks. Unfortunately, a look at the code tells me that this is
beyond my current skills, but I might start toying around with it some
day ;-)


Stefan

> Guenter

