Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40354 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754693AbdBPOny (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Feb 2017 09:43:54 -0500
Subject: Re: [PATCH v4 1/2] dt: Add vendor prefix for Sensirion
To: Marco Franchi <marco.franchi@nxp.com>
References: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com>
 <1487247824-10005-2-git-send-email-marco.franchi@nxp.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, marcofrk@gmail.com,
        FoxPeter@kabelbw.de
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <336e0fa6-3d69-cd16-0480-b62ae68b2de2@roeck-us.net>
Date: Thu, 16 Feb 2017 06:43:51 -0800
MIME-Version: 1.0
In-Reply-To: <1487247824-10005-2-git-send-email-marco.franchi@nxp.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/16/2017 04:23 AM, Marco Franchi wrote:
> Sensirion is a sensor manufacturer, providing relative humidity sensors,
> temperature sensor and flow sensor solutions.
>
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Wonder who should queue this up. Rob ?

Thanks,
guenter

> ---
> Changes since v3:
> - none
>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 7a98c33..43e1799 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -263,6 +263,7 @@ sbs	Smart Battery System
>  schindler	Schindler
>  seagate	Seagate Technology PLC
>  semtech	Semtech Corporation
> +sensirion	Sensirion AG
>  sgx	SGX Sensortech
>  sharp	Sharp Corporation
>  si-en	Si-En Technology Ltd.
>

