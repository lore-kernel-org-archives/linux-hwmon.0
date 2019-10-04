Return-Path: <SRS0=Xc2u=X5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B8EC4360C
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 15:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8895D2133F
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 15:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tyZJhAyx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389224AbfJDPNT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Oct 2019 11:13:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33663 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389086AbfJDPNT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Oct 2019 11:13:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so4120551pfl.0
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Oct 2019 08:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vCova5NwMscozvUgpip4t3AhmCTzqGCS3is+QJZoL/Q=;
        b=tyZJhAyxLlVn4sZiSicoy++1tyrhxanMYgmlD3O7/ulNhAAYvttde1tBesXcImeXlJ
         oPYI1mWbs9JW5LQSf+ztIFtmKtUHepa1lCeoh/dzHxm4rMDHCne/lGBPckkZHpFYNGzx
         vU7V5eqwDNfCVi2AxxN7zU1UGNxrJEtB4g/H42zcVuGDztMWLbFX38ntq6vDR4GAlLPE
         HRewrSUMEdH3CPH6UMBeSXplTj/LMQWsM6El3jxwYashcjHjRGJdexyJVV0igTERfqEG
         Vz1EECUBSsV9aKzbJwwCTkr3gLEFvpNRaXSLomOPjFPPWtyKxtw0rseRbCc1w8tsvdtY
         oChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=vCova5NwMscozvUgpip4t3AhmCTzqGCS3is+QJZoL/Q=;
        b=iNTxRiHzCoVlVJMCSkTMfMwYhpZo11GoGWbFhAp4/lLKLn2AV5i/TZPpL2Uv2bMpNv
         PHQylE0cI//H7ArmYKFaUtABf//ys/f2LOV7U8puYiP7BsPg6WQBqvnSAnvm28Cl0hiV
         BzbjxCVrlmTCOudFRVO8B6h3NGj9KS/SRBOZi0rBmX0/New6bp+zkIffe2ADhpQfrLI4
         1e26HSznz6tqozS9ZdTEMYL5T8SzkzClqzwQoCFUKYx1Tojnxf1RFh2W1oB6h5rYAmde
         RdfF73/TpieDe5Kt/tjEibPFfVxAbTjzMiAUGQcqnyLcKRz9WqwOu9O7Iwt0uJrMIPD8
         wL6A==
X-Gm-Message-State: APjAAAUiXcH7lItCXY+tSKFWL9D4WQHjvjmEMJXpPovjh4qQSr4T2mEu
        pN80EcEwdtwLjEv2qDdlsFwnJYB1
X-Google-Smtp-Source: APXvYqx8wfdckU/KkEYMWIRegjL0hli0bxpDKerLnsR9FMg20+Lue0gEt3a0ANIwmbaWkBfK4b+a+A==
X-Received: by 2002:a17:90a:33a2:: with SMTP id n31mr18058924pjb.28.1570201998044;
        Fri, 04 Oct 2019 08:13:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b11sm6002584pgr.20.2019.10.04.08.13.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 08:13:17 -0700 (PDT)
Date:   Fri, 4 Oct 2019 08:13:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191004151316.GB28287@roeck-us.net>
References: <BL0PR01MB4835450548ED3DF4C893BDA2959F0@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB4835450548ED3DF4C893BDA2959F0@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 03, 2019 at 06:34:41PM +0000, Tremblay, Eric wrote:
> hwmon: Add DT bindings for TMP513 driver
> 
$subject is misleading.

> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/tmp513.txt      | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> new file mode 100644
> index 000000000000..341c764e9173
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> @@ -0,0 +1,33 @@
> +TMP513 system monitor sensor
> +-------------------------
> +
> +Require node properties:
> +- compatible: one of
> +		"ti,tmp512"
> +		"ti,tmp513"
> +- reg : the I2C address of the device. This is 0x5c, 0x5d, 0x5e, or 0x5f.
> +
> +Optional properties:
> +- shunt-resistor-uohm : The shunt resistor value in uOhm. If 0, the calibration process
> +		will be skiped and the current and power measurement engine will not work.
> +		Temperature and voltage measurement will continue to work. The shunt value also
> +		need to respect : rshunt <= pga-gain * 40 * 1000 * 1000. If not, it's not possible
> +		to compute a valid calibration value.

If this is not mandatory, I would suggest to declare a sensible default,
such as 1 mOhm / 1000 uOhm.

> +- bus-voltage-range: 32V or 16V, default to 32V.

Question for Rob: Does this need "-volt" as part of the name ?

> +- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Default to 8.

It might be useful to explain "pga".

> +- temp_2_nfactor: nFactor for remote channel 1. Value according to Table 11 in datasheet.
> +- temp_3_nfactor: nFactor for remote channel 2. Value according to Table 11 in datasheet.
> +- temp_4_nfactor: nFactor for remote channel 3. Value according to Table 11 in datasheet,

Maybe an array and temp-nfactor, with 0x0 meaning "use default" ?

> +		TMP513 only.
> +
> +Example:
> +	tmp513@5c {
> +		  compatible = "ti,tmp513";
> +		  reg = <0x5C>;
> +		  shunt-resistor-uohm = <330000>;
> +		  bus-voltage-range = <32>;
> +		  pga-gain = <8>;
> +		  temp_2_nfactor = <0x01>;
> +		  temp_3_nfactor = <0x02>;
> +		  temp_4_nfactor = <0x03>;
> +	};
> -- 
> 2.17.1
> 
