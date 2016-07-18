Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48543 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751265AbcGROlH (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 18 Jul 2016 10:41:07 -0400
Subject: Re: [PATCH v7] hwmon: added kernel module for FTS BMC chip "Teutates"
To: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
References: <1468842689-31582-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Cc: linux-hwmon <linux-hwmon@vger.kernel.org>,
	Thilo Cestonaro <thilo@cestona.ro>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <578CEA7D.6000704@roeck-us.net>
Date: Mon, 18 Jul 2016 07:41:01 -0700
MIME-Version: 1.0
In-Reply-To: <1468842689-31582-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/18/2016 04:51 AM, Thilo Cestonaro wrote:
> From: Thilo Cestonaro <thilo@cestona.ro>
>
> This driver implements support for the FTS BMC Chip "Teutates".
>
> Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
> ---

[ ... ]

> +
> +/*****************************************************************************/
> +/* Module initialization / remove functions				     */
> +/*****************************************************************************/
> +static int fts_remove(struct i2c_client *client)
> +{
> +	struct fts_data *data = dev_get_drvdata(&client->dev);
> +
> +	watchdog_unregister_device(&data->wdd);
> +	return 0;
> +}
> +
> +static int fts_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	u8 revision;
> +	struct fts_data *data;
> +	int err;
> +	s8 deviceid;

One (hopefully) last question: Effectively this means that any device ID >=0x80
will be identified as error. Is this on purpose ? It is quite unusual.

Thanks,
Guenter

