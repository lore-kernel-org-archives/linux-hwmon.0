Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:35272 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754702AbdHVHqP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Aug 2017 03:46:15 -0400
Received: by mail-wr0-f175.google.com with SMTP id k46so42928418wre.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2017 00:46:15 -0700 (PDT)
Date: Tue, 22 Aug 2017 08:46:11 +0100
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
Subject: Re: [RESEND] [PATCHv6 1/4] mfd: da9052: add register details for TSI
Message-ID: <20170822074611.4zplckgbiibyh6pc@dell>
References: <20170821145404.18902-1-sebastian.reichel@collabora.co.uk>
 <20170821145404.18902-2-sebastian.reichel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170821145404.18902-2-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 21 Aug 2017, Sebastian Reichel wrote:

> Add register details an channels definition for using the TSI
> registers in the hwmon driver.
> 
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  include/linux/mfd/da9052/da9052.h |  6 ++++++
>  include/linux/mfd/da9052/reg.h    | 11 ++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
