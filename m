Return-Path: <SRS0=kUOG=TA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08C5C43219
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0636205C9
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rd7kUmKS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfD3Q5V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Apr 2019 12:57:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39595 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfD3Q5V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Apr 2019 12:57:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id z26so3471421pfg.6
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2019 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NLhzQHTXFe3oFzZhviDRPJ6SuHxRimUgpUmSG4YrfuU=;
        b=Rd7kUmKSgMbRd28BMdXQR1DDB0j6j2ZOCjpAv6xSRlUERTW3P0jx3JJaMgiK8D4EZu
         1IZqvuzzCFXTHXw6PD8vtfAh5J7FI+jR2BUgV7CrqzM0zQw0lsPkenij2aM8YRTW8Agu
         Lh6ogIRK53xNdfQ7mppFzIsfgf38MwTte7TFNPndYDuG9IEB1jNcCfvqARThw1f45j2z
         Ak+MZaaGvpkVHku6Cb4tGs5r8FY0+CUyltSFQV4/QOOskkUcCPSP8ysOnaj6sIWEEQ0T
         4yJN7AUE3Hk3Ur2O2np852UP8yIgPhCKyfxBPsvZjszVJeB816YcY/QPdunmOu79PtfC
         FJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NLhzQHTXFe3oFzZhviDRPJ6SuHxRimUgpUmSG4YrfuU=;
        b=YQBtgkBlhyQE0lQE45R/1qg1kpRP6g6ZGE++5D9RivcBoyMKxNJfnfh/49ZE6gZCOE
         v0qeDqSgepzLPcsNTax4c0872yCSFX05CWYgmJImcDme9a5cxnGGh6EahUoJ1/wWkJa1
         /xbIQHGBDATTxm21nG+GvIWXvZT9eh9uXbKOGfsHwItwdp5ZXOW7DAmNjO3e40agZQ9B
         j9CEQqy00Y8494+Ru1JgWDQVNUxPEMxaLnTSKPU0463vUbnxo74jVUccOj1gwjzc1gSe
         yL//HnLjTCbvo2XjnXlCwVcVFDqRWAwLrZ5goYXcrlXNg5e2jw85Lx79YieyuPoIrnHt
         zUeg==
X-Gm-Message-State: APjAAAV1YW1o3+rhgX6BOGP5gge2ob0nVyGrNdw2hU7Vaatwgag96qeV
        3b/tXh79n2cXm6BvAqmxlo+JklTS
X-Google-Smtp-Source: APXvYqycudQJ8a4BkSwzWJ60dZro/fjolAa/BMYIJT2FbnF5gBZ3kx2+vIh8lUxAzlAIrFK35poDMA==
X-Received: by 2002:a63:2a8f:: with SMTP id q137mr67974991pgq.31.1556643440579;
        Tue, 30 Apr 2019 09:57:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h127sm57691996pgc.31.2019.04.30.09.57.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 09:57:20 -0700 (PDT)
Date:   Tue, 30 Apr 2019 09:57:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iker Perez <iker.perez@codethink.co.uk>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add tmp75b to lm75.txt
Message-ID: <20190430165719.GC2699@roeck-us.net>
References: <20190430144609.19500-1-iker.perez@codethink.co.uk>
 <20190430144609.19500-3-iker.perez@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430144609.19500-3-iker.perez@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 30, 2019 at 03:46:09PM +0100, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
There should be some description / rationale for the patch here.

> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> ---
>  Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
> index 12d8cf7cf592..586b5ed70be7 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
> @@ -25,6 +25,7 @@ Required properties:
>  		"ti,tmp175",
>  		"ti,tmp275",
>  		"ti,tmp75",
> +		"ti,tmp75b",
>  		"ti,tmp75c",
>  
>  - reg: I2C bus address of the device
> -- 
> 2.11.0
> 
