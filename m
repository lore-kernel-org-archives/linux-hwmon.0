Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF33C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 11:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2E4D60F6F
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 11:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244850AbhJIL7d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 9 Oct 2021 07:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhJIL7d (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 9 Oct 2021 07:59:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7E7C061570
        for <linux-hwmon@vger.kernel.org>; Sat,  9 Oct 2021 04:57:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x27so50317957lfa.9
        for <linux-hwmon@vger.kernel.org>; Sat, 09 Oct 2021 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ddKTI6gnxdVhQkUnuikMlEViQcCSWc9S4SrlE2LPasM=;
        b=Yg6rDn/QwCnZ4mhkc/514eVzXNnZnBJsuoxUVFlrhZpRt82oMGdPOHTiqm3+XtRIxZ
         RwhlX2vDonxSDsF54dlYxNdjdZ5st2xZg6UDF9Y6azZS2DzXd1a44z7AiXAoReSRQUKP
         Dc6WUjrIY96qhIbo47NxeAk/WuDTgKAGgJbEw5ERZ6y870+1KUF29r5ru+dxsOPZWayB
         +n1TZ9b6jw3syhLy3nDVDCyxYqVb0tSEXN+nzyxiq1fM4uJgTW+CvHYnDoHgrjN7Nfyi
         3fVroAlBduYh/hXHXEUQNR8qFidOFS8cpveEAjcS4aPeILNiZctB27eDCNOc6kxlATt3
         IIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddKTI6gnxdVhQkUnuikMlEViQcCSWc9S4SrlE2LPasM=;
        b=XbtO9BQmXOG6d0jQd1fcb5NtFb0Xn2V8eqDQdhzfA8UFoaQPdOBt7t10lNYvLOCw09
         HMEnh/BqrzpYQONLDa/mYd2FwoKfQtE5Mcwz7jGsYIK9KsXN3z3MUvbNl3NN3iGbdgl0
         ujrMlZeAORFoK8WNTIRtPLC41k5HmcES9VFbySJRXNlqrnxtl3fF78/lArhJtoj61b6e
         xn+Nn7Ub7t18JmFc/ZVUQlmRdWM2Egr1qFPWJnMfTnGXk48d2NhVGOQ3a7Cy1bkIDc6X
         /1RPLwQWFjrvKu0ZmzywpPS070VQt+Y2slrOG0GCP1Iz788e0RoBnkDUN+TrdBM+a1Qg
         oLHw==
X-Gm-Message-State: AOAM530/QjXysg/y3VB2cGHMA42BvzlvIteIDL9GbTC30xG5TU+Wp+fp
        aAt+PI7ECgku4aSd0eNHc6vQFvo208qY3OhRw2NdAvEHoQ4BLA==
X-Google-Smtp-Source: ABdhPJwi87OXKsFksT0f11sHBmIjP1L0dHkYUJoao8hhpCllD6s+7zVPFAfZxfwRJPU4ZrBJgZ13OyJvtYsEL3F0atY=
X-Received: by 2002:a05:651c:140d:: with SMTP id u13mr9541773lje.9.1633780654110;
 Sat, 09 Oct 2021 04:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211009024430.3322230-1-osk@google.com> <089c590f-5b35-8a2a-6132-d8d3e2695c15@roeck-us.net>
In-Reply-To: <089c590f-5b35-8a2a-6132-d8d3e2695c15@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Sat, 9 Oct 2021 07:57:17 -0400
Message-ID: <CABoTLcSMDPQvhgmUL5aE_df++pg4qN+cmf=31J9WPVnKnT6k7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add nct7802 bindings
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi everyone

> > Document bindings for the Nuvoton NCT7802Y driver.
> >
> > Signed-off-by: Oskar Senft <osk@google.com>
>
> Please pdon't expect from reviewers to figure out what changed
> between versions and provide change logs.
Uh, I'm sorry, I'm new to the Linux upstreaming game. I'm used to
using code review tools like Gerrit, which help with that.

Changes from "PATCH v2 1/2" to "PATCH v4 1/2" (v3 was sent with a
typo, so please ignore v3):
- Removed extra layer "temperature-sensors" as discussed.
- Renamed "sensor" to "input" as discussed.
- Renamed "mode" to "sensor-type" to indicate temperature or voltage.
- Added "temperature-mode" to indicate "thermistor" or "thermal-diode".
- Removed description attributes from "sensor-type" and didn't add for
"temperature-mode", since they would have just repeated the names of
the properties.
- Numbered sensors 0 (LTD) and 1..3 (RTD1..3).

Some notes:
- While 1..3 are "natural numberings", there's no equivalent for "0"
in the datasheet - the name "0" is arbitrary. An alternative would be
to name this sensor "ltd" instead of "input", since it's not
configurable (beyond disabling it).
- I wasn't sure what the correct way is to enforce a match from
"input@X" to "reg = <X>", so I listed the inputs individually.
Technically RTD1 and RTD2 could be done as "patternProperties", if we
could enforce the match between @X and reg.

I hope I included all the various comments and discussion points both
from PATCH v2 and from the "tmp421" thread [1]. Please let me know if
I missed anything.

Does this proposal match the general thinking and goals for
dt-bindings for hwmon devices?

Thanks
Oskar.

[1] https://lore.kernel.org/linux-hwmon/20210924114636.GB2694238@roeck-us.net/
