Return-Path: <SRS0=THek=AP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4782C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 19:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B8EF208B8
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jul 2020 19:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NC6atwJO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGDT4j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Jul 2020 15:56:39 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:18767 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGDT4i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Jul 2020 15:56:38 -0400
Date:   Sat, 04 Jul 2020 19:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1593892231;
        bh=o/KfzUJv7sndoCcX9ukT4bB/4gHNx0upMgm3bM5q+mU=;
        h=Date:To:From:Reply-To:Subject:From;
        b=NC6atwJOx7MGbGvWCk8wqJpvJmN8BJdhfxteWfLiGSDfPfRgUZtU0oJ3Nonopcufx
         RKG5vdS1AkRxKEnFFIHYM9IB70OiFqZpLNkXmEC56pWdzVkde2Wcx6YUlal0nwXLKT
         vIpXdCtrSVQxqztDUgaUopTGPxGdorlhvPNzYa3o=
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [QUESTION] fan rpm hwmon driver
Message-ID: <xU_nzuNaKzomGSEsIdtEGvDVgR0MuUoti45TC5WzkVu0FscRsOEp7dzY4tGOoUkvrG9QPJethyosMSnxcXFuE-xcpqJ6DQwfnPkPlFiEcbY=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello all,

I am completely new to Linux kernel development. I have written a kernel mo=
dule for my laptop that integrates the fan speeds available in the embedded=
 controller memory into the hwmon subsystem.

My first question would be: can such a driver be merged into the mainline? =
I ask this because it is a device specific driver, and I am not sure if suc=
h drivers are wanted in the mainline.

Depending on the answer to my first question, my second question is: where =
should such a driver reside in the source tree? Initially, I thought of dri=
vers/hwmon, but that seems to be occupied by drivers for external(?) device=
s (I am not sure, but that is the idea I get). So I am now thinking of driv=
ers/platform/x86. However, I have failed to find any fan hwmon drivers ther=
e, so I am not sure about that one, either.

I send my mail to the hwmon mailing list, because after all, it is about a =
hwmon module, but if it is not the correct place, please point me in the ri=
ght direction.

I would greatly appreciate if anyone could help me. Thank you for your time=
.


Barnab=C3=A1s P=C5=91cze
