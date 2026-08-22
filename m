Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758042F12DA;
	Sat, 22 Aug 2026 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787399836; cv=none; b=ACXlTGM4G4Scec4gQqnLnOGp98Dbf75qmjqrnqNx51Yqhyq9Qw9OD77zUHRaAvcTuGWNB7pj5dk8bCtHhxLYkKItXo1/jKfw8Mv+VhuCn/J23L7EQlu/1WeoZOSHW2K2Pg/jz2Pw+J4HktLaZSWbxWOYch1m7rmsb8bjTHjbhEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787399836; c=relaxed/simple;
	bh=T3nfyCSI420p69lDYOa/F/k7M8R5b1UBKbh9wkrhjII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYGjMOrvMTiRuAUpr9LkmJwsWYCtfcjU/1hTkm4l6Z92cZ9Llx4N5UXPg7zk23Oumg3zS4pcPWhp2rQf3pj7Nnfe7fx0iTwAOjtCwpoXfpKd0PGQfoAprp0tarVYOGWyAE+ieLmlLiLE9+tY3asWez4eX18CUqGOQclnGNruvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kQHhooem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kQHhooem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CB41F000E9;
	Sat, 22 Aug 2026 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787399835;
	bh=ITtmsKsUnrgc2haF6tJIN5qTxFpDrhtTms9cB52T6EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQHhooem/9A8fHEXJ0tOfGzuxKE6lpu/8BWwpLx1MdjTh73ritnYwrz/tHKjF7GqF
	 xuFMiHivHvAmm3Qo3kHCjujl1Ggvqwv9bt0D3BGFTRhfbi3eGDqaVYBSxs0LTiyxAK
	 5yjPqjCvXiVpkU1QMdM+AKj2PzxAyxkfvJOaDKZI=
Date: Sat, 22 Aug 2026 13:55:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@qq.com>
Cc: sashiko-bot@kernel.org, linux-hwmon@vger.kernel.org,
	sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, me@jackdoan.com, savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v4] hwmon: (aquacomputer_d5next) valid the data size
 before reading the sensor data
Message-ID: <2026082252-clerk-anointer-ceaf@gregkh>
References: <20260822092616.B9B121F000E9@smtp.kernel.org>
 <tencent_CE16CF998D9A25B20DEF1275DDCEDDB61907@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CE16CF998D9A25B20DEF1275DDCEDDB61907@qq.com>

On Sat, Aug 22, 2026 at 07:34:35PM +0800, Edward Adam Davis wrote:
> The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> fails to handle cases where the sensor data length is too small when reading
> the data, resulting in [1] during the read process.

What is "user-forged sensor data"?

> 
> Add a data size check, if the size is less than that required for the
> specific data item to be read, abort the sensor data read operation.

This patch does much more than that.

> 
> [1]
> BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
> Read of size 2 at addr ffff888108aba257 by task swapper/1/0
> Call Trace:
>  get_unaligned_be16 include/linux/unaligned.h:48 [inline]
>  aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
>  aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
>  __hid_input_report.constprop.0+0x319/0x470 drivers/hid/hid-core.c:2168
>  hid_irq_in+0x55d/0x710 drivers/hid/usbhid/hid-core.c:287
>  __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
>  usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
> 
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---

Was the Assisted-by: tag forgotten?


> v1 -> v2: change to check the data item and update comments
> v2 -> v3: check all sub items and update subject
> v3 -> v4: add speed and flow check
> 
>  drivers/hwmon/aquacomputer_d5next.c | 104 ++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 1ca70e726298..89c9fc0c77e5 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -1324,6 +1324,107 @@ static const struct hwmon_chip_info aqc_chip_info = {
>  	.info = aqc_info,
>  };
>  
> +/* aqc_raw_data_valid()
> + * Does not support special-case sensor readings data size check

Why not?

> + */
> +static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
> +{
> +	int off, fan_off, i;
> +	char *msg;
> +
> +	if (!priv)
> +		return false;
> +
> +	/* +1 for get_unaligned_be16(), it reads 2 bytes */
> +	off = priv->serial_number_start_offset + SERIAL_PART_OFFSET + 1;
> +	if (off >= size) {
> +		msg = "serial number start offset";

That's a lot of debugging code being added, why?  Who is going to use
that?



> +		goto invalid;
> +	}
> +
> +	off = priv->firmware_version_offset + 1;
> +	if (off >= size) {
> +		msg = "firmware version offset";
> +		goto invalid;
> +	}
> +
> +	/* Physical temperature sensor readings data size check*/
> +	for (i = 0; i < priv->num_temp_sensors; i++) {
> +		off = priv->temp_sensor_start_offset + i * AQC_SENSOR_SIZE + 1;
> +
> +		if (off >= size) {
> +			msg = "temp sensor start offset";
> +			goto invalid;
> +		}
> +	}
> +
> +	/* Virtual temperature sensor readings data size check*/
> +	for (i = 0; i < priv->num_virtual_temp_sensors; i++) {
> +		off = priv->virtual_temp_sensor_start_offset +
> +		      i * AQC_SENSOR_SIZE + 1;
> +
> +		if (off >= size) {
> +			msg = "virtual temp sensor start offset";
> +			goto invalid;
> +		}
> +	}
> +
> +	/* Fan speed and related readings data size check */
> +	if (!priv->fan_structure)
> +		goto flow;
> +
> +	for (i = 0; i < priv->num_fans; i++) {
> +		fan_off = priv->fan_sensor_offsets[i] + 1;
> +		off = fan_off + priv->fan_structure->speed;
> +		if (off >= size) {
> +			msg = "fan speed offset";
> +			goto invalid;
> +		}
> +
> +		off = fan_off + priv->fan_structure->power;
> +		if (off >= size) {
> +			msg = "fan power offset";
> +			goto invalid;
> +		}
> +
> +		off = fan_off + priv->fan_structure->voltage;
> +		if (off >= size) {
> +			msg = "fan voltage offset";
> +			goto invalid;
> +		}
> +
> +		off = fan_off + priv->fan_structure->curr;
> +		if (off >= size) {
> +			msg = "fan curr offset";
> +			goto invalid;
> +		}
> +	}
> +
> +flow:
> +	/* Flow sensor readings data size check */
> +	for (i = 0; i < priv->num_flow_sensors; i++) {
> +		off = priv->flow_sensors_start_offset + i * AQC_SENSOR_SIZE + 1;
> +		if (off >= size) {
> +			msg = "flow sensors start offset";
> +			goto invalid;
> +		}
> +	}
> +
> +	if (priv->power_cycle_count_offset != 0) {
> +		off = priv->power_cycle_count_offset + 3;
> +		if (off >= size) {
> +			msg = "power cycle count offset";
> +			goto invalid;
> +		}
> +	}
> +
> +	return true;
> +invalid:
> +	pr_debug("data size (%d) is less than the %s, %s\n",
> +		 size, msg, __func__);

drivers should always use dev_dbg().

also pr_debug() already has __func__ in it.  Please fix your LLM.

thanks,

greg k-h
