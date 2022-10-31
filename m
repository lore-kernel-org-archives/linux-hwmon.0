Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFFBFA373D
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 03:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiJaDSP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Oct 2022 23:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiJaDSO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Oct 2022 23:18:14 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8B99589
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Oct 2022 20:18:13 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-13be3ef361dso12260564fac.12
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Oct 2022 20:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H6yxG6WG9YfR7jV8jGy3YWitKuGi/H/H/AJtqr1d/Ug=;
        b=CANWyWyOBDJYSzCgSlIhkQ0yRPbcY+4ULmsx8zlEaG0bALSbHMyGse9Xo4pl7y2I8G
         VC4zGnD15egUZposRt1EuSA79k2jXHS6Uj5nS0lz6m3yqr/AhaqI36mVYRCtQkBytDc4
         WFwDnUltzrHazZBh8STrAerej7VRbjZu70VM7K3eTI8wMDbpMuo5kQZ/+FtkLANNL7bS
         BSjPpnP2n7iejxarFyS3AtY4+2Lae2W4w4CZx4Pc9pD/3iU/hZCnaV4dKpHAco0jhCUx
         8zNvYZrYBsWwYEfRJClAd8qPuSBVlv85WMJcu1bcvWYuqPQKw7Qfc/T8rQnsCmS7VflK
         rmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H6yxG6WG9YfR7jV8jGy3YWitKuGi/H/H/AJtqr1d/Ug=;
        b=Jb63w+XSE5YT8lUEmDvfB2DHQdXHTCJNdrG56ROlxMN5Ixip18UNyim+0SKIzox48u
         4DvEKEKt2QrUQaXzngCXF+gQQBwd1l2EUl+9WS19nYnDdczpzbP/lZJ6ixtZWhBLejra
         AEjRVWymm40NP7HDn6b9KgT3WrG0yW/Z5XuEwLQleWG5fU0bW7Lv+SimWOqBKAD+dg3U
         G6ngk9vC/uh8hqYGnjCv7I+vevL7PAyt9opTD2u7iMe9EPPxHCQqi+9mGw33dcVorfuz
         twC49zR8vyOL5G71ODG0oE3JuhGqNn6GTIDcpxRJSfmQGZUH8X1dboc07CiuTsvwCO0g
         bfWg==
X-Gm-Message-State: ACrzQf0dFqYepr7WIREJYxm10S9U8hUFey//DGXDKST0BygcbaT6wA7T
        Mxj4aflzFAc9Yg+CPB/+ryKJ9E0qj20=
X-Google-Smtp-Source: AMsMyM5GU4Vp4imGM17KnpPplJ970/PZCr/2MHw6JTw162JOJm5HE7grMHnF/RPsLNXbbg9SONGXBA==
X-Received: by 2002:a05:6870:148d:b0:13b:11ec:75ee with SMTP id k13-20020a056870148d00b0013b11ec75eemr6353159oab.64.1667186292340;
        Sun, 30 Oct 2022 20:18:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u10-20020a9d720a000000b00661abb66319sm2303698otj.37.2022.10.30.20.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 20:18:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 30 Oct 2022 20:18:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for
 various board settings
Message-ID: <20221031031810.GA1396334@roeck-us.net>
References: <20221029103057.3234561-1-frank@crawford.emu.id.au>
 <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
 <f802b322431a182c4bdf0f91cd4114fe381ebfe7.camel@crawford.emu.id.au>
 <20221030013909.GA1264837@roeck-us.net>
 <cd0def02f2397db0a05f100debe9d11b0f6d5ac0.camel@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd0def02f2397db0a05f100debe9d11b0f6d5ac0.camel@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 30, 2022 at 01:06:45PM +1100, Frank Crawford wrote:
> On Sat, 2022-10-29 at 18:39 -0700, Guenter Roeck wrote:
> > On Sun, Oct 30, 2022 at 10:43:59AM +1100, Frank Crawford wrote:
> > > On Sat, 2022-10-29 at 07:04 -0700, Guenter Roeck wrote:
> > > > 
> ...
> > > > That is really not what I meant when I asked to use a callback
> > > > function.
> > > > As written, the code might as well call that function directly
> > > > from
> > > > the
> > > > init code, and there would be no reason to have a callback
> > > > function
> > > > pointer.
> > > > 
> > > > A callback function would only make sense to me if it is added
> > > > to struct dmi_system_id, and called via dmi_check_system().
> > > > See other callers of dmi_check_system() for examples.
> > > 
> > > Oh, investigating other kernel code I see what you mean, and it
> > > does
> > > simplify one possible future update, but looking through the other
> > > modules in hwmon, I can't see any using a DMI callback.  The
> > > primary
> > > use of dmi_check_system() is just as a count of successful matches.
> > > 
> > > Also, just going back to a previous comment about creating a static
> > > version of sio_data and updating this in the callback, this does
> > > worry
> > > me going forward as in future I hope to add code to handle the case
> > > of
> > > multiple chips.  Updating the static version for one chip may cause
> > > issues with the other chips.
> > > 
> > The value is set based on DMI data. I don't see how that would make
> > a difference even if there are multiple chips. The DMI data would
> > still be the same and is board specific, not chip specific.
> 
> For present cases, yes, but consider the current setting, which
> disables pmw2 for the FN68PT board, if there was a second chip on that
> board, you would not want the same setting for both chips.
> 

Sorry, that is purely hypothetical. Kernel code should not be optimized
for hypothetical situations.

> I haven't yet worked out how it would be distinguish at the time, but
> also it hasn't been strictly necessary.
> 
> A simple case I have coming up for future patch is to use the DMI table
> to ignore ACPI conflicts when we know it is safe, but that should be
> done on each chip separately, not necessarily globally for all chips on
> that board.  Again, in practice it isn't important, and I haven't
> worked out how to specify it separately yet.
> 
> Also, I have been looking at the difference in the use of
> dmi_check_system() and what the use of dmi_first_match() does and it
> really is just a case of the callback being used at the time of
> matching vs deferring the actions to be performed at later and possibly
> more appropriate stages.
> 

I can see that you are for whatever reason completely opposed to using 
the dmi callback function. Fine, but then don't introduce another one
just to have a callback function and in case it may possibly be needed
sometime in the future. Introduce it if and when it is needed, and only
then. The same applies to all other infrastructure: Introduce it if and
only if it is needed for more than one use case, not because it may be
needed for some unspecified use case some time in the future.

Thanks,
Guenter
