Return-Path: <SRS0=ZzD2=R7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B8AC43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 17:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9C7D20823
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553795180;
	bh=rzXuT1uAIN/hr+isQ5EiNUP7DbSWt1Ty7HFRXuEX9/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MgDb44spgZFnpv1iKvSi8KKI15IH/7ApHyBYNZEayQ+pxBckHvcoF+FSAHHCaoTR5
	 B+VB4J3LrS3AXUwnTgiALNJZGJfd4n4oK+e1ZZwpJ1V0M8IyyvnWZ27KmSiNwYGTA7
	 i6Cu87Xr0ZiqDYicjpWUJh1HDy2z/WEP5Xo27nRo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfC1RqS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Mar 2019 13:46:18 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44495 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbfC1RqR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Mar 2019 13:46:17 -0400
Received: by mail-ot1-f65.google.com with SMTP id d24so4630357otl.11;
        Thu, 28 Mar 2019 10:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y1KOTI5v37c2GUD741WUKs7vqEUZGTx89wekxMdDD8c=;
        b=ck8JAsLEcsv/ibj/7weqBeBRs8F+zAez2823ShQ2uja+/80EyxPFg8nUAusCZGteWW
         lck4xHbIFKzKoX46HbignuqUsGAElhk7P/5ptWfWbVm3KF9HJmI6gDs9YlMgVlPfNMBP
         jPB72fiiNfidzRtBp8O9G69JE0+byIAqGrvCNUSKgygfmvYawoq0rX7syigUxtKdOCof
         FipnZ4tcVAHePBB0G9sedPd13/TJnvO5My/cDgz16Hhw77PqQEoL7rYocBAXV7VXNO49
         2PWVnw+/Xeb08FM0z+7g22opSsERQaB+fk6gW1UJ23TwD0j5U4jl+Wsy4iXcRxTvpI7P
         QqXg==
X-Gm-Message-State: APjAAAU5jqFBE42C1Yp5IhXYDuaKlXu/8J+785HjaLpgD1fmYI7w0Z1m
        RCcc8r1wbM/gsF1WfpCz/A==
X-Google-Smtp-Source: APXvYqy6TNLEbp/cNbAtiypKO2hjImvI4aYSAiD8T3u3mqhIAmnAkO++uXc23jsgdT8AgcOQRPpDRQ==
X-Received: by 2002:a9d:6ad1:: with SMTP id m17mr30452628otq.108.1553795176356;
        Thu, 28 Mar 2019 10:46:16 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k25sm9836868otl.58.2019.03.28.10.46.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 10:46:15 -0700 (PDT)
Date:   Thu, 28 Mar 2019 12:46:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
Message-ID: <20190328174615.GA6068@bogus>
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 28, 2019 at 01:09:36PM +0000, Charles Keepax wrote:
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No changes since v3.
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/hwmon/cirrus,lochnagar.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
> new file mode 100644
> index 0000000000000..ffb79ccf51ee3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
> @@ -0,0 +1,26 @@
> +Cirrus Logic Lochnagar Audio Development Board
> +
> +Lochnagar is an evaluation and development board for Cirrus Logic
> +Smart CODEC and Amp devices. It allows the connection of most Cirrus
> +Logic devices on mini-cards, as well as allowing connection of
> +various application processor systems to provide a full evaluation
> +platform.  Audio system topology, clocking and power can all be
> +controlled through the Lochnagar, allowing the device under test
> +to be used in a variety of possible use cases.
> +
> +This binding document describes the binding for the hardware monitor
> +portion of the driver.
> +
> +This binding must be part of the Lochnagar MFD binding:
> +  [4] ../mfd/cirrus,lochnagar.txt
> +
> +Required properties:
> +
> +  - compatible : One of the following strings:
> +                 "cirrus,lochnagar2-hwmon"
> +
> +Example:
> +
> +lochnagar-hwmon {
> +	compatible = "cirrus,lochnagar2-hwmon";

You don't have any resources in DT, the parent MFD driver can just 
instantiate this child device.

Rob
