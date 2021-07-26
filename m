Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831A1C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 22:43:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 663B860F6E
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 22:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbhGZWC4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jul 2021 18:02:56 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:38555 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhGZWCz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jul 2021 18:02:55 -0400
Received: by mail-il1-f175.google.com with SMTP id h18so10473775ilc.5;
        Mon, 26 Jul 2021 15:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i7W+OmniO0n+yFAm2mpkHoKuWj91dOMIPVrO2iqKr3s=;
        b=OW89SAgwGC2/y5lT+rA6jYcEW9ny1nEZHDV7dA5sQ+F/ygmAMzW1aYtbqO8f3on+Ei
         0wgEiGKbMfr5mDBXE+a9lZLEWVm8DCsKBDlc8e9Lzlk3vq5W6t9uyKyD4eDtv4UVvuS5
         wT105cSIHHauq7SyHGrO+LOKKD/E19+SfngTxEjx6tx4PWFJbJMVS6A8DpzGy74ONalN
         2xUHRTMalDqOJ0EQoNrpvjSYCxpy/QT3d5ggf0jXxXPnQ7ImBsbEqCG4Sx9xrniyUl9k
         GEe+r16ku5jaAOUOAOmrukgfYKmV2PhqdUgqu6SQWBMlm9u+CMk9tu4zdvjINV1nIEvn
         J+5A==
X-Gm-Message-State: AOAM533RRAx0MMANL7LFaY2OTo8UMI776fQ3qS7m2LLTDD2E6JeHG36k
        8+7H8v4P8RGfSVrMu+wQLQ==
X-Google-Smtp-Source: ABdhPJxLb0vkmfm3yZD46Ugp2iWjnCSCJbj5zOl/HDGf1iJ7if7H2PMNmik0W1L0sZmcYz7kOx9dqQ==
X-Received: by 2002:a05:6e02:13e2:: with SMTP id w2mr14703915ilj.308.1627339402660;
        Mon, 26 Jul 2021 15:43:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 125sm843773iow.9.2021.07.26.15.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:43:21 -0700 (PDT)
Received: (nullmailer pid 1010994 invoked by uid 1000);
        Mon, 26 Jul 2021 22:43:18 -0000
Date:   Mon, 26 Jul 2021 16:43:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     devicetree@vger.kernel.org, jdelvare@suse.com,
        Akshay Gupta <Akshay.Gupta@amd.com>, broonie@kernel.org,
        linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver
 bindings
Message-ID: <20210726224318.GA1009398@robh.at.kernel.org>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210726133615.9709-1-nchatrad@amd.com>
 <20210726133615.9709-3-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726133615.9709-3-nchatrad@amd.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 26 Jul 2021 19:06:15 +0530, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
> 
> - Document device tree bindings for AMD SB-RMI emulated service.
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v3:
> None
> 
>  .../devicetree/bindings/hwmon/amd,sbrmi.yaml  | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
