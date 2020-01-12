Return-Path: <SRS0=Bx3T=3B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD9CC32771
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Jan 2020 11:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62E2721744
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Jan 2020 11:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXbrrp5j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732678AbgALLWC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Jan 2020 06:22:02 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36552 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732668AbgALLWC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Jan 2020 06:22:02 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so4794836lfe.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jan 2020 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J/hGPBV9O8y1r4I/kNVXxaBjxv5wLfCvrzJ+lyF5gU8=;
        b=YXbrrp5jiT1psd89mFxIh1l3s2A3XepycVbFh/kPLR8Guiy005rNYBb/ebqinuQSjm
         7vJMXLmcuhp1PojpdzEqkKtVe2H8dm7gQKHsUr/E0yDIt1uy2vHRuHCy+mU4mtVLu3/+
         plwmBnqKWERkiXStEkIWVNHyNkGMRGh7hmZh0ABbwsM5T/N9ZtdeDMLne27uzfuRgXKA
         kX8XsC//O5/ujKQLtJMWIJMlAwmyfTYdE4skK3NtnC8tCsCqkeV1d1sRvTen9UuuP5lj
         o8p/9hK7TNgU8Pv1RydZqaJ1vPa1U0hXXH9LrKri8RGKpskOijePWM74RG1uPYCrCjXV
         ayBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J/hGPBV9O8y1r4I/kNVXxaBjxv5wLfCvrzJ+lyF5gU8=;
        b=LizHwlwuHkeX+DxIOK9akfD8bQScciyGnJpxHYmOU7WJeTanmA6VZtnrUjTes+wSg8
         sZTSRGDBV18rOym1KpyZ2Ho6vxjyx2Nd62XfrmY+Uyxc0g7IT6UvXZ2m1SxZMYDVDELr
         gIPG0KkjKfkqKh3gPc2FoGigl0UCf8ct9si7cXU3a11QnRnqVhefht7P17BRGjSMt0tu
         RgLrtS2wuFI0bb6i7SARBGQuBZkmkJL4BYs3q0KQ46vmYFHERD55hqK+qUSbz92mh1L5
         7l0IsaRTwFJqfX2PftaGv6NNgwaExLBH+sDB+Ch7m7p+eqfGHECc2hrJk7tm4KHBLEuc
         m7+w==
X-Gm-Message-State: APjAAAWbX3YMfCkEjJC54N1x/IRBO4SSiJAN/o7LzFyjRNHGh4DSahNM
        1PkIz42VAJLcUIq+8LLv3Ee/qnPYpsk1YP9Ws58CqA==
X-Google-Smtp-Source: APXvYqxIl+s85PduWiqfAEx7nOiaIevZBLUsVcio0qfitsaWujhuW7W5l0Ud7kTZiN0gAlnZOeOTZrvUgoy15qbK+Hw=
X-Received: by 2002:a19:5513:: with SMTP id n19mr4806877lfe.205.1578828120912;
 Sun, 12 Jan 2020 03:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20191215174509.1847-1-linux@roeck-us.net> <20191215174509.1847-2-linux@roeck-us.net>
 <yq1r211dvck.fsf@oracle.com> <b22a519c-8f26-e731-345f-9deca1b2150e@roeck-us.net>
 <yq1sgkq21ll.fsf@oracle.com> <20200108153341.GB28530@roeck-us.net>
 <38af9fda-9edf-1b54-bd8d-92f712ae4cda@roeck-us.net> <CAEJqkgg_piiAWy4r3VD=KyQ7pi69bZNym2Ws=Tr8SY5wf+Sprg@mail.gmail.com>
In-Reply-To: <CAEJqkgg_piiAWy4r3VD=KyQ7pi69bZNym2Ws=Tr8SY5wf+Sprg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 12 Jan 2020 12:21:49 +0100
Message-ID: <CACRpkdYU7ZDcKp+BbXRCnEFDw1xwDkU_vXsfo-AZNUWGEVknXQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: Driver for temperature sensors on SATA drives
To:     Gabriel C <nix.or.die@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Jan 12, 2020 at 12:18 PM Gabriel C <nix.or.die@gmail.com> wrote:

> What I've noticed however is the nvme temperature low/high values on
> the Sensors X are strange here.
(...)
> Sensor 1:     +27.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
> Sensor 2:     +29.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
(...)
> Sensor 1:     +23.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
> Sensor 2:     +25.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

That doesn't look strange to me. It seems like reasonable defaults
from the firmware if either it doesn't really log the min/max temperatures
or hasn't been through a cycle of updating these yet. Just set both
to absolute min/max temperatures possible.

Yours,
Linus Walleij
