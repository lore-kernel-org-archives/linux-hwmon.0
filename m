Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE6D3D5668;
	Fri, 10 Apr 2026 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832838; cv=none; b=ZKpIxiUf0ObuSe381dP/9FGU9PwQCe8nUcJfzJAJxaabrKYNrlqGJccye5aSn6SuoR/Lw6LhOKfYijz18biRfCP+NRR1zbWMQgMfWL5lwXFwg+g/rLlitN8G/kM/SQ7dbCsRjc3OlflsYKNH51SNqAoLZ0SeB2L4w3JxtFs7asg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832838; c=relaxed/simple;
	bh=DhI/OkHJmAlFb2E8T2Sq0d7zABUR4+AKc9tF8OFgYK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBOn/R0hpSry1aj7AY86QxiUQsDZAlZDzHLydAmtgNXBskemx6cYaa8XmNU0z0m5/dV0llQvB1t9qk6gywYgOJinDYMTf6fKjl+6ZYzC+5M93T4VJTeIkBFiWmFo6jOvt4kZTcBbqx1YVa5u5lKvYPQyxIdkKD6So2kPbtL/GvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KbfhcOrE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KbfhcOrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775832834;
	bh=DhI/OkHJmAlFb2E8T2Sq0d7zABUR4+AKc9tF8OFgYK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KbfhcOrEyZC+4N5OabPlo8c12l6UPUC3lwjChfQmLc1nd3gLGLNhBoqT6BIPwiF6l
	 0H3++Z+vXyQ5EgOnbhow/FkWcB1Gmiai5Ag5I2NxJB6WmUkvggTQnwGFZT0WKjrhc+
	 QBAHkRg+uHvJaEcIWtU2tHuB93BWwEKSi/Of/5aI=
Date: Fri, 10 Apr 2026 16:53:54 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <23c6211d-cdc7-4e26-bc7a-a0563c846a24@t-8ch.de>
References: <20260401153949.77488-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401153949.77488-1-aureo.serrano@arctic.de>

Hi Aureo,

On 2026-04-01 23:39:47+0800, Aureo Serrano de Souza wrote:
(...)

> +struct arctic_fan_data {
> +	struct hid_device *hdev;
> +	struct device *hwmon_dev;	/* stored for explicit unregister in remove() */
> +	spinlock_t in_report_lock;	/* protects fan_rpm, ack_status, write_pending, pwm_duty */
> +	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
> +	int ack_status;			/* 0 = OK, negative errno on device error */
> +	bool write_pending;		/* true while an OUT report ACK is in flight */
> +	u32 fan_rpm[ARCTIC_NUM_FANS];
> +	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
> +	/*
> +	 * OUT report buffer. Cache-line aligned so it occupies its own cache
> +	 * line, preventing DMA cache-coherency issues with adjacent fields
> +	 * (fan_rpm[], pwm_duty[]) on non-coherent architectures.
> +	 * Embedded in the devm_kzalloc'd struct so it is heap-allocated and
> +	 * passes usb_hcd_map_urb_for_dma(). Serialized by the hwmon core.
> +	 */
> +	u8 buf[ARCTIC_REPORT_LEN] ____cacheline_aligned;

I recently discovered __dma_from_device_group_begin() / _end().
These look like the correct solution to use here. It would also make
parts of the comment unnecessary, as the macro already expresses this
semantic.

> +};

(...)


Thomas
