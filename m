Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E794C636CA
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Jul 2021 20:55:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC0476117A
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Jul 2021 20:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbhGQU6D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Jul 2021 16:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233666AbhGQU6C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Jul 2021 16:58:02 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98A8C061764
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id y17so14333393pgf.12
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
        b=yG/94pT++KysRkRR7Ee9X/reRZojfKEcZDLOovFdsOCIl6tMAHuE4febS8dZjRq5on
         KakPilolQePL2d3aMUyd0sD2TpYRm3tFxj9hcX+iuHw+lTBEHfYq8POysMd5FJbVILZq
         b8CQb+EfVh6yJZzKi3jm+4bSd90uJQgsJBmJLGe3ZJSJIYCLeIkEdLUyG4qCERiR/D3Y
         CLFZxGYQ2TrtobRV/SdNOcMAnBKcFjZrQJtjrVYq7LWy4xElrWV7FvFTn060p8a4rY4U
         adR8o5Jt47WSv1Zror7vG7WmZ4dkwESOOo1I1AuekVMbzXvKduiajK3Zbz5E0/tyNsPV
         XgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
        b=Blcw2f1d3+d0f8FJi5N+dsMiHqKhn6qGs+qo17W0LEokUR6d1p7rPGMeBUqkfp+LUe
         AvWl60l4UCLA6n8XbtB8ZAdp3gAUx9o9PaXtCmbzrvfaT73VNVV3gFzOVgvmWKJCNKnC
         Tr5TWmy7/tGLhDysrC0P8XBICDHNv7aSboUtNv8nT95rM/SJgf41Z6yUWOfs3jvPlUPf
         EW8/BOMphRpRjPTFX58xzHuAZ8J+px3TlLpfJFkxbdg3PPWEiuI0J4nNi7F1RsKasP9C
         mf0sRZFzuO+84EMSyTLzwWrfWct0hoodFLCFvlp4YnKhWf+6E6lIScvE795ZeJI4bZJe
         jVCQ==
X-Gm-Message-State: AOAM532vsvjTNFkd3vji6Hk/9V1Ubskydw/w/OyyC++/9AKz3jw0ifcB
        7qsqFvT7zjSZ41c0d9YvLg1ymmOe9LK0FjmAlNJGew==
X-Google-Smtp-Source: ABdhPJwegUQnpKKeNNS0aeS1tIibmSwIVu8h0HW57Wt8a6q24xYnmH9VFR5v+d9CeKf0ktP85MKfdE2UMTwvnwW1EYI=
X-Received: by 2002:a65:6248:: with SMTP id q8mr16976866pgv.279.1626555305105;
 Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-7-iwona.winiarska@intel.com> <59428599ef7efb2521bd62c49a3bc55c710f29de.camel@intel.com>
 <6807a14deb52956ad2fe390b1811dd98901a642a.camel@intel.com>
 <CAPcyv4ifjCZSUuk5H5qw6sjt5vdAkTfNzd+4imu+9e_iOt74gQ@mail.gmail.com> <YPJ05JUiOggKajIx@kroah.com>
In-Reply-To: <YPJ05JUiOggKajIx@kroah.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 17 Jul 2021 13:54:54 -0700
Message-ID: <CAPcyv4iuP=uSEWyd+N65FpasQidtN82tW8q-dvf_qT7_FMiTsw@mail.gmail.com>
Subject: Re: [PATCH 06/14] peci: Add core infrastructure
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "Winiarska, Iwona" <iwona.winiarska@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Luck, Tony" <tony.luck@intel.com>,
        "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 16, 2021 at 11:13 PM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 16, 2021 at 02:50:04PM -0700, Dan Williams wrote:
> > On Fri, Jul 16, 2021 at 2:08 PM Winiarska, Iwona
> > > > > +}
> > > > > +EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
> > > >
> > > > I think it's cleaner to declare symbol namespaces in the Makefile. In
> > > > this case, add:
> > > >
> > > > cflags-y += -DDEFAULT_SYMBOL_NAMESPACE=PECI
> > > >
> > > > ...and just use EXPORT_SYMBOL_GPL as normal in the C file.
> > > >
> > >
> > > I kind of prefer the more verbose EXPORT_SYMBOL_NS_GPL - it also
> > > doesn't "hide" the fact that we're using namespaces (everything is in
> > > the C file rather than mixed into Makefile), but it's not a strong
> > > opinion, so sure - I can change this.
> > >
> >
> > Perhaps as a tie breaker, the maintainer you are submitting this to,
> > Greg, uses the -DDEFAULT_SYMBOL_NAMESPACE scheme in his subsystem,
> > drivers/usb/.
>
> We did that because namespaces were added _after_ the kernel code was
> already there.  For new code like this, the original use of
> EXPORT_SYMBOL_NS_GPL() is best as it is explicit and obvious.  No need
> to dig around in a Makefile to find out the namespace name.

Fair enough.

/me goes to update drivers/cxl/
