Return-Path: <SRS0=IC/C=27=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05BBC33C99
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jan 2020 05:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86E462077B
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jan 2020 05:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZAvK398"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgAJFHE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Jan 2020 00:07:04 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36733 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbgAJFHE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jan 2020 00:07:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so771259ljg.3;
        Thu, 09 Jan 2020 21:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DR/csZpOtlFwPUHSslKZ8t2JxeV60nIvwDhXAUm3/D0=;
        b=QZAvK398MN6OnXyXajGrojpY2ka0rixjwuNfnJymJA5MsddwzVX0a2DKuIaU3UBVcT
         JSEgD+iP2fMVHC+e/MWwad3C1Cy2BY4OnZ4QE/C4gXeKQMUmKUddHprwv879Rv39GLan
         YVcuCIAv2r04eNNHAhm0bjocC4H/Ogk3LLFBxSPPsXNFkWsCN8sEbEtaV680d371gkUI
         Fzk8BlzIkrVDG78szO91R86LGvongnKnEq9rb1ASejLdtyuunOUTQEVYzl+lGm4jDPK1
         qNKGYQv8YBucoZrXpqK2ZL8ZrZz/xiu7dOTMYIleXGB+y45oS5G7qtSJcjkeD5O7Zjg0
         seZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DR/csZpOtlFwPUHSslKZ8t2JxeV60nIvwDhXAUm3/D0=;
        b=Q0dflK6SADSn4wwjAOpmrW2Oe6w0zVmJt3mxzn3uWnhWcvigp16u/Uic9OC5oKYxWH
         n3VbshP4N7n5zRhqDM5enguiVHpXSp8P/IJcGw4jqOL3QWUW4N2yRu6B4jeZMehBn8G1
         5WiTty8vWnf6yiNuNeC0YDxf3YwKu0tDmOhcfqEXnZKhGOeYY7S+iuqMWiYVXFmASGzk
         ETnnL7wlCKIFA+cqzYztBAZQhcvOKB/lZ7/pf8vCeInKXm96JckvYvw9Dgkb/zqxZh3w
         8hg51r4Ti0mwIhgQiZHb8bvJKHAIjqFu9PKkeACFhWCUX5IpLPAdR1WqKG2uWAZK7Ym2
         /Wtw==
X-Gm-Message-State: APjAAAU7NagPSyBdrrVlfE0BkuLq+WhqXV+GFQI10BSC/kRWnY99QkYn
        /MLsPgFf9QCJTdaHqVav95BU/0HAwikmLyJebpw=
X-Google-Smtp-Source: APXvYqy8VXuT5WbOs+qRrXtcCTu2FXb1F4RB6SFVExvT9YXcXtl0TazRO+jKkMpAHn/mPQNVWK1SlhgxNra+mRRtMD0=
X-Received: by 2002:a2e:556:: with SMTP id 83mr1204265ljf.127.1578632821868;
 Thu, 09 Jan 2020 21:07:01 -0800 (PST)
MIME-Version: 1.0
References: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
 <1577023823-9615-2-git-send-email-akinobu.mita@gmail.com> <20200108161331.GA18546@bogus>
In-Reply-To: <20200108161331.GA18546@bogus>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Fri, 10 Jan 2020 14:06:49 +0900
Message-ID: <CAC5umygcuGTKw=8NO+yM4z=MpAiw62Eo6p0vky_soTRmn0Y1Wg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to stop fan on shutdown
To:     Rob Herring <robh@kernel.org>
Cc:     linux-hwmon@vger.kernel.org,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2020=E5=B9=B41=E6=9C=889=E6=97=A5(=E6=9C=A8) 1:13 Rob Herring <robh@kernel.=
org>:
>
> On Sun, Dec 22, 2019 at 11:10:22PM +0900, Akinobu Mita wrote:
> > The pwm-fan driver leaves the fun running when shutting down the system=
.
> > (On the other hand the gpio-fan driver stops it.)
>
> Seemms like we should have consistent behavior independent of what the
> underlying implementation uses. Is there actually a case you'd want to
> leave the fan on? It seems strange to disable in suspend and leave on in
> shutdown.

I agree.  I was trying to keep the current behavior unchanged, so I added
"disable-state-shutdown" property.  But I can't think of any case we want
to leave the fun on in shutdown.

So it's better to change the shutdown behavior and remove the option
completely or add "retain-state-shutdown" property instead.
(The "retain-state-shutdown" property is inspired by gpio-leds)

> Wouldn't the shutdown state depend if the PWM off state is high or low?
> IIRC, i.MX PWM has a quirk that the PWM disabled state is high. Doesn't

It could be possible to affect the shutdown behavior for pwm-fan.
There are three i.MX PWM drivers (pwm-imx1, pwm-imx27, and pwm-tpm).
Do you remember which one actually have such limitation?

Maybe it should be handled by the PWM controller/chip driver and PWM core.
From the perspective of PWM user drivers for now, we have nothing to do
other than setting duty cycle zero and then disable PWM for stopping the
pwm-fan.

> it also depend on what the PWM driver does in shutdown?

I think so.  But as far as I can see, no PWM drivers implement shutdown
callback.
