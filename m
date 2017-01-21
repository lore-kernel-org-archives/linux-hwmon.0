Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57907 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750717AbdAUUOP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2017 15:14:15 -0500
Subject: Re: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
To: Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20170121192010.30681-1-f.fainelli@gmail.com>
 <20170121192010.30681-2-f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <028d56df-7187-69c2-000f-15dd7d0496b8@roeck-us.net>
Date: Sat, 21 Jan 2017 12:14:09 -0800
MIME-Version: 1.0
In-Reply-To: <20170121192010.30681-2-f.fainelli@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/21/2017 11:20 AM, Florian Fainelli wrote:
> We have a device reference, utilize it instead of pr_warn().
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to -next.

Thanks,
Guenter

