Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:34018 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752482AbdHULLL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Aug 2017 07:11:11 -0400
Received: by mail-wr0-f179.google.com with SMTP id p14so27238213wrg.1
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Aug 2017 04:11:11 -0700 (PDT)
Date: Mon, 21 Aug 2017 12:11:08 +0100
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
Subject: Re: [PATCHv6 2/4] mfd: da9052: make touchscreen registration optional
Message-ID: <20170821111108.uiejvdssuv6eqvbr@dell>
References: <20170718092024.22552-1-sebastian.reichel@collabora.co.uk>
 <20170718092024.22552-3-sebastian.reichel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170718092024.22552-3-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 18 Jul 2017, Sebastian Reichel wrote:

> If the touchscreen pins are used as general purpose analogue
> input, the touchscreen driver should not be used. The pins
> will be handled by the existing hwmon driver instead.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  drivers/mfd/da9052-core.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
