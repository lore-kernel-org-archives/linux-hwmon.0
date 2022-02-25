Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C167DC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Feb 2022 02:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbiBYCHV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Feb 2022 21:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236585AbiBYCHV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Feb 2022 21:07:21 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99CF52E47;
        Thu, 24 Feb 2022 18:06:48 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id l20-20020a0568302b1400b005af8c95bbe4so2676872otv.1;
        Thu, 24 Feb 2022 18:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=n/JmMQjBO3b9sSTBWZhnwPOQWlvCnu5dMsR0Ms7SruA=;
        b=CIJLBUrmORdybg64iY5/ywVRzqwvlLspEWxv51HFtLtZ2zhxrqrdcAOH0Kfa9hxQGE
         vYuRfrbXfu8Xwkzfar+oA2OLmNtSbjswVq5ih5B/AwQKp5WnTW9IDe2xsF20OiU/r/7P
         B2okO84KOLgZJTCqfsv+ZKsQ7HfPr8d01ZYdZAbB35ipX5j65Yi7/Ps791dZgj8PcVdM
         O1myst7qd3EZ7Bs7rE2vXH+t/Ui/lxXrXRAMmcJ30f8iA9PQto/N/Inp7fGGfWgVbVmK
         9lE0cvpKrhEjd4/ioPqg0gRPMPNLwiljHOoDFYovWsuXF2PDASSTD/sZVjYbFQQv+Yeu
         A17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=n/JmMQjBO3b9sSTBWZhnwPOQWlvCnu5dMsR0Ms7SruA=;
        b=lCtSwoM5v9wbiI0Jygko75ae/3NpLgGDbCmO2fF+tv0P0QjjDH9QOg5x004AlzLHR2
         GG1p9Gd+kZ/BaEiCZ7mR1v5LGmJUWoyoeJRVQYoxgv1iX2Yvx/3aNjtY1dU35NeAxv9r
         kvM2tZi/+XcX/+cAZKIC4p8p19xXaPtPHBry1g+a/OV3z5usf27U2yKfLMWkTsqyYDE8
         F5Agrk//ugqEE7z7ow9Z6H7GsPG5J8vctam24Of/fBW7OVUU4D3VUGZEBX0U0C3EjtTS
         WxlvND7m6e5VXfIfJHW4mCgOnE2ZY5KlD4yzh/PfABetp/H1yeMiM4Y8r0citOdKVLTN
         7/9Q==
X-Gm-Message-State: AOAM531VMAcS7s745BAHsQg4SgXBHSLCRmOaciyj4pFzc/LIhOQ8cg/L
        l5uGW7pA6JqmW6LPf2o13aQ=
X-Google-Smtp-Source: ABdhPJy5+T3R2dtcbHabWl/uC/bOGBJIsPDNcGXwt4zjfTRELPb+7rteirTw63K0EPsRLs+a0RLvHw==
X-Received: by 2002:a9d:634e:0:b0:5a3:ceb4:1b7b with SMTP id y14-20020a9d634e000000b005a3ceb41b7bmr1981962otk.266.1645754808186;
        Thu, 24 Feb 2022 18:06:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id hj9-20020a056870c90900b000d3d15ecd18sm674320oab.8.2022.02.24.18.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 18:06:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Feb 2022 18:06:46 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add ti,tmp125 temperature sensor
 binding
Message-ID: <20220225020646.GA1975734@roeck-us.net>
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
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter
