Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B3377574
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536481; cv=none; b=JE/Y2KWG9Ka2y94MKb79eU7fE0zOxYxet2oS0yRUJBmLsTi/hOWw2sUYq/yFOm2vP9I+rsN+froP6vHlycEYljHmpDbZj7ipBUzTzhHoJQA/azK8tEaHI+4b3JcMh0mYqpMhVtA7eXeyFpDwtb2RCciJsxNQMkVgTj/GW6qUE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536481; c=relaxed/simple;
	bh=lYuTZ4Zhas8ZPRyj5etivQlp/UpZ+eG+upGuTZAwe6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvzT7BBR4/9tyWtw2HQS41fjG07MbuVvJnf/+pyyQJaXBD2DW1zQSqrA5rkPd8D36gQRIMKg0TXXuwjBx7aoRfy6+0F1BoHTViOq7es2gnIlEgPN0a6YNMh/7zKsFZLcm/UsOGDrvqQMSMpFic5+C566W8/2OBI6Dec4Dhs2RwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2D1BRD9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2D1BRD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA92C2BCB3;
	Thu, 30 Apr 2026 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536481;
	bh=lYuTZ4Zhas8ZPRyj5etivQlp/UpZ+eG+upGuTZAwe6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Z2D1BRD997dsWgitW7ZBH/FScuxWh40mSJsMKdjZ9LP9sXldYEd/SDcVMIHhXgPuB
	 KAUXBUxDQ+eOM4dD7+d98eT6IkHg4qkz91saZ365WwsTpMS6f/dZkOaEu9przJrZut
	 4CFRTAxiAVOhr3lQ+igw/Szm3GdmFq/3W36utfDwpq7lIAN2FDoie+aM0Hm5FaT3GT
	 HUKHFnn1FlzLAq9EhwjEOpGA+G6niHrSK7NSmFJq8jJMvsTJosqyAo0QYuZ7Sr+x69
	 4jE6OWvd7aTlu22Vedp3W6O9kSDZCJfdgVUBJyJJQptwirKW/4vEum7f07ObANT0e0
	 tLwJ1AXHufTmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Reply-To: sashiko@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430064519.1632-1-hehuan1@eswincomputing.com>
References: <20260430064519.1632-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 08:08:00 +0000
Message-Id: <20260430080801.1AA92C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Hardware access with disabled clock when CONFIG_PM=3Dn
- [High] Resource leak and hardware powered on during driver unbind
- [High] System suspend state desynchronization causes potential crashes
- [High] Unclocked hardware access in the interrupt handler
- [Medium] Missing synchronization on timeout path causes race condition an=
d stale data
- [Medium] Unvalidated sysfs input and hwmon ABI violation for temp_offset
- [Low] Mismatch between commit message and implemented voltage channels
--

commit 226d2b003d7fbabad9b8abaf9c71cf6fdf386a91
Author: Huan He <hehuan1@eswincomputing.com>

hwmon: Add Eswin EIC7700 PVT sensor driver
   =20
Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
supports temperature and voltage monitoring with polynomial conversion,
and provides sysfs interface for sensor data access.
   =20
The PVT IP contains one temperature sensor and four voltage sensors for
process variation monitoring.

> The PVT IP contains one temperature sensor and four voltage sensors for
> process variation monitoring.

This isn't a bug, but the commit message states there are four voltage
sensors, while the driver implementation only exposes a single voltage chan=
nel.
Could the commit message be updated to match the implementation?

> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
> new file mode 100644
> index 0000000000000..d9d6a035defeb
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.c
[ ... ]
> +static irqreturn_t eic7700_pvt_hard_isr(int irq, void *data)
> +{
> +	struct pvt_hwmon *pvt =3D data;
> +	u32 val;
> +
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +	/*
> +	 * Read the data, update the cache and notify a waiter of this event.
> +	 */
> +	val =3D readl(pvt->regs + PVT_DATA);

Could this cause a bus fault if a spurious or delayed interrupt fires while
the device is in the RPM_SUSPENDED state?

When the device is suspended, the hardware clock is gated. Accessing regist=
ers
without checking the PM runtime state could lead to a crash. Should this use
pm_runtime_get_if_active() to protect against accessing unclocked hardware?

[ ... ]
> +static int eic7700_pvt_read_data(struct pvt_hwmon *pvt,
> +				 enum pvt_sensor_type type, long *val)
> +{
> +	unsigned long timeout;
> +	u32 data;
> +	int ret;
> +
> +	/*
> +	 * Wait for PVT conversion to complete and update the data cache. The
> +	 * data read procedure is following: set the requested PVT sensor mode,
> +	 * enable conversion, wait until conversion is finished, then disable
> +	 * conversion and IRQ, and read the cached data.
> +	 */
> +	reinit_completion(&pvt->conversion);
> +
> +	eic7700_pvt_set_mode(pvt, pvt_info[type].mode);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, PVT_ENA_EN);
> +
> +	/*
> +	 * Wait with timeout since in case if the sensor is suddenly powered
> +	 * down the request won't be completed and the caller will hang up on
> +	 * this procedure until the power is back up again. Multiply the
> +	 * timeout by the factor of two to prevent a false timeout.
> +	 */
> +	timeout =3D 2 * usecs_to_jiffies(ktime_to_us(pvt->timeout));
> +	ret =3D wait_for_completion_timeout(&pvt->conversion, timeout);
> +
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +
> +	data =3D READ_ONCE(pvt->data_cache);
> +
> +	if (!ret)
> +		return -ETIMEDOUT;

If the timeout expires, could an interrupt still be in flight?

If so, a subsequent read request would call reinit_completion(), and the
delayed interrupt handler could execute, complete the new request premature=
ly,
and cause the read to return stale data.

Does the timeout path need to call synchronize_irq() to ensure no interrupt
handler is running before returning?

[ ... ]
> +static int eic7700_pvt_write_trim(struct pvt_hwmon *pvt, long val)
> +{
> +	/*
> +	 * Update PVT trim register safely while the controller is temporarily
> +	 * disabled.
> +	 */
> +	eic7700_pvt_set_trim(pvt, val);
> +
> +	return 0;
> +}

Does this code validate the user input before writing it to the hardware?

Writing a negative value could truncate to 0xFFFFFFFF and overwrite reserved
bits in the register. Additionally, the hwmon ABI specifies that temp_offset
should be in millidegrees Celsius, but this writes the raw value directly to
the register without scaling.

[ ... ]
> +static void eic7700_pvt_disable_pm_runtime(void *data)
> +{
> +	struct pvt_hwmon *pvt =3D data;
> +
> +	pm_runtime_dont_use_autosuspend(pvt->dev);
> +	pm_runtime_disable(pvt->dev);
> +}

Can this leak the clock reference and leave the hardware powered on if the
device is unbound?

Because pm_runtime_put_autosuspend() is used after reads, the device remains
active for a 3-second window. If the module is removed during this window,
pm_runtime_disable() will cancel the pending suspend but it does not suspend
a device that is currently RPM_ACTIVE.

Should this cleanup action explicitly suspend the device if it is active?

[ ... ]
> +static int eic7700_pvt_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D eic7700_pvt_init_iface(pvt);
> +	if (ret) {
> +		clk_disable_unprepare(pvt->clk);
> +		return ret;
> +	}
> +
> +	clk_disable_unprepare(pvt->clk);

Is this driver intended to be built when CONFIG_PM is disabled?

If CONFIG_PM is disabled, pm_runtime_get_sync() in the hwmon read function =
is
a no-op that returns 1. Because the clock is explicitly disabled at the end=
 of
probe() and relies entirely on PM runtime to re-enable it, a read operation
will access the hardware registers while the clock is gated, leading to an
external abort or system hang.

Also, eic7700_pvt_suspend() checks !pm_runtime_status_suspended(dev), which
is always false when CONFIG_PM=3Dn, causing it to erroneously call
clk_disable_unprepare() on an already disabled clock.

[ ... ]
> +static int __maybe_unused eic7700_pvt_suspend(struct device *dev)
> +{
> +	int ret =3D 0;
> +
> +	if (!pm_runtime_status_suspended(dev)) {
> +		ret =3D eic7700_pvt_runtime_suspend(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to suspend: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

Does calling eic7700_pvt_runtime_suspend() directly leave the PM runtime
state desynchronized?

This manually gates the clock if the device is active, but it fails to upda=
te
the device's PM runtime status. The PM core still considers the device to be
RPM_ACTIVE.

If a kernel thread calls pm_runtime_get_sync() before late suspend, it will
see the state as active, return immediately without re-enabling the clock,
and crash when accessing registers.

Should this use pm_runtime_force_suspend() and pm_runtime_force_resume() to
safely maintain state consistency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430064107.1598=
-1-hehuan1@eswincomputing.com?part=3D2
