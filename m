Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C92C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 May 2022 01:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237456AbiEZBzv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 21:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236351AbiEZBzv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 21:55:51 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220F5B0D1F;
        Wed, 25 May 2022 18:55:50 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id k186so682621oia.2;
        Wed, 25 May 2022 18:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JwNSlS7auMvhdZbxyQweykvS8MDOIeXnOtAANqqR/WA=;
        b=MXrMALlQoOz3XSvimzo0c2UUpsyxRDKe5ch7vHAxAbuVk+HyB6gUgRA77UrRSDQgjH
         en6C5LNRiKDfYdjVrxkOZcGhIAjXUARDgheiFtz5oCZnO3Zu70CNsKgRaCrx5ne6YSv7
         w4VgFep5QRxQj4dwAgcioPlJivix6BZfMJxNrB5QuS5MJZpf7+id9LN9X748btG6b6rw
         Ba0HYj2JixXD8mqt5a+pDr5q0CEGBd3pwOmG0V1xvA8e/OGLLX142+UjKmxz3vI8UbwG
         UrZZvP2ig+UmK/BF0zDJ+7tVKRsE7ItilYvymof/mhEe6GgTsVmIZnbAeZxYLYao+OeB
         hAuA==
X-Gm-Message-State: AOAM532hSvz/MNt0CNfK/iKMMFCx4b9zbGJu9GlSdbDIOaMIhQt6NvUf
        ZKn6/jKbWXa1U5KqZL0GxQ==
X-Google-Smtp-Source: ABdhPJxv26vjcAUEWXR2FpLRNwmxJ25iCdLe859oBE6SIUSGOz6Soo76FmWtXiarauQJLr8Le7fmzQ==
X-Received: by 2002:a05:6808:e8d:b0:322:4fbe:8c5f with SMTP id k13-20020a0568080e8d00b003224fbe8c5fmr19869oil.284.1653530149501;
        Wed, 25 May 2022 18:55:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a10-20020a056808128a00b00325cda1ff8dsm231077oiw.12.2022.05.25.18.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:55:48 -0700 (PDT)
Received: (nullmailer pid 2893724 invoked by uid 1000);
        Thu, 26 May 2022 01:55:48 -0000
Date:   Wed, 25 May 2022 20:55:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     alexander.sverdlin@nokia.com, jdelvare@suse.com,
        linux@roeck-us.net, krzysztof.kozlowski+dt@linaro.org,
        slawomir.stepien@nokia.com, robh+dt@kernel.org,
        krzysztof.adamski@nokia.com, devicetree@vger.kernel.org,
        przemyslaw.cencner@nokia.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: hwmon: Allow specifying channels for
 lm90
Message-ID: <20220526015548.GA2893672-robh@kernel.org>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-3-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-3-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 25 May 2022 09:36:52 +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Add binding description for temperature channels. Currently, support for
> label and temperature-offset-millicelsius is implemented.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> ---
>  .../bindings/hwmon/national,lm90.yaml         | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
