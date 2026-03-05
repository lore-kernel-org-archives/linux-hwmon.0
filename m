Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310F91799F
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674111; cv=none; b=QhCKRsE69GfN1Wa1HVZn4+zVo2GH/tBrk2ixOHrdfjjf/EZa/qW2uund4qLrSslOKsHG5P0tx0kMHG6u5vcxCBahtAG8Au+g1w4BurDalqLAyDPV/kvmNrcCoKQG/TyTEmYxoR0EmN933Zn6WX1t7XqPfWuFEIkRUiRAejFBov4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674111; c=relaxed/simple;
	bh=ADhr4puGwCO0351H9+Lc7+Nerh2coldOPagqnMF8nBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLZDkFouM+AxLlhgAPIQRnMEN6iVg0rwuPNfhaJkYcizsF45cUlbkRVMazubR/rwkSNq9FhIo8ryHOH+Iqy52lJuJZGBwzRWK9+Q2Tm2lhn05y/GtZxzYDG8VYsWiYpUYav2MJEiX4hQNUB5DpkyqYJl95QJfUwjD+ktZ8YsRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vrf9PRnE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vrf9PRnE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so85876945ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 17:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772674109; x=1773278909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jQoK7r1bXDhr+VrZlNKYtyi9gx0dUmt+zGC0ZXLm5CA=;
        b=Vrf9PRnElVbJfdKzBG4p6ADxmIQHZIevTMe8Fdbj4dTHygAAH4crlYBR1DU5ANl9Rq
         Q0IwGFz/YdcfiFu+U9Mmz4Lk+q7oWYj8ZSviVUqKw2QXIFGyYKCzzs+bawJsHXySO25h
         o4MVMFUosKE9nzM7QBfcYGLseVVPjnviUCbuEk/VOZ4j65wxhqsMuqn8caMoGqS3f2eW
         SB8qi9MdObL8aNsyvgb1Z6uTQQ4tJ+KGdgeeIBT7duGLDW18yPJBzIFGHamH9JbxcZ3a
         mIBOjZBO2O3kS72s/fqok7uzmuQ2GICXiDQiT1bQEQYn2pZUrHqOvsI1FVApsVg4wVLN
         AssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772674109; x=1773278909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQoK7r1bXDhr+VrZlNKYtyi9gx0dUmt+zGC0ZXLm5CA=;
        b=R1rhtttOqhOWGQ722a7z11qSCyag16Qp3ZT7db3R17kTY42IDkmaqztHjrkJTRjnUZ
         oTMageAqTk9YHY/oNntwYbZT/tS0GpzJC9yo9B6y88MBgqTzxSWzNCenyQzGRFBTebbb
         qLXLlb5fTz3Vmb5X1kGhCvTrpCFMW7SixkUEczRxyvP7/nV7B1lOyS9tt1jZluluZGh6
         fRV31qfWcKmOdu7aUszhkRAJYQTa0dY7APyFFdDk1o5xmQGkRioEvr3X+jnzcTK6EaqR
         FcoomyiuPLvUEqyjU5ZbfmTWZ2fltOMkM5aQ86EkRv3DncbORcm2yXveJ3jKbsjLuyOs
         H9lg==
X-Gm-Message-State: AOJu0YzIkZdvVZ+EU95Le/sj5jUyPA5HL48Vr90OBLT+In+mgvnX7YcI
	ayYoTcEfsPDbZN+XTcKSIQaHqX/u1c71qv69ZQQxY5FWDotRUTe9+vyH
X-Gm-Gg: ATEYQzwhYpR7MeRh9amqWefvMKGpaN9w4sijy47Hy+fWVG3oc9UgN7Nl6JMyPhTP6+4
	49ybeKj37l58pMWtPtRx1F8fju0MCOYSU1iXu64V9741dUdBgZN4ziChH5e+4LQxyvM7TXf9blz
	iXftO2TWER5rZ1LVjH5Z1JLCDEVAUT4T8Q4ZX3SWarb3Ki5My6rQjRPNGq8pFdZK0OmzJKWckn3
	fmI4AdEzTrjZ3RTphoIFX1ahrxcdZOlJK2xATs9Xkr+Co35e9c6qGY45OMk5iSeajEQ585ALvcQ
	yKhXku6LAbIpbj/fpR+8ibTqD09i1hnzohuxdr9Ap8cHHHEl9al+51ze5vx13cKx4uRQ4LX6Jpi
	2xN+bGyP2n560DQfd36sdccmTNswhwBAEXu9CfsyOiE5ihfL71Z3oM1nGmjAJry6GWgKMFZiiUV
	MozkaWQNJDbalx0/oDbBL7JZElfzgQFzCmB9XDrA+3Xt/dz5bFFqDvksiHf7x+EIVKER3We5/F
X-Received: by 2002:a17:902:cecf:b0:2ae:5a0b:9ce8 with SMTP id d9443c01a7336-2ae6ab64a40mr37215405ad.45.1772674109391;
        Wed, 04 Mar 2026 17:28:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa5asm211299295ad.60.2026.03.04.17.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 17:28:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49ac1a48-c133-4d3e-93ad-6770a3865b80@roeck-us.net>
Date: Wed, 4 Mar 2026 17:28:28 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hwmon: gigabyte_waterforce: present FW version as
 major.minor
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Aleksa Savic <savicaleksa83@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
 <f21e5af6bd12966cd1bacb820bfbcf473d001c51.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f21e5af6bd12966cd1bacb820bfbcf473d001c51.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 14:05, Michał Mirosław wrote:
> Show firmware version as major.minor to match how the firmware files for
> Waterforce II are distributed.
> 

That is not the only change made in the code. The file is now always
created but reports nothing if the firmware version is not available.
That is a functional change which needs to be explained.

Thanks,
Guenter

> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>   drivers/hwmon/gigabyte_waterforce.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
> index 7f5c88f66e40..04dfe0f4a45f 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -33,8 +33,8 @@
>   /* Control commands, inner offsets and lengths */
>   static const u8 get_status_cmd[] = { REPORT_ID, CMD_STATUS };
>   
> -#define FIRMWARE_VER_START_OFFSET_1	2
> -#define FIRMWARE_VER_START_OFFSET_2	3
> +#define FIRMWARE_VER_MAJOR	0x02
> +#define FIRMWARE_VER_MINOR	0x03
>   static const u8 get_firmware_ver_cmd[] = { REPORT_ID, CMD_FIRMWARE_VERSION };
>   
>   /* Command lengths */
> @@ -64,12 +64,12 @@ struct waterforce_data {
>   	struct completion fw_version_processed;
>   
>   	/* Sensor data */
> +	unsigned long updated;	/* jiffies */
>   	s32 temp_input[1];
>   	u16 speed_input[2];	/* Fan and pump speed in RPM */
>   	u8 duty_input[2];	/* Fan and pump duty in 0-100% */
>   
> -	int firmware_version;
> -	unsigned long updated;	/* jiffies */
> +	u8 fw_ver_major, fw_ver_minor;
>   
>   	u8 buffer[MAX_REPORT_LENGTH];
>   };
> @@ -267,8 +267,8 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
>   	switch (data[1]) {
>   	case CMD_FIRMWARE_VERSION:
>   		/* Received a firmware version report */
> -		priv->firmware_version =
> -		    data[FIRMWARE_VER_START_OFFSET_1] * 10 + data[FIRMWARE_VER_START_OFFSET_2];
> +		priv->fw_ver_major = data[FIRMWARE_VER_MAJOR];
> +		priv->fw_ver_minor = data[FIRMWARE_VER_MINOR];
>   
>   		if (!completion_done(&priv->fw_version_processed))
>   			complete_all(&priv->fw_version_processed);
> @@ -297,7 +297,8 @@ static int firmware_version_show(struct seq_file *seqf, void *unused)
>   {
>   	struct waterforce_data *priv = seqf->private;
>   
> -	seq_printf(seqf, "%u\n", priv->firmware_version);
> +	if (priv->fw_ver_major || priv->fw_ver_minor)
> +		seq_printf(seqf, "%hhu.%hhu\n", priv->fw_ver_major, priv->fw_ver_minor);
>   
>   	return 0;
>   }
> @@ -307,9 +308,6 @@ static void waterforce_debugfs_init(struct waterforce_data *priv)
>   {
>   	char name[64];
>   
> -	if (!priv->firmware_version)
> -		return;	/* There's nothing to show in debugfs */
> -
>   	scnprintf(name, sizeof(name), "%s-%s", DRIVER_NAME, dev_name(&priv->hdev->dev));
>   
>   	priv->debugfs = debugfs_create_dir(name, NULL);

