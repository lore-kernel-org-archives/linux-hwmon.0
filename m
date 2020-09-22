Return-Path: <SRS0=kmu5=C7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF93C2D0E2
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Sep 2020 22:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 386DF206FB
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Sep 2020 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600813506;
	bh=kBUaNAJPSgSsnUAIYYlFcj+LjcsipeiATNKOajjg5n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rYf3AB0Gm+I3eSZVwOm9s4H407dvndz8ysaIBjvESe5IZ1kOxfwSQ2jJAijHIIDTW
	 ICZDjxcMMET0csv/rPGIJSV96luSXeRRy5tNA2u2HRT4HVe6n9rhbdYaxO+NQjcBIQ
	 EdWoyS3ANl4wCULqpwqTN/668t5ujm1EZVf1ZDa0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIVWZF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Sep 2020 18:25:05 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36423 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgIVWZF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Sep 2020 18:25:05 -0400
Received: by mail-il1-f193.google.com with SMTP id t12so18895958ilh.3;
        Tue, 22 Sep 2020 15:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bvurKRN2DDvC1Hgvp7WYCV624aS6APp8mw0PAo4N1WU=;
        b=awhXKVxfBIitxslqQ3igb8vO7AZvDUAZPqoR/KqAqdnRFDQZKbhq5V8iWwIt5IaES1
         zBaxrgwwEZb6pYuegZ709nD2XeD7U2ZXGlRUYUw5sh7U+sFgnBSjXI260c281RzfW4n1
         97zvWcjVRr+yyAK0HLEVsRR3twAkvYraZ8Jmv4GX1rm8LAFLd7pVL1vrn/wdsX06HM7B
         LNtl3LfK2Cl/5jn7Y1nSOfN5nX63T3I/ro+rPfhgFCZXVWqjy/V4OcFkBZ6d64kktB6Z
         Zk+I4M2u/VRoszHTla8W6oPvcHVtX5Ff2giGP1x7PlnMTKPx3txfchhJI7f8XnYLnvcc
         dSdQ==
X-Gm-Message-State: AOAM533aFopA3nY2z4MY/0ZZ/JT1zkLPt3WTi47uB/2k48TlpEIJzi+y
        IMt4mngS7QWwoEcT6ICERA==
X-Google-Smtp-Source: ABdhPJxlUuCCBpD4JyTf1PVMpkz3ym+qfciLsM01eFcizDC6XpyBWcz9NAtaqjTPvL/oBLNul/hfbA==
X-Received: by 2002:a05:6e02:e0a:: with SMTP id a10mr6491535ilk.113.1600813504600;
        Tue, 22 Sep 2020 15:25:04 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 64sm9991459ilv.0.2020.09.22.15.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:25:03 -0700 (PDT)
Received: (nullmailer pid 3368435 invoked by uid 1000);
        Tue, 22 Sep 2020 22:25:02 -0000
Date:   Tue, 22 Sep 2020 16:25:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Chu Lin <linchuyuan@google.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, qiongwang@google.com,
        zhongqil@google.com, jasonling@google.com, belgaied@google.com
Subject: Re: [PATCH] dt-bindings: hwmon: max20730: adding device tree doc for
 max20730
Message-ID: <20200922222502.GA3364463@bogus>
References: <20200910170638.1985729-1-linchuyuan@google.com>
 <6059ab76-02ff-0ab6-15bf-e34026a2f855@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6059ab76-02ff-0ab6-15bf-e34026a2f855@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 15, 2020 at 08:04:24PM -0700, Guenter Roeck wrote:
> On 9/10/20 10:06 AM, Chu Lin wrote:
> > Testing:
> > make dt_binding_check
> > 
> 
> This isn't really an appropriate patch description.

And will always pass with a .txt file...

> 
> > Signed-off-by: Chu Lin <linchuyuan@google.com>
> > ---
> >  .../devicetree/bindings/hwmon/max20730.txt    | 23 +++++++++++++++++++
> 
> AFAIK this needs to be written as .yaml file.

Yes.

> 
> Guenter
> 
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/max20730.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/max20730.txt b/Documentation/devicetree/bindings/hwmon/max20730.txt
> > new file mode 100644
> > index 000000000000..3afb42b04567
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/max20730.txt
> > @@ -0,0 +1,23 @@
> > +max20730 properties
> > +
> > +Required properties:
> > +- compatible: Must be one of the supported compatible strings:
> > +	"maxim,max20730" for max20730
> > +	"maxim,max20734" for max20734
> > +	"maxim,max20743" for max20743
> > +- reg: I2C address
> > +
> > +Optional properties:
> > +
> > +- vout-voltage-divider
> > +	Resistance of the vout voltage divider.
> > +	Two numbers, the first number is the output resistor,
> > +	the second number is the total resistance.

Is this a common property for this type of device? And what type of 
device is it because there's no description telling me?

> > +
> > +Example:
> > +
> > +max20730@10 {
> > +	compatible = "maxim,max20730";
> > +	reg = <0x10>;
> > +	vout-voltage-divider = <1000 2000>;
> > +};
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0a6ac3f00ed5..a04bf34a65b8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12371,6 +12371,7 @@ W:	http://www.roeck-us.net/linux/drivers/
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> > +F:	Documentation/devicetree/bindings/hwmon/max20730.txt
> >  F:	Documentation/devicetree/bindings/hwmon/max31785.txt
> >  F:	Documentation/devicetree/bindings/hwmon/ltc2978.txt
> >  F:	Documentation/hwmon/adm1275
> > 
> 
