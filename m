Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D71C5519F
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Nov 2020 15:29:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EB3A20773
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Nov 2020 15:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="H855ivrz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgKVP3f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Nov 2020 10:29:35 -0500
Received: from gproxy10-pub.mail.unifiedlayer.com ([69.89.20.226]:41252 "EHLO
        gproxy10-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727382AbgKVP3e (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Nov 2020 10:29:34 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id C3967140444
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2020 08:29:33 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id grIzkVLpYwNNlgrIzkilnE; Sun, 22 Nov 2020 08:29:33 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=BoezP7f5 c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=k-42gJp3AAAA:8
 a=VwQbUJbxAAAA:8 a=fptXGtOzaEJ37_pLjjsA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=uCSXFHLys93vLW5PjgO_:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4texVuXX85PEej5ZSyI6jvoQk4UjfdLrxiVgnyjHmI8=; b=H855ivrzSu1RmscJwWoZ02fDHx
        8lI/Ir5gjRraIGbWNzp3Hu6R1qC89NFqKD9SRbs32Tb54xPAewhTpG5Ni8EJFtx84guJNdJLL3G9L
        E5OgRLjLPg8nDJB/ZkoKCOluVuESUNJMj7gR5HxMJsABvniECquMHpNX24Tsepmt07+bdh9aegNj6
        58W/HYPXW7IY6vIxokMf0qCYzGLBolxWzJORYVAXFrwVNelZCSMLNtZwZUJWeGWQrgkDGJxtDYqAJ
        Sjr/tF0Lx6kHgOQJFsZis/2WgDK3TB0r6HJ/r79lk36s9ArAIoGnvaBt1CNb2QVqPkdt2oNUIDX/H
        K+O1MJ9w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45172 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kgrIy-003STE-Lh; Sun, 22 Nov 2020 15:29:32 +0000
Date:   Sun, 22 Nov 2020 07:29:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: pwm-fan: Support multiple fan
 tachometer inputs
Message-ID: <20201122152932.GA168733@roeck-us.net>
References: <20200920180943.352526-1-pbarker@konsulko.com>
 <20200920180943.352526-2-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920180943.352526-2-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kgrIy-003STE-Lh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:45172
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Sep 20, 2020 at 07:09:40PM +0100, Paul Barker wrote:
> Document and give an example of how to define multiple fan tachometer
> inputs for the pwm-fan driver.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/pwm-fan.txt     | 28 +++++++++++++------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> index 41b76762953a..4509e688623a 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> @@ -8,15 +8,16 @@ Required properties:
>  
>  Optional properties:
>  - fan-supply		: phandle to the regulator that provides power to the fan
> -- interrupts		: This contains a single interrupt specifier which
> -			  describes the tachometer output of the fan as an
> -			  interrupt source. The output signal must generate a
> -			  defined number of interrupts per fan revolution, which
> -			  require that it must be self resetting edge interrupts.
> -			  See interrupt-controller/interrupts.txt for the format.
> -- pulses-per-revolution : define the tachometer pulses per fan revolution as
> -			  an integer (default is 2 interrupts per revolution).
> -			  The value must be greater than zero.
> +- interrupts		: This contains an interrupt specifier for each fan
> +			  tachometer output connected to an interrupt source.
> +			  The output signal must generate a defined number of
> +			  interrupts per fan revolution, which require that
> +			  it must be self resetting edge interrupts. See
> +			  interrupt-controller/interrupts.txt for the format.
> +- pulses-per-revolution : define the number of pulses per fan revolution for
> +			  each tachometer input as an integer (default is 2
> +			  interrupts per revolution). The value must be
> +			  greater than zero.
>  
>  Example:
>  	fan0: pwm-fan {
> @@ -55,3 +56,12 @@ Example 2:
>  		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
>  		pulses-per-revolution = <2>;
>  	};
> +
> +Example 3:
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		pwms = <&pwm1 0 25000 0>;
> +		interrupts-extended = <&gpio1 1 IRQ_TYPE_EDGE_FALLING>,
> +			<&gpio2 5 IRQ_TYPE_EDGE_FALLING>;
> +		pulses-per-revolution = <2>, <1>;
> +	};
