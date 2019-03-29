Return-Path: <SRS0=13Sa=SA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FD8C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 16:53:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94E6C218D0
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 16:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEMtky0D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbfC2QxL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Mar 2019 12:53:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38832 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbfC2QxL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Mar 2019 12:53:11 -0400
Received: by mail-pf1-f195.google.com with SMTP id 10so1332184pfo.5;
        Fri, 29 Mar 2019 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cSv7rafI70a3Ao5nfJVeAC5IAb01NH10+kXLwTj3uyw=;
        b=mEMtky0DiymyIiDjn1VjjwFsMEpolS0mbvpRBejF8Qg1k2GdwmNDuSpB+guECc59Zl
         j52wJEw1z3mauWLdvHcTL5vO3PnyN7dm1t1i+Q70ZdsWD1emj1Vf1VfbpvFJ1yDwXfol
         6JDRXnGN2OFwbhsIyGtCoo/THw1vU1/UfYNoCtaCLhi1x7i9yIjUxEa/YJ0x587Eqt2/
         PSRE2FKDzueoCjHTCT1ltcjkwOjcxi9jB4Tmd512MbEtROMTHe44m0nl4szcsvxuzrj0
         ALfJrGL3Xs6FQLw0uRlH26oXlRBBTwjnuXBp6nWg57iWsSwGiRcUiu4+1YEUj/hMESrN
         EOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cSv7rafI70a3Ao5nfJVeAC5IAb01NH10+kXLwTj3uyw=;
        b=b53MF40xcIaBFUeIln7/JD0FqR3StZydhGCfWF2vb5cY08MBeFKriKqelCQBErvTNB
         J98RaO7zZ9CGpsphS+EtYNLbyWgKrkv7JjBxkOsMGNzYQ5cDy867CM5HrsBzSYbTMp9G
         JqK2+mDzE3pkYS17IOD2g2yXDD/l7AINtx5W8JgzYMWQZ+Lsn5WCGPSBXdrXUaqI+anm
         YCrbqvzlOyt5h+QLotxDOikLa2fx7Krrbu2iZwDHZmDOQmWF3R0yVbSwZmvOwN5dtyUB
         qZcieM+gWbQVT6xVmwhJUVNye9fCHNEgW1wZFU7NBS5i7IipMhNThPTUDAJT4jLiFQ/U
         DJVQ==
X-Gm-Message-State: APjAAAW/ey+KUDfUX29w2pNmhG5sNycreEc01seezfZ2b6EtpAvSDNNL
        kCuOGV0tUIVdHm2yEQGXAqY=
X-Google-Smtp-Source: APXvYqxI7vidalccq5zmrDZi9wN8Q1QsSKVMaIR0arHPcWHzGPeSnF4tKt/x7RKDarg3EcXCO+K/5w==
X-Received: by 2002:a63:5b64:: with SMTP id l36mr47721088pgm.182.1553878389760;
        Fri, 29 Mar 2019 09:53:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n9sm3427645pff.43.2019.03.29.09.53.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 09:53:08 -0700 (PDT)
Date:   Fri, 29 Mar 2019 09:53:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
Message-ID: <20190329165307.GA6085@roeck-us.net>
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

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
> +};
