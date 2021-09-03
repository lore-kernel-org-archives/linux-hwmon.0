Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56633C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 19:33:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AFDC60F9C
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 19:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbhICTed (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Sep 2021 15:34:33 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:44579 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhICTed (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Sep 2021 15:34:33 -0400
Received: by mail-ot1-f41.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so294890otg.11;
        Fri, 03 Sep 2021 12:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h93QnZOmlKU71R0mu5aX/T+cRYD/25MM5v7t+BpOEzM=;
        b=PHf2nbD9rkrhJ4sSTfjSFm3eB0mR+DSV1wYzJlQ1lBO9GjlnZw4bluwhvom4HF6gnh
         6VWHwGrPBnctBfUR+pUH3PV1juO5ci29YRGUsSprDj5DZs/8B1x5PIKNyehi1fH/889K
         HRkMn7iy/VhEadFJ17mLwI8LKhTrFv5PTu/co7IPSzQs+DQohtXj1mKOrbhvTdAvchwU
         W57jcb4lAk3dUFNlEcnX6dW6WKXoPOIkMMKgf6JvrFQOHVlPPukkoCmPdQ6sWDi51hoy
         G3xf5GdstdJrAjuFbz3HMAP9hC8vhIVL0MsiJJNLVFk6Dy9a2ZtrLY0tUiKOPbJqXlyI
         UnVw==
X-Gm-Message-State: AOAM533jQJtX2HZc5yvG47S8b2EfT8zrRrHRGRtPbk7jCDPt8iNRTYF/
        sE/UpyRQNATJPeXFXImrhQ==
X-Google-Smtp-Source: ABdhPJwdBBJtFlqocmoFYyVftAutdVo1ktVmpc64diZ/uohzI6VIU6Tv4BEXO9XGS39OaD6tecXd8g==
X-Received: by 2002:a9d:4689:: with SMTP id z9mr561722ote.101.1630697612913;
        Fri, 03 Sep 2021 12:33:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t21sm52316otl.67.2021.09.03.12.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:33:31 -0700 (PDT)
Received: (nullmailer pid 3323574 invoked by uid 1000);
        Fri, 03 Sep 2021 19:33:30 -0000
Date:   Fri, 3 Sep 2021 14:33:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-sunxi@googlegroups.com,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 23/52] dt-bindings: hwmon: Add IIO HWMON binding
Message-ID: <YTJ4inrxz9qE83fi@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-24-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-24-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 01 Sep 2021 11:18:23 +0200, Maxime Ripard wrote:
> Even though we had the iio-hwmon driver for some time and a number of
> boards using it already, we never had a binding for it. Let's add it
> based on what the driver expects and the boards are providing.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Reduced the maximum number of io-channels, and added a comment for
>     the limitation
> ---
>  .../devicetree/bindings/hwmon/iio-hwmon.yaml  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
