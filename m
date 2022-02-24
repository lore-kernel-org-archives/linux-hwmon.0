Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6310C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Feb 2022 22:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbiBXWr2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Feb 2022 17:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbiBXWr1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Feb 2022 17:47:27 -0500
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4A31115D;
        Thu, 24 Feb 2022 14:46:55 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id x193so5555381oix.0;
        Thu, 24 Feb 2022 14:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=T8rxC4SYHootntoGkG1lgl7SL9cYYjf8RJoTjRMEDOI=;
        b=HfUFT8wUQ9+QBqCePpvEvGYUmUfF1ikxa1SBS9qxqoBxZzOLfWWKkMHOKZ3vFg/IjR
         LLdF3qYIWEwx4x0/t7QLx8iC1yUW4g2hL3zTBD/E+HzHjeYp/ijoZbm6g0jm6LtuDPtR
         gdZPA8TXzW1J/iemdqlF4C+MyI7vX/qc9jJOyz3u8adMJLPj2LC3PpRf/w+E3AaxVddF
         gxBexkUm7gAR0cyFF1F2s90IFEI2WXhuUouX7bzXGE+MrI3h9yo5P5eUW8DkCcZ8QHw4
         3gJEbf5ZFFghlrWJat/OD34UIr14h/HF4KmaAStG/36GSq+OJ2EHsVcllBqW7XxbAB1c
         2TPg==
X-Gm-Message-State: AOAM5321TNMiEAjq/bXs+UgODlBOC9XmrhmoVTeWEfMNSaGhe2wyvYd1
        AzScKO+H9NSFyPSMjvX8bXcy49lWHA==
X-Google-Smtp-Source: ABdhPJxNyNx9W4NeO27WuCMbSEimeKORw2pmahAu2YqpfRZNb1uTcdHLEdw16iIx9VR+kpyZjiuf8A==
X-Received: by 2002:a05:6808:bd0:b0:2d7:2a9f:368 with SMTP id o16-20020a0568080bd000b002d72a9f0368mr187554oik.304.1645742814813;
        Thu, 24 Feb 2022 14:46:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l19-20020a056830239300b005adc1d88a0fsm292749ots.79.2022.02.24.14.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 14:46:54 -0800 (PST)
Received: (nullmailer pid 3735288 invoked by uid 1000);
        Thu, 24 Feb 2022 22:46:53 -0000
Date:   Thu, 24 Feb 2022 16:46:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add ti,tmp125 temperature sensor
 binding
Message-ID: <YhgK3X79u8I2RbTS@robh.at.kernel.org>
References: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Feb 18, 2022 at 10:06:42AM +0100, Christian Lamparter wrote:
> From the freely available Texas Instruments' TMP125 datasheet:
> 
> "The TMP125 is an SPI-compatible temperature sensor available in the
> tiny SOT23-6 package. Requiring no external components, the TMP125
> is capable of measuring temperatures within 2 degree C of accuracy
> over a temperature range of −25 degree C to +85 degree C and
> 2.5 degree C of accuracy over −40 degree C to +125 degree C."
> 
> The TMP125 is very similar to the TMP121/TMP122 series of familiar
> chips.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
