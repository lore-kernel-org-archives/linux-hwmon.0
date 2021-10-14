Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F689C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 16:31:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E87E261027
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 16:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhJNQdT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 12:33:19 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:36551 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhJNQdS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 12:33:18 -0400
Received: by mail-oi1-f179.google.com with SMTP id u69so9212065oie.3;
        Thu, 14 Oct 2021 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ET+eBAEzswnPZ9lAOusbvcnm44VnpSd48WBrygvyVK4=;
        b=Ky4amqUwFu/Nokx45uuuGWpZdL7KwYr3sDLX0Q1DcJYC2sWjimz7nsyFVYrBxRkRDe
         5gGwYROb2bv/NJIT5GZbliATFr1qmLnoeR/tiqd1qa1aLyFeB1LL0gcrHKH1azVergUa
         DsZG5D3RsrRmpJRD5L3eC658aEnv9sDb5lrfdWDFLrH5HW8cAwVOA+sUD4bgLtfT69Go
         sLp8ZXCWESsEVp/PAo05JaxL1hpafxaqWpszh8SuzzFCXw3gwVblrVPaYg3E/4yFbW+j
         pVCJ+2Ye4SDNyHKkVq4+nODl4KAMPllmXVN2TOEg/8tuoKD65UZtiSwOWABxGkZCdNqP
         0r7A==
X-Gm-Message-State: AOAM533mXLtnyxLNBW6TTQTeaO/KfLenx2JrCF/BMKZ2WlZXncDQIxC4
        rQ9z7pAtARLYACM95Duiig==
X-Google-Smtp-Source: ABdhPJzDHB2Q6XBKVsGmr4k1/ZyOCtRwHuzLmcZKVeIiEaAYwNO8veeKqvwgdUQ5AqFXMYSSHb04vQ==
X-Received: by 2002:aca:ac0b:: with SMTP id v11mr13670449oie.155.1634229073225;
        Thu, 14 Oct 2021 09:31:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f14sm533883oop.8.2021.10.14.09.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:31:12 -0700 (PDT)
Received: (nullmailer pid 3491534 invoked by uid 1000);
        Thu, 14 Oct 2021 16:31:11 -0000
Date:   Thu, 14 Oct 2021 11:31:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 9/9] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <YWhbT6mU9e9Zs+u1@robh.at.kernel.org>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <d1721a50efc0f88728614b5b07c0d9332ae4971c.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1721a50efc0f88728614b5b07c0d9332ae4971c.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:11:49PM +0200, Krzysztof Adamski wrote:
> Add binding description for the per temperature channel configuration
> like labels and n-factor.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
