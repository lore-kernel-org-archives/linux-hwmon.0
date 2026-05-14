Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE593BFE41
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798350; cv=none; b=jIMOXYJbsEdUIlwb+sd3rYJ6CI3x3iC9MCW77DBU2h8iP6l1zVkFSUVo70vVTTf9zNkzv/y17mR7+mtVRXdHCJxONufb50xOQd0TPG7t9lGirQlfKjofPDYdYFQRdFufvv9fM81AbryGAmcbvbn76dzNgALy4ZSG5B9e/4mrkUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798350; c=relaxed/simple;
	bh=y4xneNCw8cOwBcYaN679hjxSb9QnwtNMvJrsSrXqwUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uBcHqOhdFLSJNs/4sqMKz6QHRnSw1qIkm60yiwNK3qjjT/+06XeswYqQhRKsHHJrauX31Bti8BefXalEukjczYClDMcainUtGTAC8xFBv4vjciTWbjih36YOwRQS8jYTnTjAtTs9lOR/S7l6UoLm1HyGscZqy6oJp2JzFhJYKqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4+X9Sir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4+X9Sir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122A6C2BCB3;
	Thu, 14 May 2026 22:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778798350;
	bh=y4xneNCw8cOwBcYaN679hjxSb9QnwtNMvJrsSrXqwUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=j4+X9SirOQZGd/BY43IaWzxEe28hpZILpPiLvl3mo1ZSLFp6roW/rhxBMkL5C4U70
	 At6c7gWQk+VFb9wPZ5zHso+DoxVn5pNRbzfjYHu2fRRy2sF4p38uQKPigKxw4LoVDl
	 Qe1/5zbhYZWtFQnq75Rxkp7qErwQ18wkroCCNUm3+w1IVmZUEXTQbYVNXmO0TLbdWf
	 QOZTNRmt1AH+rY9BHGUBOGUUSdDhlIUU6iDPcLKacHzXQg6AdVzs0AT5oV7NP91sTM
	 n7+h0rmWa7iTVWFJK7fYYjZckhbyqqAwXvWctUkM1TOyon1ro6DPbkG+UuSujJpx6s
	 WtukWN8S2u/2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (lm90) Stop work before releasing hwmon
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260514220214.1380831-1-linux@roeck-us.net>
References: <20260514220214.1380831-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 22:39:09 +0000
Message-Id: <20260514223910.122A6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Re-ordering work cancellation before hwmon device unregistration i=
ntroduces a Use-After-Free vulnerability due to a race with sysfs accesses.
--

commit dfb6baf4fb10f085fc08795b014c46ab84d8b479
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (lm90) Stop work before releasing hwmon device
   =20
This commit addresses a use-after-free issue by moving the cancellation
of alert_work and report_work to a separate devm action. It registers
this new action after the hwmon device is registered, ensuring the works
are cancelled before the hwmon device is freed.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 3c10a5066b53d..50b30d7192256 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c

[ ... ]

> @@ -2902,6 +2907,10 @@ static int lm90_probe(struct i2c_client *client)
> =20
>  	data->hwmon_dev =3D hwmon_dev;
> =20
> +	err =3D devm_add_action_or_reset(&client->dev, lm90_stop_work, data);
> +	if (err)
> +		return err;
> +

Does this reordering introduce a regression where the workqueue can be
re-armed after it is cancelled?

Because this devm action is registered after
devm_hwmon_device_register_with_info(), lm90_stop_work() will be called fir=
st
during teardown, cancelling alert_work and report_work.

However, at this point the hwmon device is still registered and its sysfs
attributes remain exposed.

If user-space reads a sysfs attribute in this window, it triggers the
hwmon core to invoke lm90_temp_read(), which calls lm90_update_device()
and then lm90_update_alarms_locked().

If alerts are disabled on the chip, lm90_update_alarms_locked() will call
schedule_work(&data->report_work) or schedule_delayed_work(&data->alert_wor=
k).

Could this dynamically re-arm the workqueue after lm90_stop_work() has
already run?

If the work is re-armed, the teardown process will then unregister the
hwmon device and free the data structure. The asynchronously executing work
would then dereference the freed data pointer, resulting in a use-after-fre=
e.

Would it be possible to introduce synchronization state, such as checking a
flag in the data structure before scheduling works, or decoupling the
teardown order?

>  	if (client->irq) {
>  		dev_dbg(dev, "IRQ: %d\n", client->irq);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514220214.1380=
831-1-linux@roeck-us.net?part=3D1
