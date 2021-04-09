Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF1FC433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Apr 2021 18:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 061666113A
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Apr 2021 18:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhDISvp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Apr 2021 14:51:45 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:35813 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISvo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Apr 2021 14:51:44 -0400
Received: by mail-oi1-f179.google.com with SMTP id x2so6773268oiv.2;
        Fri, 09 Apr 2021 11:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f+4ndTt3wjCZTMJSYdB8/fpaf3M8KIUloh58S1QEzl0=;
        b=alhVGZsA0fDuQkQ4idbUHJdC1/abgXuqYSa6WnWn26EcYbbuOQy/cEhPYcEmGeHBFT
         Ome58b/CxSxqC7XyjSqGFwKqc9QK6E8vfxcFwuz3B/jM96iQt+JYu+uk3GeGR469jaGN
         7YX4jdCfrsTd/cuiEjLHKBvUT+lJS5fQ8Tf58rGw1PNRxSPfpU1ujE74Yca1TzqdtnAV
         dR7GpF7xhye88/L2EfpswBq+gpW0paOfpclgn2HUMOmx81kFVtbieZglKMZlTZdjy2bU
         ZIkYf1QGTemoLXL7tSE2SVwFVsUVCLxtiPmFjM5mB96VbcJbfrup0xSpoEu+4OiHkFXL
         0HqQ==
X-Gm-Message-State: AOAM531nm3g3k2Ptxx7lMqQKWHqGx7n90wWdR1dXRrhLjLNAogj5M0T3
        /PMmv2J4dOelupptAGoZjw==
X-Google-Smtp-Source: ABdhPJyVYh26v6Vbit3BbJbpf4cuRcJc3xfz5q2R2mExSNTaOyp7yodWVPSBSI9otINf8apUeQs0gw==
X-Received: by 2002:aca:4c0c:: with SMTP id z12mr11025330oia.109.1617994291424;
        Fri, 09 Apr 2021 11:51:31 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o64sm664409oif.50.2021.04.09.11.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:51:30 -0700 (PDT)
Received: (nullmailer pid 3950959 invoked by uid 1000);
        Fri, 09 Apr 2021 18:51:29 -0000
Date:   Fri, 9 Apr 2021 13:51:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        linux@roeck-us.net, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next 3/3] dt-bindings: Add MP2888 voltage regulator
 device
Message-ID: <20210409185129.GA3950913@robh.at.kernel.org>
References: <20210408141726.2561683-1-vadimp@nvidia.com>
 <20210408141726.2561683-4-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408141726.2561683-4-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 08 Apr 2021 17:17:26 +0300, Vadim Pasternak wrote:
> Monolithic Power Systems, Inc. (MPS) dual-loop, digital, multi-phase
> controller.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
