Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:34650 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754759AbdHVHqZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Aug 2017 03:46:25 -0400
Received: by mail-wr0-f169.google.com with SMTP id p14so49032402wrg.1
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2017 00:46:25 -0700 (PDT)
Date: Tue, 22 Aug 2017 08:46:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Sebastian Reichel <sre@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND] [PATCHv6 2/4] mfd: da9052: make touchscreen
 registration optional
Message-ID: <20170822074621.5qtevebr2edatvdr@dell>
References: <20170821145404.18902-1-sebastian.reichel@collabora.co.uk>
 <20170821145404.18902-3-sebastian.reichel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170821145404.18902-3-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 21 Aug 2017, Sebastian Reichel wrote:

> If the touchscreen pins are used as general purpose analogue
> input, the touchscreen driver should not be used. The pins
> will be handled by the existing hwmon driver instead.
> 
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  drivers/mfd/da9052-core.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
