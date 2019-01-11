Return-Path: <SRS0=3IXP=PT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01F9C43387
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Jan 2019 19:36:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9CBD218D4
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Jan 2019 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547235374;
	bh=BwPyxOCyT1s4mG3ndn5xZFm4s+B8b+xv7xME+A1Lv8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=p8Rc1kGFayKkR17Wm+YaPDnffw0X9YBlIYfXVS/DSIMh9eaYhz7LjW7L4cylrOULv
	 6qUrC26e2Q9QOtb3R9zEuZ3f3W4Sbleflh5TYDIw9Qn3qdJ/7m+Utz7mPtyOq35taK
	 8Rl+Mpm75SffAsuPRq/KNvZTVnecTCW65mXDbEd8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733120AbfAKTgO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Jan 2019 14:36:14 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38325 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730371AbfAKTgO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Jan 2019 14:36:14 -0500
Received: by mail-oi1-f196.google.com with SMTP id a77so13128437oii.5;
        Fri, 11 Jan 2019 11:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sgjNyKwvBmSnWBhf3mpBEBkik4wi2D1IvV80VMbnk1k=;
        b=rBDMmHmDTDydcFjzVl7486lrbTq9shammMQyq3NFsMj4aHWG9+feDx6C/yoZZ3BDDO
         fFhKiL8UHK2CNf4ukIzrsJPlUELL63hKjPfWP1e/CXSeLt131p9f1E3+zdWyts3M/wKj
         WdLr3tg04beGklkrbnHEF8VAMT7F4iGVIrfZArBN5aOG82/auhUXa5LyBH5//rK00W7N
         1KN7ij5nXyOYvtQDOFgtnIe7yIR51sMrCDrlAufHTGRiKRfp5t0it++jMXpHJRvVKoOK
         aiXEf9Q/ryRclf4mJeZGZMSY6W5fUjjN0T2Hz4Kg1mZGRh55JqPS1ifExEz29t0aTWs0
         VgNQ==
X-Gm-Message-State: AJcUukciOsttQGVJl6BClgOqvnhRB41RS1hkqhnJNYKNy4l169sv7hGH
        aA+c7rFW9a+YyIhOWes9f677Ax57FQ==
X-Google-Smtp-Source: ALg8bN77UNQHQgYo9erfr4B1RjiTjlhzXE4nfvFopthH7ogTJLa2XCXKf42F/bP31sMH/clXDVpIJw==
X-Received: by 2002:a54:450f:: with SMTP id l15mr10417134oil.351.1547235373216;
        Fri, 11 Jan 2019 11:36:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v3sm71297991oib.57.2019.01.11.11.36.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 11:36:12 -0800 (PST)
Date:   Fri, 11 Jan 2019 13:36:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com,
        openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com,
        dongsheng.wang@hxt-semitech.com
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Message-ID: <20190111193612.GA23166@bogus>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
> Bindings for DPS650AB power, voltage, temperature, and fan monitering.

s/monitering/monitoring/

> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..bbd601100e66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
> +
> +Required properties:
> +- compatible : "dps650ab"

Needs a vendor prefix.

> +- reg        : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +       dps650ab@58 {
> +                   compatible = "dps650ab";
> +                   reg = <0x58>;
> +       };
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.

We can't accept emails with these clauses.

Rob
