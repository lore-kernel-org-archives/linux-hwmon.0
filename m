Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8262DF59
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 00:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778287119; cv=none; b=nXPkE7FXRjXTJjwEBOdmEISJXciw3j5j/66gd5rzc2KvrIAJqtr7IKvcWJVbd43FOhNpmcqjR19F05f89zDGuY6eE4fAgFr80lN2r87MYuGqCUnYUMESyLusNrm2ocGaZrKYMo3VQKoQv5h1WrAfrdJEr/yPEq5ei5NLxEPPhAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778287119; c=relaxed/simple;
	bh=1dDEiS3FtHeSP07BBlh+ohYPPY/idXLrY1/ZrkprUpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BP0iqAGd+vuF8bzWP4bwP7eikaaG3ijYzDgYTffnsz7lhKM+h7rGPna8ju1PlOIOuKlKObE1RawOWeuKFzKPZv3eZu/x9nsMcQiWdrma8W7r/Cym9SP9SqWzTA7d2gT708aOrCejVNGqy5kTPpAb3GeMf4mWsiNabV7zRbYKguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jf988igN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jf988igN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E84C2BCB0;
	Sat,  9 May 2026 00:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778287119;
	bh=1dDEiS3FtHeSP07BBlh+ohYPPY/idXLrY1/ZrkprUpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Jf988igNrI5+1/ly0VjBTjUhnu8N/SjOqwshZ0G0Cwl1ygyTziUYgTfI2byh6eC/g
	 MrbzA794Cd5K8uJu3UAmTpLraH342qMI3OFtSYQC6VYibbo2Sb+FSXvOvkM1duywuS
	 6cdeWTnzKF6NsHq2/bDl3karE/4ac9ToC/QFXcWNGsQ3C9fAzgJ1pgfhC0oaaNV6Bd
	 VHqGRjCXeJcXnAMTMjVJcerzlObBHdOv0tYjfLXYvrWbSgFhQCvQ1SMfr+9iEKYwcn
	 LVv9tgfPMK8KKsPis9g3qWqxZuAkJtOxQ7DVXHT2ymMjq5Hw+CpAY7HUAkxEFJmVZR
	 EkdBGPvq0cu1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508-adm1266-v1-3-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-3-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:38:38 +0000
Message-Id: <20260509003839.64E84C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added `firmware_revision` debugfs attribute does not imp=
lement the required locking, violating hwmon subsystem guidelines.
--

commit f5df7ce75de0c22a0deb00195b618fb596ec7c9a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add firmware_revision debugfs entry

This commit adds a debugfs entry to read and report the ADM1266 firmware
revision. It fetches the data via the manufacturer-specific IC_DEVICE_REV
block-read command.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index ba8a025095287..5cfca00a44682 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

> +static int adm1266_firmware_revision_read(struct seq_file *s, void *pdat=
a)
> +{
> +	struct device *dev =3D s->private;
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_IC_DEVICE_REV, buf);

Does this function need to take the hardware monitoring lock before accessi=
ng
the device?

The subsystem guidelines state that drivers must implement locking for
attributes registered by other means than the standard sysfs info parameter.
Would it be appropriate to wrap this I2C read with hwmon_lock() and
hwmon_unlock() to prevent concurrent access issues?

> +	if (ret < 0)
> +		return ret;
> +	if (ret < 3)
> +		return -EIO;
> +
> +	seq_printf(s, "%u.%u.%u\n", buf[0], buf[1], buf[2]);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-adm1266-v1=
-0-ec08bf29e0ce@nexthop.ai?part=3D3
