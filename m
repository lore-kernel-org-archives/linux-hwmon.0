Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36114 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbdIRVH4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2017 17:07:56 -0400
Date: Mon, 18 Sep 2017 16:07:54 -0500
From: Rob Herring <robh@kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, jiri@resnulli.us
Subject: Re: [patch v2 2/2] dt-bindings: hwmon: add binding documentation for
 max6621 device
Message-ID: <20170918210754.mnwz6ckqxs7jakb5@rob-hp-laptop>
References: <1505126725-4336-1-git-send-email-vadimp@mellanox.com>
 <1505126725-4336-3-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505126725-4336-3-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 11, 2017 at 10:45:25AM +0000, Vadim Pasternak wrote:
> Add binding document for Maxim MAX6621 temperature sensor device.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  Documentation/devicetree/bindings/hwmon/max6621.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max6621.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max6621.txt b/Documentation/devicetree/bindings/hwmon/max6621.txt
> new file mode 100644
> index 0000000..c1f7e95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/max6621.txt
> @@ -0,0 +1,14 @@
> +MAX6621 temperature sensor
> +-------------------------
> +
> +This device supports I2C only.
> +
> +Requires node properties:
> +- compatible : "maxim,max6621"
> +- reg : the I2C address of the device.

This could go in trivial-devices.txt instead. Either way,

Acked-by: Rob Herring <robh@kernel.org>
