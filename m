Return-Path: <SRS0=QYPh=YR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D73DC47E49
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Oct 2019 22:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE5ED2084C
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Oct 2019 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571957199;
	bh=x3hNnnGJpnisP3BwIy7EFZxeU6ayGCNRwRmqKAuzHwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kOIMssx6QKdney5uq/GEYWwRDQdz2OFllOOdzNbsiyMQbHaX48hZXy4qKqPNybKo2
	 CjSLnoE1a6ZAyQ0RjMcgtnYlwu1cJtR1pilVt/sPTwuGXcKgC6jkc22u5EsIkDIxhF
	 I3RyEDQrktKd3QZKKxUKBChaxMXUJZFSAKkcNUBQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732010AbfJXWqi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Oct 2019 18:46:38 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41572 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfJXWqi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Oct 2019 18:46:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id 94so455212oty.8;
        Thu, 24 Oct 2019 15:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=eqBWHMeb1uutEsfLf6F7++K0t8cTqP/wqa4Ge5W53RA=;
        b=NfhdUihU72pZQoCD6CZz4WukHuNn4MZmbCxZr65stzTm+hH3Y5H3NKqcz9oBJYCYiX
         5m3qJOJHlMJV2Dh+g609h8wL1H8VASmK/ktJJdXbxTLy+Dh1qBNZPXLurddCrLaWoBk0
         fpmhs8AgfLDKlsyfDWDRo93d5DayZLt/2VtvDqjzpjEWSljXdX//ekgD9TWAp3ov379s
         yPNLWCUk5DtNUBARUIs2z6Rb2x+j1YsnO9AfZHThZjortIQKywWawt0+J6Z6c8UeiWbd
         BZ6DigOFcinRQ3q4k/j6mQ2WTYP4QYFHgy115G6p8ni6B3AXVaIVtANQaIBMbdoMTnN0
         RXSA==
X-Gm-Message-State: APjAAAUU3OQueCDowAw4Y1HfWTdAIPJ48kz/vZmX2+LO60LJmo3R/W1/
        8WLMpXXESIzBx3VCEyro8g==
X-Google-Smtp-Source: APXvYqwclJJ8CjkX2MWKccpUrilAbIrx9hpqpqDYXvlNTA7PEuwxfh3LTcHesecXALFrHtZeCGyFlA==
X-Received: by 2002:a9d:7f02:: with SMTP id j2mr240954otq.296.1571957196977;
        Thu, 24 Oct 2019 15:46:36 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n127sm42602oia.0.2019.10.24.15.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 15:46:36 -0700 (PDT)
Date:   Thu, 24 Oct 2019 17:46:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add ltc2947 documentation
Message-ID: <20191024224635.GA6747@bogus>
References: <20191021154115.319073-1-nuno.sa@analog.com>
 <20191021154115.319073-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021154115.319073-2-nuno.sa@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 21 Oct 2019 17:41:15 +0200, =?UTF-8?q?Nuno=20S=C3=A1?= wrote:
> Document the LTC2947 device devicetree bindings.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
> Changes in v2:
>  * Add license identifier;
>  * Fix the uint32-array properties;
>  * Set maximum at the same indent as allOf in adi,accumulation-deadband-microamp;
>  * Set enum at the same indent as allOf in adi,gpio-out-pol;
>  * Use spi instead of spi0 on the example;
> 
> Changes in v3:
>  * Nothing changed.
> 
>  .../bindings/hwmon/adi,ltc2947.yaml           | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
