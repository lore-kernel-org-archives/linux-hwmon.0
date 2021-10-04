Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0AEC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Oct 2021 16:46:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F6B0610FB
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Oct 2021 16:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbhJDQsX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Oct 2021 12:48:23 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:40454 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbhJDQsW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Oct 2021 12:48:22 -0400
Received: by mail-oi1-f177.google.com with SMTP id t189so22414524oie.7;
        Mon, 04 Oct 2021 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1DobaCt0bMPr+ViGu/ixOHkx151Bqy4Zn2YhcuLalkU=;
        b=4Aio+CTeEPeh879l30UWWOF1GIwCAm8ftbZJZtyr6HFUkiXRBUv9uCJ0SJNpd2dSe4
         6eqivBrOnsNLibj5C3FZUcGGhpVZpNoo3vpLK6to1YXM9UEWhjPnHA57WPeAzN2yOOlf
         XeBrFrNSIxXLiMKfBsypM4vjzKA8DVSqsbqZE3WGRoBj9sxMri2p75tEa1M45ix00nTR
         YwzQoPzkWV+j7e5mhI/ZvxHiekTTOxBPXjazoGOdplTlQW5NMIUkycGIJtCduxmxRvMc
         ini8buFD+gmFSDo27TyI0qM4F8J1U7DFLn4AhuLDg99v8wssSk4qnWmM+9CkXHusj93g
         S2kQ==
X-Gm-Message-State: AOAM533MHaDOhRAFVlzLy1MN+TDR/vV7o1ttvOZGd7dHCXdGwi+FYsKW
        qHN+KDg5T9FTzFgELLjvS4YSGAU7yw==
X-Google-Smtp-Source: ABdhPJzboyOwsAAWmyZgtQg1FwG3zlra7xAmdy/uyyvdFlxRAfqdEIlDsE05UklF6t+uMe8bqxJZzg==
X-Received: by 2002:a05:6808:1141:: with SMTP id u1mr14330548oiu.123.1633365993123;
        Mon, 04 Oct 2021 09:46:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j10sm2889998oog.39.2021.10.04.09.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 09:46:32 -0700 (PDT)
Received: (nullmailer pid 1451769 invoked by uid 1000);
        Mon, 04 Oct 2021 16:46:31 -0000
Date:   Mon, 4 Oct 2021 11:46:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <YVsv57G5gke7m0OA@robh.at.kernel.org>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <4ec773876f9e73c05c1328eb60a95b1197f26909.1632984254.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ec773876f9e73c05c1328eb60a95b1197f26909.1632984254.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 30 Sep 2021 08:57:52 +0200, Krzysztof Adamski wrote:
> Add basic description of the tmp421 driver DT bindings.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
