Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C365E573
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 01:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289014; cv=none; b=SdMbUcC7rknIJ19bbunR+lYyFA+tQHI9Np64WNnn0b4vs3MPEzEoItUmp6TW7pDwXyTqoLx4vDuftD3omm/2unpoi2jfr+PVD+6bL5SSR3mT/KApO2Ht0JFWHYe6Cxi2LNiXI0X7F7WwyiB4/8MVLAQF/rHOV8WnMbFJIdxGnWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289014; c=relaxed/simple;
	bh=Zo8a+0AvypZRcVyxEa3yGppAS5kG8KAEQWND9UsgCnQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FsabjZnIAZTh9CGuL4p54b2q4c4HBRYQSQ+T2iI4jX8jDBDalXQYL2DMGxNni2n1BZX2nc2xkB/UAtUBmT7/XmTDZ9bANCG355Kqc5f9THMKPS+FxnV69pHEIvEpB1K+gBUlnz0NYoOzBQVn5/8VeO20Ewmn6pLvj5LTxWAGVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vA11HmoI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vA11HmoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87FFC2BCB0;
	Sat,  9 May 2026 01:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778289014;
	bh=Zo8a+0AvypZRcVyxEa3yGppAS5kG8KAEQWND9UsgCnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=vA11HmoIhEIBnI6T0MYN+f8YifZd32V80D+7WIKVpJTxAXLl0kxsasu40WdN+x1ra
	 mwVBR0fNrhQ/9NlKrQSzPgj7MTH1hweNVaZgW2RvlQ+A+ztFD2ylj/3f5il0RH/YS6
	 VWNhS/sBC4iKJZ3JANxfBktvC2a0vKtoAvrGZZBC/YUV8O9/G5sUf7Jb/dUntJ+xMM
	 a4Ii4rsMeB3jiKhSFor/jTfTou9wEZuJnI5uvRp5qE8uRf9WxkMfVhREXzRQpcSyFT
	 qTt7GB1+h4guL3wJTN5NKqFRy7nWp5IgxVnagc6/30+bmTR5+sx4QaUe/5IcuCiQ7B
	 eWTYQSmX0m24A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] hwmon: (pmbus/adm1266) add clear_blackbox debugfs
 entry
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508-adm1266-v1-4-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-4-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 01:10:13 +0000
Message-Id: <20260509011013.E87FFC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing locking in the debugfs clear_blackbox attribute handler cr=
eates a race condition with nvmem blackbox reads and violates hwmon subsyst=
em guidelines.
--

commit bc35a67bf6371f1a9ee8f0d0c2436676ca57954d
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry

This commit exposes a write-only debugfs file alongside sequencer_state to
clear the ADM1266 blackbox. Writing any data to this file issues a 2-byte
block-write command to the READ_BLACKBOX register.

> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const cha=
r __user *ubuf,
> +					    size_t count, loff_t *ppos)
> +{
> +	struct i2c_client *client =3D file->private_data;
> +	u8 payload[2] =3D { 0xFE, 0x00 };
> +	int ret;
> +
> +	ret =3D i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
> +					 sizeof(payload), payload);

Could this clear command race with concurrent reads of the blackbox?

Looking at adm1266_nvmem_read_blackbox(), it performs a multi-transaction
sequence where it first reads the record_count, then loops to read individu=
al
records:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
    ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, =
buf);
    ...
    record_count =3D buf[3];

    for (index =3D 0; index < record_count; index++) {
        ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1,
                                       &index, read_buff);
    ...
}

If this write runs concurrently, it seems it could clear the hardware
blackbox mid-read since the core I2C bus lock only serializes individual
transactions. This might cause the remaining nvmem reads to fetch corrupted
data or fail with I/O errors.

The hwmon subsystem guidelines also mention that drivers must implement
locking for attributes registered outside the core subsystem. Should this
write be protected to serialize it against other hardware accesses?

> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-adm1266-v1=
-0-ec08bf29e0ce@nexthop.ai?part=3D4
