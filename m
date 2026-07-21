Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BD9433040
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644998; cv=none; b=F90L/FGF2KKs9HgK0cvrLHkm3hmzUCq+1Cik/VlEHGP3iljMuT6/a5l1HezgvHo0ws1cEL47ZAB3aC9Iu73IaJLqPrEAzRWUpTK6a8hsviknZM11n588nmWF7xYmo3SKQ5cw//7jYn8YhYHy+YkuHRQZBF2s3B+N/xn7QhkRKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644998; c=relaxed/simple;
	bh=hQsgZYWQqH9i/NrORImdmeSLXv9aDfUjV6uIDqOqU9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uE1xLFLHMzatbw01oEqJ78WTuGxkQXVMMygNzWYzyHF0410dtLsssBleMgloYQJ2a97hXPXRX9mMvFHymvT7SPZYVcjE7GjomtWBUXZETwsoOrVLIdBk/6Leu+9Ty4AFi8rBg7/qasqoMIefBUoa/uPJsMOpdSYU+akNJHwC280=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeW533e7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeW533e7"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so74962395ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784644995; x=1785249795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dyETNxShtGcQyPOyiuGpwnqCxI5IoVaAZT4rR6milw=;
        b=WeW533e7Py5abaOMzxL3zih0MPtcZ6zQWRMvmcndevHlWxFcf4sExvqRly1uiwhkeM
         Bu6fZ76rmdd78hssYqUtv0P194UoYhDWA2izePnjHKVYKHySMAeFgZTZclMQhierWuu0
         gsOGedIl+a9Au0qmGPI0uriN370ZkybQm6j523sTmiblkgq+BXGsXh4YmEzu7KXa48xB
         cfjtJXh75lHeuEMWsYMaPXqUZGDN7iaSpfPgBZKF3j0sRcZsablvhBkp7CAFpuNMdLue
         ciPumJonRkXFa617cpEnMOSv9ov0N8a+JdNO4A1ekkXOm4SQtntzbSMBf8wU4oaCq31K
         RD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644995; x=1785249795;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8dyETNxShtGcQyPOyiuGpwnqCxI5IoVaAZT4rR6milw=;
        b=qtwQKvZq1jk08804tm4vJcLUhbUTQlwoe9kGm+Y2fMMuL5PyW2lBIJ3zG91d+wGHLS
         v8YJ40dXeWvCjH3pwK4EtsV6wqJOaTCNm2iARDboikiUiQfr46IdJIlN3/1bVlHJKiaX
         2QpwZUjTAcwV1NYsPu5QPlZvVhPkvZPj27jMwOwTApa9kpGC1n8a/ZPb6rUtsNpxzAi+
         kVYfPUh+QkSJQqMd7idxFarqIUVA77OjkUfn8shaAaWl0xivSHG6woMd5rnbn3n8SlAw
         qFH0f+sV0tpJTW0KsmSDMy0cpf9Z8dLTIY1zXE5StG1OQoAEr5FIuXcSHq5tSvtNgMeD
         w/ww==
X-Forwarded-Encrypted: i=1; AHgh+Rqz5wcYZTpT8F40huNL6b0f7CMT24AQxInoat25JPsAnP4OcLf7bn1SFNDHeP4Lbs8xDUeRqLqlyVhohw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQRKnCL1ziU+j0gVbXfQ+vKXdKcq9mqg72r1D9vOppfw/d5WXx
	nEGS1rjgKvhj65pB5ygDxQNVRdjFpaq9Kuq/g8z9N0HzNaELkoH1G1GU
X-Gm-Gg: AR+sD10Jn6zBvdVFjAnWnKblKQN7um6u9fI/x60yuokGzNOB+j63OH80bg05mxyi7GY
	RzN7yfovrjXBgYvtWKqxZOgCqj9q+WXvfGglqTYzx0PG0rbqdSxBpXGyi/G5Q1lydg2Fvi0TejF
	OTF5XIDYF7RNn2wOMVZindBNX1gE3lBEJLgRlp2jJsGoh1k6f77dnOSQGqqjxe5zJdnhpHE+8fZ
	D4RhnvkNCVqpufT1TRLLOqOLx6HEHiJMWKmX/PQqSUqfv7W3dKxn73J3zUyO+tFs9f9Oxq33vcA
	seB5rCNjLXDQga7RxF6UQi0fTpLfl8yveqH8wFyF6eB00/UCCdf2T7tOGvW9nBlCVsE4pDN/bXL
	qAnOsC5Fb8KYqSEaCbJQNQhDyjZ4HaTEnatKECpm6JepsFoRmKv9a4mIg4RlQgBWpkqXcX4cpvw
	Zz8ddHDokZ6KcHEfxP0FaPIzBKbeYVG4Ljf5tPn3xSfWCmHyySned61ttQrsN0yw==
X-Received: by 2002:a17:902:fc43:b0:2ca:6d2a:871 with SMTP id d9443c01a7336-2cf349eb38amr186463805ad.37.1784644994914;
        Tue, 21 Jul 2026 07:43:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm81473429eec.21.2026.07.21.07.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:43:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3c287fdd-a32d-448b-af04-4d03f895e618@roeck-us.net>
Date: Tue, 21 Jul 2026 07:43:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
To: Andy.Chung@amd.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
 <20260721-kb9002-upstream-v3-3-70563922be8d@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260721-kb9002-upstream-v3-3-70563922be8d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 23:31, Andy Chung via B4 Relay wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> ---
>   MAINTAINERS            |   8 +
>   drivers/hwmon/Kconfig  |  11 ++
>   drivers/hwmon/Makefile |   1 +
>   drivers/hwmon/kb9002.c | 469 +++++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 489 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b4b1575bdbd..1d80ac2660e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13931,6 +13931,14 @@ S:	Maintained
>   F:	Documentation/hwmon/k8temp.rst
>   F:	drivers/hwmon/k8temp.c
>   
> +KANDOU KB9002 PCIE RETIMER HWMON DRIVER
> +M:	Andy Chung <andy.chung@amd.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/kandou,kb9002.yaml
> +F:	Documentation/hwmon/kb9002.rst
> +F:	drivers/hwmon/kb9002.c
> +
>   KASAN
>   M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
>   R:	Alexander Potapenko <glider@google.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 08c29685126a..300329773e87 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -335,6 +335,17 @@ config SENSORS_K10TEMP
>   	  This driver can also be built as a module. If so, the module
>   	  will be called k10temp.
>   
> +config SENSORS_KB9002
> +	tristate "Kandou KB9002 PCIe retimer"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the integrated
> +	  temperature sensor and firmware version readout on Kandou
> +	  KB9002 PCIe 5.0 retimers, accessed over SMBus.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called kb9002.
> +
>   config SENSORS_KBATT
>   	tristate "KEBA battery controller support"
>   	depends on KEBA_CP500
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 63809eeec2f4..0cad7e21634c 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -113,6 +113,7 @@ obj-$(CONFIG_SENSORS_IT87)	+= it87.o
>   obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
>   obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
>   obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
> +obj-$(CONFIG_SENSORS_KB9002)	+= kb9002.o
>   obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
>   obj-$(CONFIG_SENSORS_KFAN)	+= kfan.o
>   obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
> diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
> new file mode 100644
> index 000000000000..61a6e522e770
> --- /dev/null
> +++ b/drivers/hwmon/kb9002.c
> @@ -0,0 +1,469 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Kandou KB9002 PCIe 5.0 retimer hwmon driver.
> + *
> + * The retimer exposes a system management bus (SMBus 3.0 with PEC)
> + * target for firmware-managed status registers. This driver assumes
> + * the chip is strapped to SMBus mode and exports the aggregated
> + * maximum die temperature as hwmon temp1_input (millidegrees Celsius)
> + * plus the firmware version and boot status under debugfs.
> + *
> + * Datasheet: Kandou KB9002 PCIe retimer (KA-015171-PD).
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/seq_file.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +
> +#define KB9002_DEV_NAME			"kb9002"
> +
> +/*
> + * SMBus read command codes. Each read is a two-phase PEC-protected
> + * transaction: prime writes the target address, data reads it back with
> + * the register contents. FW reads use a 16-bit address, HW reads 32-bit.
> + */
> +#define KB9002_CC_FW_READ_PRIME		0x82
> +#define KB9002_CC_FW_READ_DATA		0x81
> +#define KB9002_CC_HW_READ_PRIME		0x8a
> +#define KB9002_CC_HW_READ_DATA		0x89
> +
> +/* Firmware register offsets (16-bit). */
> +#define KB9002_FW_REG_VID		0x0004
> +#define KB9002_FW_REG_FW_VERSION	0x0500
> +#define KB9002_FW_REG_TEMP_MAXIMUM	0x0550
> +
> +#define KB9002_VID_MASK			GENMASK(31, 16)
> +#define KB9002_VID_KANDOU		0x1e6f
> +
> +/* Firmware boot status: 0xe8 in the top byte means init completed OK. */
> +#define KB9002_HW_REG_FW_BOOT_STATUS	0xe0090008
> +#define KB9002_FW_BOOT_STATUS_OK_MSB	0xe8
> +
> +/*
> + * Hardware registers reached over raw I2C (32-bit addressing). The
> + * host-interface bit selects SMBus (set) vs raw-I2C target; parts
> + * strapped to raw I2C need it set before SMBus access works.
> + */
> +#define KB9002_HW_REG_REVID		0x00480004
> +#define KB9002_HW_REG_HOST_IF		0x00480008
> +#define KB9002_HOST_IF_SMBUS		BIT(1)
> +
> +#define KB9002_REVID_MASK		GENMASK(7, 0)
> +#define KB9002_REVID_B0			0x10
> +#define KB9002_REVID_B1			0x11
> +
> +/* Retries to drain a stray leading 0xff from the raw-I2C FIFO. */
> +#define KB9002_REVID_READ_RETRIES	16
> +
> +/* Temperature: 32-bit Q16.16 absolute Kelvin. */
> +#define KB9002_TEMP_FRAC_BITS		16
> +#define KB9002_ABS_ZERO_MILLI_C		(-273150)
> +
> +/* Firmware takes up to ~2s to respond after a host-interface change. */
> +#define KB9002_FW_READY_POLL_US		(25 * USEC_PER_MSEC)
> +#define KB9002_FW_READY_TIMEOUT_US	(2 * USEC_PER_SEC)
> +
> +struct kb9002_data {
> +	struct i2c_client *client;
> +	struct device *hwmon_dev;
> +};
> +
> +/* Raw-I2C read: write the 32-bit BE address, then read 4 BE data bytes. */
> +static int kb9002_i2c_read(struct i2c_client *client, u32 reg, u32 *val)
> +{
> +	u8 addr[4];
> +	u8 rbuf[4];
> +	struct i2c_msg msgs[2] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = sizeof(addr),
> +			.buf = addr,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(rbuf),
> +			.buf = rbuf,
> +		},
> +	};
> +	int ret;
> +
> +	put_unaligned_be32(reg, addr);
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret < 0)
> +		return ret;
> +	if (ret != ARRAY_SIZE(msgs))
> +		return -EIO;
> +
> +	*val = get_unaligned_be32(rbuf);
> +	return 0;
> +}
> +
> +/* Raw-I2C write: 4 BE address bytes followed by 4 BE data bytes. */
> +static int kb9002_i2c_write(struct i2c_client *client, u32 reg, u32 val)
> +{
> +	u8 buf[8];
> +	struct i2c_msg msg = {
> +		.addr = client->addr,
> +		.flags = 0,
> +		.len = sizeof(buf),
> +		.buf = buf,
> +	};
> +	int ret;
> +
> +	put_unaligned_be32(reg, &buf[0]);
> +	put_unaligned_be32(val, &buf[4]);
> +
> +	ret = i2c_transfer(client->adapter, &msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/*
> + * Read the silicon revision ID. A fresh FIFO may start with a stray
> + * 0xff that shifts the result, so drain one byte between retries until
> + * the top byte is no longer 0xff.
> + */
> +static int kb9002_read_revid(struct i2c_client *client, u32 *revid)
> +{
> +	u8 dummy;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < KB9002_REVID_READ_RETRIES; i++) {
> +		ret = kb9002_i2c_read(client, KB9002_HW_REG_REVID, revid);
> +		if (ret)
> +			return ret;
> +		if ((*revid >> 24) != 0xff)
> +			return 0;
> +		/* Drain one byte from the chip to re-align the I2C FIFO. */
> +		i2c_master_recv(client, &dummy, 1);
> +	}
> +
> +	return -EIO;
> +}
> +
> +/*
> + * Read a 32-bit firmware register over SMBus: block-write the 16-bit LE
> + * address, then block-read the echoed address plus 4 LE data bytes.
> + */
> +static int kb9002_fw_read(struct kb9002_data *data, u16 reg, u32 *val)
> +{
> +	struct i2c_client *client = data->client;
> +	u8 addr[2];
> +	u8 rbuf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	put_unaligned_le16(reg, addr);
> +
> +	ret = i2c_smbus_write_block_data(client, KB9002_CC_FW_READ_PRIME,
> +					 sizeof(addr), addr);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_read_block_data(client, KB9002_CC_FW_READ_DATA, rbuf);
> +	if (ret < 0)
> +		return ret;
> +	if (ret < (int)(sizeof(addr) + sizeof(*val)))
> +		return -EIO;
> +
> +	*val = get_unaligned_le32(&rbuf[sizeof(addr)]);
> +	return 0;
> +}
> +
> +/* Like kb9002_fw_read but for a hardware register (32-bit LE address). */
> +static int kb9002_smbus_hw_read(struct kb9002_data *data, u32 reg, u32 *val)
> +{
> +	struct i2c_client *client = data->client;
> +	u8 addr[4];
> +	u8 rbuf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	put_unaligned_le32(reg, addr);
> +

Just for verification: Some accesses are LE, others are BE. This is unusual.
To help understand what is LE and what is BE, please add a comment at the
top o the file describing which accesses are LE and which accesses are BE.

> +	ret = i2c_smbus_write_block_data(client, KB9002_CC_HW_READ_PRIME,
> +					 sizeof(addr), addr);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_read_block_data(client, KB9002_CC_HW_READ_DATA, rbuf);
> +	if (ret < 0)
> +		return ret;
> +	if (ret < (int)(sizeof(addr) + sizeof(*val)))
> +		return -EIO;
> +
> +	*val = get_unaligned_le32(&rbuf[sizeof(addr)]);
> +	return 0;
> +}
> +
> +/*
> + * Switch the host interface from raw-I2C to SMBus and wait for firmware
> + * to come back up. Called only when SMBus access failed in probe, i.e.
> + * the chip is strapped to raw-I2C mode. Confirms the revision, sets the
> + * SMBus-mode bit, then polls until firmware responds again.
> + */
> +static int kb9002_enable_smbus_target(struct kb9002_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	u32 revid;
> +	u32 val;
> +	int op_ret;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "raw I2C required to switch to SMBus mode\n");
> +
> +	ret = kb9002_read_revid(client, &revid);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "revision ID read failed\n");
> +
> +	switch (FIELD_GET(KB9002_REVID_MASK, revid)) {
> +	case KB9002_REVID_B0:
> +	case KB9002_REVID_B1:
> +		break;
> +	default:
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "unsupported revision ID 0x%08x\n", revid);
> +	}
> +
> +	ret = kb9002_i2c_read(client, KB9002_HW_REG_HOST_IF, &val);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "host interface read failed\n");
> +
> +	val |= KB9002_HOST_IF_SMBUS;
> +
> +	ret = kb9002_i2c_write(client, KB9002_HW_REG_HOST_IF, val);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "host interface write failed\n");
> +
> +	/* Wait until firmware re-initialisation completes. */
> +	ret = read_poll_timeout(kb9002_fw_read, op_ret, op_ret == 0,
> +				KB9002_FW_READY_POLL_US,
> +				KB9002_FW_READY_TIMEOUT_US, true,
> +				data, KB9002_FW_REG_VID, &val);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "firmware not responding over SMBus\n");
> +
> +	return 0;
> +}
> +
> +/* Convert Q16.16 absolute Kelvin to millidegrees Celsius. */
> +static long kb9002_temp_to_milli_c(u32 raw)
> +{
> +	s64 milli_k = ((s64)raw * 1000) >> KB9002_TEMP_FRAC_BITS;
> +
> +	return (long)milli_k + KB9002_ABS_ZERO_MILLI_C;
> +}
> +
> +static int kb9002_read_temp(struct kb9002_data *data, long *val)
> +{
> +	u32 raw;
> +	int ret;
> +
> +	ret = kb9002_fw_read(data, KB9002_FW_REG_TEMP_MAXIMUM, &raw);
> +	if (ret)
> +		return ret;
> +
> +	*val = kb9002_temp_to_milli_c(raw);
> +	return 0;
> +}
> +
> +static umode_t kb9002_is_visible(const void *drvdata,
> +				 enum hwmon_sensor_types type,
> +				 u32 attr, int channel)
> +{
> +	if (type == hwmon_temp &&
> +	    (attr == hwmon_temp_input || attr == hwmon_temp_label))
> +		return 0444;
> +	return 0;
> +}

In this context, the function can just return 0444 without any checks.

> +
> +static int kb9002_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *val)
> +{
> +	struct kb9002_data *data = dev_get_drvdata(dev);
> +
> +	if (type == hwmon_temp && attr == hwmon_temp_input)
> +		return kb9002_read_temp(data, val);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int kb9002_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, const char **str)
> +{
> +	if (type == hwmon_temp && attr == hwmon_temp_label) {
> +		*str = KB9002_DEV_NAME;
> +		return 0;
> +	}
> +	return -EOPNOTSUPP;
> +}

This is a pointless attribute. The label attribute is supposed to return
the sensor location, not the chip name. The chip name is already reported
in the "name" attribute. Please drop.

> +
> +static const struct hwmon_ops kb9002_hwmon_ops = {
> +	.is_visible = kb9002_is_visible,
> +	.read = kb9002_read,
> +	.read_string = kb9002_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const kb9002_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info kb9002_chip_info = {
> +	.ops = &kb9002_hwmon_ops,
> +	.info = kb9002_hwmon_info,
> +};
> +
> +static int kb9002_fw_version_show(struct seq_file *s, void *unused)
> +{
> +	struct kb9002_data *data = s->private;
> +	u32 ver;
> +	int ret;
> +
> +	guard(hwmon_lock)(data->hwmon_dev);
> +
> +	ret = kb9002_fw_read(data, KB9002_FW_REG_FW_VERSION, &ver);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "%u.%02u.%02u.%u\n",
> +		   (ver >> 24) & 0xff, (ver >> 16) & 0xff,
> +		   (ver >>  8) & 0xff, (ver >>  0) & 0xff);
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(kb9002_fw_version);
> +
> +static int kb9002_fw_load_status_show(struct seq_file *s, void *unused)
> +{
> +	struct kb9002_data *data = s->private;
> +	u32 status;
> +	int ret;
> +
> +	guard(hwmon_lock)(data->hwmon_dev);
> +
> +	ret = kb9002_smbus_hw_read(data, KB9002_HW_REG_FW_BOOT_STATUS, &status);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "%s\n",
> +		   (status >> 24) == KB9002_FW_BOOT_STATUS_OK_MSB ?
> +		   "normal" : "abnormal");
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(kb9002_fw_load_status);
> +
> +static void kb9002_debugfs_init(struct kb9002_data *data)
> +{
> +	struct dentry *dir = data->client->debugfs;
> +
> +	debugfs_create_file("fw_ver", 0444, dir, data,
> +			    &kb9002_fw_version_fops);
> +	debugfs_create_file("fw_load_status", 0444, dir, data,
> +			    &kb9002_fw_load_status_fops);
> +}
> +
> +static int kb9002_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct kb9002_data *data;
> +	struct device *hwmon_dev;
> +	u32 vid;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BLOCK_DATA |
> +				     I2C_FUNC_SMBUS_PEC))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +
> +	/* All firmware register accesses are PEC-protected. */
> +	client->flags |= I2C_CLIENT_PEC;
> +

Doesn't this depend on controller PEC support (I2C_FUNC_SMBUS_PEC) ?
Also, the driver depends on I2C_FUNC_SMBUS_BLOCK_DATA support,
which is not always available. I would suggest to check for both.

Thanks,
Guenter

> +	i2c_set_clientdata(client, data);
> +
> +	/*
> +	 * Try SMBus first. If the chip is strapped to raw-I2C mode it
> +	 * will not respond to SMBus framing, so fall back to switching
> +	 * the host interface over raw I2C and retry.
> +	 */
> +	ret = kb9002_fw_read(data, KB9002_FW_REG_VID, &vid);
> +	if (ret) {
> +		dev_dbg(dev, "SMBus probe failed (%d), trying raw-I2C host-interface switch\n",
> +			ret);
> +		ret = kb9002_enable_smbus_target(data);
> +		if (ret)
> +			return ret;
> +		ret = kb9002_fw_read(data, KB9002_FW_REG_VID, &vid);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "VID read failed after host-interface switch\n");
> +	}
> +	if (FIELD_GET(KB9002_VID_MASK, vid) != KB9002_VID_KANDOU)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "unexpected VID 0x%08x\n", vid);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, KB9002_DEV_NAME,
> +							 data,
> +							 &kb9002_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	data->hwmon_dev = hwmon_dev;
> +	kb9002_debugfs_init(data);
> +	return 0;
> +}
> +
> +static const struct i2c_device_id kb9002_id[] = {
> +	{ .name = KB9002_DEV_NAME },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, kb9002_id);
> +
> +static const struct of_device_id kb9002_of_match[] = {
> +	{ .compatible = "kandou,kb9002" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, kb9002_of_match);
> +
> +static struct i2c_driver kb9002_driver = {
> +	.driver = {
> +		.name = KB9002_DEV_NAME,
> +		.of_match_table = kb9002_of_match,
> +	},
> +	.probe = kb9002_probe,
> +	.id_table = kb9002_id,
> +};
> +module_i2c_driver(kb9002_driver);
> +
> +MODULE_AUTHOR("Andy Chung <andy.chung@amd.com>");
> +MODULE_DESCRIPTION("Kandou KB9002 PCIe retimer hwmon driver");
> +MODULE_LICENSE("GPL");
> 

