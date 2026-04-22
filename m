Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216B3451DA
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776899984; cv=none; b=ZKCLoNZ80szNfX2abBBENddDpslcGx/zi5t++m1EWkAfcJZyL2CltFMSV3tgFAwyhVuLxDq37aZ6c2HOAjVSkV1b5HilW0kV2ZrzvNC+IjUkXMzWvXC4CtgYcw6n2NAERPEgozWYeblacz7jeeO04hM5yMhIFLOtlmXcLuBdNjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776899984; c=relaxed/simple;
	bh=hZfc3XuBWH+xI+K8Ym0m/S7o0iMDWjGvgwOtHSTxpCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aC7xa92NSHbA4cFHJHNsZy8p4xCsbKFc9FM1bD+7ULb1DoxDFM4EqJx/P64u7jwdU1Aqv6AG+bqrflwVeEHEGWrmFtgGKQXrcprAiPtIxSDVPSzl8gVKJlpTvi4tOHj6T2K8Odz6GsI5lCmo/S0ZlIPhSjZU3AOiK3w21TDOt9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRdSwlk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRdSwlk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E851C19425;
	Wed, 22 Apr 2026 23:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776899983;
	bh=hZfc3XuBWH+xI+K8Ym0m/S7o0iMDWjGvgwOtHSTxpCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hRdSwlk58OPfmpayGW8kcaKTpk86qV5Yyb1wZ1IiaLaajCOnPuVWn80I0ED4FHyg9
	 gf/vA3EidUNZhrPysxAtGtMaCT9S5LPgfImCeyVDqoR5afWSOJnAzMNFTeSDfokzrg
	 7a4CKGF3gR7UiWUs5r7VS9LvUMKRSADj0I2Y9RJ8pgvn7fdvlxoubQq4pChXWezs6Z
	 fXbF0OytN6IxurwEpC4hOUr7r7B0pGA+49Df+MLmm0S0iV99NKvNOo/AwgMXmWKarj
	 EpYtWHt52qICAUJWl4vXp9rC33LLxx/9lV+6vVNGwFcPk6JXqq+RikBXPCqQ8n9cwr
	 imIuEGX5RDrzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/12] thermal/core: Put of_node field cooling device
 structure under Kconfig option
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-8-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-8-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 23:19:42 +0000
Message-Id: <20260422231943.5E851C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Critical] Double initialization of the cooling device leads to linked li=
st corruption in devm_thermal_of_cooling_device_register().
--

commit ec613b33ae03267fedce00f5da67c6af4d2e4061
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/core: Put of_node field cooling device structure under Kconfig opti=
on

The device node pointer in the cooling device structure is only needed
by the thermal OF in order to bind a thermal zone with a cooling
device. Now only the OF based drivers are using the thermal OF
functions and do not call the function with a NULL device_node
parameter as before. We can put this field under the CONFIG_THERMAL_OF
condition and make it go away if the device tree is not used.

> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index ba2c8b4dda873..0a95cfeffa74e 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -125,7 +125,6 @@ struct thermal_cooling_device {
>  	const char *type;
>  	unsigned long max_state;
>  	struct device device;
> -	struct device_node *np;
>  	void *devdata;
>  	void *stats;
>  	const struct thermal_cooling_device_ops *ops;
> @@ -133,6 +132,9 @@ struct thermal_cooling_device {
>  	struct mutex lock; /* protect thermal_instances list */
>  	struct list_head thermal_instances;
>  	struct list_head node;
> +#ifdef CONFIG_THERMAL_OF
> +	struct device_node *np;
> +#endif

This isn't a bug in this patch, but I noticed a regression introduced by an
earlier patch in the series that affects thermal OF cooling device
registration.

Does devm_thermal_of_cooling_device_register() call
thermal_cooling_device_init_complete() twice on the same cooling device?

When devm_thermal_of_cooling_device_register() calls
thermal_of_cooling_device_register(), it successfully registers the device
and calls thermal_cooling_device_init_complete(cdev), which adds the node
to thermal_cdev_list via list_add().

After returning, devm_thermal_of_cooling_device_register() calls
thermal_cooling_device_init_complete(tcd) again with the same pointer.

Calling list_add() twice on the same node corrupts the linked list. If
CONFIG_DEBUG_LIST is disabled, the node's next pointer points to itself,
causing infinite loops during subsequent traversals of thermal_cdev_list.

I see this regression was fixed later in the series in commit 61302b0ce72b9
("thermal/of: Pass the of_index and add a function to register with an inde=
x").

>  #ifdef CONFIG_THERMAL_DEBUGFS
>  	struct thermal_debugfs *debugfs;
>  #endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D7
