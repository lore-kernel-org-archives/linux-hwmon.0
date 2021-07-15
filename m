Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9A8C636CA
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 19:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83410613CA
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 19:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245176AbhGOTxC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Jul 2021 15:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245058AbhGOTw1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Jul 2021 15:52:27 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F166C094248
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jul 2021 12:35:09 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id c15so3941334pls.13
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jul 2021 12:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWQzYFArmX7BK0KtHhu7qCMLH8EpJJltCicUZnmhozs=;
        b=x+X7r/05mLeYMY5IOOQXqOPlH4+7oeO79bZ5YPDJ++PHDQKt0r4FcvE/lkq15akq7B
         Ce5RF/y77x9dJasWX7jMdKXiDyCRNfCPc0xcdgmMO0nH9GJ8PcKjDkDCNNwh88V3I8q+
         DVd8W4UyeBtFOTbd2yOFKy6XhIXfiUb4cjWvUYZNsBW6xRsYQlKKhDyHMQ8HR13L0zF5
         yJn4825mzOpNHdMV2eZ72kAoCCdIieowUKQvUmzKFsCD1CehD3TdyOBZuq4PFKBRFYvE
         J7XyrEX7xMecHu4TmiRqBc6ToIEqTL1RABDWAcgFcJqtXWCwwkUwT8cTATLu+1RfuxFH
         zOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWQzYFArmX7BK0KtHhu7qCMLH8EpJJltCicUZnmhozs=;
        b=rXfzC6F6VASxc/xcddXMV0PD7T0u0O2R6t+W+rqsdbKA8D5vki4uXD8YYLWTGusCjr
         49OEvgrm4HjchosIfQZwiCoF4Y30zKqXIgKdnNn3Ceroehsm9VC3+ZHlT88JL5QGuT3j
         tE5QjwSzeKPbE4dRASG6tT1lyziuikt9GojVuRmg5IQnudyerFuWgcs2qr7T7QvrPF0B
         Ly62KgkZoViw8euzyqcyvU+2OFrxppW5MD+NbuJdKD/JZm+CDa3RIwd+scu0xubXTOgo
         P3tEAGfU1PvC7tA0SuCUEkrKRgk0/O66q6gBh5KSc+a3OAn7rEdogTzm3XpXSm58JTj1
         4RMg==
X-Gm-Message-State: AOAM531lFun+A3zEornGFKzm68uWQli+bZiRj0oR/f/i/tMIURv6Bx8s
        b58a6UmdABMgoNwUBg6ilHvBHG8bbV43VKD7jd7Skg==
X-Google-Smtp-Source: ABdhPJwxNVyUFsXl8r6NxD+c6uWM8R2fmbcCrxfwX4wABHvVgCgyv6hXJdQx4qtT/3WKROCvcTTm94Gam5hqhrB02Do=
X-Received: by 2002:a17:90a:8407:: with SMTP id j7mr11756922pjn.13.1626377708767;
 Thu, 15 Jul 2021 12:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <3b9cfe5f728c40c473a22070029c8790b452daf4.camel@intel.com> <fe9a5191e401b38325aaff11365b5970034d26cc.camel@intel.com>
In-Reply-To: <fe9a5191e401b38325aaff11365b5970034d26cc.camel@intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 15 Jul 2021 12:34:58 -0700
Message-ID: <CAPcyv4h-PrBhPU7FcuKwk++o5unKY03H85M-inpDGvmDh-ybGQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] Introduce PECI subsystem
To:     "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Luck, Tony" <tony.luck@intel.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 15, 2021 at 10:33 AM Winiarska, Iwona
<iwona.winiarska@intel.com> wrote:
>
> On Wed, 2021-07-14 at 16:51 +0000, Williams, Dan J wrote:
> > On Tue, 2021-07-13 at 00:04 +0200, Iwona Winiarska wrote:
> > > Note: All changes to arch/x86 are contained within patches 01-02.
> >
> > Hi Iwona,
> >
> > One meta question first, who is this submission "To:"? Is there an
> > existing upstream maintainer path for OpenBMC changes? Are you
> > expecting contributions to this subsystem from others? While Greg
> > sometimes ends up as default maintainer for new stuff, I wonder if
> > someone from the OpenBMC commnuity should step up to fill this role?
> >
>
> The intention was to direct it to Greg, but I guess I didn't express
> that through the mail headers.

Usually something like a "Hey Greg, please consider applying..." in
the cover letter lets people know who the upstream path is for the
series.

> I am expecting contributions - for example there is at least one other
> major BMC vendor which also ships PECI controllers.

You're expecting to take patches from them and you'll forward them to
Greg, or they'll go to Greg directly?

>
> From my perspective, the pieces that make up a BMC are pretty loosely
> connected (at least from the kernel perspective - scattered all over
> the kernel tree), so I don't see how that would work in practice.

No worries, Greg continues to scale more than other mere mortals for
these kinds of things. I was more asking because it was not clear from
these patches, nor MAINTAINERS, and it's healthy for Linux to grow new
patch wranglers from time to time.
