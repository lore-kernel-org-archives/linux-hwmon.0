Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF0DC5519F
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Nov 2020 18:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5DAC2076C
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Nov 2020 18:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="NHArIPCy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgKVSrn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Nov 2020 13:47:43 -0500
Received: from gproxy7-pub.mail.unifiedlayer.com ([70.40.196.235]:34726 "EHLO
        gproxy7-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727888AbgKVSrm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Nov 2020 13:47:42 -0500
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
        by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id C2971215C12
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2020 11:47:41 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id guOjkYARgeMJHguOjkgCTm; Sun, 22 Nov 2020 11:47:41 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=T72iscCQ c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=jtbBNqsHAAAA:8 a=DPgDxNo4V5PxLIsSBKsA:9
 a=CjuIK1q_8ugA:10:nop_charset_2 a=nlm17XC03S6CtCLSeiRr:22
 a=RWaeYqt-Cn-VcsFsiLGo:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KuU95b05VNKUjdDIi+AV2fuN9ZDA+T6+yXdu2cyNEEM=; b=NHArIPCy8HHpHn4MsiwYIm8xhv
        2KPYCx0V/BqvTChSpN9NdkceM4STLNrfqtebk2rOuDlA9P/Mgv2A56DPSkJuPUUm3iBmTxUD4XsHy
        cx6MB5lHOirrQ/tbrWw5ATEPIa0zbn1ietFy0TPjrU25dVpB+nXZ9rQLmrUNspT2YprrwEIcK7ufP
        JKO3xhq3G1pyMlqfjCC7fy2pOvahEPp2/JQvwPidmdehFziNxnnM3r/jpj+i9DpEuU30I/4DoDyVX
        k2mi2r3zyYcOk7yM0I0HElsbQzaT82SFmczRH8UyrE5mkG3lyXxI32Ua/mS+vU1S0IsKZxD7koc1H
        R+A7Jl9w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45998 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kguOi-000GL8-Lv; Sun, 22 Nov 2020 18:47:40 +0000
Date:   Sun, 22 Nov 2020 10:47:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     rentao.bupt@gmail.com
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        taoren@fb.com, mikechoi@fb.com
Subject: Re: [PATCH v3 2/2] docs: hwmon: Document max127 driver
Message-ID: <20201122184740.GA69899@roeck-us.net>
References: <20201119175324.22472-1-rentao.bupt@gmail.com>
 <20201119175324.22472-3-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119175324.22472-3-rentao.bupt@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kguOi-000GL8-Lv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:45998
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 22
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 19, 2020 at 09:53:24AM -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add documentation for the max127 hardware monitoring driver.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  Changes in v3:
>    - no code change. xdp maintainers were removed from to/cc list.
>  Changes in v2:
>    - add more description for min/max sysfs nodes.
>    - convert values from volt to millivolt in the document.
> 
>  Documentation/hwmon/index.rst  |  1 +
>  Documentation/hwmon/max127.rst | 45 ++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/hwmon/max127.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 408760d13813..0a07b6000c20 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -111,6 +111,7 @@ Hardware Monitoring Kernel Drivers
>     ltc4245
>     ltc4260
>     ltc4261
> +   max127
>     max16064
>     max16065
>     max1619
> diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
> new file mode 100644
> index 000000000000..dc192dd9c37c
> --- /dev/null
> +++ b/Documentation/hwmon/max127.rst
> @@ -0,0 +1,45 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver max127
> +====================
> +
> +Author:
> +
> +  * Tao Ren <rentao.bupt@gmail.com>
> +
> +Supported chips:
> +
> +  * Maxim MAX127
> +
> +    Prefix: 'max127'
> +
> +    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
> +
> +Description
> +-----------
> +
> +The MAX127 is a multirange, 12-bit data acquisition system (DAS) providing
> +8 analog input channels that are independently software programmable for
> +a variety of ranges. The available ranges are {0,5V}, {0,10V}, {-5,5V}
> +and {-10,10V}.
> +
> +The MAX127 features a 2-wire, I2C-compatible serial interface that allows
> +communication among multiple devices using SDA and SCL lines.
> +
> +Sysfs interface
> +---------------
> +
> +  ============== ==============================================================
> +  in[0-7]_input  The input voltage (in mV) of the corresponding channel.
> +		 RO
> +
> +  in[0-7]_min    The lower input limit (in mV) for the corresponding channel.
> +		 ADC range and LSB will be updated when the limit is changed.
> +		 For the MAX127, it will be adjusted to -10000, -5000, or 0.
> +		 RW
> +
> +  in[0-7]_max    The higher input limit (in mV) for the corresponding channel.
> +		 ADC range and LSB will be updated when the limit is changed.
> +		 For the MAX127, it will be adjusted to 0, 5000, or 10000.
> +		 RW
> +  ============== ==============================================================
