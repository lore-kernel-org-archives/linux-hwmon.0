Return-Path: <SRS0=dESa=X3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17053C10F14
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 21:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D217B207FF
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 21:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M3xaUt8s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbfJBVoG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Oct 2019 17:44:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37047 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfJBVoG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Oct 2019 17:44:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id c17so413902pgg.4
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Oct 2019 14:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Utf5M1idf2buPTzn1CVF8rxTf5cVxXahETs/DaKiNis=;
        b=M3xaUt8sd02dZGe4DPmvT90aqmBi2cvGVSovauj0vgBiqy29njVa/dlH+wIuqpMcKz
         kwITAp40GngOPQ2YVZ/gwrw90iMoQdKJvTUzTa0V1VWHZ8krzvvqMvPyHf8JC7CxQb3X
         snZqo2+jrReRzXnofN9rkWfiK2aF1XjgxBhlIujwtdgmMdIWgyMzx11xxsXou95b6N2u
         HKRzvMLdJyrEf6iSOL8vtv0GcqmxPiU2T9AZ2jpcVRFK73leIWPVa+tT0Jj35+VhuYuX
         Z4uC3PADmo7DBn3d86QZ45CPBZBzERNHLUwS144q5mnWvPPG6CK87ii5ptzxlmyyQe84
         X6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Utf5M1idf2buPTzn1CVF8rxTf5cVxXahETs/DaKiNis=;
        b=jU98lorK1npPaYfljJ1OXvrzJ0hcrDC08jN6V+JggAGJqciG/sBfodvHZbN5tuO+v2
         AzJ12OCH+8sr+M2WDCVDop3VO5AQq1En7h+QAUm10cOGAKStJ4yDZtqzFby52mSl08uw
         dzujyt4V9EIDNSkVw40wf7f9RYB+63OhRle/xVWISf6vQDXSSbmnetyB44yzjnUON+tN
         8ZpAGnjX0B0f+qztimdNYoyn9AYf9S1CSs9b2tJ7YZdmv8tV7klerqdP1Y94jdWVQtAu
         1rTGjzjqXNQ2agcZ6umVQTQkIEUHbGZleO0T0OWZuQsdU6vnw/PFZkb48H5eCqDHVSgD
         GZKw==
X-Gm-Message-State: APjAAAXcfEz8/bAXoixY41jVCqdtHpGW6HVnXSdxlJwLxxtoNclq9I9L
        9IF7IN3WFxunmQ3GebmF5VpUX4bGsSQzYyRctCDQmA==
X-Google-Smtp-Source: APXvYqwmS6yUrRxO8pfbPbwvbcEQW39IJQhiquCtoAJBHGQ4cKBNNnHAcNCdaXN4aNhg/EZwr2gGCtxqrRW91whHXKM=
X-Received: by 2002:a62:798e:: with SMTP id u136mr7263870pfc.3.1570052642514;
 Wed, 02 Oct 2019 14:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=GVdHhsdHOMpuhEKkWMssW37keqX5c59+6fiEgLs+Q1g@mail.gmail.com>
 <20190924174728.201464-1-ndesaulniers@google.com> <a2e08779-e0ba-2711-9e0d-444d812c0182@roeck-us.net>
In-Reply-To: <a2e08779-e0ba-2711-9e0d-444d812c0182@roeck-us.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Oct 2019 14:43:51 -0700
Message-ID: <CAKwvOdnG6tTHHx5aL8oA3ta_mW24aZ37JX+=HQ9YphearL4DOg@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (applesmc) fix UB and udelay overflow
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        jdelvare@suse.com,
        =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc?= <tpgxyz@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 30, 2019 at 5:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Again, I fail to understand why waiting for a multiple of 20 seconds
> under any circumstances would make any sense. Maybe the idea was
> to divide us by 1000 before entering the second loop ?

Yes, that's very clearly a mistake of mine.

>
> Looking into the code, there is no need to use udelay() in the first
> place. It should be possible to replace the longer waits with
> usleep_range(). Something like
>
>                 if (us < some_low_value)        // eg. 0x80
>                         delay(us)

Did you mean udelay here?

>                 else
>                         usleep_range(us, us * 2);
>
> should do, and at the same time prevent the system from turning
> into a space heater.

The issue would persist with the above if udelay remains in a loop
that gets fully unrolled.  That's while I "peel" the loop into two
loops over different ranges with different bodies.

I think I should iterate in the first loop until the number of `us` is
greater than 1000 (us per ms)(which is less of a magical constant and
doesn't expose internal implementation details of udelay), then start
the second loop (dividing us by 1000).  What do you think, Guenter?

--
Thanks,
~Nick Desaulniers
