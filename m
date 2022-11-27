Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D36FC43217
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Nov 2022 17:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiK0RxP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Nov 2022 12:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiK0RxO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2022 12:53:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E917CD2
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 09:53:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E875B80B3C
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 17:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CDDC43470
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 17:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669571590;
        bh=k9itY0/RfZYnglpECnzcgbKWaM08ZpZSr20eIcSCy2I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SZ0yQG4wH1vNSlosySQdeKJTP0YfPed7u4+gKdyljvFwPCRrrbqZjhzIRnhZcinXy
         UcTpy1aXfV4hDzuo+4NLSZNzDse9K3cotMhNotPEXRZoVnyDpASilLw0sQSdM5lves
         qfTHMng0zFaqevilq21lqHpVbe/kVLytScNRgMWt1wAlvUqkdKdel1o6GvvCjwPJso
         NpRn+ZGoly+mYGrnvADunrajrIXsBvuLD0ODKQe9EijD5fZimq4bQByYLycgVVwdvB
         VOSTd3zuSdYi3f5bIoPRjPTzGpMQ/QqtNyBnHIfOJXr+zieuEnHDA3oHNdCPFSEJnF
         z6TkhxCWEQcPw==
Received: by mail-ua1-f45.google.com with SMTP id y15so3124058uan.6
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 09:53:10 -0800 (PST)
X-Gm-Message-State: ANoB5pnQqzKRCKhGgzAWeimEF5h8Rkko52lI9RFEqxUJj1pcorNZfiJ9
        uhBLO1aF3vI3o7B7rtZ67/xhTRRpaCkx0tUaWw==
X-Google-Smtp-Source: AA0mqf60WBEZo0YhfVdsddPuMpmlSJQ/DCSkiLVccmOkZSjggy6M6BjOoGgVKdvbxedmkyq+ftRnlZc0PHTxFTkIv8E=
X-Received: by 2002:ab0:1006:0:b0:419:70a:90cb with SMTP id
 f6-20020ab01006000000b00419070a90cbmr7253502uab.36.1669571589555; Sun, 27 Nov
 2022 09:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20221126171711.1078309-1-saravanan@linumiz.com>
In-Reply-To: <20221126171711.1078309-1-saravanan@linumiz.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Sun, 27 Nov 2022 11:53:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFHJ3rLbfiu6xv3XdYYBEPAqTXGXq_hRE2R6G8-ouxMQ@mail.gmail.com>
Message-ID: <CAL_JsqKFHJ3rLbfiu6xv3XdYYBEPAqTXGXq_hRE2R6G8-ouxMQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
To:     Saravanan Sekar <saravanan@linumiz.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        krzysztof.kozlowski+dt@linaro.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 26, 2022 at 11:17 AM Saravanan Sekar <saravanan@linumiz.com> wrote:
>
> Add bindings for mps,mpq7932 power-management IC
>
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  .../bindings/hwmon/pmbus/mps,mpq7932.yaml     | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml

Use get_maintainers.pl and send patches to the right lists. DT list is
missing so no checks run and it's not in the review queue (Patchwork).

Rob
