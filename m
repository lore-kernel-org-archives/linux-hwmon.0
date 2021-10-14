Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBA7C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 16:31:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4580961027
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 16:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbhJNQdd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 12:33:33 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:34394 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhJNQda (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 12:33:30 -0400
Received: by mail-ot1-f44.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so9026748otb.1;
        Thu, 14 Oct 2021 09:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FX/cNoyXB/frcukZs6+xm1D5DNFakIV7iyO17ryIxJQ=;
        b=abFBaM3OdtJJMdkyGVjWKvlIYy4O7MgLTPSOquzRVgvbVhIqfD9OZ0RpFumAXnIQhr
         IC0OzEQv08aTv+g7Ag/bW538Jq/5ohDvQs464ftAWJg8PqWTjdpoGcXEXe4+2IIu7VfY
         PTzNrufG/BS3ZB9eNJ7NajDkdYaeqa/owzp75XPCR1DBxXXq54e/GZ47vsNwKNVhUc65
         qpRGacMAcEcv9+hd/Vwsy1hliREUCN3jNbNw2uWQMchpQadXj79EtkT2ABFiiM1B66h7
         FNn7677d7oRXvKZtpt0agBlsjmP6gN42gjm7/tP9bk4Q790TiOtJfkBQwgO9/CKc6PaH
         wfXg==
X-Gm-Message-State: AOAM533fYdMfk4y6shIMiKkDO6lo6r49Zs3W9ldehoQqyMHL73yP9h44
        za+V66DmCGqUS/lf39hkyQ==
X-Google-Smtp-Source: ABdhPJxU7+vFvdmiETZeTe6TqPFgZc9jWYF+5or2MBUXDUbnBu2yPmpzUOpM7B5+Rt4UdOhnCT97Bw==
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr3241922otf.103.1634229085554;
        Thu, 14 Oct 2021 09:31:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o14sm525392oos.11.2021.10.14.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:31:24 -0700 (PDT)
Received: (nullmailer pid 3491914 invoked by uid 1000);
        Thu, 14 Oct 2021 16:31:24 -0000
Date:   Thu, 14 Oct 2021 11:31:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <YWhbXIYgKdGZz5RB@robh.at.kernel.org>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <84ac871e30a406a1613d140a084b4f3390753099.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84ac871e30a406a1613d140a084b4f3390753099.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 14 Oct 2021 15:00:25 +0200, Krzysztof Adamski wrote:
> Add basic description of the tmp421 driver DT bindings.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
