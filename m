Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338D37C924
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342092; cv=none; b=JHSmZKSS4EjX1idkbEOgEqYDbm7icu9mqt6K8mWcYZktDwwgzf6A7E6oFE13P0B1tQYn+u+dMYPFxDcIXBR+RPjuvYmqjS8YuZQJt4op9mzspzzbJhphZ7/GJWWqxRx9ChVqxtRTwT7thWQgutCU4kbby2aQHKrCckC0edUiItk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342092; c=relaxed/simple;
	bh=4DUGoc0eE8u1uspwWyxo0A7BXA8tb7VuyHYTTHVRPGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vFy6wymHqi0GXYrn5LQahcpm7GA5dtJZP+lIwuuD7QXbz2WaBtz5qnq70mIlc+7silWCAmjftsZBhomoKTNJOjZoKE1CsHJnylXP2x7AOdSzbHVeMOSkf9xCqhBNtwYjtsmH3J1ejTKvL0WCSasuUYSSQglJjKEmSJM2bGqvbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgM4XziJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgM4XziJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A220FC2BCAF;
	Thu, 16 Apr 2026 12:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776342091;
	bh=4DUGoc0eE8u1uspwWyxo0A7BXA8tb7VuyHYTTHVRPGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KgM4XziJ0JFAghkZ43Y8vgHJ3AzObwSpSmhF9w2X7Ijod2eVR9uFkyGz4meV66T5v
	 skr2fCabRXXx7lOB1S4H+JwzutcjSmc00kMvHsRirOvAXINBboZkAH6NEiQ+JVnrzq
	 ZGm28oUg0SK1TKUPjAGKXNMB+wMTnycW6LtrTDjokyRlYEW1yOJ9qjYTiVioUBm7yA
	 NdLCzN7DfN4WqjmvOREAghpP2PJXzwqSWIMqwLSjXZBy2n2zpvwZk0n25FOjpNWSzF
	 M76rCG3NW1aFWYhBFczSJZYl75gHK7tLYH3WSEazTS/4w7AnwAcEaIj6RQnJVfHFZd
	 l8apjz9CGVb4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (adm1031) Serialize update rate changes
Reply-To: sashiko@lists.linux.dev
To: "Gui-Dong Han" <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260416091754.310-3-hanguidong02@gmail.com>
References: <20260416091754.310-3-hanguidong02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2026 12:21:31 +0000
Message-Id: <20260416122131.A220FC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Missing I2C error handling leads to hardware register corruption a=
nd state desynchronization.
--

commit ffbce3cc3043a4bfb1c8f7ba4a9010b9c8a23c2c
Author: Gui-Dong Han <hanguidong02@gmail.com>

hwmon: (adm1031) Serialize update rate changes

This commit expands the locked section in update_interval_store() to cover
the hardware register read-modify-write sequence and the software state
update. This ensures the hardware updates and cached state updates occur
together.

> diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> index 887fba9ea149f..a46db83471f2c 100644
> --- a/drivers/hwmon/adm1031.c
> +++ b/drivers/hwmon/adm1031.c
[ ... ]
> @@ -897,13 +897,14 @@ static ssize_t update_interval_store(struct device =
*dev,
>  	}
>  	/* if not found, we point to the last entry (lowest update interval) */
> =20
> +	mutex_lock(&data->update_lock);
> +
>  	/* set the new update rate while preserving other settings */
>  	reg =3D adm1031_read_value(client, ADM1031_REG_FAN_FILTER);

Could the truncation of the error code lead to register corruption?

Looking at adm1031_read_value(), it returns a u8:

static inline u8 adm1031_read_value(struct i2c_client *client, u8 reg)
{
        return i2c_smbus_read_byte_data(client, reg);
}

If i2c_smbus_read_byte_data() returns a negative error code like -EIO, it g=
ets
silently truncated to an 8-bit value (like 0xFB). This garbage value is then
masked, modified, and written back to the register.

>  	reg &=3D ~ADM1031_UPDATE_RATE_MASK;
>  	reg |=3D i << ADM1031_UPDATE_RATE_SHIFT;
>  	adm1031_write_value(client, ADM1031_REG_FAN_FILTER, reg);

Does ignoring the return value of adm1031_write_value() leave the software
and hardware states desynchronized?

If the I2C write fails, data->update_interval is updated anyway, meaning
the cached software state no longer matches the actual hardware state
despite the expanded lock.

> -	mutex_lock(&data->update_lock);
>  	data->update_interval =3D update_intervals[i];
>  	mutex_unlock(&data->update_lock);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416091754.310-=
1-hanguidong02@gmail.com?part=3D3
