Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08D3C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 15:18:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8889961090
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 15:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347036AbhIXPTn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 11:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347069AbhIXPTn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 11:19:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADDCC061571
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Sep 2021 08:18:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u8so40875250lff.9
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Sep 2021 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5E7t/WszXkQagFRXOLaF8gaxoWgE1XNb8TlegVhlV6M=;
        b=g5Fb87d3LH2CS17A/kJMtdePbqm35JkHVHlr+BeS1W6eBK9wAjT4FuQiN3z+DB+uLu
         V/D3ND4TgGBdQz9Bw7Ns4NbFqcjKkazyKQOras6GZKPP94qMlfeB+5YNQ5XTJrWlWuqy
         VgLTi0E1xtYqHEV9H7vzJFmNioTA9UfGiE6La+XUS1ildHaqoybMy5DH9wVYTReWfx4U
         wMlyPo1DHNzVjofBWAj213d0iSP7e+O1KAnRHZdeFrEl55/2iVszbi/XH8zBI6ezXbUl
         Y1ir8LIZyEQwD4EM39I7nTefOcBS/9yE3Eq98he7ntgpxs8WCdMvxFMJuuaQrn1jbiWF
         Sp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5E7t/WszXkQagFRXOLaF8gaxoWgE1XNb8TlegVhlV6M=;
        b=2AM1vObvX+Nej7eJwsQJ/lnHj6+ywR3wE1yi2gVX+E2KUYbK/yfOs2bONdBINBSsE6
         FLLRgpU8BK0sRwhrLweINYHrD9/M+BwAgq/Bscw+etECZr7MC6nhff8buZxjdJX/6/00
         XsJ1MypTNadE6KOzoj68FqDIhzItoYKpXV5Jz32d5/J5v/Vhn7VK2M/LBWvF06DhjJQV
         Y+LsFTsmAfkhp2SpGwnRaDImU6rCE03BMWXzaHux0e6ecj0nM27Xc9aOphHNJpVjj8+a
         EeirO+bIznDEAe4y+NIBVJfpeUxRiKglce0KMj1DU0OgC2ipvJP2R39avd2X6XtDrND3
         uWtg==
X-Gm-Message-State: AOAM532B/22Gv4ghtXhwEIBF1Rlu81ebmL7y9E3GwMZIj6UM3qE5hHzn
        Be4c7dml99nWyYep5XSIcN/rEYjZjYvaY8J3uWjc4w==
X-Google-Smtp-Source: ABdhPJzhVp/rRQIVKo/1Zx4nJNd19zn5n9JUPphrqT/hrSpbTbi4oeJS7Ph5KVwmUJSY+F2SEeevp7xltZ7tsI1iKWY=
X-Received: by 2002:a05:6512:3e1e:: with SMTP id i30mr9807008lfv.273.1632496687675;
 Fri, 24 Sep 2021 08:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210921004627.2786132-1-osk@google.com> <YUzzjYMwNKwMFGSr@robh.at.kernel.org>
In-Reply-To: <YUzzjYMwNKwMFGSr@robh.at.kernel.org>
From:   Oskar Senft <osk@google.com>
Date:   Fri, 24 Sep 2021 11:17:51 -0400
Message-ID: <CABoTLcRpSuUUu-x-S8yTLUJCiN4RERi2kd8XATP_n3ZTRpAWDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add nct7802 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob

> > +maintainers:
> > +  - Guenter Roeck <linux@roeck-us.net>
>
> Should be someone that cares about this h/w, not who applies patches.

Hmm, ok. After talking with Guenter, I thought that would be him. But
I can add myself, too, since we're obviously using that HW. Is that
what you mean?

> > +    properties:
> > +      ltd:
> > +        type: object
> > +        description: Internal Temperature Sensor ("LTD")
>
> No child properties?

Yes. We really just want the ability to enable / disable that sensor.
What's the correct way in the YAML to describe that? Same for RTD3.

> > +          "type":
> > +            description: Sensor type (3=thermal diode, 4=thermistor).
>
> 2nd time I've seen this property this week[1]. Needs to be more specific
> than just 'type'.

Ha yes, the example in [1] came from this patch. I went with this name
to stay in-line with the sysfs name, being "tempX_type". In the
hardware this would be called "mode".

My original proposal [2] was to have this property a string list named
"nuvoton,rtd-modes" with a set of accepted values, i.e. basically an
enum. Splitting this string list into individual sensors makes sense.

The other question that remains open (at least in my view), is whether
naming the sensors "ltd, rtd1, rtd2, rtd3" is the right approach or if
we should really go to naming them "sensor@X" with a reg property set
to X. Note that ltd and rtd3 do not accept any additional
configuration beyond "is enabled" (i.e. "status").

> > +            temperature-sensors {
> > +                ltd {
> > +                  status = "disabled";
>
> Don't show status in examples.
Hmm, ok. I found it useful to make clear that a sensor can be
disabled, but maybe that's just always the case?

I appreciate your other comments and will fix them in the next version
of the patch. But I'd like to get clarity wrt. recommended sensor and
property naming in the device tree before sending that.

Thoughts?

Thanks
Oskar.

> [1] https://lore.kernel.org/all/CAL_Jsq+NXuF+F7OE3vyEbTUj6sxyMHVWHXbCuPPoFaKjpyZREQ@mail.gmail.com/
[2] https://lore.kernel.org/all/20210910130337.2025426-1-osk@google.com/
