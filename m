Return-Path: <SRS0=hC89=RB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56CBC43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Feb 2019 06:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76116213A2
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Feb 2019 06:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lkZvxAf1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfBZGFH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Feb 2019 01:05:07 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:34507 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfBZGFH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Feb 2019 01:05:07 -0500
Received: by mail-io1-f66.google.com with SMTP id e1so9631590iok.1
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Feb 2019 22:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QBbQSjxgXNOYZnEmoNiNRV58Re9OYSStn0JNxlv7v/o=;
        b=lkZvxAf1FWMD9XdaKePztbZ19t1muIkBBWFeYmpvJU1Fkmw1Bog/cSaLWeL9I/5+tS
         bjyR9sgxgk3B1dqF3NCmCI2F7zCSbx0VXF0pL6Sy+MoVZsgdMmRDae8iy0p8+ItEfzfe
         h1xrJnMNk0BFA/Bu0fiSrZTQXEl1vu7Ez0GR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QBbQSjxgXNOYZnEmoNiNRV58Re9OYSStn0JNxlv7v/o=;
        b=eHwBE5m7SPNvL09HJldjXz6HtVPajr7cKLvpDpNq5RJF27wyiQC8VyPLjaisPY5Out
         EmgV5MXyi1xvMwcXAvJnTqn5hU8Ehltb/3KdWYyPtygQAbTlJ3fhlv/YXuMCd4E+i8jJ
         gZZCsnTgYL3Az7M98lf1a9hZZF2c4IglKKkYZhZAvGIISDhF/sRGdkoFK/g0PBS/2mFR
         WMWhNH1VpJVRKGNYAH+S7mmmYQFAaXtst0wL0ZcT+najS/rQwMcXZQJ8rF9VG5OE+CTw
         CKcYZwRdDkE0AK1ZuHcdDzWGHG4u7P8uyhWumtgsOauXGZpBye8Bpkxo30pzOwbDvQpl
         4HCw==
X-Gm-Message-State: AHQUAuYi5sBfVcwFD9ZPJhz8lua9eEl8LPsav+1cXfV83GhdRlp9dTKl
        m39uoIaAC5L7FKktQE9d9oJlJC1OVK46Kg+JFqcJgw==
X-Google-Smtp-Source: AHgI3IayJXoPFhflLHgZWELMwCRx0Yb2FMD2NYdu+Ti8duXQp4OzM215LULD3zn5NYbwzLyMEZB1wX1XxAcC/USnIXo=
X-Received: by 2002:a5e:c605:: with SMTP id f5mr11998100iok.252.1551161106550;
 Mon, 25 Feb 2019 22:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20190212113808.3040-1-jagan@amarulasolutions.com>
 <CAMty3ZBaOZoj+xV+e+4BtYdaWA2biwENmngOa9vbbMB=_vbB1w@mail.gmail.com> <59969c88-585c-cb7d-3104-8059b78ed2e3@roeck-us.net>
In-Reply-To: <59969c88-585c-cb7d-3104-8059b78ed2e3@roeck-us.net>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 26 Feb 2019 11:34:55 +0530
Message-ID: <CAMty3ZCT+yBJOnjcvLoKva+E1Zkdgr0aA=_kAreqpM3=c7yczg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: hwmon: Add missing documentation for lm75
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-hwmon@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Rob,

On Thu, Feb 21, 2019 at 7:32 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/20/19 9:22 AM, Jagan Teki wrote:
> > On Tue, Feb 12, 2019 at 5:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >> Add missing dt-binding documentation for lm75 hwmon sensor.
> >>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >> Changes for v2:
> >> -  Add all compatible nodes available in lm75.
> >>
> >>   .../devicetree/bindings/hwmon/lm75.txt        | 37 +++++++++++++++++++
> >>   1 file changed, 37 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt
> >
> > Any comments on this? It is blocking some dts changes to get merge
> > into Mainline.
> >
>
> Waiting for Rob's Ack.

Any comments?
