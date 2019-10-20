Return-Path: <SRS0=JtC8=YN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E5CA9EA0
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 484F521929
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD34q47s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfJTQHf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Oct 2019 12:07:35 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44810 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfJTQHe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Oct 2019 12:07:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so6751806pfn.11
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Oct 2019 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+Alvow6ykUJOlscK1IQqfXd9eJu9eGunl/5f1Ldkvvo=;
        b=OD34q47sJM2P4DnM9t6QNJhQltrXnZUIjLgE76ZrvHFQVeaueqH7HtS4kFKQ7wRX/6
         l5ZL1oZm6ggOeOBtxh9f4gZDmU74cYQ4RchCQfEZ3JzRNAZ7nqI5w8m8RJ9JlCwdBg8b
         hA63qraDmML7JnxpoHn/OuvX7zIGJsSNa8JzmgWpz89/1kfxKXykDanyPN1GzqXXSgCb
         k0WxYzCawBrwUdVa+n42fG2ivD22yQLGK2o2qP3jTO1KGshaddqv7mP2ulzboVdqCzVD
         h+3o4Z8MmrLRptjUN8E1/1GQdUf63psOj1dqa7fh8S5ndO+LmJDWmIWNt0sPN15KtxDt
         ezwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+Alvow6ykUJOlscK1IQqfXd9eJu9eGunl/5f1Ldkvvo=;
        b=UdDvRHiSRde0W+bxZzb/690wVDMH8FoBnuhZ30cHIa7bPuMfweC4jqEEijRUxTLygv
         i/9L14Dser6Et1T2prkjdATDT04h3hYVaOADjXxDU0o6O8d+zbAK9NifJfkLDwJNgNix
         54V1L7U49QH2yvgKbctfBsnpRiRpxJXTbwtEZvNmHVv/LLi3VEPwPTk1Dtr8HAJd82h1
         QY64o01BXG+/w1rnTgTbDB61hmqNirc89W2I5R5a+CTUURR4DS8/TGBNSpsAJKSHuJOJ
         UNXHIREI060rJPBTLHqoIDiYKYjChwinJDWnvQY0rnU0cOtnRTeI0mCLZLEKDo82G4wH
         apQA==
X-Gm-Message-State: APjAAAXdJlpoqjjyjdAoWwwcYrqf+Ww7xNN2xRzvuzZNWSME16541kZI
        aZ9eovQLszpUf5xsRbKPiPF/cBzG
X-Google-Smtp-Source: APXvYqyTrK7u3UyH5NDWVxU7lZ26EVN+jeHc/HPWIke/e3MMGQS5mvYAXqZJaGMzfqTPsvs6r8OLHg==
X-Received: by 2002:aa7:821a:: with SMTP id k26mr18397752pfi.184.1571587654095;
        Sun, 20 Oct 2019 09:07:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 13sm13264837pgm.76.2019.10.20.09.07.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 09:07:32 -0700 (PDT)
Date:   Sun, 20 Oct 2019 09:07:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191020160730.GA27123@roeck-us.net>
References: <BL0PR01MB4835F4346C7895E1DD579079959B0@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB4835F4346C7895E1DD579079959B0@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 07, 2019 at 08:47:03PM +0000, Tremblay, Eric wrote:
> dt-bindings: Add TMP512/513 documentation
> 
> Add documentation for TMP512/513 sensor chips
> 
Since this is the devicetree documentation, it will need to be approved by
a devicetree maintainer. Wondering why that didn't happen, I just realized
what you did not copy the devicetree mailing list. Please do that when you
resend.

Note that they may require devicetree documentation in yaml format nowadays.

Guenter

> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/tmp513.txt      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> new file mode 100644
> index 000000000000..dbfade74f6b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> @@ -0,0 +1,32 @@
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
> +		to compute a valid calibration value. Default to 1000 uOhm.
> +- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Default to 8.
> +		The PGA gain affect the shunt voltage range.
> +		The range will be equal to: pga-gain * 40mV.
> +- bus-voltage-range: 32V or 16V, default to 32V.
> +- nfactor: u8 array of three(TMP513) or two(TMP512) n-Factor value for each remote
> +		temperature channel. Default to 0.
> +		See datasheet Table 11 for n-Factor range list and value interpretation.
> +
> +Example:
> +	tmp513@5c {
> +		  compatible = "ti,tmp513";
> +		  reg = <0x5C>;
> +		  shunt-resistor-uohm = <330000>;
> +		  bus-voltage-range = <32>;
> +		  pga-gain = <8>;
> +		  nfactor = [01 F3 00];
> +	};
