Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264233939BD
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326885; cv=none; b=QwDGkRqdXHaCPJ1NKj04x8hDgcJWoLzf2tEsZqj9/DL4ZVt1UlR5Y9rj3Tb2xU5h/iT8mMRkjukOf1f9qn/e3RgARDqfonvGtiwm1WsSVMiHgyb5NFUy/TvMZGugmTZaD4pQvJ3w40MPM3WdG/uTj5OR+2nsq0BfhUfAveT818k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326885; c=relaxed/simple;
	bh=7FPJM1dlkAVXylkX7da0xMYxM1z0IV5/snroZAJVOV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXM6uAQYjS9n5aq0NMt8HTMO73KJe/yS2nsla9/EMzEiXRnFAUfnSrR6vQw2BWrBta2kGKVRXx2wIguSVP79CCooarZjxrza5AbuOSYfJtXi4zxcp+MA/4aQUgoOGNvBLH7IGgjyOQnMsr8NNfoJcgkq32yJ2DpnqHff4rvfvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg0NkTq6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg0NkTq6"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ae38f81be1so8423960eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768326883; x=1768931683; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyYxtzzilS58b8K7mR2Z5leR7YOClXrIf1D7x5HC/xs=;
        b=Vg0NkTq6AU+hQAu4Mpcn0uzQi/ZDY6YiQQbayX8AUlwMBrI+Juk+yZFA5PVMvHAG5J
         VoOOpA2sDikNmeMlOz3RyeBrdVyrEARCZveL6u9Ggn0R72g3odt8YNz53rwad9nAYvve
         JcEd9FaHOF/mxbnAmYOqWqoq6syPxJNq2u51cGJzlYVg8eLXzkddQK+ut+Hil89vzBww
         mqyosyVtVS18TGfVbT3OKFs8ZnwA4RqgSyj8QgYVQpU4DgDlNz+rIKEqtqIVOck0UCpd
         idRgSuETRTLwaVFSTuebXSVT9f+Bcnby/dq2gqBESPff+2g53NkcpRnV51CxnAfAcibC
         z91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326883; x=1768931683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyYxtzzilS58b8K7mR2Z5leR7YOClXrIf1D7x5HC/xs=;
        b=SysfSom5tLUBlFl2UsZW4ic7lDxYqeKI7uaRvrkGhq803sA5djxr27S0c0949W8ALQ
         5CL3aFhvM+xkdHpJa7X7lPZNTz1UmYmQYajH6DpzX5WOzQiDYLjlvHMat6RSSgqDu8Q2
         7yY/jvn0rvJGwS/Q2tqC3Tof29A1P1UbQgXa2xQCQ2TYyFchP5KTKAJt+34BZQuYHDxs
         bcsy/Ni4NBM/A2fHwmDJYwir+5Drie/cAvOJelipc96SybjzEc9ArXJH6iEgiTLd1kSf
         0iEyJdV9wI8iUg0HujJucMdbeWiRzSq0WT3GISY3vZmnM1a75g+m/7EuNBeslag1U4xB
         ADRg==
X-Forwarded-Encrypted: i=1; AJvYcCUoJOjL55Vgrm3DvNaw3c3nBRuW55xKb0+VUlhB7ngCsIxSNAUL4thkpMeAslIkoD8TqLYUx3DKMfjU7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT7q8NXw7P0g2sJ4CeYbGrFPZGDym1n7UvTF9mImEJPA1qzSJq
	oNQYoAvorABKHPqnL3LHoJNlIidHWjRJEz33zraUxUEpYhQWo9h2DCAw8qOVlg==
X-Gm-Gg: AY/fxX60J9z96Qu8PkUWG4wl7mfP/sXeLFA2d/oT168MXchUx9Z6ql2F2fmKu2y9+N4
	3VvsdPrmtu1FsxA5vAA2Ws4K99bmoVEN7aP1fA8FoOQr5vW6R+vJOMR81ULA+3+bGbc15qRJ3hz
	q6vXUP1igFuNSOdjxAnotq0K14L128I3fDc3fJJZuiNC5KPN0BHrp2jmA0N6A4v6T8g08tr6caS
	IyraB/BF24yVn5nlpewo4Jona+LgggHo58KLjrVnyMW2W7UdyUouRn2Vej0gWRfGTKioyJUX4BD
	WyTpquwTIrB3E12jw/HVfnD0DMUqQiLlBZ/icSUjNHXjLuwedaa17EQJCRFj8Xx1yiZdXZBFRmu
	WDYZshXoAwRJYL9oni1PYze9JZAzggBNkxoBhffcEJzNJxvrqURYYJrlZ1RpMZk1L8yZP9nqAJs
	ykGAsHkXKqW6ff4BKO8zxDaW97
X-Google-Smtp-Source: AGHT+IEM+7oCXc0yFPWeFB4g5y7tv61UpN9NggMZE0qAH3zBMDg0pt98vUYV9fAQFsH9UiGJXGZPLQ==
X-Received: by 2002:a05:7301:678d:b0:2ae:605b:d52f with SMTP id 5a478bee46e88-2b17d2e6bc6mr23768975eec.39.1768326883150;
        Tue, 13 Jan 2026 09:54:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a53cdsm18014271eec.11.2026.01.13.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:54:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 13 Jan 2026 09:54:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "benoit.masson" <yahoo@perenite.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] hwmon: it87: prepare for extended PWM temp maps
Message-ID: <1410044e-554d-4009-9248-ce063b352659@roeck-us.net>
References: <20260110012613.48150-1-yahoo@perenite.com>
 <20260110012613.48150-2-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260110012613.48150-2-yahoo@perenite.com>

On Sat, Jan 10, 2026 at 02:26:10AM +0100, benoit.masson wrote:
> Introduce helper logic for PWM-to-temperature mappings so newer
> register layouts can be supported without affecting legacy chips.
> 
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> ---
>  drivers/hwmon/it87.c | 178 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 133 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index ec5b1668dd7b..dfd1e896c1ab 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -251,6 +251,7 @@ static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59 };
>  #define IT87_REG_FAN_MAIN_CTRL 0x13
>  #define IT87_REG_FAN_CTL       0x14
>  static const u8 IT87_REG_PWM[]         = { 0x15, 0x16, 0x17, 0x7f, 0xa7, 0xaf };
> +static const u8 IT87_REG_PWM_8665[]    = { 0x15, 0x16, 0x17, 0x1e, 0x1f, 0x92 };
>  static const u8 IT87_REG_PWM_DUTY[]    = { 0x63, 0x6b, 0x73, 0x7b, 0xa3, 0xab };
>  
>  static const u8 IT87_REG_VIN[]	= { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> @@ -283,6 +284,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
>  #define IT87_TEMP_OFFSET_MAX	ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
>  #define IT87_TEMP_LIMIT_DEFAULT	3
>  #define IT87_TEMP_MAP_DEFAULT	3
> +#define IT87_PWM_OLD_NUM_TEMP	3
>  #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
>  #define NUM_FAN_DIV		3
>  #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
> @@ -331,6 +333,7 @@ struct it87_devices {
>  #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
>  #define FEAT_FOUR_TEMP		BIT(22)
>  #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
> +#define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
>  
>  static const struct it87_devices it87_devices[] = {
>  	[it87] = {
> @@ -554,6 +557,7 @@ static const struct it87_devices it87_devices[] = {
>  #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
>  						     FEAT_10_9MV_ADC))
>  #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
> +#define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
>  
>  struct it87_sio_data {
>  	int sioaddr;
> @@ -632,7 +636,9 @@ struct it87_data {
>  	u8 has_pwm;		/* Bitfield, pwm control enabled */
>  	u8 pwm_ctrl[NUM_PWM];	/* Register value */
>  	u8 pwm_duty[NUM_PWM];	/* Manual PWM value set by user */
> -	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping (bits 1-0) */
> +	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping */
> +	u8 pwm_temp_map_mask;
> +	u8 pwm_temp_map_shift;
>  
>  	/* Automatic fan speed control registers */
>  	u8 auto_pwm[NUM_AUTO_PWM][4];	/* [nr][3] is hard-coded */
> @@ -714,6 +720,72 @@ static int pwm_from_reg(const struct it87_data *data, u8 reg)
>  		return (reg & 0x7f) << 1;
>  }
>  
> +static inline u8 pwm_temp_map_get(const struct it87_data *data, u8 ctrl)
> +{
> +	return (ctrl >> data->pwm_temp_map_shift) &
> +		data->pwm_temp_map_mask;
> +}
> +
> +static inline u8 pwm_temp_map_set(const struct it87_data *data, u8 ctrl,
> +				  u8 map)
> +{
> +	ctrl &= ~(data->pwm_temp_map_mask << data->pwm_temp_map_shift);
> +	return ctrl | ((map & data->pwm_temp_map_mask)
> +		       << data->pwm_temp_map_shift);
> +}
> +
> +static inline u8 pwm_num_temp_map(const struct it87_data *data)
> +{
> +	return data->num_temp_map ? data->num_temp_map :
> +		IT87_TEMP_MAP_DEFAULT;
> +}
> +
> +static unsigned int pwm_temp_channel(const struct it87_data *data,
> +				     int nr, u8 map)
> +{
> +	if (has_new_tempmap(data)) {
> +		u8 num = pwm_num_temp_map(data);
> +
> +		if (map >= num)
> +			map = 0;
> +		return map;
> +	}
> +
> +	if (map >= IT87_PWM_OLD_NUM_TEMP)
> +		map = 0;
> +
> +	if (nr >= IT87_PWM_OLD_NUM_TEMP)
> +		map += IT87_PWM_OLD_NUM_TEMP;
> +
> +	return map;
> +}
> +
> +static int pwm_temp_map_from_channel(const struct it87_data *data, int nr,
> +				     unsigned int channel, u8 *map)
> +{
> +	if (has_new_tempmap(data)) {
> +		u8 num = pwm_num_temp_map(data);
> +
> +		if (channel >= num)
> +			return -EINVAL;
> +		*map = channel;
> +		return 0;
> +	}
> +
> +	if (nr >= IT87_PWM_OLD_NUM_TEMP) {
> +		if (channel < IT87_PWM_OLD_NUM_TEMP ||
> +		    channel >= 2 * IT87_PWM_OLD_NUM_TEMP)
> +			return -EINVAL;
> +		channel -= IT87_PWM_OLD_NUM_TEMP;
> +	} else {
> +		if (channel >= IT87_PWM_OLD_NUM_TEMP)
> +			return -EINVAL;
> +	}
> +
> +	*map = channel;
> +	return 0;
> +}
> +
>  static int DIV_TO_REG(int val)
>  {
>  	int answer = 0;
> @@ -725,6 +797,14 @@ static int DIV_TO_REG(int val)
>  
>  #define DIV_FROM_REG(val) BIT(val)
>  
> +static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
> +{
> +	if (data->type == it8613 || data->type == it8622)

Did you try to compile this patch ? I guess not, because I get

drivers/hwmon/it87.c: In function ‘it87_reg_pwm’:
drivers/hwmon/it87.c:802:27: error: ‘it8613’ undeclared (first use in this function); did you mean ‘it8603’?
  802 |         if (data->type == it8613 || data->type == it8622)
      |                           ^~~~~~
      |                           it8603
drivers/hwmon/it87.c:802:27: note: each undeclared identifier is reported only once for each function it appears in

The code should use register pointers in struct it87_data to avoid such
problems and the need for runtime type checks.

Guenter
