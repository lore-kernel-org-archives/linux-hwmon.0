Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D69C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 15:37:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7031A60EE9
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 15:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347153AbhIXPix (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 11:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbhIXPiw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 11:38:52 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC9EC061571
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Sep 2021 08:37:19 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g41so41877138lfv.1
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Sep 2021 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIiXg3KWNaaiadXRiJALyTJvpk2NlOpsDMLooSBe0Uo=;
        b=SXmJjR1n5wGvVPsrifQ2Jio7TAw9SW+N1v34qSobYed1m5T7cHjTMDI+G7VW1c3sNP
         a4YdsMHoSpgoG1aXNjtzkA11KaW0L15W9Tykm7EhCZBKZUZMxI9m1/qV8aLIoaqWRu5H
         MDM4VibqWSmSuf0FWvQUOH4ttjLkBHJQsFWLLSxYQCwrHCoFeAVM7KGXrB+lc/n0gkdU
         1QxzXepRD/6foOX0P/ItJo882340UfIr0S89TDu47mVRGVaAfrcwjWmFucySgibFH4o1
         24NY+Qzv352XkbHqCmB+vTEX/EzJFY7XbqKfE2jJOpiu5CHXtXI6C2lSXHkl/1NefcvL
         l1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIiXg3KWNaaiadXRiJALyTJvpk2NlOpsDMLooSBe0Uo=;
        b=CGNk6DBdO5huExopFIlWH2bji7va2ZHKHyY9WxOkzwjGsJXd+5C/T9FZTkB/sLvHkX
         fy55GZWUkwwT02rllYyn2Mo9aZOdP+rkJZP1pigs0MsmVK7EJyaZrxadIQ5NkACV1q4o
         CV6f2LSx0hD9oFGUDrWhENtUHwOwh1AQ1V5HjbfAe0vYBf/iTOOGW5b108autnB/b4j4
         LaTjTqDRoLBu4gIlZacFfhtP+TtUMsFgY8EnJyL5DGOldXl/vVkfhwLP27DCAU1pqif3
         F58LMfNcCkNx9nVezovCX7/tWkF7yoBuh/SiPRP8w+H1rTROT/mGG/4xoHokvOtKbZdH
         OgzQ==
X-Gm-Message-State: AOAM532eNvouvYNbAAmRvLHyV77DcyJVcGw64ScIuw7DhwQLX9ZcRLQ5
        merxs+VH0NydfByZDMfofHdixM7NBMPluzS9PX6V9qLeSPuKW/UC
X-Google-Smtp-Source: ABdhPJxnIuFkBBR/oG3fA3A1Sqyr0X/E+ybkFh48ZTX9iQb69fKdVYVuH/Eh2PqTNZ+krPCdDyaRZmtnlGiHZ2nQaCE=
X-Received: by 2002:a05:651c:178e:: with SMTP id bn14mr12222808ljb.521.1632497836908;
 Fri, 24 Sep 2021 08:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org> <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
 <20210921205247.GA2363535@roeck-us.net> <CAL_Jsq+NXuF+F7OE3vyEbTUj6sxyMHVWHXbCuPPoFaKjpyZREQ@mail.gmail.com>
 <20210924002951.GA3027924@roeck-us.net> <YU2D7L7QMgCJZUeb@localhost.localdomain>
 <20210924114636.GB2694238@roeck-us.net>
In-Reply-To: <20210924114636.GB2694238@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Fri, 24 Sep 2021 11:37:00 -0400
Message-ID: <CABoTLcQYHZbsgzXN7XXKQdDn8S-YsuE+ks9WShAEKcBJojEfcQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for tmp421
To:     Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> > In many cases the channels are "shared" - we have 3 voltage, 3 current and 3
> > power sensors but in fact they are not separate sensors but 3 channels
> > each able to measure 3 different things and they may share some common
> > properties in each channel (so current, voltage and power may be
> > calculated bases on the same shunt resistor or correction factor). An
> > example being adi,ltc2992.  In those cases it doesn't make sense to have
> > two levels as how would you describe the shared parent? Call it generic
> > "channels"?

So in that case (e.g. for the nct7802, see [1]) do we want just
1-level, maybe like this:

nct7802@28 {
    compatible = "nuvoton,nct7802";
    reg = <0x28>;

    sensor@1 { /* RTD1 */
         reg = <0x1>;
         status = "okay";
         mode = "thermistor"; /* Any of "thermistor", "thermal-diode",
"voltage" */
    };

    sensor@2 { /* RTD2 */
         reg = <0x2>;
         status = "okay";
         mode = "thermal-diode"; /* Any of "thermistor",
"thermal-diode", "voltage" */
    };

    sensor@3 { /* RTD3 */
         reg = <0x3>;
         status = "okay";
         mode = "voltage"; /* Any of "thermistor", "voltage" */
    };

    sensor@4 { /* LTD */
        reg = <0x4>; /* using the same number as in sysfs */
        status = "okay";
        /* No mode configuration for LTD */
    };
};

In this example, RTD1, RTD2 and LTD would be temperature sensors and
RTD3 would be a voltage sensor.

Would that make more sense? Is the use of strings acceptable?

Thanks
Oskar.

[1] https://lore.kernel.org/all/20210921004627.2786132-1-osk@google.com/
