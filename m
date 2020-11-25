Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5FDC83013
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Nov 2020 16:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B9FA21527
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Nov 2020 16:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="qHemW7gA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbgKYQpj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Nov 2020 11:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732124AbgKYQpj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Nov 2020 11:45:39 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCB8C0613D4
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2020 08:45:39 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id j15so3513875oih.4
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2020 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=//aeNIk4e2H5K/5bLZxrHq7kfsI+sxwIOG3dlkQOdLY=;
        b=qHemW7gAjn7Ma4W/tHso5itx2bGM3ICY71/izQ+JD5MxjtC7Q+zjvBynjEuCgNKvhv
         IL2t1DSwnBPHYg+HSzDLM2CtZn2H3J4fOaZHDh0sB0ErQtsA2oRWU4LW3gD+HFmR7KnB
         1AnItlrWfcWhQGcgOkZhv+a454Bdh1pMhr09w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=//aeNIk4e2H5K/5bLZxrHq7kfsI+sxwIOG3dlkQOdLY=;
        b=NXR3ffwI+F1nK7I5TvcLoRust4avtvCS54/K3lWXENdHgshPexGr4kidAnFML1purn
         ic+xzufts1ftrqBnStlK7DJHdfDx+73Qt1WoKlN7bP1O8KUTY/kMAcvXYEJ5UxojAIqS
         vB5c4bmQI3CdSLyFmgw062RG3s4VrxEgf6lchUBygW3gT4oB+3cKcoru/9devpdtjEZv
         sHvQhSAFFc9GCpYXuq+Wyz86ak4bUKjC7hMduoPav1gDFLcVnaWPw4DMfR9TxTMxLJEu
         T2pvgU0bkfJPeg/CPEvOM8hNhde4gqSTRXHl+0o5aivHgoqM3uH5s5P4XT2gok56LSRr
         bQoA==
X-Gm-Message-State: AOAM530mmWI4D0vmtqP6Qug+3YoT01fxHTDak0d+w9CYoj0cQXraJ4Kd
        qIT3EjXM8P3fZWDzXuJz602KoOcg478L2pv82qoaQw==
X-Google-Smtp-Source: ABdhPJzYOWObgQ+4fBeg2bGVJnX8RJycdhCLxyJ1uETC9h0SGng4Klu9S3sPvZgwQlGTaeyjNaFBbgtq/LMS2ayxq1Y=
X-Received: by 2002:aca:4d51:: with SMTP id a78mr2720393oib.27.1606322738128;
 Wed, 25 Nov 2020 08:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201113150853.155495-1-pbarker@konsulko.com>
In-Reply-To: <20201113150853.155495-1-pbarker@konsulko.com>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Wed, 25 Nov 2020 16:45:27 +0000
Message-ID: <CAM9ZRVvng=E_-ZPYSYwC0537+CxTv3=BsiWp0_eGprt8Jqgzkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pwm-fan: Support multiple tachometer inputs
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Dongjin Kim <tobetter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 13 Nov 2020 at 15:09, Paul Barker <pbarker@konsulko.com> wrote:
>
> These changes were made to support a custom board where one PWM output
> is routed to two fans, each of which has a tachometer signal routed to a
> GPIO input on the SoC.
>
> As the custom board doesn't currently support the latest mainline kernel
> I've tested these changes on a SanCloud BeagleBone Enhanced using an
> oscilloscope to check the PWM output and a signal generator to simulate
> the fan tachometer signals. I've tested variants of the device tree with
> 0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
> probe function is correct.
>
> The device tree bindings changes have been submitted in a separate
> series:
> https://lore.kernel.org/linux-devicetree/20200920180943.352526-1-pbarker@konsulko.com/
>
> These changes can also be pulled from:
>
>   https://gitlab.com/pbarker.dev/staging/linux.git
>   tag: for-hwmon/pwm-fan-tachometers-v2_2020-11-13
>
> Changes since v1:
>
>   * Split RPM calculation fix into a separate patch which has now been
>     accepted.
>
>   * Break the changes down into smaller patches so they're easier to
>     review.
>
>   * Rebased changes on hwmon-next.
>
> Paul Barker (4):
>   hwmon: pwm-fan: Refactor pwm_fan_probe
>   hwmon: pwm-fan: Dynamically setup attribute groups
>   hwmon: pwm-fan: Store tach data separately
>   hwmon: pwm-fan: Support multiple fan tachometers
>
>  drivers/hwmon/pwm-fan.c | 155 ++++++++++++++++++++++++----------------
>  1 file changed, 95 insertions(+), 60 deletions(-)
>
>
> base-commit: 414920a4a5d5613e4aa77c89944f9c1dc86b06c4
> --
> 2.29.2
>

Has anyone had a chance to look at this series? I see that the
corresponding dt-bindings change has been accepted into the hwmon-next
tree but I've not heard anything back on these patches.

I also see that a patch just got sent to this list which will conflict
with this series
(https://lore.kernel.org/linux-hwmon/20201125163242.GA1264232@paju/T/#u).
It'd be good to get feedback so that either myself, Dongjin Kim or
both of us can re-work our patches to be compatible.

Thanks,

-- 
Paul Barker
Konsulko Group
