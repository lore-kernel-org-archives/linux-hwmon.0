Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34C186284
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 00:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878150; cv=none; b=PEo0HpNPEqAzVTtj+GBIRpJve5KM0P0cp4TjNu9BAaxZ/+hoy2/VyxFN0pj2FKaJ3slTVvJqixb4VhHqYaeRcRH6nrq0lLCQRPfHCYf2Prs5UK9bAMXHSIk5WRcvqokPzJPmapACxuHVkv++9Q3j7SLZABYHhZuvZ0exYiK/dJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878150; c=relaxed/simple;
	bh=HefiMDs5T1KyjSP2zDY9X7nzX1TtrbHziBskoJWjJmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HY3ApmHGapu7n02zENqgewALMFEVKDqFnMpht39s0IvJkDDkZFVa/JpEd13nrDpwzFDaFrYZIofhW181JOUwF7OB8FHpdEuNbT/PNkvJi/NYqH/FmIdbAYDP/AMtzi9a5EgvhjonBaxm6u1Ch8dPusRh2fAis5zcDbIJuYA8NTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxoBVJ4L; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxoBVJ4L"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso6593432eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 17:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878149; x=1781482949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjF0EWl7MQGGTkR5fyBPqpK6B4Vr2VFhRJBsPsGHejw=;
        b=IxoBVJ4L5jl+myLgaqUXCsTjl8JmfSWkmXXR/O0rmnZdhJMrh+97bpYEYrCIxOXkgu
         XFcz6bMK2EDc+mvWQeAgXNW2aYDhZ3RT9L5vy1+5Z+FWMfmQjH+/yvfzRkOJNAvDzNr4
         5X9cAXa+Phgqh4hrcI/k+3nohkNEHYiOOku5EBZfMQbFiqWNlDDFZzQNskGdWAdeuEfh
         FZtnQWf0lYecAGdz3PSpTbVkg8D9iqXgL0ncbbjw7yPEKblDvznO6OQagBYhz3rS6DtH
         dWMhRrmXgk2E2OhQ0s+vBXGfRFXOWZHgGs5qgxForthlTXJ/ttuJzMke8oEwSOngm4QJ
         qOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878149; x=1781482949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LjF0EWl7MQGGTkR5fyBPqpK6B4Vr2VFhRJBsPsGHejw=;
        b=T4tZ7o3LFkPE7Z6eIW/gMZaSOjMaRL+Uhb8GBq+Wz+UhujObUUsx2vMJ3MlAgiEKqW
         oTmV/TFoqEVolNnqIQufgNzEkGa3gXhUvbmWQRa3u/gxPHEGdH7qWLHAbVKU9sCkJhXM
         wVvDeadLKdZFevjYAiWIyQdZa5dKqKAZMItzic0SAlWLuPSXKnV86L5mHveSE0APDWG3
         W+nxS/CTdSTnvJUPRzARENw1PvsAQQcgJAoI56QvFgvgs4jOlkZYYRhMm/lcPrcJKlqR
         xeryZ24rEvBxk370jYTl+1QO0XZBwVdLO9/CZY02IISsKxbNoqV544im6SGq0zVs63sL
         sBfw==
X-Forwarded-Encrypted: i=1; AFNElJ+gEU8VtGaxV6dko58qAYmg0qqpSAGyq9y++tTHCIJHVGv7wsNe4RjJQh9x+BqbCSLhPxmpZIX7fcSazg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXlcp6JUEjC5A8r2+JgiaWbetvPPT+fr5nQCzRfhPOkoe81b8D
	XeWycl/IU3zaE0C21ZXc7zvG1lBCYTOKkDMcxn48qlCnvmQ9DRm7Gqs6
X-Gm-Gg: Acq92OGDmZepWflDij4d0UZvdyQ5C69JucfzM8aKz0wjLebvh8C4AFRgY/grKiR8glJ
	w82P/szqfnH895hQDnJZPBScsNbWz0yebQb1eAYiJxYUixmLxNHoGTtmn2gJD0ImN897iqJzOct
	EiW9OTyquWUfEQ+mAQAumuN6MTB++UZbV0KeS9O/JynhytcNd1SXsXoKGoz7YLErQLNSb9Iag/3
	GSHyrZeyus0PzMlZz3/j3EM1h9K4DFfx379E1s95165EOy5yGHXO5LwJXv5Q4Qla/skSYIOZP8d
	AbXpX8SEYR/N3zjiWVVeDgNOpw0qkR42bqAMNpAgm25miYpDTCjMntVClyCKK6FBpfQyjKHgm1K
	wa//uuVj/nTmrKw7BI9n5Q3yEeLFUObyRbcwfLS8O+Llr21Jz+3jiKql0OkGXf3u47WrAJPDf+7
	PapiLPvXwgz58NItG0rTnuyjPbi7Pqm53M3hNfsnIpkBm16KRONPUSEQCzpA==
X-Received: by 2002:a05:7300:8cac:b0:304:fa0d:85ba with SMTP id 5a478bee46e88-3077af576f4mr7794021eec.12.1780878148924;
        Sun, 07 Jun 2026 17:22:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8708sm15964925eec.15.2026.06.07.17.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:22:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:22:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B850-E GAMING WIFI
Message-ID: <385707f2-db47-4dd0-b90e-bf6f58a91518@roeck-us.net>
References: <20260607123626.100630-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607123626.100630-1-eugene.shalygin@gmail.com>

On Sun, Jun 07, 2026 at 02:36:16PM +0200, Eugene Shalygin wrote:
> The board has a similar sensor configuration to the
> ROG STRIX B850-I GAMING WIFI, but includes an additional
> T-Sensor header. The patch was provided via GitHub [1].
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter

> 
> [1] https://github.com/zeule/asus-ec-sensors/pull/105
> ---
>  Documentation/hwmon/asus_ec_sensors.rst |  1 +
>  drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 9ad3f0a57f55..9669e729bb8b 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -32,6 +32,7 @@ Supported boards:
>   * ROG STRIX B550-E GAMING
>   * ROG STRIX B550-I GAMING
>   * ROG STRIX B650E-I GAMING WIFI
> + * ROG STRIX B850-E GAMING WIFI
>   * ROG STRIX B850-I GAMING WIFI
>   * ROG STRIX X470-F GAMING
>   * ROG STRIX X470-I GAMING
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index b5d97a27f80d..27e39138011e 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -628,6 +628,14 @@ static const struct ec_board_info board_info_strix_b650e_i_gaming = {
>  	.family = family_amd_600_series,
>  };
>  
> +static const struct ec_board_info board_info_strix_b850_e_gaming_wifi = {
> +	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> +		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
> +		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
> +	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +	.family = family_amd_800_series,
> +};
> +
>  static const struct ec_board_info board_info_strix_b850_i_gaming_wifi = {
>  	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
>  		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
> @@ -868,6 +876,8 @@ static const struct dmi_system_id dmi_table[] = {
>  					&board_info_strix_b550_i_gaming),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
>  					&board_info_strix_b650e_i_gaming),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-E GAMING WIFI",
> +					&board_info_strix_b850_e_gaming_wifi),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
>  					&board_info_strix_b850_i_gaming_wifi),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-F GAMING",
