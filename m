Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233BC34CDD
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 00:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878117; cv=none; b=G/FnDEbQA7/FS40s+wJqhe5RcfdYimX+yjdnsBEzY56k0XGGHM9AeepKiXJm/0gwkY2RUOK8kAhsuR3w3YrmCkMtzKpYmMyRnPvuKJs/qQqLeuPKwp7X2wA1QLz5NodtLl1qNE+ofgcaBWwoKaicVWIocWBE8gXGYmJu2EcFqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878117; c=relaxed/simple;
	bh=NBM4UisdYfOHAKTHcpNtY+0vBSuV5SkQMW/imIrVGas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un1lMesf6j38HVUbj15pgjngdlQV+/T5sI4lv//RIh628KHoOv6Dr40yxYXsscTi16DrvomBI/eVdWEhIFpfOFBLEKlFXv9HDk+7ibhq8J//mmKi90arZz+Avc5fpD1W6QgjFfA6TYh5bEQ+/NXXFQbOzcRSLW1k5XNqJID37Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTv9RnnB; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTv9RnnB"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13809223fd4so2748305c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 17:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878115; x=1781482915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj/23dJqQgCyDD0aOfzKH4iLZgT/F6tYyBMjQm/q3K0=;
        b=rTv9RnnB8/j3RHAz8iQKE3Ytr0kHA70705AmvRV5iGj8hHhUgSm2r4z8vmyw3xSa+r
         89vKZV/FS4bdgs2/68zOf0aDfbbVU/l2e3KHGzzZJfU19UEdBsatkyu5Htw4odCZCQs/
         arqh0hxQCJI/FFdHYfqEs+4BSck1F8/PlSOcNN5tetO7Y7N4rQ4nbJWKwYepGcxoKP+h
         Njuqd72/6DvwEIU9/w8G6dAVbOHeWNwobv+eZ8ZOZElV02eT41gO3mPs9a52rn/Xp7N8
         T9VTMIBDhvTFeOmF4K/O8yD0ObVnoY5ePne3UqwLr+TmybpCBVTZeivh0DKqHpin6Aau
         ON4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878115; x=1781482915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yj/23dJqQgCyDD0aOfzKH4iLZgT/F6tYyBMjQm/q3K0=;
        b=qjBDuILZ7W9k2SdrWWLxMpEClGjBj3Vz6hlpeOmpD0gvuXr++iA2T71A3v5ZB+IQU3
         QNudAB+bj0BwHBVvdRtGSnoGVZUPa5Z6Ub0lLBc15FSw29PX6PH4rwKHXBZ+i76TbyxE
         05jdHMdaryxXb0qWCD7xI6jCJSIgOrmNE25uDmPEa+AnkG1C6I9+6JTSDPeE5M6WdMzw
         47OCzoz9MIKOb6jkl6r9sfGNTACZt/6ryc7gMlUIs5iZkUZu3fK9nKO2p+M77O9jfNyN
         P0sXhZbI4LvUjjG5gh9olO71YmQ8jQbqc/YDJ5mZblf9Dez+zD54MQGzgodJaSyWDhxb
         gfcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VtaW0X1mfTvEIwQ0Xdl5E1T28NR9/ep/onREIxl7LjMMA77LCqYmO3OpJfqKwdPGFNoQFURpZ3oiWKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsuX3yvA8ntT+DrMW1XE21FJLV5DVV8YyxlzkdnelDPzdbGw6
	ZX/tPOL55KQju6kFUBgpI4xqHsd0HmAWfq2iJyUXDyWpLCAXvSZcfU7W
X-Gm-Gg: Acq92OH2Y7665xAcosxANz02RYqoT11ucoqaKUWkJCXKG+BFdtUHMC63jkMuvhuy+sy
	ZX9xP1qxVcoC1GxM5zojfceccN7VCn2EFSCPfVXyLrkQ98kQwYiwIyLCtFvj9gyhEKJkZMHDKfv
	9Mt0/fIQ5QXA5qn/nPQxmQPqZKLrLK/0olQ7LDhxRrVbAVRFcD94Dx+P31wTH/ZUo51jY9+k30D
	pQrFdZFg27RpuCSDBxvq1hwxfuWZksR/0Do2ddr6tThrkMYxLQZhLYz/O/AXq/WCMALHrR9XW4d
	viVc/MhXxV7XGncqIj+8rLTKjkBpNv2DoBi05Gii/SZmorZ1iVEgUWAWtd9f9680MUgVOwQ69Bu
	BLiuW+dOVAKAWNPji1KDnm7R9vBBgrS1m+aPulWIDIpVd+VMbf53kcpc8A3EOt4RZCQqmOfZ+KV
	ls/hdheJr4y3cjoQqQVs79DGJhUMolboskgRPWFzI8CDgj1m+tspVxFQ5czw==
X-Received: by 2002:a05:701b:4504:10b0:138:2369:50e5 with SMTP id a92af1059eb24-1382369514amr706650c88.26.1780878115067;
        Sun, 07 Jun 2026 17:21:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30791f9da69sm7084180eec.31.2026.06.07.17.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:21:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:21:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
	Oleg Tsvetkov <oleg-tsv@yandex.ru>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E
 GAMING WIFI
Message-ID: <2c22c11c-f564-49f2-a4c0-3a8c3d5fedfc@roeck-us.net>
References: <20260607110702.84599-1-eugene.shalygin@gmail.com>
 <20260607110702.84599-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607110702.84599-2-eugene.shalygin@gmail.com>

On Sun, Jun 07, 2026 at 01:06:10PM +0200, Eugene Shalygin wrote:
> From: Veronika Kossmann <nanodesuu@gmail.com>
> 
> Add support for ROG STRIX B650E-E GAMING WIFI
> 
> Signed-off-by: Veronika Kossmann <nanodesuu@gmail.com>
> Co-developed-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
> Signed-off-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/asus_ec_sensors.rst |  1 +
>  drivers/hwmon/asus-ec-sensors.c         | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 9ad3f0a57f55..e14419811aac 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -31,6 +31,7 @@ Supported boards:
>   * ROG MAXIMUS Z690 FORMULA
>   * ROG STRIX B550-E GAMING
>   * ROG STRIX B550-I GAMING
> + * ROG STRIX B650E-E GAMING WIFI
>   * ROG STRIX B650E-I GAMING WIFI
>   * ROG STRIX B850-I GAMING WIFI
>   * ROG STRIX X470-F GAMING
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 070bb368f2b7..f351bcfc5679 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -274,7 +274,7 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
>  	[ec_sensor_temp_cpu_package] =
>  		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
>  	[ec_sensor_temp_mb] =
> -	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
> +		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
>  	[ec_sensor_temp_vrm] =
>  		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
>  	[ec_sensor_temp_t_sensor] =
> @@ -616,6 +616,14 @@ static const struct ec_board_info board_info_strix_b550_i_gaming = {
>  	.family = family_amd_500_series,
>  };
>  
> +static const struct ec_board_info board_info_strix_b650e_e_gaming = {
> +	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> +		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
> +		SENSOR_FAN_CPU_OPT,
> +	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +	.family = family_amd_600_series,
> +};
> +
>  static const struct ec_board_info board_info_strix_b650e_i_gaming = {
>  	.sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
>  		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
> @@ -861,6 +869,8 @@ static const struct dmi_system_id dmi_table[] = {
>  					&board_info_strix_b550_e_gaming),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
>  					&board_info_strix_b550_i_gaming),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-E GAMING WIFI",
> +					&board_info_strix_b650e_e_gaming),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
>  					&board_info_strix_b650e_i_gaming),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
