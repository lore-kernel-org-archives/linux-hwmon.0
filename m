Return-Path: <SRS0=VsDM=YH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04015C4CECE
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Oct 2019 18:14:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C31ED2067B
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Oct 2019 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571076853;
	bh=xxmGiqlWJUnvGAiEfFDM+nDaTJsPAgKxjsKbWoDVmAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u1YOaAMSjOjmUKH3wrvwGvUiWEA9PlCwKbBE9n/XL1stCYDso33ILvkE2pZQQjnUd
	 qkRGrHAjiE4YeUTe06r64AyP3qCUUXMsKsuxe2q6Yy6o1N/xCPCGoj44g2IgynOwiv
	 o7UVWM37sALMA2Bx5PxhR+1ue/RBqFkasKW+DxlI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733063AbfJNSON (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Oct 2019 14:14:13 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44731 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732330AbfJNSON (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Oct 2019 14:14:13 -0400
Received: by mail-ot1-f66.google.com with SMTP id 21so14575591otj.11;
        Mon, 14 Oct 2019 11:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=N/oP1f1HUsAcWz240lSJUR0uNH2aOpDS9BJ9NO93YYs=;
        b=WH4alCtbSXdwqupx3OAF3b7QHkEbCYgUpczj6CV6uukWlDlvO9kSvwAVRWGclGMiXU
         SIFTLVmDIN+nGfh79Kkv197TayLqtB7LCeF9t9TEvZ6NUd/3KOE4WOn5R9pCSM/AIHui
         GY3ICH0W3Sm5DADTcSjo3Wjcd8lRcIPL/JVGp84emblb4yngxXNLCNdOhLy49eyqkb7C
         3wmZ80du3KvX5SQ3EvLLq0EuO2dqNwkeUmZdDARgAaSnRmpXwdzHgeydRCCun4h1giUH
         WDFPG0igFGUE4g3kyIqxuRHb7zL5IMpFq6pcqjR+knVb8yWopZrn6IWT2+zKCQASQYGb
         K59Q==
X-Gm-Message-State: APjAAAU9lNb5C3ljokDSVwp7nQPqXKGU+gLiU2jIT7S2zFHSoyAfOsiI
        ccafE+OfUAfkbww6Rzm/vw==
X-Google-Smtp-Source: APXvYqzzl16ke1YkGnRrU5ok5zwZXAS87U+RbEYstUfUhMyQVoHEJPA74WCoLvI7GZ7F7ocOuynEpw==
X-Received: by 2002:a9d:7f8d:: with SMTP id t13mr26232221otp.369.1571076852390;
        Mon, 14 Oct 2019 11:14:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r26sm5304386oij.46.2019.10.14.11.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:14:11 -0700 (PDT)
Date:   Mon, 14 Oct 2019 13:14:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: Add ltc2947 documentation
Message-ID: <20191014181411.GA9019@bogus>
References: <20191011114853.159327-1-nuno.sa@analog.com>
 <20191011114853.159327-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191011114853.159327-2-nuno.sa@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 11 Oct 2019 13:48:53 +0200, =?UTF-8?q?Nuno=20S=C3=A1?= wrote:
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
>  .../bindings/hwmon/adi,ltc2947.yaml           | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
