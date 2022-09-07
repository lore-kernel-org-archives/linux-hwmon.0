Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13608C54EE9
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Sep 2022 16:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIGQYk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Sep 2022 12:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiIGQYg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2022 12:24:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6A225FB
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Sep 2022 09:24:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ADAC2B81E13
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Sep 2022 16:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4E2C433D6
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Sep 2022 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662567872;
        bh=vTVr854EXqXkSJvlNt6mCZYemdk/OMs+8qHWQd8YaXE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Zj6ovJ5tU3836sNa+QH81StMjSkgtwKN/nkkXaXwFUwuKETtr04LT/IzHukXhxplO
         5ERWUB9F5pD+xwTRhF2KIaO93ka6/OKajzhQ5bzNa8yWf/Ky+Q6PcIC46QCzSHNDkA
         fgLsJW9n6V0/ReAA9HnfGeBTBUdOdUfq/U6oX9OZHcWs0Jn+P88D6oM+oH4TgparRq
         eBNPFy8STF8Z3VrZ94o05IYPaaHf39KUrcP9Wp/yt4Cxlxf1BGmCgRWFfAX7epIMO5
         9cojRABIFegUBEDuGmRpi3j9XrjshRkFX0Isk0+tGaBVKSBaoSfi0+T7ehsNh8XG2m
         zk+6i4pkBS19A==
Received: by mail-vs1-f50.google.com with SMTP id m65so5124629vsc.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Sep 2022 09:24:32 -0700 (PDT)
X-Gm-Message-State: ACgBeo1oyQ9z+tFbVCagKpbKKI4xHytZYtLg51dW5eds4AkiK9/dAJ0p
        5LaL5bXtc2w/7j07KzBiTOAb+l+/wumzrWZTcg==
X-Google-Smtp-Source: AA6agR5/3nRcy8b+Ti7a+5jHWh/7a6mbuElkdt0WOKh8FxuFLGmp3Mp4HjDVzOIxrehQ/bznpe7B2pi3MEWd+FLuEks=
X-Received: by 2002:a05:6102:3353:b0:38c:9170:a96b with SMTP id
 j19-20020a056102335300b0038c9170a96bmr1596815vse.26.1662567871171; Wed, 07
 Sep 2022 09:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220907101908.184819-1-Ibrahim.Tilki@analog.com> <20220907101908.184819-4-Ibrahim.Tilki@analog.com>
In-Reply-To: <20220907101908.184819-4-Ibrahim.Tilki@analog.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 7 Sep 2022 11:24:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5z_XO8D7m+AMPhKeWaKGVxfOdQmJy7AnTHz3HJqioMg@mail.gmail.com>
Message-ID: <CAL_Jsq+5z_XO8D7m+AMPhKeWaKGVxfOdQmJy7AnTHz3HJqioMg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] dt-bindings: hwmon: Add bindings for max31760
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 7, 2022 at 5:20 AM Ibrahim Tilki <Ibrahim.Tilki@analog.com> wrote:
>
> Adding bindings for Analog Devices MAX31760 Fan-Speed Controller
>
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> ---
>  .../bindings/hwmon/adi,max31760.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31760.yaml

Please use get_maintainers.pl and send patches to the correct lists so
that automated checks run and it's in my review queue. You have to
resend for all that to happen.

Rob
