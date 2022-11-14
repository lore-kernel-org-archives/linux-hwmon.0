Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5195C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Nov 2022 19:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236720AbiKNTrI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Nov 2022 14:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiKNTrH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Nov 2022 14:47:07 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB35DFCE7
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 11:47:04 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso11494198wme.5
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vaNuduer9UPlnYE1fRAS2akD9wJj/Hf3Zb0alzhLo4=;
        b=XZHEO1CKnnZm8Cm83VyUHL2ChEyDD806/1jIAyWC0kVi0Z43O1CnFCoC0IFXLqUSDe
         wN93LlIgstgkkW4bXOKsa6ZVNJ/k0J3vnZvrR3JYuc6So5xsaM2+hm+9gaatsiaPP9rX
         TitJtwRheOM+VyCKq7B3GBYU0jBFQ9CDtFzdD8ml3xHOFfWd4EMQWbW3wHXmUp7L0fYe
         Gkb+xOoJw0wL5E2L3JS4kNiPIUN6/SdACz5xHMuZS0aHgkgyaQ3h8Sv7ODAXPiEsKvLP
         I13xVj1+HJPSr+gbRCLH2RdUwCW8b5Q8y3ikzm62ibaJvvhlS3HcK3RPSFZiOWNa0E4a
         IiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vaNuduer9UPlnYE1fRAS2akD9wJj/Hf3Zb0alzhLo4=;
        b=eCKmPoZgEf6H7DhhKQOjYigFpNJpRoOQxTv7YDW8jGgzXeLjLSYvf6RoMw47GvZLCk
         LY4UIA53xxcHgKPfGmsA8ixUJabHWEKllo4OeQD0SomMUC8CMjSa9R5F3WsBM37HDwf2
         5Xj4jccihkFBlDapfkJr3FvigWSo/FPAQehu9bAn8SlSUTi5+edUf0hiWyC4BAs7samM
         zVHQpSr+faukte0wIq+WgQtwCfP4lg0zDvuRg+IRkZLC8ZjRlYTilZUkE77U7pmQ43re
         et7qoiZRJZIuf4GRCpjl6w9iIAIT3VKxG06sbywgXw06qbhZg6aiyxqr3flImzwYm6qk
         Ds7g==
X-Gm-Message-State: ANoB5pkYjKc1gywxCxXTRgXqIFYWMrPhJ7OH76osszyFcwQNG+wiWrnp
        qcVRWFxGXEmSJEieN31qklp2xlhUbl6/h357EgGCnXDsHgI=
X-Google-Smtp-Source: AA0mqf51YgGKcYfA5Gi1OGhlv/Ib4wBBOPxWs8QIntli6y1t/E5v55DcXHNw7DhCW20Sk/YmgHKQ1Z3BwXgf+Fc4rmk=
X-Received: by 2002:a05:600c:3393:b0:3cf:a8a5:63ab with SMTP id
 o19-20020a05600c339300b003cfa8a563abmr8928478wmp.101.1668455223334; Mon, 14
 Nov 2022 11:47:03 -0800 (PST)
MIME-Version: 1.0
References: <9072e6884c86199765da31a23ef0935cedaaae6a.1668286473.git.chunkeey@gmail.com>
 <20221112233605.GA521020@roeck-us.net>
In-Reply-To: <20221112233605.GA521020@roeck-us.net>
From:   Christian Lamparter <chunkeey@gmail.com>
Date:   Mon, 14 Nov 2022 20:46:51 +0100
Message-ID: <CAAd0S9B=n9feFQSYT3vaRg0MBSHLy9rngcJFRRWkPsj4o0zDmg@mail.gmail.com>
Subject: Re: [PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Sun, Nov 13, 2022 at 12:36 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Nov 12, 2022 at 09:56:40PM +0100, Christian Lamparter wrote:
> > found on the ASRock X670E PG Lightning (and possibly others).
> >
> > the userspace sensors-detect utiliy found "a" chip right away:
> > |Probing for Super-I/O at 0x2e/0x2f
> > |[...]
> > |Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
> > |Found unknown chip with ID 0xd802
> > |    (logical device B has address 0x290, could be sensors)
> >
> > Looking at the documentation: ASRock was nice enough to point
> > the exact chip out in the mainboard's "English User Manual" [0].
> > In section "1.5 Block Diagram" on page 10 it says "SIO NCT6796D-S".
> > It is also mentioned that it uses eSPI to interface with the CPU.
> >
> Who knows, maybe the "-S" is for "eSPI".

Apparently, eSPI has been around for a while. Didn't know that, it's
been quietly replacing
LPC starting from 2015.

I've been doing even more digging, this time on github. Should have
done this sooner.
What I found is that for the LibreHardwareMonitor Project that 0xd802
ID is a new chip!

<https://github.com/LibreHardwareMonitor/LibreHardwareMonitor/pull/846>
They call it "NCT6799D".
I guess, I'll ask there, because I do have photos of the chip on the mainboard
with the "NCT6796D-S" label on it. (The SuperIO is located behind the GPU).

> >
> > [0] https://download.asrock.com/Manual/X670E%20PG%20Lightning_English.pdf
> > [1] https://www.nuvoton.com/export/resource-files/NCT6796D_Datasheet_V0_6.pdf
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > ---
> >
> > Any insights into the missing two fan speed sensors would be very appreciated.
>
> Two possibilities: There may be more options to enable those fan inputs (ie
> different pins) not curently supported by the driver, or there is a fan
> multiplexer on the board. Hard if not impossible to say without datasheet.

Your suggestion: "Look at the Windows Utility" was very helpful in this regard.
So ASRock has each motherboard configurations in a separate .xml file.
And the content of that ASRock XML for my motherboard does make sense.
My best guess is that, I have to spend more time at driver, the missing fans
should have been fan4 and fan5.

=> Adding the ID isn't enough to get this supported just yet. For the
time being if someone
wants to use this: Please just stick with the force_id module
parameter. I ask Nuvoton (apparently
they have a github page) or try to figure this out by looking more at
the windows utility.

Thank you!

Christian

PS.: As luck would have it, I also got an ASRock B660M PG board. This has
the "NCT6796D-R". However this chip reuses the existing NCT6796D ID and is
instantly working with 6.1-rc4.
