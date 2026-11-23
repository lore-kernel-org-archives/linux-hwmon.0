Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468274;
	b=5FAwyWVT9YVGrX78RPKrNJKW69/7+qI+/LOMRRHICDG1O/KAbRvZG4jxthUekICpUcFL
	 0jnkiJkh/GIq1cHVkQMz6tTCFDj/9GeMA473O19gEc3JxKWi1uN2r3EiPnaZ9wVHDldyf
	 4OYWnEIMTdtJr8PQHWztGVR9YMLriviiswRFQhc4/nlsUtD4boX9cExXynWIdgcQeT5L6
	 TIrRVbf7Lz+4OKlJN/cT93FUTRXus7+/xQYKJg2bhvk7R7SMIgOwfEOqMsedVYVyt4Zdf
	 v3L5ZIyRjgGi9H/t6qnCfoHIOuXRmygnfqKDWQEGGWkV3B38Ig7R5aNloc2RRmuv8Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468274;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mSKk9/8YwoyuItcF4erJygL0vpyQpn5UlZ4I6HOLWxE=;
	b=k88tojHaGAGqSYjBNRwCo8csUNkXMqmZ0foukw/AfdxgEo9O6G+bB3VvjEYo6/CS8brL
	 R1Tg7SiK+YdOk1cojBcHe9+hZmq/lzbIACU/hgQWpqCvZiwuonMxkemvdoK6DzDhp5ys0
	 OhmTsJW5CKj7gyLDLJjIlPyl0jlFivUDZ3v/bT/G3+l8kUowt1Da0NehHmEcCzfpJJAfs
	 tqPO0GBPs8eoA26AhP00srLvnb8iSnYdVQ2sjqWaXyKxM+cYdyMlhpw3riVoUB/xSwmH+
	 KgvdC+uWVly8OL0sr2ecfhf9pWz3X5vN3O40FV4Pk6P7ar9xHoVIkNjsNDfSxyH53qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n04ssT8g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFCC606A31E;
	Mon, 23 Nov 2026 21:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n04ssT8g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861C91F000CA;
	Mon, 23 Nov 2026 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468273;
	bh=mSKk9/8YwoyuItcF4erJygL0vpyQpn5UlZ4I6HOLWxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n04ssT8gwdDgNYAmgXjtGk0AkqadLUG0+0U7dBHSruG9OHzM6oWiwTJw1rQdp0f1Q
	 pC1hplFhR+0hO/OWq+Kp2n6Ap9gH9uYTj6hU99c4hx4Wv3vrNQVgI6b8k5p2pCIVyg
	 PZrqsmcrf46nAzgvFNJM0gfHrXlHIPDDZFnN/iC38zGi4BYE0uC8W+p8V9ZNlwjr1n
	 sH3bje/eFE1Cl7qQMZUtMKS/ry2CV9PNXGvRrAeaf6y923OrPgpdYEXuoS+UeGBzeP
	 Bl+/kGlPx+dAwOb7S+JpsfsaITXki89L6EVOfigKaYt9+bDZcjVuVnez1gSB3iybxh
	 8/4/haakMr7EA==
Message-ID: <sashiko-outbox-230063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/12] hwmon: Add Qualcomm PMIC BCL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-2-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
 <20261124-qcom-bcl-hwmon-v5-2-747d5383d538@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 21:11:13 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] hwmon: qcom-bcl: infinite poll loop in
  bcl_alarm_enable_poll() on reassertion
- [Medium] hwmon: qcom-bcl: max_mu exceeds 6-bit L1/L2 field in
  bcl_thresh_write()
- [Medium] hwmon: qcom-bcl: unlocked enable_irq_wake() race in
  bcl_alarm_irq_init()
- [Low] hwmon: qcom-bcl: 32-bit jiffies wraparound in
  bcl_curr_input_read() cache
- [Low] hwmon: qcom-bcl: redundant private mutex bcl->lock duplicating
  hwmon_lock()
--

commit ad4e95352ce7aa5ad76440eaf33e8bd9c53a0538
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

hwmon: Add Qualcomm PMIC BCL driver

This commit adds a hwmon driver for the Qualcomm SPMI PMIC Battery Current
Limiting (BCL) peripheral to monitor battery voltage and current and report
threshold alarms.

> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmo=
n.c
> new file mode 100644
> index 0000000000000..a5a3a59484571
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c

[ ... ]

> +struct bcl_device {
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	u32			base;
> +	struct regmap_field	*fields[F_MAX_FIELDS];
> +	struct bcl_alarm_data	bcl_alarms[BCL_LIMIT_ALARM_MAX];
> +	/* Protects hardware register access and device state */
> +	struct mutex		lock;

[Severity: Low]
This isn't a bug, but the hwmon core already serializes .read and .write
callbacks under the hwmon device lock, and regmap serializes individual
register accesses.  Could this use hwmon_lock() and hwmon_unlock() instead
of a driver-private mutex?

> +	u32			last_in_input;
> +	s32			last_curr_input;
> +	unsigned long		last_in_updated;
> +	unsigned long		last_curr_updated;

[ ... ]

> +static const struct reg_field bcl_smb2360_reg_fields[] =3D {
> +	[F_V_MAJOR]	=3D REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	=3D REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	=3D REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	=3D REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	=3D REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	=3D REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	=3D REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	=3D REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	=3D REG_FIELD(VCMP_L2_THR, 0, 5),
> +	[F_IN_INPUT]	=3D REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_H0_THR]	=3D REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	=3D REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	=3D REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_smb2370_reg_fields[] =3D {
> +	[F_V_MAJOR]	=3D REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	=3D REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	=3D REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	=3D REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	=3D REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	=3D REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	=3D REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	=3D REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	=3D REG_FIELD(VCMP_L2_THR, 0, 5),

[ ... ]

> +/* Register 0x2a50 mapping: 0 -> 2S, 1 -> 3S */
> +static const struct bcl_desc smb2360_data =3D {
> +	.reg_fields =3D bcl_smb2360_reg_fields,
> +	.num_reg_fields =3D F_CURR_INPUT + 1,
> +	.data_field_bits_size =3D 8,
> +	.thresh_field_bits_size =3D 8,
> +	.battery_config_field =3D REG_FIELD(0x2a50, 0, 1),
> +	.features =3D BCL_IN_MON | BCL_IN_INPUT | BCL_CURR_MON,
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_IN] =3D {
> +		.base_mu =3D 4500,
> +		.max_mu =3D 8400,
> +		.step_mu =3D 50,
> +		.default_scale_nu =3D 432918,
> +		.thresh_type =3D {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDE=
X},
> +	},
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_CURR] =3D {
> +		.max_mu =3D 17575,
> +		.default_scale_nu =3D 540679,
> +		.thresh_type =3D {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_IN] =3D {
> +		.base_mu =3D 6750,
> +		.max_mu =3D 12600,
> +		.step_mu =3D 75,
> +		.default_scale_nu =3D 648790,
> +		.thresh_type =3D {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDE=
X},
> +	},

[ ... ]

> +static int bcl_thresh_write(struct bcl_device *bcl, long value, enum bcl=
_limit_alarm lvl,
> +			    enum bcl_channel channel)
> +{
> +	const struct bcl_desc *desc =3D bcl->desc;
> +	const struct bcl_channel_cfg *cfg =3D &desc->channel_cfg[bcl->batt_conf=
ig][channel];
> +	enum bcl_fields base_field =3D channel =3D=3D CHANNEL_IN ? F_IN_L0_THR =
: F_CURR_H0_THR;
> +	struct regmap_field *field;
> +	long thresh =3D clamp_val(value, cfg->base_mu, cfg->max_mu);
> +	u32 raw_val;
> +	int ret;
> +
> +	if (WARN_ON(channel =3D=3D CHANNEL_CURR && lvl >=3D BCL_LIMIT_ALARM_LVL=
2))
> +		return -EINVAL;
> +
> +	field =3D bcl->fields[base_field + lvl];
> +
> +	if (cfg->thresh_type[lvl] =3D=3D THRESH_TYPE_ADC)
> +		raw_val =3D bcl_convert_milliunit_to_raw(bcl, thresh, channel,
> +						       desc->thresh_field_bits_size);
> +	else
> +		raw_val =3D bcl_convert_milliunit_to_index(bcl, thresh, channel);
> +
> +	ret =3D bcl_validate_threshold_fits(bcl, &desc->reg_fields[base_field +=
 lvl],
> +					  raw_val, thresh, channel =3D=3D CHANNEL_IN ? "mV" : "mA");
> +	if (ret)
> +		return ret;

[Severity: Medium]
As reported by Daniel Lezcano on v4 [1], can bcl_thresh_write() reject
valid clamped thresholds on SMB2360 and SMB2370?

For both chips, F_IN_L1_THR and F_IN_L2_THR are 6-bit fields (max index
63, which corresponds to 7650 mV on 2S and 11475 mV on 3S), whereas
channel_cfg sets max_mu to 8400 mV on 2S and 12600 mV on 3S (index 78).
Writing a value >=3D 7675 mV on 2S or >=3D 11513 mV on 3S to in0_lcrit or
in0_lemergency clamps to at most index 78, causing
bcl_validate_threshold_fits() to log a dev_err() and fail with -EINVAL
instead of clamping to the hardware limit.

[ ... ]

> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val =3D 0;
> +	s32 signed_val;
> +	const struct bcl_desc *desc =3D bcl->desc;
> +
> +	/* Return cached value if read too soon after last update */
> +	if (bcl->last_curr_updated &&
> +	    time_before(jiffies, bcl->last_curr_updated + HZ)) {
> +		*out =3D bcl->last_curr_input;
> +		return 0;
> +	}

[Severity: Low]
On 32-bit platforms, can time_before(jiffies, bcl->last_curr_updated + HZ)
wrap around if curr1_input (or in0_input in bcl_in_input_read()) is not
read for more than LONG_MAX jiffies (~24.8 days at HZ=3D1000)?  During the
following ~24.8 days, time_before() evaluates to true and returns the
stale cached reading without updating last_curr_updated.  Using u64
timestamps with get_jiffies_64() and time_before64() would avoid the wrap.

[ ... ]

> +static void bcl_alarm_enable_poll(struct work_struct *work)
> +{
> +	struct bcl_alarm_data *alarm =3D container_of(work, struct bcl_alarm_da=
ta,
> +							 alarm_poll_work.work);
> +	struct bcl_device *bcl =3D (struct bcl_device *)alarm->device;
> +	long status;
> +	int ret;
> +	bool notify =3D false;
> +
> +	scoped_guard(mutex, &bcl->lock)
> +		ret =3D bcl_read_alarm_status(bcl, alarm->type, &status);
> +
> +	/* If read failed or shutting down, reschedule */
> +	if (ret || READ_ONCE(alarm->shutting_down)) {
> +		if (!READ_ONCE(alarm->shutting_down)) {
> +			dev_err_ratelimited(bcl->dev,
> +					    "Failed to read alarm %d status: %d\n",
> +					    alarm->type, ret);
> +			schedule_delayed_work(&alarm->alarm_poll_work,
> +					      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +		}
> +		return;
> +	}
> +
> +	/* Check if alarm cleared and IRQ needs re-enabling */
> +	scoped_guard(mutex, &alarm->a_lock) {
> +		if (alarm->shutting_down)
> +			return;
> +
> +		if (!status && !alarm->irq_enabled) {
> +			alarm->irq_enabled =3D true;
> +			enable_irq(alarm->irq);
> +
> +			if (!alarm->irq_wake_enabled && !enable_irq_wake(alarm->irq))
> +				alarm->irq_wake_enabled =3D true;
> +
> +			notify =3D true;
> +		}
> +	}
> +
> +	if (notify) {
> +		/* Reassertion racing enable_irq() is dropped by the PMIC on unmask; r=
e-check. */
> +		scoped_guard(mutex, &bcl->lock)
> +			ret =3D bcl_read_alarm_status(bcl, alarm->type, &status);
> +
> +		if (ret || status) {
> +			if (!READ_ONCE(alarm->shutting_down))
> +				schedule_delayed_work(&alarm->alarm_poll_work,
> +						      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +			return;
> +		}
> +
> +		/* Notify outside a_lock: sysfs_notify()/kobject_uevent_env() may slee=
p */
> +		bcl_hwmon_notify_event(bcl, alarm->type);
> +		return;
> +	}
> +
> +	/* Alarm still active, reschedule polling */
> +	if (!READ_ONCE(alarm->shutting_down))
> +		schedule_delayed_work(&alarm->alarm_poll_work,
> +				      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +}

[Severity: Medium]
Does bcl_alarm_enable_poll() enter an infinite 50 ms polling loop if the
post-unmask re-check sees ret !=3D 0 or status !=3D 0?

When the first read observes status =3D=3D 0, bcl_alarm_enable_poll() sets
alarm->irq_enabled =3D true, enables the IRQ, and sets notify =3D true.  If
the alarm reasserted before enable_irq() unmasked the line, the PMIC drops
that edge (so bcl_handle_alarm() will not run to clear
alarm->irq_enabled), and the re-check under if (notify) reschedules
alarm_poll_work and returns with alarm->irq_enabled still true.

On all later runs once status clears back to 0, (!status &&
!alarm->irq_enabled) is false, so notify stays false: the clear
notification is never sent and the function falls through to reschedule
alarm_poll_work every 50 ms forever.

[ ... ]

> +static int bcl_alarm_irq_init(struct platform_device *pdev,
> +			      struct bcl_device *bcl)
> +{
> +	int ret, irq_num, i;
> +	struct bcl_alarm_data *alarm;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(bcl->bcl_alarms); i++) {
> +		alarm =3D &bcl->bcl_alarms[i];
> +		alarm->type =3D i;
> +		alarm->device =3D bcl;
> +		ret =3D devm_mutex_init(bcl->dev, &alarm->a_lock);
> +		if (ret)
> +			return ret;
> +
> +		/* Initialize work before IRQ request */
> +		INIT_DELAYED_WORK(&alarm->alarm_poll_work, bcl_alarm_enable_poll);
> +
> +		irq_num =3D platform_get_irq_byname(pdev, bcl_lvl_info[i].irq_name);
> +		if (irq_num < 0)
> +			return irq_num;
> +
> +		alarm->irq =3D irq_num;
> +		alarm->irq_enabled =3D true;
> +
> +		ret =3D devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
> +						bcl_handle_alarm, IRQF_ONESHOT,
> +						bcl_lvl_info[i].irq_name, alarm);
> +		if (ret) {
> +			alarm->irq_enabled =3D false;
> +			return ret;
> +		}
> +
> +		/*
> +		 * Register the cleanup action right after the IRQ is
> +		 * requested, before any other fallible step in this loop, so
> +		 * a delayed work scheduled by the IRQ handler is guaranteed
> +		 * to be canceled on teardown. Keeping it after the IRQ
> +		 * request also preserves safe devm LIFO teardown order.
> +		 */
> +		ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_cleanup_action,
> +					       alarm);
> +		if (ret)
> +			return ret;
> +
> +		if (!enable_irq_wake(irq_num))
> +			alarm->irq_wake_enabled =3D true;
> +	}

[Severity: Medium]
Can enable_irq_wake() in bcl_alarm_irq_init() race with bcl_handle_alarm()
once devm_request_threaded_irq() activates the interrupt?

CPU0                              CPU1
bcl_alarm_irq_init()
  devm_request_threaded_irq()
                                  bcl_handle_alarm()
                                    mutex_lock(&alarm->a_lock)
                                    alarm->irq_enabled =3D false
                                    disable_irq_nosync(alarm->irq)
                                    /* irq_wake_enabled is still false */
                                    mutex_unlock(&alarm->a_lock)
  enable_irq_wake(irq_num)
  alarm->irq_wake_enabled =3D true  <-- wake enabled while IRQ is disabled

If bcl_handle_alarm() also runs between enable_irq_wake() and
alarm->irq_wake_enabled =3D true (or after bcl_alarm_enable_poll() has
already enabled wake), enable_irq_wake() can be called twice while
irq_wake_enabled only tracks a single boolean, leaving wake_depth
unbalanced on teardown.  Acquiring alarm->a_lock and checking
alarm->irq_enabled && !alarm->irq_wake_enabled before calling
enable_irq_wake() would prevent this.

[1] https://lore.kernel.org/r/5598422c-8830-4fcf-be2b-e4486ea64539@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-qcom-bcl-h=
wmon-v5-0-747d5383d538@oss.qualcomm.com?part=3D2
