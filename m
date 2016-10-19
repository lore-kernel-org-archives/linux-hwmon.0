Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39910 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756464AbcJSBYq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Oct 2016 21:24:46 -0400
Date: Tue, 18 Oct 2016 18:24:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mcp3021: rework for DT support of reference-voltage
Message-ID: <20161019012442.GA30552@roeck-us.net>
References: <20161018224444.11225-1-clemens.gruber@pqgruber.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161018224444.11225-1-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 19, 2016 at 12:44:44AM +0200, Clemens Gruber wrote:
> Support setting the reference voltage in the device tree.
> Rework of driver structure, put chip specific data in a separate
> structure and assign it depending on device id from platform data or
> DT match.
> Extend the device documentation and add new documentation for the
> devicetree bindings.
> Also change S_IRUGO to the better readable 0444, which fixes a
> checkpatch warning.
> 
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> ---
>  .../devicetree/bindings/hwmon/mcp3021.txt          |  21 +++

This needs to be a separate patch.

...

> +static int mcp3021_probe(struct i2c_client *client,
> +	const struct i2c_device_id *id);
> +static int mcp3021_remove(struct i2c_client *client);
>  

We are trying hard to get rid of functions declarations like this.
Adding it means that the code is rearranged for no good reason.
Please limit the changes to nececessary changes, and please refrain
from rearranging it and from introducing your personal style.

> -enum chips {
> +enum {

Another indication that you are making changes for no good reason.
You may not like named enums, others do. That doesn't mean you can
change the code to your liking. Please don't do that.

Guenter
