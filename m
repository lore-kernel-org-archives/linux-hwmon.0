Return-Path: <SRS0=13Sa=SA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E16C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 13:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 657182183F
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553866131;
	bh=xYEJqj8FrG9LVsMXhDsCTaVAutx6e+oJB6hIKUH5Igg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=JZVYhkIGeRzzaXs3VsPd3oqecF+056UqTSUSbGx0X4+U/FVncO+SDlFwrb0S8Yj5z
	 1KAr/aAf88SfqqVSrYRHN6iZL4xpLd8BIo1i29Sf961mV5bTKx3sAKAwfe/2BZa2dB
	 TI2aw03VE3jO3B5fykx4DgbZu4MBNF8ChpnBOVvk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbfC2N2u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Mar 2019 09:28:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729584AbfC2N2u (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Mar 2019 09:28:50 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F77E2183F;
        Fri, 29 Mar 2019 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553866129;
        bh=xYEJqj8FrG9LVsMXhDsCTaVAutx6e+oJB6hIKUH5Igg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=caBmGcnyDgQi529dbRmyV1sDK535lchoBdQXjbN0ELVV/LTCmFhShYeiAHTb6ojVo
         0LjIY64X3QtLIsTqXLMM6e/Ynyu3GoO8EoUO/q8kz0FhU/p5tIc3kumqsvnpEHRzBt
         AgH9WmAl5ol9di/DLuW3K+a80MM6EL1ztLHF5cos=
Received: by mail-qt1-f169.google.com with SMTP id k2so2547451qtm.1;
        Fri, 29 Mar 2019 06:28:49 -0700 (PDT)
X-Gm-Message-State: APjAAAXqxuPuMwhIkSO4NvZiVGftsmA25+9oKrcUYwJjKadpsvcRg4Jx
        N1TTdgLO5tw8zdzu3TSEMyHLCZ8hsCwmRXZaWA==
X-Google-Smtp-Source: APXvYqwRTJwxu397LoAnJUiSXGET6mNlbT2AaUi3oShUnqUPz3bhjSjDoIkI+HhaGs2nKZ0P+YwE9FB526RS8WQq55w=
X-Received: by 2002:aed:35b0:: with SMTP id c45mr41497612qte.144.1553866128700;
 Fri, 29 Mar 2019 06:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
 <20190328174615.GA6068@bogus> <20190329092236.GL46536@ediswmail.ad.cirrus.com>
In-Reply-To: <20190329092236.GL46536@ediswmail.ad.cirrus.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 29 Mar 2019 08:28:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJDp_AftJ_J-gpJ4Spt7vUi7PQ-0uidJYB0PPVKfrhJXg@mail.gmail.com>
Message-ID: <CAL_JsqJDp_AftJ_J-gpJ4Spt7vUi7PQ-0uidJYB0PPVKfrhJXg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 29, 2019 at 4:22 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Thu, Mar 28, 2019 at 12:46:15PM -0500, Rob Herring wrote:
> > On Thu, Mar 28, 2019 at 01:09:36PM +0000, Charles Keepax wrote:
> > > Lochnagar is an evaluation and development board for Cirrus
> > > Logic Smart CODEC and Amp devices. It allows the connection of
> > > most Cirrus Logic devices on mini-cards, as well as allowing
> > > connection of various application processor systems to provide a
> > > full evaluation platform. This driver supports the board
> > > controller chip on the Lochnagar board.
> > >
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > > +Required properties:
> > > +
> > > +  - compatible : One of the following strings:
> > > +                 "cirrus,lochnagar2-hwmon"
> > > +
> > > +Example:
> > > +
> > > +lochnagar-hwmon {
> > > +   compatible = "cirrus,lochnagar2-hwmon";
> >
> > You don't have any resources in DT, the parent MFD driver can just
> > instantiate this child device.
> >
>
> + Lee Jones
>
> Lee, was very very keen for me to not mix mfd_add_devices and
> of_platform_populate in the MFD driver. As such we moved all the
> sub-drivers into DT. I agree it is a little odd that this exists
> only to bind in this driver but I think it is probably a bit late
> to change that. If we were going to have the MFD instantiating
> children directly a lot of the rest of the binding would have
> been done very differently.

Okay. This is why I don't like incomplete examples...

Reviewed-by: Rob Herring <robh@kernel.org>
