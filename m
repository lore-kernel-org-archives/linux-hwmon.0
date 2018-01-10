Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37518 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752170AbeAJKUN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jan 2018 05:20:13 -0500
Date: Wed, 10 Jan 2018 11:20:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
Message-ID: <20180110102011.GC5822@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jan 09, 2018 at 02:31:23PM -0800, Jae Hyun Yoo wrote:
> +#pragma pack(push, 1)
> +struct peci_xfer_msg {
> +	unsigned char client_addr;
> +	unsigned char tx_len;
> +	unsigned char rx_len;
> +	unsigned char tx_buf[MAX_BUFFER_SIZE];
> +	unsigned char rx_buf[MAX_BUFFER_SIZE];
> +};
> +#pragma pack(pop)

For any structure that crosses the user/kernel boundry, you _HAVE_ to
use the "__" variant.  So for here you would use __u8 instead of
"unsigned char" in order for things to work properly.

I'm guessing you didn't test this all out on a mixed 32/64 bit system?

Please fix up and test to ensure that it all works properly before
resubmitting.

thanks,

greg k-h
