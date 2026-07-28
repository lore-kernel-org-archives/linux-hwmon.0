Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096FD1C862F;
	Tue, 28 Jul 2026 00:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198040; cv=none; b=FFIpT+gwrXjnZqPtig+i+699pWuk2SWjnZY8y963qXqMjHvObGp7H7yv46N27lB7HUiFO9nWVcKGwuFk5jtOs9axOtwMU6hWosnp+Cq01yprdBVIKWCfrshfjjeG9hYywUbGNslZxD1dgIhV/Icu2iz0zF6i20qsrAR558U6xZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198040; c=relaxed/simple;
	bh=ktsU+n3fOViemRmTHevVxgr7kLGlzgY14tTACK8KfwA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AkJFAZE7jeaJMwDfR0UgCOQRP6vGPq1Oqki/+MOn2or5NA+WGSKgNTI6nhpQIKTTAk5nUnuqsAtjdzCRMtH63OOo40W54KhRWzcn51DKOmVmE8QeuPwloBHObmMIvBi2Jw590NS93FLNyqbobD7PbgTBj8qBPoWgV429P+0tJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRwXEFSU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRwXEFSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F651F000E9;
	Tue, 28 Jul 2026 00:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198038;
	bh=FzpNV/JEx7TsCU6aVqAeO006KaafMwQwuIr2uFT9/2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HRwXEFSUj2toQ0AM72Pmq/TUDXrWHcLZqC+6Kx2l8Tu5q9M15V4HfweQqE78Dm5aI
	 twS2eiCQjLcTEfgh+kCHOpWkEo6ADFVWl40bUugMEw1h0DFhVTNuFcMMrVezUfitlQ
	 KN7ln4E1CsAzagPpisQP9MRx8e84WBIiZGghidHVjfEhACNIjM5ST+UxmosGIGcalT
	 l/fFm5o6dbKHPx+WD9a9R+MRxeYQg3N5jR16f/JsUa06IHkFW+uTlKStQkQ0XvN3te
	 A+ZV50Kiwrpy7oMRqWgKe/hrsLuF+l3q8xPG4ip3sKcKBypPOodxq1pOnNnG7QfHh4
	 OT9Z8zfgpB0FQ==
Date: Mon, 27 Jul 2026 17:20:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Zinc Lim <limzhineng2@gmail.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Guenter
 Roeck <linux@roeck-us.net>, Simon Horman <horms@kernel.org>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, kernel-team@meta.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, zinclim@meta.com
Subject: Re: [PATCH net-next 6/6] eth: fbnic: firmware notifies hwmon on
 sensor threshold events
Message-ID: <20260727172037.2ea238a9@kernel.org>
In-Reply-To: <20260721221540.648272-7-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
	<20260721221540.648272-7-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 15:15:40 -0700 Zinc Lim wrote:
> +void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id, long val)
> +{
> +	enum hwmon_sensor_types type;
> +	struct device *hwmon;
> +	s32 attr = -1;
> +
> +	switch (id) {
> +	case FBNIC_SENSOR_TEMP:
> +		type = hwmon_temp;
> +
> +		if (val <= fbd->fw_cap.temp.min)
> +			attr = hwmon_temp_min_alarm;
> +		else if (val >= fbd->fw_cap.temp.crit)
> +			attr = hwmon_temp_crit_alarm;
> +		else if (val >= fbd->fw_cap.temp.max)
> +			attr = hwmon_temp_max_alarm;
> +
> +		break;
> +	case FBNIC_SENSOR_VOLTAGE:
> +		type = hwmon_in;
> +
> +		if (val <= fbd->fw_cap.volt.min)
> +			attr = hwmon_in_min_alarm;
> +		else if (val >= fbd->fw_cap.volt.max)
> +			attr = hwmon_in_max_alarm;
> +
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	/* Pair with WRITE_ONCE() in fbnic_hwmon_unregister(). Skip the
> +	 * notification if hwmon failed to register or has already been torn
> +	 * down.
> +	 */
> +	hwmon = READ_ONCE(fbd->hwmon);
> +	if (attr >= 0 && hwmon)
> +		hwmon_notify_event(hwmon, type, attr, 0);
>  }

We need a 

	if (!IS_REACHABLE(CONFIG_HWMON))
		return;

in this function, so that compiler can eliminate the
hwmon_notify_event() call _completely_ if HWMON is a module
and the driver is built into the main kernel image.
-- 
pw-bot: cr
