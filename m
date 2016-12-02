Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38374 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751963AbcLBEmr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2016 23:42:47 -0500
Subject: Re: [PATCH v3 2/2] devicetree: hwmon: Add documentation for TMP108
 driver.
To: John Muir <john@jmuir.com>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480645962-55584-1-git-send-email-john@jmuir.com>
 <1480645962-55584-3-git-send-email-john@jmuir.com>
Cc: John Muir <muirj@google.com>, Anatol Pomazau <anatol@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <148e02ed-1b2b-27c7-e463-da3dfd05b684@roeck-us.net>
Date: Thu, 1 Dec 2016 20:42:44 -0800
MIME-Version: 1.0
In-Reply-To: <1480645962-55584-3-git-send-email-john@jmuir.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/01/2016 06:32 PM, John Muir wrote:
> Simple hwmon binding documentation.
>
> Signed-off-by: John Muir <john@jmuir.com>

Straightforward, so I'll apply it w/o waiting for confirmation from the DT maintainers
(Rob - please scream if that is unacceptable).

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/tmp108.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp108.txt b/Documentation/devicetree/bindings/hwmon/tmp108.txt
> new file mode 100644
> index 0000000..8c4b10d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/tmp108.txt
> @@ -0,0 +1,14 @@
> +TMP108 temperature sensor
> +-------------------------
> +
> +This device supports I2C only.
> +
> +Requires node properties:
> +- compatible : "ti,tmp108"
> +- reg : the I2C address of the device. This is 0x48, 0x49, 0x4a, or 0x4b.
> +
> +Example:
> +	tmp108@48 {
> +		compatible = "ti,tmp108";
> +		reg = <0x48>;
> +	};
>

