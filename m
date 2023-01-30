Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16F0C54EED
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Jan 2023 15:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237993AbjA3PTc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238116AbjA3PT1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Jan 2023 10:19:27 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECB176AC
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 07:19:18 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id bs10so5891441vkb.3
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 07:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xlsuOCO1YI2MMlgCHeBWLiVMGsqzeJfOwez6+D5kqBc=;
        b=Rx5ZT27gjdzWRwbX0Tyc/+dk5vjX0+wrDP1QTezFRqJJliSPoDMBhicfLS5bNaQ2qK
         oAFH1dCV4eJSERNzDTgg015uP6W+Myq6XEpgVlgjYt91G5QsrCTqG67NFFHak1/Vq2i2
         rxPmR3u+KvTqx/Z2heyy+LjQjzJhCcgo9WgbNJWcgCvTfJl5eUaDIQKLoph1lS3PoQ6V
         EBr8Xne388w6RWcCwaEMLVtXJWsyarXvwhsHDcofkrUNNWG/R2yKqA1mOhKU9TdzR4Bc
         DSRbEESte6R1DvsTknnDSwoPwzu3XNPYg/71uHT/tLNNE4cur/vEdDSBDUxhbfoxGMjA
         Sjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlsuOCO1YI2MMlgCHeBWLiVMGsqzeJfOwez6+D5kqBc=;
        b=jHY/vGVT9KNS3w1HYkn0snciSh751u9XaqfC01Y7DIz5dWgPIdcvq3UrnLxDX/q260
         ei+Qo+W+vyAn4/T+N1CEEpBzHGNocjveOuBTOUpDCMT5U6X1o2icscXlJmW5ra3QB78L
         bgu8ub97tAc5/z6rWBsVVLfudjUN78Ei3CXKXwTb5HliK5T0MJExcCZRZII59mxS5UfS
         iEVebtGyyk9PoBT4daYi37hXZ4CpQ1uFOFOxrtiyg/NEUPdHfoX0UEdK8i/fiHgMdB/l
         uPTT8gczkbwlvks6BGUrU1H0Uv1/UqSDGTcwlghK6ht+mIjEWCiTUZRpC/sxk0PPVXyE
         a/7Q==
X-Gm-Message-State: AFqh2kqaBe+lj/rW54SewVldz5Feie46LRD08R9ExSYviV3UdJ5u57JH
        4n9S/a2KRUCmhVeP30onyKSva6JNbxdjQkNLszEOWA==
X-Google-Smtp-Source: AMrXdXvrpSfest9Nz2ELy3kyAiLAnfRzOnJ1Y3sWUJTC0FxkcDwpmweJu+nCWsskihnhNOiqk4hiEqyl+u72iE7URSg=
X-Received: by 2002:a1f:9b4d:0:b0:3e1:722f:9a6f with SMTP id
 d74-20020a1f9b4d000000b003e1722f9a6fmr6572750vke.1.1675091958079; Mon, 30 Jan
 2023 07:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20230126-b4-ltc2945_shunt_resistor-v4-0-bb913470d8da@criticallink.com>
 <20230126-b4-ltc2945_shunt_resistor-v4-1-bb913470d8da@criticallink.com> <20230129201604.GA1583293@roeck-us.net>
In-Reply-To: <20230129201604.GA1583293@roeck-us.net>
From:   Jon Cormier <jcormier@criticallink.com>
Date:   Mon, 30 Jan 2023 10:19:06 -0500
Message-ID: <CADL8D3ZkGT51FX5UrCQ8afzFxPNGHbi09EdXqE+cQyGRnHR2mw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: hwmon: adi,ltc2945: Add binding
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Jan 29, 2023 at 3:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Jan 26, 2023 at 05:32:23PM -0500, Jonathan Cormier wrote:
> > Create initial binding for the LTC2945 I2C power monitor.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
>
> Series applied,
Great
> after merging patch 4/5 and 5/5 of the series
> to avoid spurious 32-bit build failures,
Huh, I split these per request, curious why they'd cause build
failures when separated...
> and after fixing a continuation line alignment.
>
> In the future, please run checkpatch --strict on your patches,
Will do. I didn't know about this option.
> and please provide change logs.
This I did do in every cover letter.
>
> Thanks,
> Guenter

-- 
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
