Return-Path: <SRS0=z2fx=XF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F200EC49ED7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Sep 2019 18:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B937E2168B
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Sep 2019 18:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dL12f012"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbfIJSOH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Sep 2019 14:14:07 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41526 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbfIJSOH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Sep 2019 14:14:07 -0400
Received: by mail-pl1-f193.google.com with SMTP id m9so8978614pls.8
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2019 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J74jWNf1SlajX3+ecICqrbY01peWUo7RB1VQLHFAtgY=;
        b=dL12f012qN7t4D5XH5QoVtYFxqGFb0AXEuevyL2thjg4DEE6YCyJVg4D5xOTFNz3j+
         tFoM6ROGqPpCKBJPywS5uG3BA8GHmKTKe8wmkCUdIEAJOacTNcSW2rJo9hwHGckngiuK
         5nXZ292aFSRlC8y8GkP0+gIEAn1Lh7QW7X3cCkEF0gSbUl1dNRoyoQdsryzSJpZcNv0U
         OtAOb/o3S/LsKjuCvY2oeycaRfT4yETvsbQWJgIoD/hmsyxfagIEqhaUZplvub05cJwX
         c4hUcQlWyaPPkJVCxHv09VYbGE0ROdqXB9yCecqJUaYv+Tqu0zFEQkxzE0zS62niy3MY
         J0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=J74jWNf1SlajX3+ecICqrbY01peWUo7RB1VQLHFAtgY=;
        b=LU7dBi9m/CuPODRfkIQLrSAIEYny/uoRzyj2+fI5yhimdTZZnqtWydASF291nFWnfl
         UaYeGnXBQH3rG4HipEpL7fyRt8fl8wauWkHTV2pDKp73cFtszP5KK/O572gUEuWHrx4H
         Co0JH/caY9K+OzSlh1/aov7CgH5jJR3HSrWktAwBzihiM49aaPzGgG9GWR/n2aetQaqs
         4Xb+wP0a+Th2hJ5FHCr91CepSeXTPvdAV+Hn6KF+iauxNii+s8HHH6Y07zxgmc8DUkz3
         2Ivhpwvl8N73PSR4n9AMlneMFvHwDRPy/qCdltEs35h3o5ffpoXXGy1N+wgXp7UJYvca
         QVdA==
X-Gm-Message-State: APjAAAWHJ/gVeDtzdzMIq5Dx48Iy1DOsTzeNmc3sAfNd7lQrugVYiDYv
        c2JX7sV+kkW0NIhgu5oKlQ/oxqTF
X-Google-Smtp-Source: APXvYqwNnPPRhxpYDkSvLf3CsNhrDFj9lRWpuhZYklLSBkMAmeuXAi08sU7Qy4MFO2sc/C486NvH2A==
X-Received: by 2002:a17:902:4303:: with SMTP id i3mr33778392pld.30.1568139246492;
        Tue, 10 Sep 2019 11:14:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s141sm27182928pfs.13.2019.09.10.11.14.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 11:14:05 -0700 (PDT)
Date:   Tue, 10 Sep 2019 11:14:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/2] hwmon: (shtc1) add support for the SHTC3 sensor
Message-ID: <20190910181404.GA26843@roeck-us.net>
References: <20190905010130.15019-2-dan@dlrobertson.com>
 <20190905014554.21658-1-dan@dlrobertson.com>
 <20190905014554.21658-2-dan@dlrobertson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905014554.21658-2-dan@dlrobertson.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 05, 2019 at 01:45:53AM +0000, Dan Robertson wrote:
> Add support for the Sensirion SHTC3 humidity and temperature sensor to
> the shtc1 module.
> 
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>

Applied to hwmon-next after making nitpick change (see below).

> ---
>  Documentation/hwmon/shtc1.rst | 19 ++++++++----
>  drivers/hwmon/Kconfig         |  4 +--
>  drivers/hwmon/shtc1.c         | 56 ++++++++++++++++++++++++++---------
>  3 files changed, 58 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/hwmon/shtc1.rst b/Documentation/hwmon/shtc1.rst
> index aa116332ba26..9b0f1eee5bf2 100644
> --- a/Documentation/hwmon/shtc1.rst
> +++ b/Documentation/hwmon/shtc1.rst
> @@ -19,7 +19,17 @@ Supported chips:
>  
>      Addresses scanned: none
>  
> -    Datasheet: Not publicly available
> +    Datasheet: http://www.sensirion.com/file/datasheet_shtw1
> +
> +
> +
> +  * Sensirion SHTC3
> +
> +    Prefix: 'shtc3'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: http://www.sensirion.com/file/datasheet_shtc3
>  
>  
>  
> @@ -30,10 +40,9 @@ Author:
>  Description
>  -----------
>  
> -This driver implements support for the Sensirion SHTC1 chip, a humidity and
> -temperature sensor. Temperature is measured in degrees celsius, relative
> -humidity is expressed as a percentage. Driver can be used as well for SHTW1
> -chip, which has the same electrical interface.
> +This driver implements support for the Sensirion SHTC1, SHTW1, and SHTC3
> +chips, a humidity and temperature sensor. Temperature is measured in degrees
> +celsius, relative humidity is expressed as a percentage.
>  
>  The device communicates with the I2C protocol. All sensors are set to I2C
>  address 0x70. See Documentation/i2c/instantiating-devices for methods to
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 650dd71f9724..e8b9b172ed9d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1382,8 +1382,8 @@ config SENSORS_SHTC1
>  	tristate "Sensiron humidity and temperature sensors. SHTC1 and compat."
>  	depends on I2C
>  	help
> -	  If you say yes here you get support for the Sensiron SHTC1 and SHTW1
> -	  humidity and temperature sensors.
> +	  If you say yes here you get support for the Sensiron SHTC1, SHTW1,
> +	  and SHTC3 humidity and temperature sensors.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called shtc1.
> diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
> index 83fe08185ac7..3e9a859a2b58 100644
> --- a/drivers/hwmon/shtc1.c
> +++ b/drivers/hwmon/shtc1.c
> @@ -24,19 +24,32 @@ static const unsigned char shtc1_cmd_measure_blocking_lpm[]    = { 0x64, 0x58 };
>  static const unsigned char shtc1_cmd_measure_nonblocking_lpm[] = { 0x60, 0x9c };
>  
>  /* command for reading the ID register */
> -static const unsigned char shtc1_cmd_read_id_reg[]	       = { 0xef, 0xc8 };
> +static const unsigned char shtc1_cmd_read_id_reg[]             = { 0xef, 0xc8 };
>  
> -/* constants for reading the ID register */
> -#define SHTC1_ID	  0x07
> -#define SHTC1_ID_REG_MASK 0x1f
> +/* constants for reading the ID register
> + * SHTC1: 0x0007 with mask 0x001f
> + * SHTW1: 0x0007 with mask 0x001f
> + * SHTC3: 0x0807 with mask 0x083f
> + */

/*
 * Multi-line comments look like this
 */

> +#define SHTC3_ID      0x0807
> +#define SHTC3_ID_MASK 0x083f
> +#define SHTC1_ID      0x0007
> +#define SHTC1_ID_MASK 0x001f
>  
>  /* delays for non-blocking i2c commands, both in us */
>  #define SHTC1_NONBLOCKING_WAIT_TIME_HPM  14400
>  #define SHTC1_NONBLOCKING_WAIT_TIME_LPM   1000
> +#define SHTC3_NONBLOCKING_WAIT_TIME_HPM  12100
> +#define SHTC3_NONBLOCKING_WAIT_TIME_LPM    800
>  
>  #define SHTC1_CMD_LENGTH      2
>  #define SHTC1_RESPONSE_LENGTH 6
>  
> +enum shtcx_chips {
> +	shtc1,
> +	shtc3,
> +};
> +
>  struct shtc1_data {
>  	struct i2c_client *client;
>  	struct mutex update_lock;
> @@ -47,6 +60,7 @@ struct shtc1_data {
>  	unsigned int nonblocking_wait_time; /* in us */
>  
>  	struct shtc1_platform_data setup;
> +	enum shtcx_chips chip;
>  
>  	int temperature; /* 1000 * temperature in dgr C */
>  	int humidity; /* 1000 * relative humidity in %RH */
> @@ -157,13 +171,16 @@ static void shtc1_select_command(struct shtc1_data *data)
>  		data->command = data->setup.blocking_io ?
>  				shtc1_cmd_measure_blocking_hpm :
>  				shtc1_cmd_measure_nonblocking_hpm;
> -		data->nonblocking_wait_time = SHTC1_NONBLOCKING_WAIT_TIME_HPM;
> -
> +		data->nonblocking_wait_time = (data->chip == shtc1) ?
> +				SHTC1_NONBLOCKING_WAIT_TIME_HPM :
> +				SHTC3_NONBLOCKING_WAIT_TIME_HPM;
>  	} else {
>  		data->command = data->setup.blocking_io ?
>  				shtc1_cmd_measure_blocking_lpm :
>  				shtc1_cmd_measure_nonblocking_lpm;
> -		data->nonblocking_wait_time = SHTC1_NONBLOCKING_WAIT_TIME_LPM;
> +		data->nonblocking_wait_time = (data->chip == shtc1) ?
> +				SHTC1_NONBLOCKING_WAIT_TIME_LPM :
> +				SHTC3_NONBLOCKING_WAIT_TIME_LPM;
>  	}
>  }
>  
> @@ -171,9 +188,11 @@ static int shtc1_probe(struct i2c_client *client,
>  		       const struct i2c_device_id *id)
>  {
>  	int ret;
> -	char id_reg[2];
> +	u16 id_reg;
> +	char id_reg_buf[2];
>  	struct shtc1_data *data;
>  	struct device *hwmon_dev;
> +	enum shtcx_chips chip = id->driver_data;
>  	struct i2c_adapter *adap = client->adapter;
>  	struct device *dev = &client->dev;
>  
> @@ -187,13 +206,20 @@ static int shtc1_probe(struct i2c_client *client,
>  		dev_err(dev, "could not send read_id_reg command: %d\n", ret);
>  		return ret < 0 ? ret : -ENODEV;
>  	}
> -	ret = i2c_master_recv(client, id_reg, sizeof(id_reg));
> -	if (ret != sizeof(id_reg)) {
> +	ret = i2c_master_recv(client, id_reg_buf, sizeof(id_reg_buf));
> +	if (ret != sizeof(id_reg_buf)) {
>  		dev_err(dev, "could not read ID register: %d\n", ret);
>  		return -ENODEV;
>  	}
> -	if ((id_reg[1] & SHTC1_ID_REG_MASK) != SHTC1_ID) {
> -		dev_err(dev, "ID register doesn't match\n");
> +
> +	id_reg = be16_to_cpup((__be16 *)id_reg_buf);
> +	if (chip == shtc3) {
> +		if ((id_reg & SHTC3_ID_MASK) != SHTC3_ID) {
> +			dev_err(dev, "SHTC3 ID register does not match\n");
> +			return -ENODEV;
> +		}
> +	} else if ((id_reg & SHTC1_ID_MASK) != SHTC1_ID) {
> +		dev_err(dev, "SHTC1 ID register does not match\n");
>  		return -ENODEV;
>  	}
>  
> @@ -204,6 +230,7 @@ static int shtc1_probe(struct i2c_client *client,
>  	data->setup.blocking_io = false;
>  	data->setup.high_precision = true;
>  	data->client = client;
> +	data->chip = chip;
>  
>  	if (client->dev.platform_data)
>  		data->setup = *(struct shtc1_platform_data *)dev->platform_data;
> @@ -222,8 +249,9 @@ static int shtc1_probe(struct i2c_client *client,
>  
>  /* device ID table */
>  static const struct i2c_device_id shtc1_id[] = {
> -	{ "shtc1", 0 },
> -	{ "shtw1", 0 },
> +	{ "shtc1", shtc1 },
> +	{ "shtw1", shtc1 },
> +	{ "shtc3", shtc3 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, shtc1_id);
