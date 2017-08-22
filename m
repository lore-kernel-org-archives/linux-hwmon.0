Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:33503 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754796AbdHVHrE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Aug 2017 03:47:04 -0400
Received: by mail-wr0-f175.google.com with SMTP id a47so3464351wra.0
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2017 00:47:04 -0700 (PDT)
Date: Tue, 22 Aug 2017 08:47:00 +0100
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
Subject: Re: [RESEND] [PATCHv6 4/4] hwmon: da9052: add support for TSI channel
Message-ID: <20170822074700.yfscqocgespuopx5@dell>
References: <20170821145404.18902-1-sebastian.reichel@collabora.co.uk>
 <20170821145404.18902-5-sebastian.reichel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170821145404.18902-5-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 21 Aug 2017, Sebastian Reichel wrote:

> TSI channel has a 4 channel mux connected to it and is normally
> used for touchscreen support. The hardware may alternatively
> use it as general purpose adc.
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  drivers/hwmon/da9052-hwmon.c | 249 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 245 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
