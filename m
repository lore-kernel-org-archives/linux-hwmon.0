Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:36850 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751766AbdGQOc7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2017 10:32:59 -0400
Received: by mail-wr0-f174.google.com with SMTP id y43so1932357wrd.3
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2017 07:32:58 -0700 (PDT)
Date: Mon, 17 Jul 2017 15:32:45 +0100
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
Subject: Re: [PATCHv5 3/6] mfd: da9052: add register details for TSI
Message-ID: <20170717143245.qvcshsnodtk7pi2h@dell>
References: <20170703084003.31184-1-sebastian.reichel@collabora.co.uk>
 <20170703084003.31184-4-sebastian.reichel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170703084003.31184-4-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 03 Jul 2017, Sebastian Reichel wrote:

> Add register details an channels definition for using the TSI
> registers in the hwmon driver.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  include/linux/mfd/da9052/da9052.h |  6 ++++++
>  include/linux/mfd/da9052/reg.h    | 11 ++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)

Do other patches in this set depend on this change?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
