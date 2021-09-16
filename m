Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A48C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 177D2610D1
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhIPTVX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 15:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhIPTVW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 15:21:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B8BC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 12:20:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y28so22708693lfb.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 12:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PPtErykHffDTwWwkTPv05ujpl6rxPVv0ht1R2b6tSic=;
        b=e0PC1GpB7ZJFgXRVvu3ZJnMbNXGWfdET3mocGGzH+6WVb9vKeNS3d8lNhcLhQduljR
         sPJROxKxQMuFAvNIHrikUiUp1G/x3EUMYJ9v0pGCWsKvUIzdGx6EYh8WRyalywQM1Tip
         6zbp5PTUekyq//jYZBaTQ7SZJstfBpCAQUAj3qJ+q1ra1I1vo8nqItuNWXgdmjTYtSle
         dsC3MCx+Ls10DzQWh70iqoAiGEbWXv+thS6sbgRWV578KKD9whbEYpkf5OttIC89M1xL
         wSCHOkSJRjL8MOO9ID2uHW3LW9RXxbZ1p7mhBDiBNIzJYXRM1Ik+lLV+XOioIbyrrwK0
         iEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PPtErykHffDTwWwkTPv05ujpl6rxPVv0ht1R2b6tSic=;
        b=TrgJbpx5XoVf3GKgAAutZLKRY/NiHfVzmQAPfW57C6vtlfuXdajV427fppy5JGu6Y+
         jX03MRgTCvlhvkBB+jTCxiXnbNiKLk1MOssSvbA4edgOUf3tmmIh6HUJPShRxsa8CE4J
         y5cYUwYAyJaqpRB/4IxkwSANLb8jHOamGUyMaNapGC3t8BSg2ixdL6BPjPoDh+M5K3Y1
         xKv5D+kw+bEDzrh54jaGp1sLp8fcXd8lj7GwgpczgVRKG8KXs39n760Lxn3qgiLzmc+F
         61maI13SnTEs0WfLe/papRXhf0Wi55NpPXy5pUCLFqs9KUiZletE42DsVnxuKGFjU2Mu
         GmUw==
X-Gm-Message-State: AOAM530lHwY73v1/D5HxKHh9go1OcGDtXhb14Hk1GIqBHD0aeG0jNAS7
        cpAr9Hi907CxCP9rpwnd0eV2mIWrLMQ6FxwvEwDxTpQbsvHQGhYa
X-Google-Smtp-Source: ABdhPJyqXxi8sTfia4C+SnKlFeZM97GP6T8DvwfvgC4OqIQLWfI9nLD5oL0an/dH+HuZ4zfTVtjjBkgiqIZULSRCNoo=
X-Received: by 2002:a19:770d:: with SMTP id s13mr5391720lfc.243.1631819999752;
 Thu, 16 Sep 2021 12:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130337.2025426-1-osk@google.com> <71c17c47-ca9e-e9d2-7b89-cc25b512c06a@roeck-us.net>
 <CABoTLcRZ43EUVzbqWniu64PkB7Yx4RMYKjaBxaSihk+k0Ca-gA@mail.gmail.com>
 <722b27f6-4390-9b5b-f6f2-75ce9e967d12@roeck-us.net> <CABoTLcSdkmuBxd5Yh6z2Oqm1-_Vd4J5Ni1i1qq5s07mWu7Ndew@mail.gmail.com>
 <20210914150859.GB3457579@roeck-us.net> <CABoTLcQfS5-UL92NR9vbc2YrGJv3oQPYCqAm-diNoq-tkHP_hQ@mail.gmail.com>
 <c410eba9-f6cf-4dbf-797f-48afde9c1898@roeck-us.net>
In-Reply-To: <c410eba9-f6cf-4dbf-797f-48afde9c1898@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Thu, 16 Sep 2021 15:19:42 -0400
Message-ID: <CABoTLcQWXerMWPvWUqjykiNcx9oGoP8aEcuDwcQ36yu-CBc0pA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwmon: Add nct7802 bindings
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

    Hi Guenter

> > Would it be acceptable to simply number the sensors and document which
> > sensor has which number?
> >
> > Something like this:
> > 0 = LTD
> > 1 = RTD1
> > ...
> >
> That might be a possibility, though it would have to be well defined
> for each chip (nct7802 also has voltage sensors). We'll have to discuss
> this with Rob.
>
> Personally I think I would prefer using a type qualifier - that seems
> cleaner. But that is really a matter of opinion.

Another existing way I found is in ltc2978. Following that, we could
do it as follows:

i2c {
    #address-cells = <1>;
    #size-cells = <0>;

    nct7802@28 {
        compatible = "nuvoton,nct7802";
        reg = <0x28>;
        #address-cells = <1>;
        #size-cells = <0>;

        sensors {
            ltd {
                status = "okay";
                label = "my local temperature";
            };

            rtd1 {
                status = "okay";
                mode = <0x2>; /* 3904 transistor */
                label = "other temperature";
            };

            rtd3 {
                status = "okay";
                mode = <0x3>; /* thermal diode */
                label = "3rd temperature";
           };
        };
    };
};


> > The NCT7802Y can self-program from an EEPROM, so I assume we should
> > honor the "power-up configuration" obtained from there? I.e. if no
> > configuration is provided in the device tree, the driver should use
> > whatever configuration the chip has when the driver is loaded.
> >
> Definitely yes. My question was more what to do if the information
> in devicetree nodes is incomplete.
I think there are two cases:
1) If the new "sensor" tree is missing, the driver should behave as it
does today to not break existing users.
2) If the new "sensor" tree is present, then each of the sensors that
should be disabled needs to have "status = 'okay'" and have the mode
set (unless it's LTD). In the above example, rtd2 is missing and would
therefore be considered disabled.

Does that make sense? I still need to find out whether this is
actually valid DT and how to express that in the YAML, though ...

Thanks
Oskar.
