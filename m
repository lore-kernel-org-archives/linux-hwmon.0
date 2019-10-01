Return-Path: <SRS0=nYzv=X2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD9CECE587
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 18:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCF4E2133F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 18:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4M3Hgo+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfJASh0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Oct 2019 14:37:26 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44717 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfJASh0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Oct 2019 14:37:26 -0400
Received: by mail-pl1-f196.google.com with SMTP id q15so5904656pll.11
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Oct 2019 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uSIZ1kom+Q/dIgS/Iij5hOv8ry8T0hY4ubscNtjNHls=;
        b=V4M3Hgo+VecdgbG4LCnp7HaQ3+GJt7yqGL9RpCJ6j18YQ9wXZI2EqYis9xhSBlf9Il
         6+Dv2nBO8adUgWBBBu2DelEgGLH+GISNrMUjwqfu37x/Rx38dLGttSbUsHOwcHtYRNy/
         EwnifUekZxz6wHTlbSR3KC1jMZSewVBI3KWjRgqaIIc6vmiU+Jkp+1560H1rP0rpLGoa
         z5TDkNsdkx/W+k4Rhpi00ODcQPldf3aqsLssqmChj9O5NmwddPE1cDXyx9t6g8XfWdzQ
         F7KxCddFa9v9ze3U58U+H53/N/J69hJavpPYq0NMgWIHYz/5bs8myiufVfyOrjjreC5+
         Ubcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=uSIZ1kom+Q/dIgS/Iij5hOv8ry8T0hY4ubscNtjNHls=;
        b=b58f1QXOifq81MQsvU0ThwBvCp3IjwQCinu64q2tOM1EOjasX9H2aLZgWT+lDZWHcb
         nk4KvEBRDtUo1gp7ELvAkG9DOaSE1NXYehfXgSHXMa8d3hpb5x7T7Lf1e6qvsLHUNQ9/
         HazmUu+eq9GAJj7XI63g35aZ5WfdtOn51rHIX6eaBqfW/ViOW7mvxnVWfecRfLoZhzAy
         BCkkaBZKZg6jbFQVIM50Cq75IImKSEhYKlwUpunCTk5AV+srL4cOoqIQtG5pT/ECsNif
         Js606xDyGs32M19ixEp7NcM7fTj4aYDUfRuFNDamAcKJ3A/rMkqQyGlxrf1eN7+3JNhU
         SkOg==
X-Gm-Message-State: APjAAAU0MM6H7KkX5q6bDiSQw/883PTqNXVx3xeKokkDqV0NONn8sQkt
        1ZMgZCGsev+RpIHdrolSCd8=
X-Google-Smtp-Source: APXvYqyK1+sNNChPd1PaywxvGEJugwDL6M87Pul1fMZKH/eax1Tygvc6yGvRshPFkMBN1AbmUduFbg==
X-Received: by 2002:a17:902:74cb:: with SMTP id f11mr27949386plt.5.1569955045691;
        Tue, 01 Oct 2019 11:37:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 207sm28325189pfu.129.2019.10.01.11.37.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 11:37:25 -0700 (PDT)
Date:   Tue, 1 Oct 2019 11:37:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191001183724.GB23564@roeck-us.net>
References: <BL0PR01MB48359694ECBFB5D97A508C10959D0@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB48359694ECBFB5D97A508C10959D0@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 01, 2019 at 05:50:32PM +0000, Tremblay, Eric wrote:
> hwmon: Add DT bindings for TMP513 driver
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/tmp513.txt      | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> new file mode 100644
> index 000000000000..0f61793cbf2f
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
> +- shunt-resistor-uohm : The shunt resistor value in uOhm.
> +
> +Optional properties:
> +- bus-voltage-range: 32V or 16V, default to 32V.
> +- max-expected-current-ma: Maximum expected current value. Default to max possible value.
> +- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Default to 8.
> +- temp_2_nfactor: nFactor for remote channel 1. Value according to Table 11 in datasheet.
> +- temp_3_nfactor: nFactor for remote channel 2. Value according to Table 11 in datasheet.
> +- temp_4_nfactor: nFactor for remote channel 3. Value according to Table 11 in datasheet,
> +				  TMP513 only.
> +- temp_hysteresis: Hystereris for temperature limits.

There is a standard sysfs attribute for hysteresis values, and I assume this
is one parameter that users might want to change at runtime. Why not use it ?

> +
> +Example:
> +	tmp513@5c {
> +		  compatible = "ti,tmp513";
> +		  reg = <0x5C>;
> +		  shunt-resistor-uohm = <330>;
> +		  bus-voltage-range = <32>;
> +		  pga-gain = <8>;
> +		  max-expected-current-ma = <100>;
> +		  temp_2_nfactor = <0x01>;
> +		  temp_3_nfactor = <0x02>;
> +		  temp_4_nfactor = <0x03>;
> +		  temp_hysteresis = <5>;
> +	};
> -- 
> 2.17.1
> 
