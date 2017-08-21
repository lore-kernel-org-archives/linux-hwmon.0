Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:38454 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752617AbdHULJs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Aug 2017 07:09:48 -0400
Received: by mail-wr0-f170.google.com with SMTP id p8so31811071wrf.5
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Aug 2017 04:09:48 -0700 (PDT)
Date: Mon, 21 Aug 2017 12:09:44 +0100
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
Subject: Re: [PATCHv6 1/4] mfd: da9052: add register details for TSI
Message-ID: <20170821110944.gei5u54wkgkqzd77@dell>
References: <20170718092024.22552-1-sebastian.reichel@collabora.co.uk>
 <20170718092024.22552-2-sebastian.reichel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170718092024.22552-2-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 18 Jul 2017, Sebastian Reichel wrote:

> Add register details an channels definition for using the TSI
> registers in the hwmon driver.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  include/linux/mfd/da9052/da9052.h |  6 ++++++
>  include/linux/mfd/da9052/reg.h    | 11 ++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Please add all the Acks you have obtained and [RESEND]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
